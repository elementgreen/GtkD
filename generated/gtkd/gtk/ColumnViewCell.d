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


module gtk.ColumnViewCell;

private import gobject.ObjectG;
private import gtk.ListItem;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkColumnViewCell` is used by [class@Gtk.ColumnViewColumn] to represent items
 * in a cell in [class@Gtk.ColumnView].
 * 
 * The `GtkColumnViewCell`s are managed by the columnview widget (with its factory)
 * and cannot be created by applications, but they need to be populated
 * by application code. This is done by calling [method@Gtk.ColumnViewCell.set_child].
 * 
 * `GtkColumnViewCell`s exist in 2 stages:
 * 
 * 1. The unbound stage where the listitem is not currently connected to
 * an item in the list. In that case, the [property@Gtk.ColumnViewCell:item]
 * property is set to %NULL.
 * 
 * 2. The bound stage where the listitem references an item from the list.
 * The [property@Gtk.ColumnViewCell:item] property is not %NULL.
 *
 * Since: 4.12
 */
public class ColumnViewCell : ListItem
{
	/** the main Gtk struct */
	protected GtkColumnViewCell* gtkColumnViewCell;

	/** Get the main Gtk struct */
	public GtkColumnViewCell* getColumnViewCellStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColumnViewCell;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColumnViewCell;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColumnViewCell* gtkColumnViewCell, bool ownedRef = false)
	{
		this.gtkColumnViewCell = gtkColumnViewCell;
		super(cast(GtkListItem*)gtkColumnViewCell, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_column_view_cell_get_type();
	}

	/**
	 * Gets the child previously set via gtk_column_view_cell_set_child() or
	 * %NULL if none was set.
	 *
	 * Returns: The child
	 *
	 * Since: 4.12
	 */
	public override Widget getChild()
	{
		auto __p = gtk_column_view_cell_get_child(gtkColumnViewCell);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Checks if a list item has been set to be focusable via
	 * gtk_column_view_cell_set_focusable().
	 *
	 * Returns: %TRUE if the item is focusable
	 *
	 * Since: 4.12
	 */
	public override bool getFocusable()
	{
		return gtk_column_view_cell_get_focusable(gtkColumnViewCell) != 0;
	}

	/**
	 * Gets the model item that associated with @self.
	 *
	 * If @self is unbound, this function returns %NULL.
	 *
	 * Returns: The item displayed
	 *
	 * Since: 4.12
	 */
	public override ObjectG getItem()
	{
		auto __p = gtk_column_view_cell_get_item(gtkColumnViewCell);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p);
	}

	/**
	 * Gets the position in the model that @self currently displays.
	 *
	 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
	 *
	 * Returns: The position of this item
	 *
	 * Since: 4.12
	 */
	public override uint getPosition()
	{
		return gtk_column_view_cell_get_position(gtkColumnViewCell);
	}

	/**
	 * Checks if the item is displayed as selected.
	 *
	 * The selected state is maintained by the liste widget and its model
	 * and cannot be set otherwise.
	 *
	 * Returns: %TRUE if the item is selected.
	 *
	 * Since: 4.12
	 */
	public override bool getSelected()
	{
		return gtk_column_view_cell_get_selected(gtkColumnViewCell) != 0;
	}

	/**
	 * Sets the child to be used for this listitem.
	 *
	 * This function is typically called by applications when
	 * setting up a listitem so that the widget can be reused when
	 * binding it multiple times.
	 *
	 * Params:
	 *     child = The list item's child or %NULL to unset
	 *
	 * Since: 4.12
	 */
	public override void setChild(Widget child)
	{
		gtk_column_view_cell_set_child(gtkColumnViewCell, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets @self to be focusable.
	 *
	 * If an item is focusable, it can be focused using the keyboard.
	 * This works similar to [method@Gtk.Widget.set_focusable].
	 *
	 * Note that if items are not focusable, the keyboard cannot be used to activate
	 * them and selecting only works if one of the listitem's children is focusable.
	 *
	 * By default, list items are focusable.
	 *
	 * Params:
	 *     focusable = if the item should be focusable
	 *
	 * Since: 4.12
	 */
	public override void setFocusable(bool focusable)
	{
		gtk_column_view_cell_set_focusable(gtkColumnViewCell, focusable);
	}
}
