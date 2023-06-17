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


module gtk.FontDialogButton;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.FontDialog;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import pango.PgFontDescription;
private import pango.PgLanguage;


/**
 * The `GtkFontDialogButton` is wrapped around a [class@Gtk.FontDialog]
 * and allows to open a font chooser dialog to change the font.
 * 
 * ![An example GtkFontDialogButton](font-button.png)
 * 
 * It is suitable widget for selecting a font in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * fontbutton
 * ╰── button.font
 * ╰── [content]
 * ```
 * 
 * `GtkFontDialogButton` has a single CSS node with name fontbutton which
 * contains a button node with the .font style class.
 *
 * Since: 4.10
 */
public class FontDialogButton : Widget
{
	/** the main Gtk struct */
	protected GtkFontDialogButton* gtkFontDialogButton;

	/** Get the main Gtk struct */
	public GtkFontDialogButton* getFontDialogButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFontDialogButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFontDialogButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFontDialogButton* gtkFontDialogButton, bool ownedRef = false)
	{
		this.gtkFontDialogButton = gtkFontDialogButton;
		super(cast(GtkWidget*)gtkFontDialogButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_font_dialog_button_get_type();
	}

	/**
	 * Creates a new `GtkFontDialogButton` with the
	 * given `GtkFontDialog`.
	 *
	 * You can pass `NULL` to this function and set a `GtkFontDialog`
	 * later. The button will be insensitive until that happens.
	 *
	 * Params:
	 *     dialog = the `GtkFontDialog` to use
	 *
	 * Returns: the new `GtkFontDialogButton`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(FontDialog dialog)
	{
		auto __p = gtk_font_dialog_button_new((dialog is null) ? null : dialog.getFontDialogStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFontDialogButton*) __p);
	}

	/**
	 * Returns the `GtkFontDialog` of @self.
	 *
	 * Returns: the `GtkFontDialog`
	 *
	 * Since: 4.10
	 */
	public FontDialog getDialog()
	{
		auto __p = gtk_font_dialog_button_get_dialog(gtkFontDialogButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(FontDialog)(cast(GtkFontDialog*) __p);
	}

	/**
	 * Returns the font of the button.
	 *
	 * This function is what should be used to obtain
	 * the font that was chosen by the user. To get
	 * informed about changes, listen to "notify::font-desc".
	 *
	 * Returns: the font
	 *
	 * Since: 4.10
	 */
	public PgFontDescription getFontDesc()
	{
		auto __p = gtk_font_dialog_button_get_font_desc(gtkFontDialogButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontDescription)(cast(PangoFontDescription*) __p);
	}

	/**
	 * Returns the font features of the button.
	 *
	 * This function is what should be used to obtain the font features
	 * that were chosen by the user. To get informed about changes, listen
	 * to "notify::font-features".
	 *
	 * Note that the button will only let users choose font features
	 * if [property@Gtk.FontDialogButton:level] is set to
	 * `GTK_FONT_LEVEL_FEATURES`.
	 *
	 * Returns: the font features
	 *
	 * Since: 4.10
	 */
	public string getFontFeatures()
	{
		return Str.toString(gtk_font_dialog_button_get_font_features(gtkFontDialogButton));
	}

	/**
	 * Returns the language that is used for font features.
	 *
	 * Returns: the language
	 *
	 * Since: 4.10
	 */
	public PgLanguage getLanguage()
	{
		auto __p = gtk_font_dialog_button_get_language(gtkFontDialogButton);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgLanguage)(cast(PangoLanguage*) __p, true);
	}

	/**
	 * Returns the level of detail at which this dialog
	 * lets the user select fonts.
	 *
	 * Returns: the level of detail
	 *
	 * Since: 4.10
	 */
	public GtkFontLevel getLevel()
	{
		return gtk_font_dialog_button_get_level(gtkFontDialogButton);
	}

	/**
	 * Returns whether the selected font is used in the label.
	 *
	 * Returns: whether the selected font is used in the label
	 *
	 * Since: 4.10
	 */
	public bool getUseFont()
	{
		return gtk_font_dialog_button_get_use_font(gtkFontDialogButton) != 0;
	}

	/**
	 * Returns whether the selected font size is used in the label.
	 *
	 * Returns: whether the selected font size is used in the label
	 *
	 * Since: 4.10
	 */
	public bool getUseSize()
	{
		return gtk_font_dialog_button_get_use_size(gtkFontDialogButton) != 0;
	}

	/**
	 * Sets a `GtkFontDialog` object to use for
	 * creating the font chooser dialog that is
	 * presented when the user clicks the button.
	 *
	 * Params:
	 *     dialog = the new `GtkFontDialog`
	 *
	 * Since: 4.10
	 */
	public void setDialog(FontDialog dialog)
	{
		gtk_font_dialog_button_set_dialog(gtkFontDialogButton, (dialog is null) ? null : dialog.getFontDialogStruct());
	}

	/**
	 * Sets the font of the button.
	 *
	 * Params:
	 *     fontDesc = the new font
	 *
	 * Since: 4.10
	 */
	public void setFontDesc(PgFontDescription fontDesc)
	{
		gtk_font_dialog_button_set_font_desc(gtkFontDialogButton, (fontDesc is null) ? null : fontDesc.getPgFontDescriptionStruct());
	}

	/**
	 * Sets the font features of the button.
	 *
	 * Params:
	 *     fontFeatures = the font features
	 *
	 * Since: 4.10
	 */
	public void setFontFeatures(string fontFeatures)
	{
		gtk_font_dialog_button_set_font_features(gtkFontDialogButton, Str.toStringz(fontFeatures));
	}

	/**
	 * Sets the language to use for font features.
	 *
	 * Params:
	 *     language = the new language
	 *
	 * Since: 4.10
	 */
	public void setLanguage(PgLanguage language)
	{
		gtk_font_dialog_button_set_language(gtkFontDialogButton, (language is null) ? null : language.getPgLanguageStruct());
	}

	/**
	 * Sets the level of detail at which this dialog
	 * lets the user select fonts.
	 *
	 * Params:
	 *     level = the level of detail
	 *
	 * Since: 4.10
	 */
	public void setLevel(GtkFontLevel level)
	{
		gtk_font_dialog_button_set_level(gtkFontDialogButton, level);
	}

	/**
	 * If @use_font is `TRUE`, the font name will be written
	 * using the selected font.
	 *
	 * Params:
	 *     useFont = If `TRUE`, font name will be written using
	 *         the chosen font
	 *
	 * Since: 4.10
	 */
	public void setUseFont(bool useFont)
	{
		gtk_font_dialog_button_set_use_font(gtkFontDialogButton, useFont);
	}

	/**
	 * If @use_size is `TRUE`, the font name will be written
	 * using the selected font size.
	 *
	 * Params:
	 *     useSize = If `TRUE`, font name will be written using
	 *         the chosen font size
	 *
	 * Since: 4.10
	 */
	public void setUseSize(bool useSize)
	{
		gtk_font_dialog_button_set_use_size(gtkFontDialogButton, useSize);
	}
}
