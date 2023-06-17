/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

module TestDrawingArea;

//debug = trace;

private import cairo.Context;
private import cairo.ImageSurface;

private import gtk.Box;
private import pango.PgContext;
private import pango.PgLayout;

private import std.stdio;
private import std.math;

private import gtk.Widget;
private import gtk.EventControllerMotion;
private import gtk.GestureClick;
private import gio.MenuItem;
private import gtk.ComboBox;
private import gtk.ComboBoxText;
private import gio.Menu;
private import gtk.Adjustment;
private import gdkpixbuf.Pixbuf;
private import gdk.Event;
private import gdk.CairoContext;

private import pango.PgCairo;
private import pango.PgFontDescription;

private import gtk.DrawingArea;
private import gtk.Image;
private import gtk.SpinButton;


/**
 * This tests the gtkD drawing area widget
 */
final class TestDrawingArea : Box
{

	this()
	{
		super(GtkOrientation.VERTICAL,4);

		TestDrawing drawingArea = new TestDrawing();

		ComboBoxText operators = new ComboBoxText();
		operators.appendText("CLEAR");
		operators.appendText("SOURCE");
		operators.appendText("OVER");
		operators.appendText("IN");
		operators.appendText("OUT");
		operators.appendText("ATOP");
		operators.appendText("DEST");
		operators.appendText("DEST_OVER");
		operators.appendText("DEST_IN");
		operators.appendText("DEST_OUT");
		operators.appendText("DEST_ATOP");
		operators.appendText("XOR");
		operators.appendText("ADD");
		operators.appendText("SATURATE");
		operators.appendText("MULTIPLY");
		operators.appendText("SCREEN");
		operators.appendText("OVERLAY");
		operators.appendText("DARKEN");
		operators.appendText("LIGHTEN");
		operators.appendText("COLOR_DODGE");
		operators.appendText("COLOR_BURN");
		operators.appendText("HARD_LIGHT");
		operators.appendText("SOFT_LIGHT");
		operators.appendText("DIFFERENCE");
		operators.appendText("EXCLUSION");
		operators.appendText("HSL_HUE");
		operators.appendText("HSL_SATURATION");
		operators.appendText("HSL_COLOR");
		operators.appendText("HSL_LUMINOSITY");
		operators.setActive(1);
		operators.addOnChanged(&drawingArea.onOperatorsChanged);

		ComboBoxText primOption = new ComboBoxText();
		primOption.appendText("Filled Arc");
		primOption.appendText("Arc");
		primOption.appendText("Line");
		primOption.appendText("Point");
		primOption.appendText("Rectangle");
		primOption.appendText("Filled Rectangle");
		primOption.appendText("Text");
		primOption.appendText("Pango text");
		primOption.appendText("Image");
		primOption.appendText("Polygon");
		primOption.setActive(0);
		primOption.addOnChanged(&drawingArea.onPrimOptionChanged);

		drawingArea.setVexpand(true);
		append(drawingArea);

		Box hbox = new Box(GtkOrientation.HORIZONTAL,4);
		hbox.append(operators);
		hbox.append(primOption);
		hbox.append(drawingArea.imageSizeSpin);
		hbox.append(drawingArea.squareSizeSpin);

		append(hbox);
	}

	final class TestDrawing : DrawingArea
	{
		CairoOperator operator = CairoOperator.OVER;
		ImageSurface surface;

		int width;
		int height;

		bool buttonIsDown;
		int motionX, motionY;

		string primitiveType;
		PgFontDescription font;
		Pixbuf nativePixbuf;
		Pixbuf scaledPixbuf;

		SpinButton imageSizeSpin;
		SpinButton squareSizeSpin;

		struct Point
		{
			int x, y;
		}

		const Point[] polygonStar = [
			{0,4},
			{1,1},
			{4,0},
			{1,-1},
			{0,-4},
			{-1,-1},
			{-4,0},
			{-1,1}
			];

		this()
		{
			setSizeRequest(333,333);
			width = getWidth();
			height = getHeight();

			primitiveType = "Filled Arc";
			font = PgFontDescription.fromString("Courier 48");

      nativePixbuf = Pixbuf.newFromFile("images/gtkDlogo_a_small.png");

			if (nativePixbuf !is null)
				scaledPixbuf = nativePixbuf.copy();
			else
				writeln("\nFailed to load image file gtkDlogo_a_small.png");

			imageSizeSpin = new SpinButton(new Adjustment(30, 1, 400, 1, 10, 0),1,0);
			imageSizeSpin.addOnValueChanged(&imageSizeSpinChanged);
			imageSizeSpin.setTooltipText("Size of Image drawing operator");

			squareSizeSpin = new SpinButton(new Adjustment(5, 4, 100, 1, 10, 0),1,0);
			squareSizeSpin.addOnValueChanged(&squareSizeSpinChanged);
			squareSizeSpin.setTooltipText("Background square size");

			setDrawFunc(&drawFunc);
			addOnResize(&onResize);

			auto motionController = new EventControllerMotion();
			addController(motionController);
			motionController.addOnMotion(&onMotion);

			auto gestureClick = new GestureClick();
			addController(gestureClick);
			gestureClick.setButton(1);
			gestureClick.addOnPressed(&onButtonPress);
			gestureClick.addOnReleased(&onButtonRelease);
		}

		void onResize(int w, int h, DrawingArea drawingArea)
		{
			width = w;
			height = h;

			surface = ImageSurface.create(CairoFormat.ARGB32, w, h);
			drawPoints(Context.create(surface));
		}

		public void onButtonPress(int nPress, double x, double y, GestureClick gestureClick)
		{
			buttonIsDown = true;
			this.queueDraw();
		}

		public void onButtonRelease(int nPress, double x, double y, GestureClick gestureClick)
		{
			buttonIsDown = false;
			this.queueDraw();
		}

		/**
		 * This will be called from the expose event call back.
		 * \bug this is called on get or loose focus - review
		 */
		public void drawFunc(Context context, int width, int height, DrawingArea drawingArea)
		{
			//Fill the Widget with the surface we are drawing on.
			context.setSourceSurface(surface, 0, 0);

			if ( buttonIsDown )
				drawPrimitive(motionX, motionY);

			context.paint();
		}

		public void onMotion(double x, double y, EventControllerMotion ctrl)
		{
			motionX = cast(int)x;
			motionY = cast(int)y;

			if ( buttonIsDown )
				this.queueDraw();
		}

		public void squareSizeSpinChanged(SpinButton spinButton)
		{
			static int count = 0;
			debug(trace) writefln("backSpinChanged - entry %s", ++count);

			drawPoints(Context.create(surface));
			this.queueDraw();

			debug(trace) writeln("backSpinChanged - exit");
		}

		public void imageSizeSpinChanged(SpinButton spinButton)
		{
			if (nativePixbuf !is null)
			{
				int w = imageSizeSpin.getValueAsInt();

				float ww = w * nativePixbuf.getWidth() / 30;
				float hh = w * nativePixbuf.getHeight() / 30;

				scaledPixbuf = nativePixbuf.scaleSimple(cast(int)ww, cast(int)hh, GdkInterpType.HYPER);
				this.queueDraw();
			}
		}

		public void drawPrimitive(int x, int y)
		{
			int w = squareSizeSpin.getValueAsInt();
			int h = w * 3 / 4;

			Context context = Context.create(surface);
			context.setOperator(operator);

			debug(trace) writefln("primitiveType = %s", primitiveType);

			switch ( primitiveType )
			{
				case "Arc":
					context.arc(x-w/2,y-w/2,w,0,2*PI);
					context.stroke();
					break;

				case "Filled Arc":
					context.arc(x-w/4,y-w/4,w/2,0,2*PI);
					context.fill();
					break;

				case "Line":
					context.moveTo(x, y);
					context.lineTo(x+w, y);
					context.stroke();
					break;

				case "Point":
					context.rectangle(x, y, 1, 1);
					context.fill();
					break;

				case "Rectangle":
					context.rectangle(x-w/2, y-w/4, w, h);
					context.stroke();
					break;

				case "Filled Rectangle":
					context.rectangle(x-w/2, y-w/4, w, h);
					context.fill();
					break;

				case "Text":
					context.selectFontFace("FreeMono", CairoFontSlant.NORMAL, CairoFontWeight.NORMAL);
					context.setFontSize(12);
					context.moveTo(x, y);
					context.showText("gtkD toolkit");
					break;

				case "Pango text":
					PgLayout l = PgCairo.createLayout(context);
					PgFontDescription fd = new PgFontDescription("Sans", w);

					l.setText("Gtk+ with D");
					l.setFontDescription(fd);

					context.moveTo(x, y);
					PgCairo.showLayout(context, l);
					break;

				case "Image":
					if ( !(scaledPixbuf is null))
					{
						CairoContext.setSourcePixbuf(context, scaledPixbuf, x, y);
						context.paint();
					}
					break;

				case "Polygon":
					//TODO: Use Context.scale and transform ?
					for ( int scale = 10 ; scale<= 300; scale+=15)
					{
						context.save();
						context.moveTo(polygonStar[0].x*scale/2+x, polygonStar[0].y*scale/2+y);

						foreach(p; polygonStar[1 .. $])
						{
							context.lineTo(p.x*scale/2+x, p.y*scale/2+y);
						}
						context.closePath();
						context.stroke();
						context.restore();
					}
					break;

				default:
					context.arcNegative(x-2,y-2,4,0,6);
					context.fill();
					break;
			}

			//Redraw the Widget.
			this.queueDraw();
		}

		private void drawPoints(Context context)
		{
			int square = squareSizeSpin.getValueAsInt();
			int totalcount = 0;
			int count = 0;
			int x = 0;
			int y = 0;

			debug(trace) writefln("w,h = %s %s",width ,height);

			float dx = 256.0 / width;
			float dy = 256.0 / height ;
			float xx;
			float yy;
			while ( x < width || y <height )
			{
				context.save();

				xx = x * dx;
				yy = y * dy;
				context.setSourceRgba( xx / 255,
				                       yy / 255,
				                       sqrt((xx*xx)+(yy*yy)) / 255,
				                       1 );

				if ( square > 1 )
				{
					context.rectangle(x, y, square, square);
					context.fill();
				}
				else
				{
					context.moveTo(x, y);
					context.stroke();
				}
				x +=square;
				if  ( x > width)
				{
					if ( y>height)
					{
						//y=0;
					}
					else
					{
						x = 0;
						y+=square;
					}
				}
				++totalcount;

				context.restore();
			}
		}

		void onOperatorsChanged(ComboBox comboBox)
		{
			auto comboBoxText = cast(ComboBoxText)comboBox;
			debug(trace) writefln("CairoOperator = %s", comboBoxText.getActiveText());
			switch ( comboBoxText.getActiveText() )
			{
				case "CLEAR":          operator = CairoOperator.CLEAR;          break;
				case "SOURCE":         operator = CairoOperator.SOURCE;         break;
				case "OVER":           operator = CairoOperator.OVER;           break;
				case "IN":             operator = CairoOperator.IN;             break;
				case "OUT":            operator = CairoOperator.OUT;            break;
				case "ATOP":           operator = CairoOperator.ATOP;           break;
				case "DEST":           operator = CairoOperator.DEST;           break;
				case "DEST_OVER":      operator = CairoOperator.DEST_OVER;      break;
				case "DEST_IN":        operator = CairoOperator.DEST_IN;        break;
				case "DEST_OUT":       operator = CairoOperator.DEST_OUT;       break;
				case "DEST_ATOP":      operator = CairoOperator.DEST_ATOP;      break;
				case "XOR":            operator = CairoOperator.XOR;            break;
				case "ADD":            operator = CairoOperator.ADD;            break;
				case "SATURATE":       operator = CairoOperator.SATURATE;       break;
				case "MULTIPLY":       operator = CairoOperator.MULTIPLY;       break;
				case "SCREEN":         operator = CairoOperator.SCREEN;         break;
				case "OVERLAY":        operator = CairoOperator.OVERLAY;        break;
				case "DARKEN":         operator = CairoOperator.DARKEN;         break;
				case "LIGHTEN":        operator = CairoOperator.LIGHTEN;        break;
				case "COLOR_DODGE":    operator = CairoOperator.COLOR_DODGE;    break;
				case "COLOR_BURN":     operator = CairoOperator.COLOR_BURN;     break;
				case "HARD_LIGHT":     operator = CairoOperator.HARD_LIGHT;     break;
				case "SOFT_LIGHT":     operator = CairoOperator.SOFT_LIGHT;     break;
				case "DIFFERENCE":     operator = CairoOperator.DIFFERENCE;     break;
				case "EXCLUSION":      operator = CairoOperator.EXCLUSION;      break;
				case "HSL_HUE":        operator = CairoOperator.HSL_HUE;        break;
				case "HSL_SATURATION": operator = CairoOperator.HSL_SATURATION; break;
				case "HSL_COLOR":      operator = CairoOperator.HSL_COLOR;      break;
				case "HSL_LUMINOSITY": operator = CairoOperator.HSL_LUMINOSITY; break;
				default:               operator = CairoOperator.OVER;           break;
			}
		}

		void onPrimOptionChanged(ComboBox comboBox)
		{
			primitiveType = (cast(ComboBoxText)comboBox).getActiveText();
		}
	}
}

