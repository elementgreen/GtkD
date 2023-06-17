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


module gst.base.TypeFindData;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gst.base.c.functions;
public  import gst.base.c.types;
private import gstreamer.Caps;
private import gstreamer.ObjectGst;
private import gstreamer.TypeFind;
private import gtkd.Loader;


/**
 * The opaque #GstTypeFindData structure.
 *
 * Since: 1.22
 */
public class TypeFindData
{
	/** the main Gtk struct */
	protected GstTypeFindData* gstTypeFindData;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstTypeFindData* getTypeFindDataStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstTypeFindData;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstTypeFindData;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstTypeFindData* gstTypeFindData, bool ownedRef = false)
	{
		this.gstTypeFindData = gstTypeFindData;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTBASE) && ownedRef )
			gst_type_find_data_free(gstTypeFindData);
	}


	/** */
	public void free()
	{
		gst_type_find_data_free(gstTypeFindData);
		ownedRef = false;
	}

	/**
	 * Returns #GstCaps associated with #GstTypeFindData
	 *
	 * Returns: #GstCaps.
	 *
	 * Since: 1.22
	 */
	public Caps getCaps()
	{
		auto __p = gst_type_find_data_get_caps(gstTypeFindData);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Caps)(cast(GstCaps*) __p, true);
	}

	/**
	 * Returns #GstTypeFindProbability associated with #GstTypeFindData
	 *
	 * Returns: #GstTypeFindProbability.
	 *
	 * Since: 1.22
	 */
	public GstTypeFindProbability getProbability()
	{
		return gst_type_find_data_get_probability(gstTypeFindData);
	}

	/**
	 * Returns #GstTypeFind associated with #GstTypeFindData
	 *
	 * Returns: #GstTypeFind.
	 *
	 * Since: 1.22
	 */
	public TypeFind getTypefind()
	{
		auto __p = gst_type_find_data_get_typefind(gstTypeFindData);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TypeFind)(cast(GstTypeFind*) __p);
	}

	/**
	 * Free-function: gst_type_find_data_free
	 *
	 * Params:
	 *     obj = object doing the typefinding, or %NULL (used for logging)
	 *     data = a pointer with data to typefind
	 *
	 * Returns: the #GstTypeFindData. The caller should free
	 *     the returned #GstTypeFindData with gst_type_find_data_free().
	 *
	 * Since: 1.22
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ObjectGst obj, ubyte[] data)
	{
		auto __p = gst_type_find_data_new((obj is null) ? null : obj.getObjectGstStruct(), data.ptr, cast(size_t)data.length);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstTypeFindData*) __p);
	}
}
