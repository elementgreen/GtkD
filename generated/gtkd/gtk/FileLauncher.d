/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
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

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gtk.FileLauncher;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import gobject.ObjectG;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkFileLauncher` object collects the arguments that are needed to open a
 * file with an application.
 * 
 * Depending on system configuration, user preferences and available APIs, this
 * may or may not show an app chooser dialog or launch the default application
 * right away.
 * 
 * The operation is started with the [method@Gtk.FileLauncher.launch] function.
 * This API follows the GIO async pattern, and the result can be obtained by
 * calling [method@Gtk.FileLauncher.launch_finish].
 * 
 * To launch uris that don't represent files, use [class@Gtk.UriLauncher].
 *
 * Since: 4.10
 */
public class FileLauncher : ObjectG
{
	/** the main Gtk struct */
	protected GtkFileLauncher* gtkFileLauncher;

	/** Get the main Gtk struct */
	public GtkFileLauncher* getFileLauncherStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFileLauncher;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFileLauncher;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFileLauncher* gtkFileLauncher, bool ownedRef = false)
	{
		this.gtkFileLauncher = gtkFileLauncher;
		super(cast(GObject*)gtkFileLauncher, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_file_launcher_get_type();
	}

	/**
	 * Creates a new `GtkFileLauncher` object.
	 *
	 * Params:
	 *     file = the file to open
	 *
	 * Returns: the new `GtkFileLauncher`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(FileIF file)
	{
		auto __p = gtk_file_launcher_new((file is null) ? null : file.getFileStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFileLauncher*) __p, true);
	}

	/**
	 * Returns whether to ask the user to choose an app for opening the file.
	 *
	 * Returns: `TRUE` if always asking for app
	 *
	 * Since: 4.12
	 */
	public bool getAlwaysAsk()
	{
		return gtk_file_launcher_get_always_ask(gtkFileLauncher) != 0;
	}

	/**
	 * Gets the file that will be opened.
	 *
	 * Returns: the file
	 *
	 * Since: 4.10
	 */
	public FileIF getFile()
	{
		auto __p = gtk_file_launcher_get_file(gtkFileLauncher);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p);
	}

	/**
	 * Launch an application to open the file.
	 *
	 * This may present an app chooser dialog to the user.
	 *
	 * The @callback will be called when the operation is completed.
	 * It should call [method@Gtk.FileLauncher.launch_finish] to obtain
	 * the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void launch(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_launcher_launch(gtkFileLauncher, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileLauncher.launch] call and
	 * returns the result.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: `TRUE` if an application was launched,
	 *     or `FALSE` and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public bool launchFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_launcher_launch_finish(gtkFileLauncher, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Launch a file manager to show the file in its parent directory.
	 *
	 * This is only supported native files. It will fail if @file
	 * is e.g. a http:// uri.
	 *
	 * The @callback will be called when the operation is completed.
	 * It should call [method@Gtk.FileLauncher.open_containing_folder_finish]
	 * to obtain the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void openContainingFolder(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_launcher_open_containing_folder(gtkFileLauncher, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileLauncher.open_containing_folder]
	 * call and returns the result.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: `TRUE` if an application was launched,
	 *     or `FALSE` and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public bool openContainingFolderFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_launcher_open_containing_folder_finish(gtkFileLauncher, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Sets whether to awlays ask the user to choose an app for opening the file.
	 * If `FALSE`, the file might be opened with a default app or the previous choice.
	 *
	 * Params:
	 *     alwaysAsk = a `gboolean`
	 *
	 * Since: 4.12
	 */
	public void setAlwaysAsk(bool alwaysAsk)
	{
		gtk_file_launcher_set_always_ask(gtkFileLauncher, alwaysAsk);
	}

	/**
	 * Sets the file that will be opened.
	 *
	 * Params:
	 *     file = a `GFile`
	 *
	 * Since: 4.10
	 */
	public void setFile(FileIF file)
	{
		gtk_file_launcher_set_file(gtkFileLauncher, (file is null) ? null : file.getFileStruct());
	}
}
