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


module gtk.ColorDialogButton;

private import gdk.RGBA;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.ColorDialog;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * The `GtkColorDialogButton` is a wrapped around a [class@Gtk.ColorDialog]
 * and allows to open a color chooser dialog to change the color.
 * 
 * ![An example GtkColorDialogButton](color-button.png)
 * 
 * It is suitable widget for selecting a color in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * colorbutton
 * ╰── button.color
 * ╰── [content]
 * ```
 * 
 * `GtkColorDialogButton` has a single CSS node with name colorbutton which
 * contains a button node. To differentiate it from a plain `GtkButton`,
 * it gets the .color style class.
 *
 * Since: 4.10
 */
public class ColorDialogButton : Widget
{
	/** the main Gtk struct */
	protected GtkColorDialogButton* gtkColorDialogButton;

	/** Get the main Gtk struct */
	public GtkColorDialogButton* getColorDialogButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColorDialogButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColorDialogButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColorDialogButton* gtkColorDialogButton, bool ownedRef = false)
	{
		this.gtkColorDialogButton = gtkColorDialogButton;
		super(cast(GtkWidget*)gtkColorDialogButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_color_dialog_button_get_type();
	}

	/**
	 * Creates a new `GtkColorDialogButton` with the
	 * given `GtkColorDialog`.
	 *
	 * You can pass `NULL` to this function and set a `GtkColorDialog`
	 * later. The button will be insensitive until that happens.
	 *
	 * Params:
	 *     dialog = the `GtkColorDialog` to use
	 *
	 * Returns: the new `GtkColorDialogButton`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ColorDialog dialog)
	{
		auto __p = gtk_color_dialog_button_new((dialog is null) ? null : dialog.getColorDialogStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkColorDialogButton*) __p);
	}

	/**
	 * Returns the `GtkColorDialog` of @self.
	 *
	 * Returns: the `GtkColorDialog`
	 *
	 * Since: 4.10
	 */
	public ColorDialog getDialog()
	{
		auto __p = gtk_color_dialog_button_get_dialog(gtkColorDialogButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ColorDialog)(cast(GtkColorDialog*) __p);
	}

	/**
	 * Returns the color of the button.
	 *
	 * This function is what should be used to obtain
	 * the color that was chosen by the user. To get
	 * informed about changes, listen to "notify::color".
	 *
	 * Returns: the color
	 *
	 * Since: 4.10
	 */
	public RGBA getRgba()
	{
		auto __p = gtk_color_dialog_button_get_rgba(gtkColorDialogButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RGBA)(cast(GdkRGBA*) __p);
	}

	/**
	 * Sets a `GtkColorDialog` object to use for
	 * creating the color chooser dialog that is
	 * presented when the user clicks the button.
	 *
	 * Params:
	 *     dialog = the new `GtkColorDialog`
	 *
	 * Since: 4.10
	 */
	public void setDialog(ColorDialog dialog)
	{
		gtk_color_dialog_button_set_dialog(gtkColorDialogButton, (dialog is null) ? null : dialog.getColorDialogStruct());
	}

	/**
	 * Sets the color of the button.
	 *
	 * Params:
	 *     color = the new color
	 *
	 * Since: 4.10
	 */
	public void setRgba(RGBA color)
	{
		gtk_color_dialog_button_set_rgba(gtkColorDialogButton, (color is null) ? null : color.getRGBAStruct());
	}

	/**
	 * Emitted when the color dialog button is activated.
	 *
	 * The `::activate` signal on `GtkColorDialogButton` is an action signal
	 * and emitting it causes the button to pop up its dialog.
	 *
	 * Since: 4.14
	 */
	gulong addOnActivate(void delegate(ColorDialogButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
