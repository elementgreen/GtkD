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


module gtk.ColorDialog;

private import gdk.RGBA;
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
 * A `GtkColorDialog` object collects the arguments that
 * are needed to present a color chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with the [method@Gtk.ColorDialog.choose_rgba]
 * function. This API follows the GIO async pattern, and the
 * result can be obtained by calling
 * [method@Gtk.ColorDialog.choose_rgba_finish].
 * 
 * See [class@Gtk.ColorDialogButton] for a convenient control
 * that uses `GtkColorDialog` and presents the results.
 *
 * Since: 4.10
 */
public class ColorDialog : ObjectG
{
	/** the main Gtk struct */
	protected GtkColorDialog* gtkColorDialog;

	/** Get the main Gtk struct */
	public GtkColorDialog* getColorDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColorDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColorDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColorDialog* gtkColorDialog, bool ownedRef = false)
	{
		this.gtkColorDialog = gtkColorDialog;
		super(cast(GObject*)gtkColorDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_color_dialog_get_type();
	}

	/**
	 * Creates a new `GtkColorDialog` object.
	 *
	 * Returns: the new `GtkColorDialog`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_color_dialog_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkColorDialog*) __p, true);
	}

	/**
	 * This function initiates a color choice operation by
	 * presenting a color chooser dialog to the user.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.ColorDialog.choose_rgba_finish]
	 * to obtain the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     initialColor = the color to select initially
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void chooseRgba(Window parent, RGBA initialColor, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_color_dialog_choose_rgba(gtkColorDialog, (parent is null) ? null : parent.getWindowStruct(), (initialColor is null) ? null : initialColor.getRGBAStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.ColorDialog.choose_rgba] call and
	 * returns the resulting color.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the selected color, or
	 *     `NULL` and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public RGBA chooseRgbaFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_color_dialog_choose_rgba_finish(gtkColorDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RGBA)(cast(GdkRGBA*) __p, true);
	}

	/**
	 * Returns whether the color chooser dialog
	 * blocks interaction with the parent window
	 * while it is presented.
	 *
	 * Returns: `TRUE` if the color chooser dialog is modal
	 *
	 * Since: 4.10
	 */
	public bool getModal()
	{
		return gtk_color_dialog_get_modal(gtkColorDialog) != 0;
	}

	/**
	 * Returns the title that will be shown on the
	 * color chooser dialog.
	 *
	 * Returns: the title
	 *
	 * Since: 4.10
	 */
	public string getTitle()
	{
		return Str.toString(gtk_color_dialog_get_title(gtkColorDialog));
	}

	/**
	 * Returns whether colors may have alpha.
	 *
	 * Returns: `TRUE` if colors may have alpha
	 *
	 * Since: 4.10
	 */
	public bool getWithAlpha()
	{
		return gtk_color_dialog_get_with_alpha(gtkColorDialog) != 0;
	}

	/**
	 * Sets whether the color chooser dialog
	 * blocks interaction with the parent window
	 * while it is presented.
	 *
	 * Params:
	 *     modal = the new value
	 *
	 * Since: 4.10
	 */
	public void setModal(bool modal)
	{
		gtk_color_dialog_set_modal(gtkColorDialog, modal);
	}

	/**
	 * Sets the title that will be shown on the
	 * color chooser dialog.
	 *
	 * Params:
	 *     title = the new title
	 *
	 * Since: 4.10
	 */
	public void setTitle(string title)
	{
		gtk_color_dialog_set_title(gtkColorDialog, Str.toStringz(title));
	}

	/**
	 * Sets whether colors may have alpha.
	 *
	 * Params:
	 *     withAlpha = the new value
	 *
	 * Since: 4.10
	 */
	public void setWithAlpha(bool withAlpha)
	{
		gtk_color_dialog_set_with_alpha(gtkColorDialog, withAlpha);
	}
}
