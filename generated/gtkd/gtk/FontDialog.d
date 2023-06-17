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


module gtk.FontDialog;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.Filter;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;
private import pango.PgFontDescription;
private import pango.PgFontFace;
private import pango.PgFontFamily;
private import pango.PgFontMap;
private import pango.PgLanguage;


/**
 * A `GtkFontDialog` object collects the arguments that
 * are needed to present a font chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with the [method@Gtk.FontDialog.choose_font]
 * function or its variants. This API follows the GIO async pattern,
 * and the result can be obtained by calling the corresponding
 * finish function, such as [method@Gtk.FontDialog.choose_font_finish].
 * 
 * See [class@Gtk.FontDialogButton] for a convenient control
 * that uses `GtkFontDialog` and presents the results.
 *
 * Since: 4.10
 */
public class FontDialog : ObjectG
{
	/** the main Gtk struct */
	protected GtkFontDialog* gtkFontDialog;

	/** Get the main Gtk struct */
	public GtkFontDialog* getFontDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFontDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFontDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFontDialog* gtkFontDialog, bool ownedRef = false)
	{
		this.gtkFontDialog = gtkFontDialog;
		super(cast(GObject*)gtkFontDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_font_dialog_get_type();
	}

	/**
	 * Creates a new `GtkFontDialog` object.
	 *
	 * Returns: the new `GtkFontDialog`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_font_dialog_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFontDialog*) __p, true);
	}

	/**
	 * This function initiates a font selection operation by
	 * presenting a dialog to the user for selecting a font face
	 * (i.e. a font family and style, but not a specific font size).
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FontDialog.choose_face_finish]
	 * to obtain the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     initialValue = the initial value
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void chooseFace(Window parent, PgFontFace initialValue, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_font_dialog_choose_face(gtkFontDialog, (parent is null) ? null : parent.getWindowStruct(), (initialValue is null) ? null : initialValue.getPgFontFaceStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FontDialog.choose_face] call
	 * and returns the resulting font face.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the selected font face
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public PgFontFace chooseFaceFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_font_dialog_choose_face_finish(gtkFontDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontFace)(cast(PangoFontFace*) __p, true);
	}

	/**
	 * This function initiates a font selection operation by
	 * presenting a dialog to the user for selecting a font family.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FontDialog.choose_family_finish]
	 * to obtain the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     initialValue = the initial value
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void chooseFamily(Window parent, PgFontFamily initialValue, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_font_dialog_choose_family(gtkFontDialog, (parent is null) ? null : parent.getWindowStruct(), (initialValue is null) ? null : initialValue.getPgFontFamilyStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FontDialog.choose_family] call
	 * and returns the resulting family.
	 *
	 * This function never returns an error. If the operation is
	 * not finished successfully, the value passed as @initial_value
	 * to [method@Gtk.FontDialog.choose_family] is returned.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the selected family
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public PgFontFamily chooseFamilyFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_font_dialog_choose_family_finish(gtkFontDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontFamily)(cast(PangoFontFamily*) __p, true);
	}

	/**
	 * This function initiates a font selection operation by
	 * presenting a dialog to the user for selecting a font.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FontDialog.choose_font_finish]
	 * to obtain the result.
	 *
	 * If you want to let the user select font features as well,
	 * use [method@Gtk.FontDialog.choose_font_and_features] instead.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     initialValue = the font to select initially
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void chooseFont(Window parent, PgFontDescription initialValue, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_font_dialog_choose_font(gtkFontDialog, (parent is null) ? null : parent.getWindowStruct(), (initialValue is null) ? null : initialValue.getPgFontDescriptionStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * This function initiates a font selection operation by
	 * presenting a dialog to the user for selecting a font and
	 * font features.
	 *
	 * Font features affect how the font is rendered, for example
	 * enabling glyph variants or ligatures.
	 *
	 * The @callback will be called when the dialog is dismissed.
	 * It should call [method@Gtk.FontDialog.choose_font_and_features_finish]
	 * to obtain the result.
	 *
	 * Params:
	 *     parent = the parent `GtkWindow`
	 *     initialValue = the font to select initially
	 *     cancellable = a `GCancellable` to cancel the operation
	 *     callback = a callback to call when the operation is complete
	 *     userData = data to pass to @callback
	 *
	 * Since: 4.10
	 */
	public void chooseFontAndFeatures(Window parent, PgFontDescription initialValue, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_font_dialog_choose_font_and_features(gtkFontDialog, (parent is null) ? null : parent.getWindowStruct(), (initialValue is null) ? null : initialValue.getPgFontDescriptionStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes the [method@Gtk.FontDialog.choose_font_and_features]
	 * call and returns the resulting font description and font features.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *     fontDesc = return location for font description
	 *     fontFeatures = return location for font features
	 *     language = return location for the language
	 *
	 * Returns: `TRUE` if a font was selected. Otherwise `FALSE` is returned
	 *     and @error is set
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public bool chooseFontAndFeaturesFinish(AsyncResultIF result, out PgFontDescription fontDesc, out string fontFeatures, out PgLanguage language)
	{
		PangoFontDescription* outfontDesc = null;
		char* outfontFeatures = null;
		PangoLanguage* outlanguage = null;
		GError* err = null;

		auto __p = gtk_font_dialog_choose_font_and_features_finish(gtkFontDialog, (result is null) ? null : result.getAsyncResultStruct(), &outfontDesc, &outfontFeatures, &outlanguage, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		fontDesc = ObjectG.getDObject!(PgFontDescription)(outfontDesc);
		fontFeatures = Str.toString(outfontFeatures);
		language = ObjectG.getDObject!(PgLanguage)(outlanguage);

		return __p;
	}

	/**
	 * Finishes the [method@Gtk.FontDialog.choose_font] call
	 * and returns the resulting font description.
	 *
	 * Params:
	 *     result = a `GAsyncResult`
	 *
	 * Returns: the selected font
	 *
	 * Since: 4.10
	 *
	 * Throws: GException on failure.
	 */
	public PgFontDescription chooseFontFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_font_dialog_choose_font_finish(gtkFontDialog, (result is null) ? null : result.getAsyncResultStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontDescription)(cast(PangoFontDescription*) __p, true);
	}

	/**
	 * Returns the filter that decides which fonts to display
	 * in the font chooser dialog.
	 *
	 * Returns: the filter
	 *
	 * Since: 4.10
	 */
	public Filter getFilter()
	{
		auto __p = gtk_font_dialog_get_filter(gtkFontDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Filter)(cast(GtkFilter*) __p);
	}

	/**
	 * Returns the fontmap from which fonts are selected,
	 * or `NULL` for the default fontmap.
	 *
	 * Returns: the fontmap
	 *
	 * Since: 4.10
	 */
	public PgFontMap getFontMap()
	{
		auto __p = gtk_font_dialog_get_font_map(gtkFontDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontMap)(cast(PangoFontMap*) __p);
	}

	/**
	 * Returns the language for which font features are applied.
	 *
	 * Returns: the language for font features
	 *
	 * Since: 4.10
	 */
	public PgLanguage getLanguage()
	{
		auto __p = gtk_font_dialog_get_language(gtkFontDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgLanguage)(cast(PangoLanguage*) __p, true);
	}

	/**
	 * Returns whether the font chooser dialog
	 * blocks interaction with the parent window
	 * while it is presented.
	 *
	 * Returns: `TRUE` if the font chooser dialog is modal
	 *
	 * Since: 4.10
	 */
	public bool getModal()
	{
		return gtk_font_dialog_get_modal(gtkFontDialog) != 0;
	}

	/**
	 * Returns the title that will be shown on the
	 * font chooser dialog.
	 *
	 * Returns: the title
	 *
	 * Since: 4.10
	 */
	public string getTitle()
	{
		return Str.toString(gtk_font_dialog_get_title(gtkFontDialog));
	}

	/**
	 * Adds a filter that decides which fonts to display
	 * in the font chooser dialog.
	 *
	 * The `GtkFilter` must be able to handle both `PangoFontFamily`
	 * and `PangoFontFace` objects.
	 *
	 * Params:
	 *     filter = a `GtkFilter`
	 *
	 * Since: 4.10
	 */
	public void setFilter(Filter filter)
	{
		gtk_font_dialog_set_filter(gtkFontDialog, (filter is null) ? null : filter.getFilterStruct());
	}

	/**
	 * Sets the fontmap from which fonts are selected.
	 *
	 * If @fontmap is `NULL`, the default fontmap is used.
	 *
	 * Params:
	 *     fontmap = the fontmap
	 *
	 * Since: 4.10
	 */
	public void setFontMap(PgFontMap fontmap)
	{
		gtk_font_dialog_set_font_map(gtkFontDialog, (fontmap is null) ? null : fontmap.getPgFontMapStruct());
	}

	/**
	 * Sets the language for which font features are applied.
	 *
	 * Params:
	 *     language = the language for font features
	 *
	 * Since: 4.10
	 */
	public void setLanguage(PgLanguage language)
	{
		gtk_font_dialog_set_language(gtkFontDialog, (language is null) ? null : language.getPgLanguageStruct());
	}

	/**
	 * Sets whether the font chooser dialog
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
		gtk_font_dialog_set_modal(gtkFontDialog, modal);
	}

	/**
	 * Sets the title that will be shown on the
	 * font chooser dialog.
	 *
	 * Params:
	 *     title = the new title
	 *
	 * Since: 4.10
	 */
	public void setTitle(string title)
	{
		gtk_font_dialog_set_title(gtkFontDialog, Str.toStringz(title));
	}
}
