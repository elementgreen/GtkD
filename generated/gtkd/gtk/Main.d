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


module gtk.Main;

private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;
private import pango.PgLanguage;


/** */
public struct Main
{

	/**
	 * Prevents [id@gtk_init] and [id@gtk_init_check] from automatically calling
	 * `setlocale (LC_ALL, "")`.
	 *
	 * You would want to use this function if you wanted to set the locale for
	 * your program to something other than the user’s locale, or if
	 * you wanted to set different values for different locale categories.
	 *
	 * Most programs should not need to call this function.
	 */
	public static void disableSetlocale()
	{
		gtk_disable_setlocale();
	}

	/**
	 * Returns the GTK debug flags that are currently active.
	 *
	 * This function is intended for GTK modules that want
	 * to adjust their debug output based on GTK debug flags.
	 *
	 * Returns: the GTK debug flags.
	 */
	public static GtkDebugFlags getDebugFlags()
	{
		return gtk_get_debug_flags();
	}

	/**
	 * Returns the `PangoLanguage` for the default language
	 * currently in effect.
	 *
	 * Note that this can change over the life of an
	 * application.
	 *
	 * The default language is derived from the current
	 * locale. It determines, for example, whether GTK uses
	 * the right-to-left or left-to-right text direction.
	 *
	 * This function is equivalent to
	 * [func@Pango.Language.get_default].
	 * See that function for details.
	 *
	 * Returns: the default language as a
	 *     `PangoLanguage`
	 */
	public static PgLanguage getDefaultLanguage()
	{
		auto __p = gtk_get_default_language();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgLanguage)(cast(PangoLanguage*) __p);
	}

	/**
	 * Get the direction of the current locale. This is the expected
	 * reading direction for text and UI.
	 *
	 * This function depends on the current locale being set with
	 * setlocale() and will default to setting the %GTK_TEXT_DIR_LTR
	 * direction otherwise. %GTK_TEXT_DIR_NONE will never be returned.
	 *
	 * GTK sets the default text direction according to the locale
	 * during gtk_init(), and you should normally use
	 * gtk_widget_get_direction() or gtk_widget_get_default_direction()
	 * to obtain the current direction.
	 *
	 * This function is only needed rare cases when the locale is
	 * changed after GTK has already been initialized. In this case,
	 * you can use it to update the default text direction as follows:
	 *
	 * |[<!-- language="C" -->
	 * #include <locale.h>
	 *
	 * static void
	 * update_locale (const char *new_locale)
	 * {
	 * setlocale (LC_ALL, new_locale);
	 * GtkTextDirection direction = gtk_get_locale_direction ();
	 * gtk_widget_set_default_direction (direction);
	 * }
	 * ]|
	 *
	 * Returns: the `GtkTextDirection` of the current locale
	 */
	public static GtkTextDirection getLocaleDirection()
	{
		return gtk_get_locale_direction();
	}

	/**
	 * Call this function before using any other GTK functions in your GUI
	 * applications.  It will initialize everything needed to operate the
	 * toolkit.
	 *
	 * If you are using `GtkApplication`, you don't have to call gtk_init()
	 * or gtk_init_check(); the `GApplication::startup` handler
	 * does it for you.
	 *
	 * This function will terminate your program if it was unable to
	 * initialize the windowing system for some reason. If you want
	 * your program to fall back to a textual interface you want to
	 * call gtk_init_check() instead.
	 *
	 * GTK calls `signal (SIGPIPE, SIG_IGN)`
	 * during initialization, to ignore SIGPIPE signals, since these are
	 * almost never wanted in graphical applications. If you do need to
	 * handle SIGPIPE for some reason, reset the handler after gtk_init(),
	 * but notice that other libraries (e.g. libdbus or gvfs) might do
	 * similar things.
	 */
	public static void init()
	{
		gtk_init();
	}

	/**
	 * This function does the same work as gtk_init() with only a single
	 * change: It does not terminate the program if the windowing system
	 * can’t be initialized. Instead it returns %FALSE on failure.
	 *
	 * This way the application can fall back to some other means of
	 * communication with the user - for example a curses or command line
	 * interface.
	 *
	 * Returns: %TRUE if the windowing system has been successfully
	 *     initialized, %FALSE otherwise
	 */
	public static bool initCheck()
	{
		return gtk_init_check() != 0;
	}

	/**
	 * Sets the GTK debug flags.
	 *
	 * Params:
	 *     flags = the debug flags to set
	 */
	public static void setDebugFlags(GtkDebugFlags flags)
	{
		gtk_set_debug_flags(flags);
	}
}
