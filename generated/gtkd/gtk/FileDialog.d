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


module gtk.FileDialog;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.FileIF;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.FileFilter;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkFileDialog` object collects the arguments that
 * are needed to present a file chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with [method@Gtk.FileDialog.open],
 * [method@Gtk.FileDialog.save], etc. These APIs follow the
 * GIO async pattern, and the result can be obtained by calling
 * the corresponding finish function, for example
 * [method@Gtk.FileDialog.open_finish].
 *
 * Since: 4.10
 */
public class FileDialog : ObjectG
{
	/** the main Gtk struct */
	protected GtkFileDialog* gtkFileDialog;

	/** Get the main Gtk struct */
	public GtkFileDialog* getFileDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFileDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFileDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFileDialog* gtkFileDialog, bool ownedRef = false)
	{
		this.gtkFileDialog = gtkFileDialog;
		super(cast(GObject*)gtkFileDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_file_dialog_get_type();
	}

	/**
	 * Creates a new `GtkFileDialog` object.
	 *
	 * Returns: the new `GtkFileDialog`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_file_dialog_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFileDialog*) __p, true);
	}

	/**
	 * Returns: the label shown on the file chooser's accept button.
	 *
	 * Since: 4.10
	 */
	public string getAcceptLabel()
	{
		return Str.toString(gtk_file_dialog_get_accept_label(gtkFileDialog));
	}

	/**
	 * Gets the filter that will be selected by default
	 * in the file chooser dialog.
	 *
	 * Returns: the current filter
	 *
	 * Since: 4.10
	 */
	public FileFilter getDefaultFilter()
	{
		auto __p = gtk_file_dialog_get_default_filter(gtkFileDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileFilter)(cast(GtkFileFilter*) __p);
	}

	/**
	 * Gets the filters that will be offered to the user
	 * in the file chooser dialog.
	 *
	 * Returns: the filters, as
	 *     a `GListModel` of `GtkFileFilters`
	 *
	 * Since: 4.10
	 */
	public ListModelIF getFilters()
	{
		auto __p = gtk_file_dialog_get_filters(gtkFileDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Gets the file that will be initially selected in
	 * the file chooser dialog.
	 *
	 * Returns: the file
	 *
	 * Since: 4.10
	 */
	public FileIF getInitialFile()
	{
		auto __p = gtk_file_dialog_get_initial_file(gtkFileDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p);
	}

	/**
	 * Gets the folder that will be set as the
	 * initial folder in the file chooser dialog.
	 *
	 * Returns: the folder
	 *
	 * Since: 4.10
	 */
	public FileIF getInitialFolder()
	{
		auto __p = gtk_file_dialog_get_initial_folder(gtkFileDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p);
	}

	/**
	 * Gets the name for the file that should be initially set.
	 *
	 * Returns: the name
	 *
	 * Since: 4.10
	 */
	public string getInitialName()
	{
		return Str.toString(gtk_file_dialog_get_initial_name(gtkFileDialog));
	}

	/**
	 * Returns whether the file chooser dialog
	 * blocks interaction with the parent window
	 * while it is presented.
	 *
	 * Returns: `TRUE` if the file chooser dialog is modal
	 *
	 * Since: 4.10
	 */
	public bool getModal()
	{
		return gtk_file_dialog_get_modal(gtkFileDialog) != 0;
	}

	/**
	 * Returns the title that will be shown on the
	 * file chooser dialog.
	 *
	 * Returns: the title
	 *
	 * Since: 4.10
	 */
	public string getTitle()
	{
		return Str.toString(gtk_file_dialog_get_title(gtkFileDialog));
	}

	/**
	 * This function initiates a file selection operation by
	 * presenting a file chooser dialog to the user.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FileDialog.open_finish]
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
	public void open(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_dialog_open(gtkFileDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileDialog.open] call and
	 * returns the resulting file.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the file that was selected.
	 *     Otherwise, `NULL` is returned and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public FileIF openFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_dialog_open_finish(gtkFileDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p, true);
	}

	/**
	 * This function initiates a multi-file selection operation by
	 * presenting a file chooser dialog to the user.
	 *
	 * The file chooser will initially be opened in the directory
	 * [property@Gtk.FileDialog:initial-folder].
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FileDialog.open_multiple_finish]
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
	public void openMultiple(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_dialog_open_multiple(gtkFileDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileDialog.open] call and
	 * returns the resulting files in a `GListModel`.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the file that was selected,
	 *     as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
	 *     and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public ListModelIF openMultipleFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_dialog_open_multiple_finish(gtkFileDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p, true);
	}

	/**
	 * This function initiates a file save operation by
	 * presenting a file chooser dialog to the user.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FileDialog.save_finish]
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
	public void save(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_dialog_save(gtkFileDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileDialog.save] call and
	 * returns the resulting file.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the file that was selected.
	 *     Otherwise, `NULL` is returned and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public FileIF saveFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_dialog_save_finish(gtkFileDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p, true);
	}

	/**
	 * This function initiates a directory selection operation by
	 * presenting a file chooser dialog to the user.
	 *
	 * If you pass @initial_folder, the file chooser will initially be
	 * opened in the parent directory of that folder, otherwise, it
	 * will be in the directory [property@Gtk.FileDialog:initial-folder].
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FileDialog.select_folder_finish]
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
	public void selectFolder(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_dialog_select_folder(gtkFileDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileDialog.select_folder] call and
	 * returns the resulting file.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the file that was selected.
	 *     Otherwise, `NULL` is returned and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public FileIF selectFolderFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_dialog_select_folder_finish(gtkFileDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FileIF)(cast(GFile*) __p, true);
	}

	/**
	 * This function initiates a multi-directory selection operation by
	 * presenting a file chooser dialog to the user.
	 *
	 * The file chooser will initially be opened in the directory
	 * [property@Gtk.FileDialog:initial-folder].
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FileDialog.select_multiple_folders_finish]
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
	public void selectMultipleFolders(Window parent, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_file_dialog_select_multiple_folders(gtkFileDialog, (parent is null) ? null : parent.getWindowStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FileDialog.select_multiple_folders]
	 * call and returns the resulting files in a `GListModel`.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the file that was selected,
	 *     as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
	 *     and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public ListModelIF selectMultipleFoldersFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_file_dialog_select_multiple_folders_finish(gtkFileDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p, true);
	}

	/**
	 * Sets the label shown on the file chooser's accept button.
	 *
	 * Leaving the accept label unset or setting it as `NULL` will fall back to
	 * a default label, depending on what API is used to launch the file dialog.
	 *
	 * Params:
	 *     acceptLabel = the new accept label
	 *
	 * Since: 4.10
	 */
	public void setAcceptLabel(string acceptLabel)
	{
		gtk_file_dialog_set_accept_label(gtkFileDialog, Str.toStringz(acceptLabel));
	}

	/**
	 * Sets the filter that will be selected by default
	 * in the file chooser dialog.
	 *
	 * If set to %NULL, the first item in [property@Gtk.FileDialog:filters]
	 * will be used as the default filter. If that list is empty, the dialog
	 * will be unfiltered.
	 *
	 * Params:
	 *     filter = a `GtkFileFilter`
	 *
	 * Since: 4.10
	 */
	public void setDefaultFilter(FileFilter filter)
	{
		gtk_file_dialog_set_default_filter(gtkFileDialog, (filter is null) ? null : filter.getFileFilterStruct());
	}

	/**
	 * Sets the filters that will be offered to the user
	 * in the file chooser dialog.
	 *
	 * Params:
	 *     filters = a `GListModel` of `GtkFileFilters`
	 *
	 * Since: 4.10
	 */
	public void setFilters(ListModelIF filters)
	{
		gtk_file_dialog_set_filters(gtkFileDialog, (filters is null) ? null : filters.getListModelStruct());
	}

	/**
	 * Sets the file that will be initially selected in
	 * the file chooser dialog.
	 *
	 * This function is a shortcut for calling both
	 * gtk_file_dialog_set_initial_folder() and
	 * gtk_file_dialog_set_initial_name() with the directory and
	 * name of @file respectively.
	 *
	 * Params:
	 *     file = a `GFile`
	 *
	 * Since: 4.10
	 */
	public void setInitialFile(FileIF file)
	{
		gtk_file_dialog_set_initial_file(gtkFileDialog, (file is null) ? null : file.getFileStruct());
	}

	/**
	 * Sets the folder that will be set as the
	 * initial folder in the file chooser dialog.
	 *
	 * Params:
	 *     folder = a `GFile`
	 *
	 * Since: 4.10
	 */
	public void setInitialFolder(FileIF folder)
	{
		gtk_file_dialog_set_initial_folder(gtkFileDialog, (folder is null) ? null : folder.getFileStruct());
	}

	/**
	 * Sets the name for the file that should be initially set.
	 * For saving dialogs, this will usually be pre-entered into the name field.
	 *
	 * If a file with this name already exists in the directory set via
	 * [property@Gtk.FileDialog:initial-folder], the dialog should preselect it.
	 *
	 * Params:
	 *     name = a UTF8 string
	 *
	 * Since: 4.10
	 */
	public void setInitialName(string name)
	{
		gtk_file_dialog_set_initial_name(gtkFileDialog, Str.toStringz(name));
	}

	/**
	 * Sets whether the file chooser dialog
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
		gtk_file_dialog_set_modal(gtkFileDialog, modal);
	}

	/**
	 * Sets the title that will be shown on the
	 * file chooser dialog.
	 *
	 * Params:
	 *     title = the new title
	 *
	 * Since: 4.10
	 */
	public void setTitle(string title)
	{
		gtk_file_dialog_set_title(gtkFileDialog, Str.toStringz(title));
	}
}
