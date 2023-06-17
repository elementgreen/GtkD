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

module TestWindow;

//debug = 1;

//version=cairo;

version(cairo)import cairo.clock;

import gtk.Version;
import gtk.Grid;

import stdlib = core.stdc.stdlib : exit;
import core.thread;
import std.random;
import std.string;

import gio.Application : GioApplication = Application;
import gtk.Application;
import gtk.ApplicationWindow;
import gtk.Adjustment;

import TestEntries;

import TestDrawingArea;
import TestScales;
import TestText;
import TestImage;
import TestThemes;
import TestAspectFrame;
import TestIdle;
import TTextView;

import gtk.Widget;
import gtk.PopoverMenuBar;
import gtk.Notebook;
import gtk.ComboBoxText;
import gtk.FileChooserDialog;
import gtk.FontChooserDialog;
import gtk.ColorChooserDialog;
import gtk.Button;
import gtk.Box;
import gtk.MessageDialog;
import gtk.Frame;
import gtk.Statusbar;
import gtk.CheckButton;
import gtk.ToggleButton;
import gtk.Calendar;
import gtk.SpinButton;
import gtk.ListStore;
import gtk.TreeIter;
import gtk.TreeView;
import gtk.TreeViewColumn;
import gtk.CellRendererText;
import gtk.Window;
import gtk.ScrolledWindow;
import gtk.MessageDialog;
import gtk.Separator;
import gtk.EventControllerMotion;
import gtk.GestureClick;
import gtk.ColorChooserDialog;

import gio.Menu;
import gio.MenuItem;
import gio.SimpleAction;
import gio.ActionMapIF;

import core.memory;

import glib.ListSG;
import gobject.Value;
import glib.Variant;
import glib.Str;
import gtk.Label;
import glib.ListG;
import gtk.Paned;

import gtk.Calendar;
import std.stdio;
import gtk.FileChooserNative;

import gtk.AboutDialog;
import gtk.Dialog;

import gtk.TreeStore;
import gdkpixbuf.Pixbuf;
import gtk.ComboBox;

import gtk.TreePath;
import gtk.CellRenderer;
import gtk.CellRendererPixbuf;

/**
 * This tests the GtkD widgets
 */


class TestWindow : ApplicationWindow
{
	/**
	 * Executed when the user tries to close the window
	 * @return true to refuse to close the window
	 */
	int windowDelete(GdkEvent* event, Widget widget)
	{

		debug(events) writefln("TestWindow.widgetDelete : this and widget to delete %X %X",this,window);
		MessageDialog d = new MessageDialog(
										this,
										GtkDialogFlags.MODAL,
										MessageType.QUESTION,
										ButtonsType.YES_NO,
										"Are you sure you want' to exit these GtkDTests?");
    d.show();
		d.addOnResponse(delegate (int response, Dialog dialog) {
			if ( response == ResponseType.YES )
			{
				stdlib.exit(0);
			}
			dialog.destroy();
		});

		return true;
	}

	void anyButtonExits(Button button)
	{
			stdlib.exit(0);
	}

	this(Application application)
	{
		super(application);
		setTitle("GtkD tests");
		setup();
		show();

		string versionCompare = Version.checkVersion(4,0,0);

		if ( versionCompare.length > 0 )
		{
			MessageDialog d = new MessageDialog(this,
										GtkDialogFlags.MODAL,
										MessageType.WARNING,
										ButtonsType.OK,
										"GtkD : Gtk+ version missmatch\n" ~ versionCompare ~
										"\nYou might run into problems!"~
										"\n\nPress OK to continue");
			d.addOnResponse((int, Dialog dialog) => dialog.destroy());
			d.show();
		}
	}

	void setup()
	{
		//Frame.defaultBorder = 7;

		auto mainBox = new Box(GtkOrientation.VERTICAL,0);

		getApplication().setMenubar(getMenuBar());
		setShowMenubar(true);
		mainBox.append(getToolbar());

		Notebook notebook = setNotebook();
		notebook.setMarginStart(10);
		notebook.setMarginEnd(10);
		notebook.setMarginTop(10);
		notebook.setMarginBottom(10);
		notebook.setVexpand(true);
		mainBox.append(notebook);

		Button cancelButton = Button.newWithLabel("Cancel");
		cancelButton.addOnClicked(&anyButtonExits);
		Button exitButton = Button.newWithLabel("Quit");
		exitButton.addOnClicked(&anyButtonExits);
		Button quitButton = Button.newWithLabel("OK");

		Box bBox = new Box(GtkOrientation.HORIZONTAL,10);

		bBox.prepend(exitButton);
		bBox.prepend(cancelButton);
		bBox.prepend(quitButton);
		mainBox.append(bBox);

		Statusbar statusbar = new Statusbar();

		mainBox.append(statusbar);
		setChild(mainBox);

		notebook.appendPage(new TestEntries.TestEntries(),new Label("Entry"));
		testEventBox(notebook);

		testButtons(notebook);

		testLists(notebook);
		testNotebook(notebook);
		testPaned(notebook);
		testDialogs(notebook);
		testViewport(notebook);

		notebook.appendPage(new TestScales.TestScales(),new Label("Scales"));
			testSpinButton(notebook);

//		notebook.appendPage(new TestTreeView,"TreeView");
//		notebook.appendPage(new TestTreeView1,"TreeView 1");
//			testList(notebook);

		version(linux) {
			// this block crashes gtk+ on win32 for some reason
			auto frame = new Frame("Drawing Area");
			frame.setChild(new TestDrawingArea.TestDrawingArea());
			notebook.appendPage(frame,new Label("Drawing"));
			notebook.appendPage(new TestText.TestText(),new Label("Text"));
			notebook.appendPage(new TestImage.TestImage(this),new Label("Image"));
			//TestThemes seems to be unfinished.
			//notebook.appendPage(new TestThemes(this),"Themes");
			notebook.appendPage(new TestAspectFrame.TestAspectFrame(),new Label("Aspect Frame"));
			notebook.appendPage(new TestIdle.TestIdle(),new Label("Idle"));
			version(cairo)notebook.appendPage(new Clock(), new Label("Cairo"));
			gtkDemo(notebook);
		}
	}

	Menu getMenuBar()
	{
		Menu menuBar = new Menu();

		Menu menu = new Menu();
		menuBar.appendSubmenu("File", menu);
		menu.append("New", "file.new");
		menu.append("Open", "file.open");
		menu.append("Close", "file.close");
		menu.append("Exit", "file.exit");

		menu = new Menu();
		menuBar.appendSubmenu("Edit", menu);
		menu.append("Find", "edit.find");
		menu.append("Search", "edit.search");

		menu = new Menu();
		menuBar.appendSubmenu("Help", menu);
		menu.append("About", "help.about");

		auto actionMap = cast(ActionMapIF)getApplication();

		auto action = new SimpleAction("file.new", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("file.open", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("file.close", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("file.exit", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("edit.find", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("edit.search", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		action = new SimpleAction("help.about", null);
		action.addOnActivate(&onMenuActivate);
		actionMap.addAction(action);

		return menuBar;
	}

	class GtkDAbout : AboutDialog
	{
		this()
		{
			string[] names;
			names ~= "Antonio Monteiro (binding/wrapping/proxying/decorating for D)";
			names ~= "www.gtk.org (base C library)";

			setAuthors( names );
			setDocumenters( names );
			setArtists( names );
			setLicense("License is LGPL");
			setWebsite("http://lisdev.com");
		}
	}

	void onMenuActivate(Variant val, SimpleAction action)
	{
		string actionName = action.getName();
		switch( actionName )
		{
			case "help.about":
				new GtkDAbout();
				break;
			default:
				MessageDialog d = new MessageDialog(
					this,
					GtkDialogFlags.MODAL,
					MessageType.INFO,
					ButtonsType.OK,
					"You pressed menu item "~actionName);
				
				d.show();
				d.addOnResponse((int response, Dialog dialog) => dialog.destroy());
			break;
		}
	}

	Widget getToolbar()
	{
		Box toolbar = new Box(GtkOrientation.HORIZONTAL,0);
		toolbar.append(Button.newFromIconName("document-open"));
		toolbar.append(Button.newFromIconName("window-close"));
		toolbar.append(new Separator(GtkOrientation.VERTICAL));
		toolbar.append(Button.newFromIconName("document-save"));
		toolbar.append(Button.newFromIconName("document-save-as"));

		return toolbar;

	}

	Notebook setNotebook()
	{
		Notebook notebook = new Notebook();
		notebook.addOnSwitchPage(&onNotebookSwitchPage);
		notebook.setTabPos(PositionType.LEFT);
		return notebook;
	}

	void onNotebookSwitchPage(Widget notePage, uint pageNumber, Notebook notebook)
	{
		//writefln("Notebook switch to page %s", pageNumber);
		// fullCollect helps finding objects that shouldn't have been collected
		GC.collect();
		//writefln("exiting Notebook switch to page %s", pageNumber);
	}

	//import EventBox;

	void testEventBox(Notebook notebook)
	{
//		EventBox eventBox = new EventBox();
//		eventBox.add(new Label("label on event box"));
//		notebook.appendPage(eventBox,"Buttons");

		//EventBox eventBox = new EventBox();
		//eventBox.add(new Label("label on event box"));
		notebook.appendPage(new Label("just a simple label"),new Label("Label"));
	}

	void testButtons(Notebook notebook)
	{
		Grid grid = new Grid();
		grid.setColumnSpacing(4);
		grid.setRowSpacing(4);
		CheckButton groupBtn;

		// Radio buttons
		foreach (i; 0 .. 9)
		{
			auto checkBtn = CheckButton.newWithLabel(format("Option %d", i + 1));
			grid.attach(checkBtn, 0, i, 1, 1);

			if (i > 0)
				checkBtn.setGroup(groupBtn);
			else groupBtn = checkBtn;
		}

		CheckButton editableButton = CheckButton.newWithLabel("editable");
		CheckButton visibleButton = CheckButton.newWithLabel("visible");
		grid.attach(editableButton,0,9,1,1);
		grid.attach(visibleButton,0,10,1,1);

		ToggleButton toggleButton = ToggleButton.newWithLabel("Toggle this");
		grid.attach(toggleButton,0,11,1,1);

		Button button = Button.newWithLabel("test events");
		grid.attach(button,0,12,1,1);

		button.addOnActivate((Button) => writeln("button Activate"));
		button.addOnClicked((Button) => writeln("button Clicked"));

		auto motionController = new EventControllerMotion();
		button.addController(motionController);
		motionController.addOnEnter((double, double, EventControllerMotion) => writeln("button Enter"));
		motionController.addOnLeave((EventControllerMotion) => writeln("button Leave"));

		auto gestureClick = new GestureClick();
		button.addController(gestureClick);
		gestureClick.setButton(1);
		gestureClick.addOnPressed((int, double, double, GestureClick) => writeln("button Pressed"));
		gestureClick.addOnReleased((int, double, double, GestureClick) => writeln("button Released"));

		auto frame = new Frame("Buttons");
		frame.setChild(grid);
		notebook.appendPage(frame, new Label("Buttons"));
	}

	class ComboStore : TreeStore
	{
		this()
		{
			//int* i = cast(int*)pixbufGetType();

			GType[] columns;
			columns ~= GType.STRING;
			columns ~= GType.STRING;
			super(columns);
		}

	}


	void testLists(Notebook notebook)
	{
		Box mainBox = new Box(GtkOrientation.VERTICAL,3);

		// comboBoxTextEntry from a list of strings
		mainBox.append(new Label("String combo"));
		static string[] cbList = ["item 1","item 2","item 3","item 4","item 5","item 6","item 7","item 8","item 9"];
		comboText = new ComboBoxText();
		comboText.appendText("Combo box text entry 1");
		comboText.appendText("Combo box text entry 2");
		comboText.appendText("Combo box text entry 3");
		comboText.appendText("Combo box text entry 4");
		comboText.appendText("Combo box text entry 5");
		comboText.setActive(2);

		Box actionBox1 = new Box(GtkOrientation.HORIZONTAL,0);
		actionBox1.append(comboText);

		Button showCombo1 = Button.newWithLabel("ShowCombo");
		showCombo1.addOnClicked(&showTextCombo);
		actionBox1.append(showCombo1);

		Frame frame = new Frame("Text entry ComboBox");
		frame.setChild(actionBox1);
		mainBox.append(frame);

		// TODO combo with widgets

		// new ComboBox + TreeModel

		ComboStore comboStore = new ComboStore();

		TreeIter iterFirst;	// to set the first active iter
		TreeIter iterChild;
		TreeIter iterTop;
		comboStore.append(iterTop, null);
		comboStore.setValue(iterTop, 0, "Paganini" );
		comboStore.append(iterFirst, iterTop);
		comboStore.setValue(iterFirst, 0, "Nicolo" );

		comboStore.append(iterTop, null);
		comboStore.setValue(iterTop, 0, "List" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Franz" );

		comboStore.append(iterTop, null);
		comboStore.setValue(iterTop, 0, "Beethoven" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Ludwic" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Maria" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Van" );

		comboStore.append(iterTop, null);
		comboStore.setValue(iterTop, 0, "Bach" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Johann" );
		comboStore.append(iterChild, iterTop);
		comboStore.setValue(iterChild, 0, "Sebastian" );

		ComboBox treeCombo = ComboBox.newWithModelAndEntry(comboStore);
		treeCombo.setEntryTextColumn(0);

		// TODO something is wrong gettign the ier from the path
		//TreePath path = new TreePath("0,0");
		//comboStore.getIter(iterChild, path);
		//treeCombo.setActiveIter(iterChild);
		// use a previously set iter
		treeCombo.setActiveIter(iterFirst);

		frame = new Frame("Tree Combo box");
		frame.setChild(treeCombo);
		mainBox.append(frame);

		simpleCombo = new ComboBoxText();
		simpleCombo.appendText("Top");
		simpleCombo.appendText("Bottom");
		simpleCombo.appendText("Left");
		simpleCombo.appendText("Right");
		simpleCombo.setActive(0);

		// actions

		Box actionBox =  new Box(GtkOrientation.HORIZONTAL,0);
		actionBox.append(simpleCombo);

		Button showCombo = Button.newWithLabel("ShowCombo"); 
		showCombo.addOnClicked(&showSimpleCombo);
		actionBox.append(showCombo);

		frame = new Frame("Simple text list");
		frame.setChild(actionBox);
		mainBox.append(frame);

		frame = new Frame("Lists");
		frame.setChild(mainBox);

		notebook.appendPage(frame,new Label("Lists"));
	}
	ComboBoxText simpleCombo;
	ComboBoxText comboText;

	void showTextCombo(Button button)
	{
		writefln("Combo selected text = %s",comboText.getActiveText());
	}

	void showSimpleCombo(Button button)
	{
		writefln("Combo selected text = %s",simpleCombo.getActiveText());
	}

	class NB : Notebook
	{
		void itemActivated(MenuItem menu_item)
		{
			writeln("NB.activateCallback");
		}
		void buttonClicked(Button button)
		{
			setCurrentPage(2);
		}

		void switchPage(Notebook notebook, /*NotebookPage page,*/ uint pageNumber)
		{
			writefln("new page = %d",pageNumber);
		}
	}


	NB nb;

	void posLeft(Button button)
	{
		nb.setTabPos(PositionType.LEFT);
	}
	void posRight(Button button)
	{
		nb.setTabPos(PositionType.RIGHT);
	}
	void posTop(Button button)
	{
		nb.setTabPos(PositionType.TOP);
	}
	void posBottom(Button button)
	{
		nb.setTabPos(PositionType.BOTTOM);
	}

	/**
	 * tests notebook
	 * @param nodebook
	 */
	void testNotebook(Notebook notebook)
	{
		nb = new NB();
		nb.setTabPos(PositionType.min);
		nb.popupEnable();
		nb.setShowBorder(false);

		class PageMove
		{
			Notebook notebook;
			PositionType toPos;
			this(Notebook notebook,PositionType toPos)
			{
				this.notebook = notebook;
				this.toPos = toPos;
			}
			void buttonClickedCallback()
			{
				notebook.setTabPos(toPos);
			}
		}

		PageMove toLeft = new PageMove(nb,PositionType.LEFT);
		PageMove toRight = new PageMove(nb,PositionType.RIGHT);
		PageMove toTop = new PageMove(nb,PositionType.TOP);
		PageMove toBottom = new PageMove(nb,PositionType.BOTTOM);

		notebook.appendPage(nb,new Label("Notebook"));

		for( char i = '1' ; i<'5' ; i++ )
		{
			Grid grid = new Grid();
			grid.setColumnSpacing(4);
			grid.setRowSpacing(4);
			Button left = Button.newWithLabel("Left "~ i);
			left.addOnClicked(&posLeft);
			Button right = Button.newWithLabel("Right "~ i);
			right.addOnClicked(&posRight);
			Button top = Button.newWithLabel("top "~ i);
			top.addOnClicked(&posTop);
			Button bottom = Button.newWithLabel("bottom "~ i);
			bottom.addOnClicked(&posBottom);

			grid.attach(top,0,0,1,1);
			grid.attach(right,1,0,1,1);
			grid.attach(left,0,1,1,1);
			grid.attach(bottom,1,1,1,1);

			if ( i == 3 )
			{

//				MenuItem menuItem = new MenuItem("menu page 3",&nb.itemActivated);
//
//				Menu menu = new Menu();
//				menu.append(new MenuItem("page 3.1",&nb.itemActivated));
//				menu.append(new MenuItem("page 3.2",&nb.itemActivated));
//				menu.append(new MenuItem("page 3.3",&nb.itemActivated));
//				menu.append(new MenuItem("page 3.4",&nb.itemActivated));
//
//				menuItem.setSubmenu(menu);

				Box box = new Box(GtkOrientation.HORIZONTAL,0);
				Button button = Button.newWithLabel("Page " ~ i);
				button.addOnClicked(&nb.buttonClicked);
				CheckButton checkButton = new CheckButton();
				box.append(checkButton);
				box.append(button);
				//nb.appendPageMenu(grid,box,menuItem);
				//nb.appendPage(grid,box);
			}
			else
			{
				nb.appendPage(grid,new Label("Page " ~ i));
			}
		}
		//nb.addOnSwitchPage(&nb.switchPage);
	}

	void testPaned(Notebook notebook)
	{
		Paned mainPaned = new Paned(GtkOrientation.VERTICAL);
		Paned p0 = mainPaned;
		Button p1;
		Paned p2;

		bool h = true;
		for ( char c='1' ; c<='5' ; c++ )
		{
			p1 = Button.newWithLabel("Pane "~c);
			if ( h ) p2 = new Paned(GtkOrientation.HORIZONTAL);
			else p2 = new Paned(GtkOrientation.VERTICAL);

			p0.setStartChild(p1);
			p0.setEndChild(p2);
			p0 = p2;
			h = !h;
		}

		notebook.appendPage(mainPaned,new Label("Paned"));
	}

	FileChooserDialog fcd;

	void showFileChooser(Button button)
	{
		string[] a;
		ResponseType[] r;
		a ~= "Lets go!";
		a ~= "Please don't";
		r ~= ResponseType.OK;
		r ~= ResponseType.CANCEL;

		if ( fcd  is  null )
		{
			fcd = new FileChooserDialog("File Chooser", this, FileChooserAction.OPEN, a, r);
		}

		fcd.setSelectMultiple(true);
		fcd.show();
		fcd.addOnResponse((int response, Dialog dialog) => dialog.hide());
//		writefln("file selected = %s",fcd.getFileName());
//
//		foreach ( int i, string selection ; fs.getSelections())
//		{
//			writefln("File(s) selected [%d] %s",i,selection);
//		}
	}

	void showColor(Button button)
	{
    static ColorChooserDialog d;

		if ( d  is  null )
		{
			d = new ColorChooserDialog("Select the color", this);
		}
		d.show();
		d.addOnResponse((int response, Dialog dialog) => dialog.hide());
	}

	void showCalendar(Button button)
	{
		Window calWin = new Window();
		calWin.setTitle("Calendar");
		Calendar calendar = new Calendar();
		//calendar.setTitle("No Title");
		calWin.setChild(calendar);
		calWin.show();
	}

	void showFont(Button button)
	{
		static FontChooserDialog f;

		if ( f  is  null )
		{
			f = new FontChooserDialog("Select the font", this);
		}
		f.show();
		f.addOnResponse((int response, Dialog dialog) => dialog.hide());
	}

	void testDialogs(Notebook notebook)
	{
		Box bBox = new Box(GtkOrientation.VERTICAL,0);

		if ( fcd  is  null )
		{
			fcd = new FileChooserDialog("File Chooser", this, FileChooserAction.OPEN);
		}

		Button fileChooser = Button.newWithLabel("File Chooser");
		fileChooser.addOnClicked(&showFileChooser);

		Button color = Button.newWithLabel("Color Dialog");
		color.addOnClicked(&showColor);

		Button calendar = Button.newWithLabel("Calendar Dialog");
		calendar.addOnClicked(&showCalendar);

		Button fontButton = Button.newWithLabel("Font Dialog");
		fontButton.addOnClicked(&showFont);

		//fontButton.modifyFont("[Newspaper][16]");

		bBox.append(fileChooser);
		bBox.append(color);
		bBox.append(calendar);
		bBox.append(fontButton);

		Frame frame = new Frame("Dialogs");
		frame.setChild(bBox);
		notebook.appendPage(frame,new Label("Dialogs"));
	}

	void testViewport(Notebook notebook)
	{
		Grid grid = new Grid();
		for ( int i = 0 ; i<21 ; i++)
		{
			for ( int j = 0 ; j<21; j++)
			{
				if ( (i == j) || (i+j==20) || (i==10) || (j==10))
				{
					grid.attach(Button.newWithLabel("Button"),i,j,1,1);
				}
			}
		}

		ScrolledWindow sw = new ScrolledWindow();
		sw.setChild(grid);
		notebook.appendPage(sw,new Label("Viewport"));
	}

	void testSpinButton(Notebook notebook)
	{
		Grid grid = new Grid();
		grid.setColumnSpacing(4);
		grid.setRowSpacing(4);

		SpinButton spin = new SpinButton(new Adjustment(1.0, 0.0, 100.0, 1.0, 10.0, 0),1,0);
		grid.attach(new Label("Spin this:"),0,0,1,1);
		grid.attach(spin,1,0,1,1);

		notebook.appendPage(grid,new Label("Spin Buttons"));
	}

	void testList(Notebook notebook)
	{
		class TestListStore : ListStore
		{
			this()
			{
				static GType [3] columns = [
								GType.STRING,
								GType.STRING,
								GType.STRING
								];
				super(columns);
			}
		}

		TestListStore testListStore = new TestListStore();

		TreeIter iterTop;
		testListStore.append(iterTop);

		static int [3] cols = [0,1,2];
		Value[] vals;
		vals ~= new Value("Antonio");
		vals ~= new Value("Canada");
		vals ~= new Value("Ontario");
		testListStore.set(iterTop,cols,vals);

		testListStore.append(iterTop);
		Value[] vals1;
		vals1 ~= new Value("John Reimer");
		vals1 ~= new Value("Canada");
		vals1 ~= new Value("BC");
		testListStore.set(iterTop,cols,vals1);

		testListStore.append(iterTop);
		Value[] vals2;
		vals2 ~= new Value("Friend of GtkD 2");
		vals2 ~= new Value("Poland");
		vals2 ~= new Value("Torun");
		testListStore.set(iterTop,cols,vals2);

		testListStore.append(iterTop);
		Value[] vals3;
		vals3 ~= new Value("Friend of GtkD 3");
		vals3 ~= new Value("Norway");
		vals3 ~= new Value("Norway");
		testListStore.set(iterTop,cols,vals3);

		TreeView treeView = new TreeView();
		treeView.setModel(testListStore);
		treeView.setHeadersClickable(true);

		//CellRendererText cellText = new CellRendererText();
		TreeViewColumn column = new TreeViewColumn("Author",new CellRendererText(),"text", 0);
		treeView.appendColumn(column);
		column.setResizable(true);
		column.setReorderable(true);
		column.setSortColumnId(0);
		column.setSortIndicator(true);

		column = new TreeViewColumn("Country",new CellRendererText(),"text", 1);
		treeView.appendColumn(column);
		column.setResizable(true);
		column.setReorderable(true);
		column.setSortColumnId(1);
		column.setSortIndicator(true);

		column = new TreeViewColumn("Province",new CellRendererText(),"text", 2);
		treeView.appendColumn(column);
		column.setResizable(true);
		column.setReorderable(true);
		column.setSortColumnId(2);
		column.setSortIndicator(true);

		//notebook.appendPage(treeView,"ListView");
		ScrolledWindow sw = new ScrolledWindow();
		sw.setChild(treeView);
		notebook.appendPage(sw,new Label("ListView"));
	}

	void testDelete(Notebook notebook)
	{
//		ulong l = 0;
//		while(true)
//		{
//			int i =0;
//			while(i<1 )
//			{
//				//Button b = new Button("Button");
//				Drawable d = getDrawable();
//				delete d;
//				++i;
//			}
//			++l;
//			write("testDelete count = %d\n\0",l*i);
//		}

	}

	void gtkDemo(Notebook notebook)
	{
		Box vBBox = new Box(GtkOrientation.VERTICAL, 0);
		vBBox.setSpacing(4);

		Button button = Button.newWithLabel("Text View");
		button.addOnClicked(delegate(Button button) {
			new TTextView.TTextView();
		});
		vBBox.append(button);

		button = Button.newWithLabel("Editable Cells");
		button.addOnClicked(delegate(Button button) {
			//	new TEditableCells()
		});
		vBBox.append(button);

		notebook.appendPage(vBBox,new Label("gtk-demo"));
	}
}

int main(string[] args)
{
	import gtkd.Loader;

	Linker.dumpLoadLibraries();
	Linker.dumpFailedLoads();

	auto application = new Application("org.gtkd.demo.TestWindow", GApplicationFlags.FLAGS_NONE);
	application.addOnActivate(delegate void(GioApplication app) { new TestWindow(application); });
	return application.run(args);
}
