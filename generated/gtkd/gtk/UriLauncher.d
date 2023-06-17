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


module gtk.UriLauncher;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkUriLauncher` object collects the arguments that are needed to open a uri
 * with an application.
 * 
 * Depending on system configuration, user preferences and available APIs, this
 * may or may not show an app chooser dialog or launch the default application
 * right away.
 * 
 * The operation is started with the [method@Gtk.UriLauncher.launch] function.
 * This API follows the GIO async pattern, and the result can be obtained by
 * calling [method@Gtk.UriLauncher.launch_finish].
 * 
 * To launch a file, use [class@Gtk.FileLauncher].
 *
 * Since: 4.10
 */
public class UriLauncher : ObjectG
{
	/** the main Gtk struct */
	protected GtkUriLauncher* gtkUriLauncher;

	/** Get the main Gtk struct */
	public GtkUriLauncher* getUriLauncherStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkUriLauncher;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkUriLauncher;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkUriLauncher* gtkUriLauncher, bool ownedRef = false)
	{
		this.gtkUriLauncher = gtkUriLauncher;
		super(cast(GObject*)gtkUriLauncher, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_uri_launcher_get_type();
	}

	/**
	 * Creates a new `GtkUriLauncher` object.
	 *
	 * Params:
	 *     uri = the uri to open
	 *
	 * Returns: the new `GtkUriLauncher`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string uri)
	{
		auto __p = gtk_uri_launcher_new(Str.toStringz(uri));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkUriLauncher*) __p, true);
	}

	/**
	 * Gets the uri that will be opened.
	 *
	 * Returns: the uri
	 *
	 * Since: 4.10
	 */
	public string getUri()
	{
		return Str.toString(gtk_uri_launcher_get_uri(gtkUriLauncher));
	}

	/**
	 * Launch an application to open the uri.
	 *
	 * This may present an app chooser dialog to the user.
	 *
	 * The @callback will be called when the operation is completed.
	 * It should call [method@Gtk.UriLauncher.launch_finish] to obtain
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
		gtk_uri_launcher_launch(gtkUriLauncher, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.UriLauncher.launch] call and
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

		auto __p = gtk_uri_launcher_launch_finish(gtkUriLauncher, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Sets the uri that will be opened.
	 *
	 * Params:
	 *     uri = the uri
	 *
	 * Since: 4.10
	 */
	public void setUri(string uri)
	{
		gtk_uri_launcher_set_uri(gtkUriLauncher, Str.toStringz(uri));
	}
}
