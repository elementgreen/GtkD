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


module gtk.AlertDialog;

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
 * A `GtkAlertDialog` object collects the arguments that
 * are needed to present a message to the user.
 * 
 * The message is shown with the [method@Gtk.AlertDialog.choose]
 * function. This API follows the GIO async pattern, and the result can
 * be obtained by calling [method@Gtk.AlertDialog.choose_finish].
 * 
 * If you don't need to wait for a button to be clicked, you can use
 * [method@Gtk.AlertDialog.show].
 *
 * Since: 4.10
 */
public class AlertDialog : ObjectG
{
	/** the main Gtk struct */
	protected GtkAlertDialog* gtkAlertDialog;

	/** Get the main Gtk struct */
	public GtkAlertDialog* getAlertDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkAlertDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkAlertDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkAlertDialog* gtkAlertDialog, bool ownedRef = false)
	{
		this.gtkAlertDialog = gtkAlertDialog;
		super(cast(GObject*)gtkAlertDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_alert_dialog_get_type();
	}

	/**
	 * This function shows the alert to the user.
	 *
	 * The @callback will be called when the alert is dismissed.
	 * It should call [method@Gtk.AlertDialog.choose_finish]
	 * to obtain the result.
	 *
	 * It is ok to pass `NULL` for the callback if the alert
	 * does not have more than one button. A simpler API for
	 * this case is [method@Gtk.AlertDialog.show].
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void choose(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_alert_dialog_choose(gtkAlertDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.AlertDialog.choose] call
	 * and returns the index of the button that was clicked.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the index of the button that was clicked, or -1 if
	 *     the dialog was cancelled and `[property@Gtk.AlertDialog:cancel-button]
	 *     is not set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public int chooseFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_alert_dialog_choose_finish(gtkAlertDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Returns the button labels for the alert.
	 *
	 * Returns: the button labels
	 *
	 * Since: 4.10
	 */
	public string[] getButtons()
	{
		return Str.toStringArray(gtk_alert_dialog_get_buttons(gtkAlertDialog));
	}

	/**
	 * Returns the index of the cancel button.
	 *
	 * Returns: the index of the cancel button, or -1
	 *
	 * Since: 4.10
	 */
	public int getCancelButton()
	{
		return gtk_alert_dialog_get_cancel_button(gtkAlertDialog);
	}

	/**
	 * Returns the index of the default button.
	 *
	 * Returns: the index of the default button, or -1
	 *
	 * Since: 4.10
	 */
	public int getDefaultButton()
	{
		return gtk_alert_dialog_get_default_button(gtkAlertDialog);
	}

	/**
	 * Returns the detail text that will be shown in the alert.
	 *
	 * Returns: the detail text
	 *
	 * Since: 4.10
	 */
	public string getDetail()
	{
		return Str.toString(gtk_alert_dialog_get_detail(gtkAlertDialog));
	}

	/**
	 * Returns the message that will be shown in the alert.
	 *
	 * Returns: the message
	 *
	 * Since: 4.10
	 */
	public string getMessage()
	{
		return Str.toString(gtk_alert_dialog_get_message(gtkAlertDialog));
	}

	/**
	 * Returns whether the alert blocks interaction
	 * with the parent window while it is presented.
	 *
	 * Returns: `TRUE` if the alert is modal
	 *
	 * Since: 4.10
	 */
	public bool getModal()
	{
		return gtk_alert_dialog_get_modal(gtkAlertDialog) != 0;
	}

	/**
	 * Sets the button labels for the alert.
	 *
	 * Params:
	 *     labels = the new button labels
	 *
	 * Since: 4.10
	 */
	public void setButtons(string[] labels)
	{
		gtk_alert_dialog_set_buttons(gtkAlertDialog, Str.toStringzArray(labels));
	}

	/**
	 * Sets the index of the cancel button.
	 *
	 * See [property@Gtk.AlertDialog:cancel-button] for
	 * details of how this value is used.
	 *
	 * Params:
	 *     button = the new cancel button
	 *
	 * Since: 4.10
	 */
	public void setCancelButton(int button)
	{
		gtk_alert_dialog_set_cancel_button(gtkAlertDialog, button);
	}

	/**
	 * Sets the index of the default button.
	 *
	 * See [property@Gtk.AlertDialog:default-button] for
	 * details of how this value is used.
	 *
	 * Params:
	 *     button = the new default button
	 *
	 * Since: 4.10
	 */
	public void setDefaultButton(int button)
	{
		gtk_alert_dialog_set_default_button(gtkAlertDialog, button);
	}

	/**
	 * Sets the detail text that will be shown in the alert.
	 *
	 * Params:
	 *     detail = the new detail text
	 *
	 * Since: 4.10
	 */
	public void setDetail(string detail)
	{
		gtk_alert_dialog_set_detail(gtkAlertDialog, Str.toStringz(detail));
	}

	/**
	 * Sets the message that will be shown in the alert.
	 *
	 * Params:
	 *     message = the new message
	 *
	 * Since: 4.10
	 */
	public void setMessage(string message)
	{
		gtk_alert_dialog_set_message(gtkAlertDialog, Str.toStringz(message));
	}

	/**
	 * Sets whether the alert blocks interaction
	 * with the parent window while it is presented.
	 *
	 * Params:
	 *     modal = the new value
	 *
	 * Since: 4.10
	 */
	public void setModal(bool modal)
	{
		gtk_alert_dialog_set_modal(gtkAlertDialog, modal);
	}

	/**
	 * Show the alert to the user.
	 *
	 * This function is a simple version of [method@Gtk.AlertDialog.choose]
	 * intended for dialogs with a single button.
	 * If you want to cancel the dialog or if the alert has more than one button,
	 * you should use that function instead and provide it with a #GCancellable or
	 * callback respectively.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *
	 * Since: 4.10
	 */
	public void show(Window parent)
	{
		gtk_alert_dialog_show(gtkAlertDialog, (parent is null) ? null : parent.getWindowStruct());
	}
}
