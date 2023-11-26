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


module gtk.TreeExpander;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.TreeListRow;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkTreeExpander` is a widget that provides an expander for a list.
 * 
 * It is typically placed as a bottommost child into a `GtkListView`
 * to allow users to expand and collapse children in a list with a
 * [class@Gtk.TreeListModel]. `GtkTreeExpander` provides the common UI
 * elements, gestures and keybindings for this purpose.
 * 
 * On top of this, the "listitem.expand", "listitem.collapse" and
 * "listitem.toggle-expand" actions are provided to allow adding custom
 * UI for managing expanded state.
 * 
 * It is important to mention that you want to set the
 * [property@Gtk.ListItem:focusable] property to FALSE when using this
 * widget, as you want the keyboard focus to be in the treexpander, and not
 * inside the list to make use of the keybindings.
 * 
 * The `GtkTreeListModel` must be set to not be passthrough. Then it
 * will provide [class@Gtk.TreeListRow] items which can be set via
 * [method@Gtk.TreeExpander.set_list_row] on the expander.
 * The expander will then watch that row item automatically.
 * [method@Gtk.TreeExpander.set_child] sets the widget that displays
 * the actual row contents.
 * 
 * `GtkTreeExpander` can be modified with properties such as
 * [property@Gtk.TreeExpander:indent-for-icon],
 * [property@Gtk.TreeExpander:indent-for-depth], and
 * [property@Gtk.TreeExpander:hide-expander] to achieve a different appearance.
 * This can even be done to influence individual rows, for example by binding
 * the [property@Gtk.TreeExpander:hide-expander] property to the item count of
 * the model of the treelistrow, to hide the expander for rows without children,
 * even if the row is expandable.
 * 
 * ## CSS nodes
 * 
 * ```
 * treeexpander
 * ├── [indent]*
 * ├── [expander]
 * ╰── <child>
 * ```
 * 
 * `GtkTreeExpander` has zero or one CSS nodes with the name "expander" that
 * should display the expander icon. The node will be `:checked` when it
 * is expanded. If the node is not expandable, an "indent" node will be
 * displayed instead.
 * 
 * For every level of depth, another "indent" node is prepended.
 * 
 * ## Accessibility
 * 
 * Until GTK 4.10, `GtkTreeExpander` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Since GTK 4.12, `GtkTreeExpander` uses the `GTK_ACCESSIBLE_ROLE_BUTTON` role.
 * Toggling it will change the `GTK_ACCESSIBLE_STATE_EXPANDED` state.
 */
public class TreeExpander : Widget
{
	/** the main Gtk struct */
	protected GtkTreeExpander* gtkTreeExpander;

	/** Get the main Gtk struct */
	public GtkTreeExpander* getTreeExpanderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkTreeExpander;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkTreeExpander;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkTreeExpander* gtkTreeExpander, bool ownedRef = false)
	{
		this.gtkTreeExpander = gtkTreeExpander;
		super(cast(GtkWidget*)gtkTreeExpander, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_tree_expander_get_type();
	}

	/**
	 * Creates a new `GtkTreeExpander`
	 *
	 * Returns: a new `GtkTreeExpander`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_tree_expander_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkTreeExpander*) __p);
	}

	/**
	 * Gets the child widget displayed by @self.
	 *
	 * Returns: The child displayed by @self
	 */
	public Widget getChild()
	{
		auto __p = gtk_tree_expander_get_child(gtkTreeExpander);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets whether the TreeExpander should be hidden in a GtkTreeListRow.
	 *
	 * Returns: TRUE if the expander icon should be hidden. Otherwise FALSE.
	 *
	 * Since: 4.10
	 */
	public bool getHideExpander()
	{
		return gtk_tree_expander_get_hide_expander(gtkTreeExpander) != 0;
	}

	/**
	 * TreeExpander indents each level of depth with an additional indent.
	 *
	 * Returns: TRUE if the child should be indented . Otherwise FALSE.
	 *
	 * Since: 4.10
	 */
	public bool getIndentForDepth()
	{
		return gtk_tree_expander_get_indent_for_depth(gtkTreeExpander) != 0;
	}

	/**
	 * TreeExpander indents the child by the width of an expander-icon if it is not expandable.
	 *
	 * Returns: TRUE if the child should be indented when not expandable. Otherwise FALSE.
	 *
	 * Since: 4.6
	 */
	public bool getIndentForIcon()
	{
		return gtk_tree_expander_get_indent_for_icon(gtkTreeExpander) != 0;
	}

	/**
	 * Forwards the item set on the `GtkTreeListRow` that @self is managing.
	 *
	 * This call is essentially equivalent to calling:
	 *
	 * ```c
	 * gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (@self));
	 * ```
	 *
	 * Returns: The item of the row
	 */
	public ObjectG getItem()
	{
		auto __p = gtk_tree_expander_get_item(gtkTreeExpander);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) __p, true);
	}

	/**
	 * Gets the list row managed by @self.
	 *
	 * Returns: The list row displayed by @self
	 */
	public TreeListRow getListRow()
	{
		auto __p = gtk_tree_expander_get_list_row(gtkTreeExpander);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TreeListRow)(cast(GtkTreeListRow*) __p);
	}

	/**
	 * Sets the content widget to display.
	 *
	 * Params:
	 *     child = a `GtkWidget`
	 */
	public void setChild(Widget child)
	{
		gtk_tree_expander_set_child(gtkTreeExpander, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets whether the expander icon should be visible in a GtkTreeListRow.
	 *
	 * Params:
	 *     hideExpander = TRUE if the expander should be hidden. Otherwise FALSE.
	 *
	 * Since: 4.10
	 */
	public void setHideExpander(bool hideExpander)
	{
		gtk_tree_expander_set_hide_expander(gtkTreeExpander, hideExpander);
	}

	/**
	 * Sets if the TreeExpander should indent the child according to its depth.
	 *
	 * Params:
	 *     indentForDepth = TRUE if the child should be indented. Otherwise FALSE.
	 *
	 * Since: 4.10
	 */
	public void setIndentForDepth(bool indentForDepth)
	{
		gtk_tree_expander_set_indent_for_depth(gtkTreeExpander, indentForDepth);
	}

	/**
	 * Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable.
	 *
	 * Params:
	 *     indentForIcon = TRUE if the child should be indented without expander. Otherwise FALSE.
	 *
	 * Since: 4.6
	 */
	public void setIndentForIcon(bool indentForIcon)
	{
		gtk_tree_expander_set_indent_for_icon(gtkTreeExpander, indentForIcon);
	}

	/**
	 * Sets the tree list row that this expander should manage.
	 *
	 * Params:
	 *     listRow = a `GtkTreeListRow`
	 */
	public void setListRow(TreeListRow listRow)
	{
		gtk_tree_expander_set_list_row(gtkTreeExpander, (listRow is null) ? null : listRow.getTreeListRowStruct());
	}
}
