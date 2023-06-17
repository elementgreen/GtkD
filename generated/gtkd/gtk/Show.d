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


module gtk.Show;

private import glib.Str;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/** */
public struct Show
{

	/**
	 * This function launches the default application for showing
	 * a given uri, or shows an error dialog if that fails.
	 *
	 * Deprecated: Use [method@Gtk.FileLauncher.launch] or
	 * [method@Gtk.UriLauncher.launch] instead
	 *
	 * Params:
	 *     parent = parent window
	 *     uri = the uri to show
	 *     timestamp = timestamp from the event that triggered this call, or %GDK_CURRENT_TIME
	 */
	public static void showUri(Window parent, string uri, uint timestamp)
	{
		gtk_show_uri((parent is null) ? null : parent.getWindowStruct(), Str.toStringz(uri), timestamp);
	}
}
