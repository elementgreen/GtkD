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


module gtk.ListHeader;

private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkListHeader` is used by list widgets to represent the headers they
 * display.
 * 
 * `GtkListHeader` objects are managed just like [class@Gtk.ListItem]
 * objects via their factory, but provide a different set of properties suitable
 * for managing the header instead of individual items.
 *
 * Since: 4.12
 */
public class ListHeader : ObjectG
{
	/** the main Gtk struct */
	protected GtkListHeader* gtkListHeader;

	/** Get the main Gtk struct */
	public GtkListHeader* getListHeaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkListHeader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkListHeader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkListHeader* gtkListHeader, bool ownedRef = false)
	{
		this.gtkListHeader = gtkListHeader;
		super(cast(GObject*)gtkListHeader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_list_header_get_type();
	}

	/**
	 * Gets the child previously set via gtk_list_header_set_child() or
	 * %NULL if none was set.
	 *
	 * Returns: The child
	 *
	 * Since: 4.12
	 */
	public Widget getChild()
	{
		auto __p = gtk_list_header_get_child(gtkListHeader);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets the end position in the model of the section that @self is
	 * currently the header for.
	 *
	 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
	 *
	 * Returns: The end position of the section
	 *
	 * Since: 4.12
	 */
	public uint getEnd()
	{
		return gtk_list_header_get_end(gtkListHeader);
	}

	/**
	 * Gets the model item at the start of the section.
	 * This is the item that occupies the list model at position
	 * [property@Gtk.ListHeader:start].
	 *
	 * If @self is unbound, this function returns %NULL.
	 *
	 * Returns: The item displayed
	 *
	 * Since: 4.12
	 */
	public ObjectG getItem()
	{
		auto __p = gtk_list_header_get_item(gtkListHeader);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
	}

	/**
	 * Gets the the number of items in the section.
	 *
	 * If @self is unbound, 0 is returned.
	 *
	 * Returns: The number of items in the section
	 *
	 * Since: 4.12
	 */
	public uint getNItems()
	{
		return gtk_list_header_get_n_items(gtkListHeader);
	}

	/**
	 * Gets the start position in the model of the section that @self is
	 * currently the header for.
	 *
	 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
	 *
	 * Returns: The start position of the section
	 *
	 * Since: 4.12
	 */
	public uint getStart()
	{
		return gtk_list_header_get_start(gtkListHeader);
	}

	/**
	 * Sets the child to be used for this listitem.
	 *
	 * This function is typically called by applications when
	 * setting up a header so that the widget can be reused when
	 * binding it multiple times.
	 *
	 * Params:
	 *     child = The list item's child or %NULL to unset
	 *
	 * Since: 4.12
	 */
	public void setChild(Widget child)
	{
		gtk_list_header_set_child(gtkListHeader, (child is null) ? null : child.getWidgetStruct());
	}
}
