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


module gtk.TestUtils;

private import glib.Str;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/** */
public struct TestUtils
{

	/**
	 * Return the type ids that have been registered after
	 * calling gtk_test_register_all_types().
	 *
	 * Returns: 0-terminated array of type ids
	 */
	public static GType[] listAllTypes()
	{
		uint nTypes;

		auto __p = gtk_test_list_all_types(&nTypes);

		return __p[0 .. nTypes];
	}

	/**
	 * Force registration of all core GTK object types.
	 *
	 * This allows to refer to any of those object types via
	 * g_type_from_name() after calling this function.
	 */
	public static void registerAllTypes()
	{
		gtk_test_register_all_types();
	}

	/**
	 * Enters the main loop and waits for @widget to be “drawn”.
	 *
	 * In this context that means it waits for the frame clock of
	 * @widget to have run a full styling, layout and drawing cycle.
	 *
	 * This function is intended to be used for syncing with actions that
	 * depend on @widget relayouting or on interaction with the display
	 * server.
	 *
	 * Params:
	 *     widget = the widget to wait for
	 */
	public static void widgetWaitForDraw(Widget widget)
	{
		gtk_test_widget_wait_for_draw((widget is null) ? null : widget.getWidgetStruct());
	}
}
