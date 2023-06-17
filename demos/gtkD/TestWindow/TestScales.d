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

module TestScales;

private import gtk.Grid;

private import gtk.Scale;
private import gtk.CheckButton;
private import gtk.ComboBox;
private import gtk.ComboBoxText;
private import gtk.Box;
private import gtk.Button;
private import gtk.Scrollbar;
private import gtk.Separator;
private import gtk.Label;
private import gtk.Adjustment;
private import gtk.Range;

debug import std.stdio;

/**
 * This tests the gtkD scales and scrollbar widgets
 */

class TestScales : Grid
{
	Scale vscale;
	Scale hscale;

	this()
	{

		debug(1)
		{
			writeln("instantiating TestScales");
		}

		super();

		createRangeControls();
	}

	void createRangeControls()
	{
			Box box1,box2,box3;
			Button button;
			Scrollbar scrollbar;
			Separator separator;
			ComboBoxText positionSelection;

			Label label;
			Scale scale;
			Adjustment adj1, adj2;

			box1 = new Box(GtkOrientation.VERTICAL,0);
			attach(box1,0,0,1,1);

			box2 = new Box(GtkOrientation.HORIZONTAL,0);
			box2.setMarginStart(10);
			box2.setMarginEnd(10);
			box2.setMarginTop(10);
			box2.setMarginBottom(10);
			box2.setVexpand(true);
			box1.append(box2);

			/* value, lower, upper, step_increment, page_increment, page_size */
			/* Note that the page_size value only makes a difference for
			 * scrollbar widgets, and the highest value you'll get is actually
			 * (upper - page_size). */
			adj1 = new Adjustment(0.0, 0.0, 101.0, 0.1, 1.0, 1.0);

			vscale = new Scale(GtkOrientation.VERTICAL,adj1);
			//scale_set_default_values (GTK_SCALE (vscale));
			vscale.setHexpand(true);
			box2.append(vscale);

			box3 = new Box(GtkOrientation.VERTICAL,10);
			box3.setHexpand(true);
			box2.append(box3);

			/* Reuse the same adjustment */
			hscale = new Scale(GtkOrientation.HORIZONTAL,adj1);
			hscale.setSizeRequest(200,-1);
			//scale_set_default_values (GTK_SCALE (hscale));
			hscale.setVexpand(true);
			box3.append(hscale);

			/* Reuse the same adjustment again */
			scrollbar = new Scrollbar(GtkOrientation.HORIZONTAL,adj1);
			/* Notice how this causes the scales to always be updated
			 * continuously when the scrollbar is moved */
			scrollbar.setVexpand(true);
			box3.append(scrollbar);

			box2 = new Box(GtkOrientation.HORIZONTAL,10);
			box2.setMarginStart(10);
			box2.setMarginEnd(10);
			box2.setMarginTop(10);
			box2.setMarginBottom(10);
			box2.setVexpand(true);
			box1.append(box2);

			/* A checkbutton to control whether the value is displayed or not */
			CheckButton cButton = CheckButton.newWithLabel("Display value on scale widgets");
			cButton.setActive(true);
			cButton.addOnToggled(&displayValues);
			cButton.setHexpand(true);
			box2.append(cButton);

			box2 = new Box(GtkOrientation.HORIZONTAL,10);
			box2.setMarginStart(10);
			box2.setMarginEnd(10);
			box2.setMarginTop(10);
			box2.setMarginBottom(10);

			/* An option menu to change the position of the value */
			label = new Label("Scale Value Position:");
			box2.append(label);

			positionSelection = new ComboBoxText();
			positionSelection.appendText("Top");
			positionSelection.appendText("Bottom");
			positionSelection.appendText("Left");
			positionSelection.appendText("Right");
			positionSelection.addOnChanged(&onPositionSelectionChanged);
			positionSelection.setActive(0);

			box2.append(positionSelection);

			box1.append(box2);
	}

	void onPositionSelectionChanged(ComboBox comboBox)
	{
		switch ( (cast(ComboBoxText)comboBox).getActiveText() )
		{
			case "Top":
				vscale.setValuePos(PositionType.TOP);
				hscale.setValuePos(PositionType.TOP);
				break;
			case "Bottom":
				vscale.setValuePos(PositionType.BOTTOM);
				hscale.setValuePos(PositionType.BOTTOM);
				break;
			case "Left":
				vscale.setValuePos(PositionType.LEFT);
				hscale.setValuePos(PositionType.LEFT);
				break;
			case "Right":
				vscale.setValuePos(PositionType.RIGHT);
				hscale.setValuePos(PositionType.RIGHT);
				break;
			default:
				break;

		}
	}

	void displayValues(CheckButton checkButton)
	{
		vscale.setDrawValue(checkButton.getActive());
		hscale.setDrawValue(checkButton.getActive());
	}
}
