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


module gtk.ColumnViewRow;

private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkColumnViewRow` is used by [class@Gtk.ColumnView] to allow configuring
 * how rows are displayed.
 * 
 * It is not used to set the widgets displayed in the individual cells. For that
 * see [method@GtkColumnViewColumn.set_factory] and [class@GtkColumnViewCell].
 *
 * Since: 4.12
 */
public class ColumnViewRow : ObjectG
{
	/** the main Gtk struct */
	protected GtkColumnViewRow* gtkColumnViewRow;

	/** Get the main Gtk struct */
	public GtkColumnViewRow* getColumnViewRowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColumnViewRow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColumnViewRow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColumnViewRow* gtkColumnViewRow, bool ownedRef = false)
	{
		this.gtkColumnViewRow = gtkColumnViewRow;
		super(cast(GObject*)gtkColumnViewRow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_column_view_row_get_type();
	}

	/**
	 * Gets the accessible description of @self.
	 *
	 * Returns: the accessible description
	 *
	 * Since: 4.12
	 */
	public string getAccessibleDescription()
	{
		return Str.toString(gtk_column_view_row_get_accessible_description(gtkColumnViewRow));
	}

	/**
	 * Gets the accessible label of @self.
	 *
	 * Returns: the accessible label
	 *
	 * Since: 4.12
	 */
	public string getAccessibleLabel()
	{
		return Str.toString(gtk_column_view_row_get_accessible_label(gtkColumnViewRow));
	}

	/**
	 * Checks if the row has been set to be activatable via
	 * gtk_column_view_row_set_activatable().
	 *
	 * Returns: %TRUE if the row is activatable
	 *
	 * Since: 4.12
	 */
	public bool getActivatable()
	{
		return gtk_column_view_row_get_activatable(gtkColumnViewRow) != 0;
	}

	/**
	 * Checks if a row item has been set to be focusable via
	 * gtk_column_view_row_set_focusable().
	 *
	 * Returns: %TRUE if the row is focusable
	 *
	 * Since: 4.12
	 */
	public bool getFocusable()
	{
		return gtk_column_view_row_get_focusable(gtkColumnViewRow) != 0;
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
	public ObjectG getItem()
	{
		auto __p = gtk_column_view_row_get_item(gtkColumnViewRow);

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
	 * Returns: The position of this row
	 *
	 * Since: 4.12
	 */
	public uint getPosition()
	{
		return gtk_column_view_row_get_position(gtkColumnViewRow);
	}

	/**
	 * Checks if the row has been set to be selectable via
	 * gtk_column_view_row_set_selectable().
	 *
	 * Do not confuse this function with [method@Gtk.ColumnViewRow.get_selected].
	 *
	 * Returns: %TRUE if the row is selectable
	 *
	 * Since: 4.12
	 */
	public bool getSelectable()
	{
		return gtk_column_view_row_get_selectable(gtkColumnViewRow) != 0;
	}

	/**
	 * Checks if the item is selected that this row corresponds to.
	 *
	 * The selected state is maintained by the list widget and its model
	 * and cannot be set otherwise.
	 *
	 * Returns: %TRUE if the item is selected.
	 *
	 * Since: 4.12
	 */
	public bool getSelected()
	{
		return gtk_column_view_row_get_selected(gtkColumnViewRow) != 0;
	}

	/**
	 * Sets the accessible description for the row,
	 * which may be used by e.g. screen readers.
	 *
	 * Params:
	 *     description = the description
	 *
	 * Since: 4.12
	 */
	public void setAccessibleDescription(string description)
	{
		gtk_column_view_row_set_accessible_description(gtkColumnViewRow, Str.toStringz(description));
	}

	/**
	 * Sets the accessible label for the row,
	 * which may be used by e.g. screen readers.
	 *
	 * Params:
	 *     label = the label
	 *
	 * Since: 4.12
	 */
	public void setAccessibleLabel(string label)
	{
		gtk_column_view_row_set_accessible_label(gtkColumnViewRow, Str.toStringz(label));
	}

	/**
	 * Sets @self to be activatable.
	 *
	 * If a row is activatable, double-clicking on the row, using
	 * the Return key or calling gtk_widget_activate() will activate
	 * the row. Activating instructs the containing columnview to
	 * emit the [signal@Gtk.ColumnView::activate] signal.
	 *
	 * By default, row are activatable.
	 *
	 * Params:
	 *     activatable = if the row should be activatable
	 *
	 * Since: 4.12
	 */
	public void setActivatable(bool activatable)
	{
		gtk_column_view_row_set_activatable(gtkColumnViewRow, activatable);
	}

	/**
	 * Sets @self to be focusable.
	 *
	 * If a row is focusable, it can be focused using the keyboard.
	 * This works similar to [method@Gtk.Widget.set_focusable].
	 *
	 * Note that if row are not focusable, the contents of cells can still be focused if
	 * they are focusable.
	 *
	 * By default, rows are focusable.
	 *
	 * Params:
	 *     focusable = if the row should be focusable
	 *
	 * Since: 4.12
	 */
	public void setFocusable(bool focusable)
	{
		gtk_column_view_row_set_focusable(gtkColumnViewRow, focusable);
	}

	/**
	 * Sets @self to be selectable.
	 *
	 * If a row is selectable, clicking on the row or using the keyboard
	 * will try to select or unselect the row. Whether this succeeds is up to
	 * the model to determine, as it is managing the selected state.
	 *
	 * Note that this means that making a row non-selectable has no
	 * influence on the selected state at all. A non-selectable row
	 * may still be selected.
	 *
	 * By default, rows are selectable.
	 *
	 * Params:
	 *     selectable = if the row should be selectable
	 *
	 * Since: 4.12
	 */
	public void setSelectable(bool selectable)
	{
		gtk_column_view_row_set_selectable(gtkColumnViewRow, selectable);
	}
}
