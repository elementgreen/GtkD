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


module gtk.ScrollInfo;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;
private import gtkd.Loader;


/**
 * The `GtkScrollInfo` can be used to provide more accurate data on how a scroll
 * operation should be performed.
 * 
 * Scrolling functions usually allow passing a %NULL scroll info which will cause
 * the default values to be used and just scroll the element into view.
 *
 * Since: 4.12
 */
public class ScrollInfo
{
	/** the main Gtk struct */
	protected GtkScrollInfo* gtkScrollInfo;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GtkScrollInfo* getScrollInfoStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkScrollInfo;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkScrollInfo;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkScrollInfo* gtkScrollInfo, bool ownedRef = false)
	{
		this.gtkScrollInfo = gtkScrollInfo;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GTK) && ownedRef )
			gtk_scroll_info_unref(gtkScrollInfo);
	}


	/** */
	public static GType getType()
	{
		return gtk_scroll_info_get_type();
	}

	/**
	 * Creates a new scroll info for scrolling an element into view.
	 *
	 * Returns: A new scroll info
	 *
	 * Since: 4.12
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_scroll_info_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkScrollInfo*) __p);
	}

	/**
	 * Checks if horizontal scrolling is enabled.
	 *
	 * Returns: %TRUE if horizontal scrolling is enabled.
	 *
	 * Since: 4.12
	 */
	public bool getEnableHorizontal()
	{
		return gtk_scroll_info_get_enable_horizontal(gtkScrollInfo) != 0;
	}

	/**
	 * Checks if vertical scrolling is enabled.
	 *
	 * Returns: %TRUE if vertical scrolling is enabled.
	 *
	 * Since: 4.12
	 */
	public bool getEnableVertical()
	{
		return gtk_scroll_info_get_enable_vertical(gtkScrollInfo) != 0;
	}

	alias doref = ref_;
	/**
	 * Increases the reference count of a `GtkScrollInfo` by one.
	 *
	 * Returns: the passed in `GtkScrollInfo`.
	 *
	 * Since: 4.12
	 */
	public ScrollInfo ref_()
	{
		auto __p = gtk_scroll_info_ref(gtkScrollInfo);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ScrollInfo)(cast(GtkScrollInfo*) __p, true);
	}

	/**
	 * Turns horizontal scrolling on or off.
	 *
	 * Params:
	 *     horizontal = if scrolling in the horizontal direction
	 *         should happen
	 *
	 * Since: 4.12
	 */
	public void setEnableHorizontal(bool horizontal)
	{
		gtk_scroll_info_set_enable_horizontal(gtkScrollInfo, horizontal);
	}

	/**
	 * Turns vertical scrolling on or off.
	 *
	 * Params:
	 *     vertical = if scrolling in the vertical direction
	 *         should happen
	 *
	 * Since: 4.12
	 */
	public void setEnableVertical(bool vertical)
	{
		gtk_scroll_info_set_enable_vertical(gtkScrollInfo, vertical);
	}

	/**
	 * Decreases the reference count of a `GtkScrollInfo` by one.
	 *
	 * If the resulting reference count is zero, frees the self.
	 *
	 * Since: 4.12
	 */
	public void unref()
	{
		gtk_scroll_info_unref(gtkScrollInfo);
	}
}
