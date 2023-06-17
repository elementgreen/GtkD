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

module TestImage;

//debug = trace

private import gtk.Box;

private import gtk.Grid;
private import gtk.FileChooserDialog;
private import gtk.Button;
private import gtk.Widget;
private import gtk.ScrolledWindow;
private import gtk.Image;
private import gtk.Dialog;
private import gtk.Window;

private import std.stdio;

private import glib.Str;
private import gio.FileIF;
private import gio.ListModelIF;

/**
 * This tests the GtkD loading and display and image file
 */
class TestImage : Box
{
	Grid grid;
	FileChooserDialog fs;
	ScrolledWindow sw;

	Window window;

	this(Window window)
	{
		this.window = window;
		debug(1)
		{
			writeln("instantiating TestImage");
		}

		super(GtkOrientation.VERTICAL,8);

		sw = new ScrolledWindow();

		sw.setChild(initGrid());

		Box hBox = new Box(GtkOrientation.HORIZONTAL,0);
		Button loadDir = Button.newWithLabel("Load Files");
		loadDir.addOnClicked(&loadImages);
		hBox.append(loadDir);

		sw.setVexpand(true);
		append(sw);
		append(hBox);

	}

	Grid initGrid()
	{

		string[] pngs;

		pngs ~= "images/gtkD_bevel.png";
		pngs ~= "images/gtkDlogo_a.png";
		pngs ~= "images/gtkD_logo_plain.png";
		pngs ~= "images/gtkD_logo_small.png";
		pngs ~= "images/gtkD_icon_1.png";
		pngs ~= "images/gtkDlogo_a_small.png";
		pngs ~= "images/gtkD_logo.png";
		pngs ~= "images/gtkD_logo_too_small.png";


		return loadGrid(pngs);
	}

	private Grid loadGrid(string[] imageFiles)
	{
		if ( grid  is  null )
		{
			grid = new Grid();
		}
		else
		{
			for (auto child = grid.getFirstChild(); child; )
				grid.remove(child);
		}


		int row = 0;
		int col = 0;

		Image image;


//		Window progressWindow = new Window();//WindowType.POPUP);
//		progressWindow.setBorderWidth(10);
//		ProgressBar progressBar = new ProgressBar();
//		progressWindow.add(progressBar);
//		progressWindow.show();


		for ( int i=0 ; i<imageFiles.length ;i++)
		{
			string fileName = imageFiles[i];
			if ( fileName[0] != '/' )
			{
				fileName = fileName;
			}
			image = Image.newFromFile(fileName);
			//image.addOnEnterNotify(&onEnter);
			//image.addOnLeaveNotify(&onLeave);
			debug(trace) writefln("adding image %s to grid at %s,%s", fileName, col, row);
			image.setMarginStart(4);
			image.setMarginEnd(4);
			image.setMarginTop(4);
			image.setMarginBottom(4);
			image.setVexpand(true);
			image.setHexpand(true);
			grid.attach(image,col,row,1,1);
			++col;
			if ( col == 8 )
			{
				col = 0;
				++row;
			}

		}
		return grid;
	}

	void loadImages(Button button)
	{
		if ( fs  is  null )
		{
			string[] a;
			ResponseType[] r;
			a ~= "Lets go!";
			a ~= "Please don't";
			r ~= ResponseType.ACCEPT;
			r ~= ResponseType.CANCEL;
			fs = new FileChooserDialog("File Selection", window, FileChooserAction.OPEN, a, r);
		}
		fs.setSelectMultiple(true);

		fs.addOnResponse(delegate(int response, Dialog dialog) {
			if ( response == ResponseType.ACCEPT )
			{
				string[] fileNames;
				ListModelIF list = fs.getFiles();

				for ( int i = 0; i<list.getNItems() ; i++)
				{
					string fileName = (cast(FileIF)list.getObject(i)).getPath();
					debug(trace) writefln("Testmage.loadImages.File selected = %s", fileName);
					fileNames ~= fileName;
				}

				loadGrid(fileNames);
			}
			fs.hide();
		});
	}

	void onEnter(Widget widget)
	{
		writeln("TestImage.mouseEnterNotify");
		//return true;
	}
	void onLeave(Widget widget)
	{
		writeln("TestImage.mouseLeaveNotify");
		//return true;
	}


}
