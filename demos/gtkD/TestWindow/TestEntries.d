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

module TestEntries;

private import gtk.Grid;

private import gtk.Entry;
private import gtk.EntryBuffer;
private import gtk.CheckButton;
private import gtk.Button;
private import gtk.Label;
private import gtk.Widget;

private import glib.Str;

private import std.stdio;
/**
 * This tests the GtkD Entry widget
 */
final class TestEntries : Grid
{
	/**
	 * Out main widget to test
	 */
	Entry entry;

	/**
	 * Creates a new TestEntries
	 */
	this()
	{
		super();

		// create the main test widget
		entry = Entry.newWithBuffer(new EntryBuffer("Change me!",-1));
		attachWithOptions(new Label("Input text"),0,1,false);
		attachWithOptions(entry,1,0,false);

		// create a button that will print the content of the entry to stdout
		Button testButton = Button.newWithLabel("Show entry");
		testButton.addOnClicked(&showEntryClicked);
		attachWithOptions(testButton,2,0,false);
		//testButton.setTooltip("This is just a test",null);

		// create a button that will change the entry display mode to invisible
		// i.e. like a password entry
		CheckButton entryVisible = CheckButton.newWithLabel("Visible");
		entryVisible.addOnToggled(&entryVisibleToggled);
		entryVisible.setActive(true);
		attachWithOptions(entryVisible,2,1,false);

		// create a button that will change the entry mode to not editable
		CheckButton entryEditable = CheckButton.newWithLabel("Editable");
		entryEditable.addOnToggled(&entryEditableToggled);
		entryEditable.setActive(true);
		attachWithOptions(entryEditable,1,1,false);
	}

  void attachWithOptions(Widget child,int column,int row,bool expand)
  {
    child.setHexpand(expand);
    child.setVexpand(expand);
    child.setMarginStart(4);
    child.setMarginEnd(4);
    child.setMarginTop(4);
    child.setMarginBottom(4);
    attach(child,column,row,1,1);
  }

	void showEntryClicked(Button button)
	{
		writef("text field contains '%s'\n",entry.getText());
	}

	void entryEditableToggled(CheckButton button)
	{
		entry.setEditable(button.getActive());
	}

	void entryVisibleToggled(CheckButton button)
	{
		entry.setVisibility(button.getActive());
	}

}
