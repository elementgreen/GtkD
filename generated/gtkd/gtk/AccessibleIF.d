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


module gtk.AccessibleIF;

private import gobject.ObjectG;
private import gobject.Value;
private import gtk.ATContext;
private import gtk.AccessibleIF;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkAccessible` is an interface for describing UI elements for
 * Assistive Technologies.
 * 
 * Every accessible implementation has:
 * 
 * - a “role”, represented by a value of the [enum@Gtk.AccessibleRole] enumeration
 * - an “attribute”, represented by a set of [enum@Gtk.AccessibleState],
 * [enum@Gtk.AccessibleProperty] and [enum@Gtk.AccessibleRelation] values
 * 
 * The role cannot be changed after instantiating a `GtkAccessible`
 * implementation.
 * 
 * The attributes are updated every time a UI element's state changes in
 * a way that should be reflected by assistive technologies. For instance,
 * if a `GtkWidget` visibility changes, the %GTK_ACCESSIBLE_STATE_HIDDEN
 * state will also change to reflect the [property@Gtk.Widget:visible] property.
 * 
 * Every accessible implementation is part of a tree of accessible objects.
 * Normally, this tree corresponds to the widget tree, but can be customized
 * by reimplementing the [vfunc@Gtk.Accessible.get_accessible_parent],
 * [vfunc@Gtk.Accessible.get_first_accessible_child] and
 * [vfunc@Gtk.Accessible.get_next_accessible_sibling] virtual functions.
 * Note that you can not create a top-level accessible object as of now,
 * which means that you must always have a parent accessible object.
 * Also note that when an accessible object does not correspond to a widget,
 * and it has children, whose implementation you don't control,
 * it is necessary to ensure the correct shape of the a11y tree
 * by calling [method@Gtk.Accessible.set_accessible_parent] and
 * updating the sibling by [method@Gtk.Accessible.update_next_accessible_sibling].
 */
public interface AccessibleIF{
	/** Get the main Gtk struct */
	public GtkAccessible* getAccessibleStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_accessible_get_type();
	}

	/**
	 * Retrieves the accessible parent for an accessible object.
	 *
	 * This function returns `NULL` for top level widgets.
	 *
	 * Returns: the accessible parent
	 *
	 * Since: 4.10
	 */
	public AccessibleIF getAccessibleParent();

	/**
	 * Retrieves the accessible role of an accessible object.
	 *
	 * Returns: the accessible role
	 */
	public GtkAccessibleRole getAccessibleRole();

	/**
	 * Retrieves the accessible implementation for the given `GtkAccessible`.
	 *
	 * Returns: the accessible implementation object
	 *
	 * Since: 4.10
	 */
	public ATContext getAtContext();

	/**
	 * Queries the coordinates and dimensions of this accessible
	 *
	 * This functionality can be overridden by `GtkAccessible`
	 * implementations, e.g. to get the bounds from an ignored
	 * child widget.
	 *
	 * Params:
	 *     x = the x coordinate of the top left corner of the accessible
	 *     y = the y coordinate of the top left corner of the widget
	 *     width = the width of the accessible object
	 *     height = the height of the accessible object
	 *
	 * Returns: true if the bounds are valid, and false otherwise
	 *
	 * Since: 4.10
	 */
	public bool getBounds(out int x, out int y, out int width, out int height);

	/**
	 * Retrieves the first accessible child of an accessible object.
	 *
	 * Returns: the first accessible child
	 *
	 * Since: 4.10
	 */
	public AccessibleIF getFirstAccessibleChild();

	/**
	 * Retrieves the next accessible sibling of an accessible object
	 *
	 * Returns: the next accessible sibling
	 *
	 * Since: 4.10
	 */
	public AccessibleIF getNextAccessibleSibling();

	/**
	 * Query a platform state, such as focus.
	 *
	 * See gtk_accessible_platform_changed().
	 *
	 * This functionality can be overridden by `GtkAccessible`
	 * implementations, e.g. to get platform state from an ignored
	 * child widget, as is the case for `GtkText` wrappers.
	 *
	 * Params:
	 *     state = platform state to query
	 *
	 * Returns: the value of @state for the accessible
	 *
	 * Since: 4.10
	 */
	public bool getPlatformState(GtkAccessiblePlatformState state);

	/**
	 * Resets the accessible @property to its default value.
	 *
	 * Params:
	 *     property = a `GtkAccessibleProperty`
	 */
	public void resetProperty(GtkAccessibleProperty property);

	/**
	 * Resets the accessible @relation to its default value.
	 *
	 * Params:
	 *     relation = a `GtkAccessibleRelation`
	 */
	public void resetRelation(GtkAccessibleRelation relation);

	/**
	 * Resets the accessible @state to its default value.
	 *
	 * Params:
	 *     state = a `GtkAccessibleState`
	 */
	public void resetState(GtkAccessibleState state);

	/**
	 * Sets the parent and sibling of an accessible object.
	 *
	 * This function is meant to be used by accessible implementations that are
	 * not part of the widget hierarchy, and but act as a logical bridge between
	 * widgets. For instance, if a widget creates an object that holds metadata
	 * for each child, and you want that object to implement the `GtkAccessible`
	 * interface, you will use this function to ensure that the parent of each
	 * child widget is the metadata object, and the parent of each metadata
	 * object is the container widget.
	 *
	 * Params:
	 *     parent = the parent accessible object
	 *     nextSibling = the sibling accessible object
	 *
	 * Since: 4.10
	 */
	public void setAccessibleParent(AccessibleIF parent, AccessibleIF nextSibling);

	/**
	 * Updates the next accessible sibling of @self.
	 *
	 * That might be useful when a new child of a custom `GtkAccessible`
	 * is created, and it needs to be linked to a previous child.
	 *
	 * Params:
	 *     newSibling = the new next accessible sibling to set
	 *
	 * Since: 4.10
	 */
	public void updateNextAccessibleSibling(AccessibleIF newSibling);

	/**
	 * Updates an array of accessible properties.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * property change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     properties = an array of `GtkAccessibleProperty`
	 *     values = an array of `GValues`, one for each property
	 */
	public void updatePropertyValue(GtkAccessibleProperty[] properties, Value[] values);

	/**
	 * Updates an array of accessible relations.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * relation change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     relations = an array of `GtkAccessibleRelation`
	 *     values = an array of `GValues`, one for each relation
	 */
	public void updateRelationValue(GtkAccessibleRelation[] relations, Value[] values);

	/**
	 * Updates an array of accessible states.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * state change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     states = an array of `GtkAccessibleState`
	 *     values = an array of `GValues`, one for each state
	 */
	public void updateStateValue(GtkAccessibleState[] states, Value[] values);
}
