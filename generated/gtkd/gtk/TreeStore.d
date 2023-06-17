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


module gtk.TreeStore;

private import glib.ConstructionException;
private import glib.Memory;
private import gobject.ObjectG;
private import gobject.Value;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.TreeDragDestIF;
private import gtk.TreeDragDestT;
private import gtk.TreeDragSourceIF;
private import gtk.TreeDragSourceT;
private import gtk.TreeIter;
private import gtk.TreeModelIF;
private import gtk.TreeModelT;
private import gtk.TreeSortableIF;
private import gtk.TreeSortableT;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A tree-like data structure that can be used with the [class@Gtk.TreeView].
 * 
 * The `GtkTreeStore` object is a list model for use with a `GtkTreeView`
 * widget. It implements the [iface@Gtk.TreeModel] interface, and consequently,
 * can use all of the methods available there. It also implements the
 * [iface@Gtk.TreeSortable] interface so it can be sorted by the view.
 * Finally, it also implements the tree [drag][iface@Gtk.TreeDragSource]
 * and [drop][iface@Gtk.TreeDragDest] interfaces.
 * 
 * `GtkTreeStore` is deprecated since GTK 4.10, and should not be used in newly
 * written code. You should use [class@Gtk.TreeListModel] for a tree-like model
 * object.
 * 
 * ## GtkTreeStore as GtkBuildable
 * 
 * The GtkTreeStore implementation of the `GtkBuildable` interface allows
 * to specify the model columns with a `<columns>` element that may contain
 * multiple `<column>` elements, each specifying one model column. The “type”
 * attribute specifies the data type for the column.
 * 
 * An example of a UI Definition fragment for a tree store:
 * 
 * ```xml
 * <object class="GtkTreeStore">
 * <columns>
 * <column type="gchararray"/>
 * <column type="gchararray"/>
 * <column type="gint"/>
 * </columns>
 * </object>
 * ```
 * 
 * Deprecated: Use [class@Gtk.TreeListModel] instead
 */
public class TreeStore : ObjectG, BuildableIF, TreeDragDestIF, TreeDragSourceIF, TreeModelIF, TreeSortableIF
{
	/** the main Gtk struct */
	protected GtkTreeStore* gtkTreeStore;

	/** Get the main Gtk struct */
	public GtkTreeStore* getTreeStoreStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkTreeStore;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkTreeStore;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkTreeStore* gtkTreeStore, bool ownedRef = false)
	{
		this.gtkTreeStore = gtkTreeStore;
		super(cast(GObject*)gtkTreeStore, ownedRef);
	}

	// add the Buildable capabilities
	mixin BuildableT!(GtkTreeStore);

	// add the TreeDragDest capabilities
	mixin TreeDragDestT!(GtkTreeStore);

	// add the TreeDragSource capabilities
	mixin TreeDragSourceT!(GtkTreeStore);

	// add the TreeModel capabilities
	mixin TreeModelT!(GtkTreeStore);

	// add the TreeSortable capabilities
	mixin TreeSortableT!(GtkTreeStore);

	/** */
	void setValue(TYPE)(TreeIter iter, int column, TYPE value)
	{
		Value v = new Value(value);
		gtk_tree_store_set_value(gtkTreeStore, iter.getTreeIterStruct(), column, v.getValueStruct());
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return gtk_tree_store_get_type();
	}

	/**
	 * Creates a new tree store.
	 *
	 * This constructor is meant for language bindings.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     types = an array of `GType` types for the columns, from first to last
	 *
	 * Returns: a new `GtkTreeStore`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType[] types)
	{
		auto __p = gtk_tree_store_newv(cast(int)types.length, types.ptr);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkTreeStore*) __p, true);
	}

	/**
	 * Appends a new row to @tree_store.
	 *
	 * If @parent is non-%NULL, then it will append the new row after the last
	 * child of @parent, otherwise it will append a row to the top level.
	 *
	 * The @iter parameter will be changed to point to this new row. The row will
	 * be empty after this function is called. To fill in values, you need to call
	 * gtk_tree_store_set() or gtk_tree_store_set_value().
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set to the appended row
	 *     parent = A valid `GtkTreeIter`
	 */
	public void append(out TreeIter iter, TreeIter parent)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		gtk_tree_store_append(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct());

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * Removes all rows from @tree_store
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 */
	public void clear()
	{
		gtk_tree_store_clear(gtkTreeStore);
	}

	/**
	 * Creates a new row at @position.
	 *
	 * If parent is non-%NULL, then the row will be made a child of @parent.
	 * Otherwise, the row will be created at the toplevel.
	 *
	 * If @position is `-1` or is larger than the number of rows at that level,
	 * then the new row will be inserted to the end of the list.
	 *
	 * The @iter parameter will be changed to point to this new row. The row
	 * will be empty after this function is called. To fill in values, you
	 * need to call gtk_tree_store_set() or gtk_tree_store_set_value().
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set to the new row
	 *     parent = A valid `GtkTreeIter`
	 *     position = position to insert the new row, or -1 for last
	 */
	public void insert(out TreeIter iter, TreeIter parent, int position)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		gtk_tree_store_insert(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct(), position);

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * Inserts a new row after @sibling.
	 *
	 * If @sibling is %NULL, then the row will be prepended to @parent’s children.
	 *
	 * If @parent and @sibling are %NULL, then the row will be prepended to the
	 * toplevel.
	 *
	 * If both @sibling and @parent are set, then @parent must be the parent
	 * of @sibling. When @sibling is set, @parent is optional.
	 *
	 * The @iter parameter will be changed to point to this new row. The row will
	 * be empty after this function is called. To fill in values, you need to call
	 * gtk_tree_store_set() or gtk_tree_store_set_value().
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set to the new row
	 *     parent = A valid `GtkTreeIter`
	 *     sibling = A valid `GtkTreeIter`
	 */
	public void insertAfter(out TreeIter iter, TreeIter parent, TreeIter sibling)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		gtk_tree_store_insert_after(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct(), (sibling is null) ? null : sibling.getTreeIterStruct());

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * Inserts a new row before @sibling.
	 *
	 * If @sibling is %NULL, then the row will be appended to @parent’s children.
	 *
	 * If @parent and @sibling are %NULL, then the row will be appended to the
	 * toplevel.
	 *
	 * If both @sibling and @parent are set, then @parent must be the parent
	 * of @sibling. When @sibling is set, @parent is optional.
	 *
	 * The @iter parameter will be changed to point to this new row. The row will
	 * be empty after this function is called. To fill in values, you need to call
	 * gtk_tree_store_set() or gtk_tree_store_set_value().
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set to the new row
	 *     parent = A valid `GtkTreeIter`
	 *     sibling = A valid `GtkTreeIter`
	 */
	public void insertBefore(out TreeIter iter, TreeIter parent, TreeIter sibling)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		gtk_tree_store_insert_before(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct(), (sibling is null) ? null : sibling.getTreeIterStruct());

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * A variant of gtk_tree_store_insert_with_values() which takes
	 * the columns and values as two arrays, instead of varargs.
	 *
	 * This function is mainly intended for language bindings.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set the new row
	 *     parent = A valid `GtkTreeIter`
	 *     position = position to insert the new row, or -1 for last
	 *     columns = an array of column numbers
	 *     values = an array of GValues
	 */
	public void insertWithValuesv(out TreeIter iter, TreeIter parent, int position, int[] columns, Value[] values)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		GValue[] valuesArray = new GValue[values.length];
		for ( int i = 0; i < values.length; i++ )
		{
			valuesArray[i] = *(values[i].getValueStruct());
		}

		gtk_tree_store_insert_with_valuesv(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct(), position, columns.ptr, valuesArray.ptr, cast(int)values.length);

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * Checks if @iter is an ancestor of @descendant.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter`
	 *     descendant = A valid `GtkTreeIter`
	 *
	 * Returns: true if @iter is an ancestor of @descendant, and false otherwise
	 */
	public bool isAncestor(TreeIter iter, TreeIter descendant)
	{
		return gtk_tree_store_is_ancestor(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), (descendant is null) ? null : descendant.getTreeIterStruct()) != 0;
	}

	/**
	 * Returns the depth of the position pointed by the iterator
	 *
	 * The depth will be 0 for anything on the root level, 1 for anything down
	 * a level, etc.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter`
	 *
	 * Returns: The depth of the position pointed by the iterator
	 */
	public int iterDepth(TreeIter iter)
	{
		return gtk_tree_store_iter_depth(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct());
	}

	/**
	 * Checks if the given iter is a valid iter for this `GtkTreeStore`.
	 *
	 * This function is slow. Only use it for debugging and/or testing
	 * purposes.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = the iterator to check
	 *
	 * Returns: true if the iter is valid, and false otherwise
	 */
	public bool iterIsValid(TreeIter iter)
	{
		return gtk_tree_store_iter_is_valid(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct()) != 0;
	}

	/**
	 * Moves @iter in @tree_store to the position after @position.
	 *
	 * @iter and @position should be in the same level.
	 *
	 * Note that this function only works with unsorted stores.
	 *
	 * If @position is %NULL, @iter will be moved to the start of the level.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A `GtkTreeIter`.
	 *     position = A `GtkTreeIter`.
	 */
	public void moveAfter(TreeIter iter, TreeIter position)
	{
		gtk_tree_store_move_after(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), (position is null) ? null : position.getTreeIterStruct());
	}

	/**
	 * Moves @iter in @tree_store to the position before @position.
	 *
	 * @iter and @position should be in the same level.
	 *
	 * Note that this function only works with unsorted stores.
	 *
	 * If @position is %NULL, @iter will be moved to the end of the level.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A `GtkTreeIter`
	 *     position = A `GtkTreeIter`
	 */
	public void moveBefore(TreeIter iter, TreeIter position)
	{
		gtk_tree_store_move_before(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), (position is null) ? null : position.getTreeIterStruct());
	}

	/**
	 * Prepends a new row to @tree_store.
	 *
	 * If @parent is non-%NULL, then it will prepend the new row before the first
	 * child of @parent, otherwise it will prepend a row to the top level. The
	 * `iter` parameter will be changed to point to this new row.  The row will
	 * be empty after this function is called. To fill in values, you need to
	 * call gtk_tree_store_set() or gtk_tree_store_set_value().
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = An unset `GtkTreeIter` to set to the prepended row
	 *     parent = A valid `GtkTreeIter`
	 */
	public void prepend(out TreeIter iter, TreeIter parent)
	{
		GtkTreeIter* outiter = cast(GtkTreeIter*)Memory.malloc0(GtkTreeIter.sizeof);

		gtk_tree_store_prepend(gtkTreeStore, outiter, (parent is null) ? null : parent.getTreeIterStruct());

		iter = ObjectG.getDObject!(TreeIter)(outiter, true);
	}

	/**
	 * Removes @iter from @tree_store.
	 *
	 * After being removed, @iter is set to the next valid row at that level, or
	 * invalidated if it previously pointed to the last one.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter`
	 *
	 * Returns: true if @iter is still valid, and false otherwise
	 */
	public bool remove(TreeIter iter)
	{
		return gtk_tree_store_remove(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct()) != 0;
	}

	/**
	 * Reorders the children of @parent in @tree_store to follow the order
	 * indicated by @new_order.
	 *
	 * Note that this function only works with unsorted stores.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     parent = the parent of the children to re-order
	 *     newOrder = an array of integers mapping the new position
	 *         of each child to its old position before the re-ordering,
	 *         i.e. `new_order[newpos] = oldpos`
	 */
	public void reorder(TreeIter parent, int[] newOrder)
	{
		gtk_tree_store_reorder(gtkTreeStore, (parent is null) ? null : parent.getTreeIterStruct(), newOrder.ptr);
	}

	/**
	 * A variant of gtk_tree_store_set_valist() which takes
	 * the columns and values as two arrays, instead of using variadic
	 * arguments.
	 *
	 * This function is mainly intended for language bindings or in case
	 * the number of columns to change is not known until run-time.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter` for the row being modified
	 *     columns = an array of column numbers
	 *     values = an array of GValues
	 */
	public void set(TreeIter iter, int[] columns, Value[] values)
	{
		GValue[] valuesArray = new GValue[values.length];
		for ( int i = 0; i < values.length; i++ )
		{
			valuesArray[i] = *(values[i].getValueStruct());
		}

		gtk_tree_store_set_valuesv(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), columns.ptr, valuesArray.ptr, cast(int)values.length);
	}

	/**
	 * Sets the type of the columns in a tree store.
	 *
	 * This function is meant primarily for types that inherit from
	 * `GtkTreeStore`, and should only be used when constructing a new
	 * `GtkTreeStore`.
	 *
	 * This functions cannot be called after a row has been added,
	 * or a method on the `GtkTreeModel` interface is called on the
	 * tree store.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     types = An array of `GType` types, one for each column
	 */
	public void setColumnTypes(GType[] types)
	{
		gtk_tree_store_set_column_types(gtkTreeStore, cast(int)types.length, types.ptr);
	}

	/**
	 * A version of gtk_tree_store_set() using `va_list`.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter` for the row being modified
	 *     varArgs = va_list of column/value pairs
	 */
	public void setValist(TreeIter iter, void* varArgs)
	{
		gtk_tree_store_set_valist(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), varArgs);
	}

	/**
	 * Sets the data in the cell specified by @iter and @column.
	 *
	 * The type of @value must be convertible to the type of the
	 * column.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     iter = A valid `GtkTreeIter` for the row being modified
	 *     column = column number to modify
	 *     value = new value for the cell
	 */
	public void setValue(TreeIter iter, int column, Value value)
	{
		gtk_tree_store_set_value(gtkTreeStore, (iter is null) ? null : iter.getTreeIterStruct(), column, (value is null) ? null : value.getValueStruct());
	}

	/**
	 * Swaps @a and @b in the same level of @tree_store.
	 *
	 * Note that this function only works with unsorted stores.
	 *
	 * Deprecated: Use [class@Gtk.TreeListModel] instead
	 *
	 * Params:
	 *     a = A `GtkTreeIter`.
	 *     b = Another `GtkTreeIter`.
	 */
	public void swap(TreeIter a, TreeIter b)
	{
		gtk_tree_store_swap(gtkTreeStore, (a is null) ? null : a.getTreeIterStruct(), (b is null) ? null : b.getTreeIterStruct());
	}
}
