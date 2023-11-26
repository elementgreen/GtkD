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


module harfbuzz.color_stop_t;

private import glib.Memory;
private import gtkd.Loader;
private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Information about a color stop on a color line.
 * 
 * Color lines typically have offsets ranging between 0 and 1,
 * but that is not required.
 * 
 * Note: despite @color being unpremultiplied here, interpolation in
 * gradients shall happen in premultiplied space. See the OpenType spec
 * [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
 * section for details.
 *
 * Since: 7.0.0
 */
public final class color_stop_t
{
	/** the main Gtk struct */
	protected hb_color_stop_t* hb_color_stop;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public hb_color_stop_t* getcolor_stop_tStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hb_color_stop;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)hb_color_stop;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (hb_color_stop_t* hb_color_stop, bool ownedRef = false)
	{
		this.hb_color_stop = hb_color_stop;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_HARFBUZZ) && ownedRef )
			Memory.free(hb_color_stop);
	}


	/**
	 * the offset of the color stop
	 */
	public @property float offset()
	{
		return hb_color_stop.offset;
	}

	/** Ditto */
	public @property void offset(float value)
	{
		hb_color_stop.offset = value;
	}

	/**
	 * whether the color is the foreground
	 */
	public @property hb_bool_t isForeground()
	{
		return hb_color_stop.isForeground;
	}

	/** Ditto */
	public @property void isForeground(hb_bool_t value)
	{
		hb_color_stop.isForeground = value;
	}

	/**
	 * the color, unpremultiplied
	 */
	public @property hb_color_t color()
	{
		return hb_color_stop.color;
	}

	/** Ditto */
	public @property void color(hb_color_t value)
	{
		hb_color_stop.color = value;
	}

	/** */
	public static GType getType()
	{
		return hb_gobject_color_stop_get_type();
	}
}
