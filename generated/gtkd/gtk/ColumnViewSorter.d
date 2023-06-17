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


module gtk.ColumnViewSorter;

private import gobject.ObjectG;
private import gtk.ColumnViewColumn;
private import gtk.Sorter;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkColumnViewSorter` is a sorter implementation that
 * is geared towards the needs of `GtkColumnView`.
 * 
 * The sorter returned by [method@Gtk.ColumnView.get_sorter] is
 * a `GtkColumnViewSorter`.
 * 
 * In column views, sorting can be configured by associating
 * sorters with columns, and users can invert sort order by clicking
 * on column headers. The API of `GtkColumnViewSorter` is designed
 * to allow saving and restoring this configuration.
 * 
 * If you are only interested in the primary sort column (i.e. the
 * column where a sort indicator is shown in the header), then
 * you can just look at [property@Gtk.ColumnViewSorter:primary-sort-column]
 * and [property@Gtk.ColumnViewSorter:primary-sort-order].
 * 
 * If you want to store the full sort configuration, including
 * secondary sort columns that are used for tie breaking, then
 * you can use [method@Gtk.ColumnViewSorter.get_nth_sort_column].
 * To get notified about changes, use [signal@Gtk.Sorter::changed].
 * 
 * To restore a saved sort configuration on a `GtkColumnView`,
 * use code like:
 * 
 * ```
 * sorter = gtk_column_view_get_sorter (view);
 * for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
 * {
 * column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
 * gtk_column_view_sort_by_column (view, column, order);
 * }
 * ```
 *
 * Since: 4.10
 */
public class ColumnViewSorter : Sorter
{
	/** the main Gtk struct */
	protected GtkColumnViewSorter* gtkColumnViewSorter;

	/** Get the main Gtk struct */
	public GtkColumnViewSorter* getColumnViewSorterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColumnViewSorter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColumnViewSorter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColumnViewSorter* gtkColumnViewSorter, bool ownedRef = false)
	{
		this.gtkColumnViewSorter = gtkColumnViewSorter;
		super(cast(GtkSorter*)gtkColumnViewSorter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_column_view_sorter_get_type();
	}

	/**
	 * Returns the number of columns by which the sorter sorts.
	 *
	 * If the sorter of the primary sort column does not determine
	 * a total order, then the secondary sorters are consulted to
	 * break the ties.
	 *
	 * Use the [signal@Gtk.Sorter::changed] signal to get notified
	 * when the number of sort columns changes.
	 *
	 * Returns: the number of sort columns
	 *
	 * Since: 4.10
	 */
	public uint getNSortColumns()
	{
		return gtk_column_view_sorter_get_n_sort_columns(gtkColumnViewSorter);
	}

	/**
	 * Gets the @position'th sort column and its associated sort order.
	 *
	 * Use the [signal@Gtk.Sorter::changed] signal to get notified
	 * when sort columns change.
	 *
	 * Params:
	 *     position = the position of the sort column to retrieve (0 for the
	 *         primary sort column)
	 *     sortOrder = return location for the sort order
	 *
	 * Returns: the @positions sort column
	 *
	 * Since: 4.10
	 */
	public ColumnViewColumn getNthSortColumn(uint position, out GtkSortType sortOrder)
	{
		auto __p = gtk_column_view_sorter_get_nth_sort_column(gtkColumnViewSorter, position, &sortOrder);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ColumnViewColumn)(cast(GtkColumnViewColumn*) __p);
	}

	/**
	 * Returns the primary sort column.
	 *
	 * The primary sort column is the one that displays the triangle
	 * in a column view header.
	 *
	 * Returns: the primary sort column
	 *
	 * Since: 4.10
	 */
	public ColumnViewColumn getPrimarySortColumn()
	{
		auto __p = gtk_column_view_sorter_get_primary_sort_column(gtkColumnViewSorter);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ColumnViewColumn)(cast(GtkColumnViewColumn*) __p);
	}

	/**
	 * Returns the primary sort order.
	 *
	 * The primary sort order determines whether the triangle displayed
	 * in the column view header of the primary sort column points upwards
	 * or downwards.
	 *
	 * If there is no primary sort column, then this function returns
	 * `GTK_SORT_ASCENDING`.
	 *
	 * Returns: the primary sort order
	 *
	 * Since: 4.10
	 */
	public GtkSortType getPrimarySortOrder()
	{
		return gtk_column_view_sorter_get_primary_sort_order(gtkColumnViewSorter);
	}
}
