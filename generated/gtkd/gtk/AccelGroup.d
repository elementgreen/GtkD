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


module gtk.AccelGroup;

private import gdk.Display;
private import glib.Str;
private import glib.c.functions;
private import gtk.c.functions;
public  import gtk.c.types;


/** */
public struct AccelGroup
{

	/**
	 * Gets the modifier mask.
	 *
	 * The modifier mask determines which modifiers are considered significant
	 * for keyboard accelerators. This includes all keyboard modifiers except
	 * for %GDK_LOCK_MASK.
	 *
	 * Returns: the modifier mask for accelerators
	 */
	public static GdkModifierType acceleratorGetDefaultModMask()
	{
		return gtk_accelerator_get_default_mod_mask();
	}

	/**
	 * Converts an accelerator keyval and modifier mask into a string
	 * which can be used to represent the accelerator to the user.
	 *
	 * Params:
	 *     acceleratorKey = accelerator keyval
	 *     acceleratorMods = accelerator modifier mask
	 *
	 * Returns: a newly-allocated string representing the accelerator
	 */
	public static string acceleratorGetLabel(uint acceleratorKey, GdkModifierType acceleratorMods)
	{
		auto retStr = gtk_accelerator_get_label(acceleratorKey, acceleratorMods);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Converts an accelerator keyval and modifier mask
	 * into a string that can be displayed to the user.
	 *
	 * The string may be translated.
	 *
	 * This function is similar to [func@Gtk.accelerator_get_label],
	 * but handling keycodes. This is only useful for system-level
	 * components, applications should use [func@Gtk.accelerator_get_label]
	 * instead.
	 *
	 * Params:
	 *     display = a `GdkDisplay` or %NULL to use the default display
	 *     acceleratorKey = accelerator keyval
	 *     keycode = accelerator keycode
	 *     acceleratorMods = accelerator modifier mask
	 *
	 * Returns: a newly-allocated string representing the accelerator
	 */
	public static string acceleratorGetLabelWithKeycode(Display display, uint acceleratorKey, uint keycode, GdkModifierType acceleratorMods)
	{
		auto retStr = gtk_accelerator_get_label_with_keycode((display is null) ? null : display.getDisplayStruct(), acceleratorKey, keycode, acceleratorMods);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Converts an accelerator keyval and modifier mask into a string
	 * parseable by gtk_accelerator_parse().
	 *
	 * For example, if you pass in %GDK_KEY_q and %GDK_CONTROL_MASK,
	 * this function returns `<Control>q`.
	 *
	 * If you need to display accelerators in the user interface,
	 * see [func@Gtk.accelerator_get_label].
	 *
	 * Params:
	 *     acceleratorKey = accelerator keyval
	 *     acceleratorMods = accelerator modifier mask
	 *
	 * Returns: a newly-allocated accelerator name
	 */
	public static string acceleratorName(uint acceleratorKey, GdkModifierType acceleratorMods)
	{
		auto retStr = gtk_accelerator_name(acceleratorKey, acceleratorMods);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Converts an accelerator keyval and modifier mask
	 * into a string parseable by gtk_accelerator_parse_with_keycode().
	 *
	 * This is similar to [func@Gtk.accelerator_name] but handling keycodes.
	 * This is only useful for system-level components, applications
	 * should use [func@Gtk.accelerator_name] instead.
	 *
	 * Params:
	 *     display = a `GdkDisplay` or %NULL to use the default display
	 *     acceleratorKey = accelerator keyval
	 *     keycode = accelerator keycode
	 *     acceleratorMods = accelerator modifier mask
	 *
	 * Returns: a newly allocated accelerator name.
	 */
	public static string acceleratorNameWithKeycode(Display display, uint acceleratorKey, uint keycode, GdkModifierType acceleratorMods)
	{
		auto retStr = gtk_accelerator_name_with_keycode((display is null) ? null : display.getDisplayStruct(), acceleratorKey, keycode, acceleratorMods);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Parses a string representing an accelerator.
	 *
	 * The format looks like “`<Control>a`” or “`<Shift><Alt>F1`”.
	 *
	 * The parser is fairly liberal and allows lower or upper case, and also
	 * abbreviations such as “`<Ctl>`” and “`<Ctrl>`”.
	 *
	 * Key names are parsed using [func@Gdk.keyval_from_name]. For character keys
	 * the name is not the symbol, but the lowercase name, e.g. one would use
	 * “`<Ctrl>minus`” instead of “`<Ctrl>-`”.
	 *
	 * Modifiers are enclosed in angular brackets `<>`, and match the
	 * [flags@Gdk.ModifierType] mask:
	 *
	 * - `<Shift>` for `GDK_SHIFT_MASK`
	 * - `<Ctrl>` for `GDK_CONTROL_MASK`
	 * - `<Alt>` for `GDK_ALT_MASK`
	 * - `<Meta>` for `GDK_META_MASK`
	 * - `<Super>` for `GDK_SUPER_MASK`
	 * - `<Hyper>` for `GDK_HYPER_MASK`
	 *
	 * If the parse operation fails, @accelerator_key and @accelerator_mods will
	 * be set to 0 (zero).
	 *
	 * Params:
	 *     accelerator = string representing an accelerator
	 *     acceleratorKey = return location for accelerator keyval
	 *     acceleratorMods = return location for accelerator
	 *         modifier mask
	 */
	public static bool acceleratorParse(string accelerator, out uint acceleratorKey, out GdkModifierType acceleratorMods)
	{
		return gtk_accelerator_parse(Str.toStringz(accelerator), &acceleratorKey, &acceleratorMods) != 0;
	}

	/**
	 * Parses a string representing an accelerator.
	 *
	 * This is similar to [func@Gtk.accelerator_parse] but handles keycodes as
	 * well. This is only useful for system-level components, applications should
	 * use [func@Gtk.accelerator_parse] instead.
	 *
	 * If @accelerator_codes is given and the result stored in it is non-%NULL,
	 * the result must be freed with g_free().
	 *
	 * If a keycode is present in the accelerator and no @accelerator_codes
	 * is given, the parse will fail.
	 *
	 * If the parse fails, @accelerator_key, @accelerator_mods and
	 * @accelerator_codes will be set to 0 (zero).
	 *
	 * Params:
	 *     accelerator = string representing an accelerator
	 *     display = the `GdkDisplay` to look up @accelerator_codes in
	 *     acceleratorKey = return location for accelerator keyval
	 *     acceleratorCodes = return location for accelerator keycodes
	 *     acceleratorMods = return location for accelerator
	 *         modifier mask
	 *
	 * Returns: %TRUE if parsing succeeded
	 */
	public static bool acceleratorParseWithKeycode(string accelerator, Display display, out uint acceleratorKey, out uint[] acceleratorCodes, out GdkModifierType acceleratorMods)
	{
		uint* outacceleratorCodes;

		auto __p = gtk_accelerator_parse_with_keycode(Str.toStringz(accelerator), (display is null) ? null : display.getDisplayStruct(), &acceleratorKey, &outacceleratorCodes, &acceleratorMods) != 0;

		acceleratorCodes = outacceleratorCodes[0 .. getArrayLength(outacceleratorCodes)];

		return __p;
	}

	/**
	 * Determines whether a given keyval and modifier mask constitute
	 * a valid keyboard accelerator.
	 *
	 * For example, the %GDK_KEY_a keyval plus %GDK_CONTROL_MASK mark is valid,
	 * and matches the “Ctrl+a” accelerator. But, you can't, for instance, use
	 * the %GDK_KEY_Control_L keyval as an accelerator.
	 *
	 * Params:
	 *     keyval = a GDK keyval
	 *     modifiers = modifier mask
	 *
	 * Returns: %TRUE if the accelerator is valid
	 */
	public static bool acceleratorValid(uint keyval, GdkModifierType modifiers)
	{
		return gtk_accelerator_valid(keyval, modifiers) != 0;
	}
}
