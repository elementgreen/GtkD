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


module harfbuzz.color_line_t;

private import glib.Memory;
private import gtkd.Loader;
private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * A struct containing color information for a gradient.
 *
 * Since: 7.0.0
 */
public final class color_line_t
{
	/** the main Gtk struct */
	protected hb_color_line_t* hb_color_line;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public hb_color_line_t* getcolor_line_tStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hb_color_line;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)hb_color_line;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (hb_color_line_t* hb_color_line, bool ownedRef = false)
	{
		this.hb_color_line = hb_color_line;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_HARFBUZZ) && ownedRef )
			Memory.free(hb_color_line);
	}


	/** */
	public @property void* data()
	{
		return hb_color_line.data;
	}

	/** Ditto */
	public @property void data(void* value)
	{
		hb_color_line.data = value;
	}

	/** */
	public @property hb_color_line_get_color_stops_func_t getColorStops()
	{
		return hb_color_line.getColorStops;
	}

	/** Ditto */
	public @property void getColorStops(hb_color_line_get_color_stops_func_t value)
	{
		hb_color_line.getColorStops = value;
	}

	/** */
	public @property void* getColorStopsUserData()
	{
		return hb_color_line.getColorStopsUserData;
	}

	/** Ditto */
	public @property void getColorStopsUserData(void* value)
	{
		hb_color_line.getColorStopsUserData = value;
	}

	/** */
	public @property hb_color_line_get_extend_func_t getExtend()
	{
		return hb_color_line.getExtend;
	}

	/** Ditto */
	public @property void getExtend(hb_color_line_get_extend_func_t value)
	{
		hb_color_line.getExtend = value;
	}

	/** */
	public @property void* getExtendUserData()
	{
		return hb_color_line.getExtendUserData;
	}

	/** Ditto */
	public @property void getExtendUserData(void* value)
	{
		hb_color_line.getExtendUserData = value;
	}

	/** */
	public @property void* reserved0()
	{
		return hb_color_line.reserved0;
	}

	/** Ditto */
	public @property void reserved0(void* value)
	{
		hb_color_line.reserved0 = value;
	}

	/** */
	public @property void* reserved1()
	{
		return hb_color_line.reserved1;
	}

	/** Ditto */
	public @property void reserved1(void* value)
	{
		hb_color_line.reserved1 = value;
	}

	/** */
	public @property void* reserved2()
	{
		return hb_color_line.reserved2;
	}

	/** Ditto */
	public @property void reserved2(void* value)
	{
		hb_color_line.reserved2 = value;
	}

	/** */
	public @property void* reserved3()
	{
		return hb_color_line.reserved3;
	}

	/** Ditto */
	public @property void reserved3(void* value)
	{
		hb_color_line.reserved3 = value;
	}

	/** */
	public @property void* reserved5()
	{
		return hb_color_line.reserved5;
	}

	/** Ditto */
	public @property void reserved5(void* value)
	{
		hb_color_line.reserved5 = value;
	}

	/** */
	public @property void* reserved6()
	{
		return hb_color_line.reserved6;
	}

	/** Ditto */
	public @property void reserved6(void* value)
	{
		hb_color_line.reserved6 = value;
	}

	/** */
	public @property void* reserved7()
	{
		return hb_color_line.reserved7;
	}

	/** Ditto */
	public @property void reserved7(void* value)
	{
		hb_color_line.reserved7 = value;
	}

	/** */
	public @property void* reserved8()
	{
		return hb_color_line.reserved8;
	}

	/** Ditto */
	public @property void reserved8(void* value)
	{
		hb_color_line.reserved8 = value;
	}

	/** */
	public static GType getType()
	{
		return hb_gobject_color_line_get_type();
	}
}
