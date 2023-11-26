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


module harfbuzz.paint_funcs_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Glyph paint callbacks.
 * 
 * The callbacks assume that the caller maintains a stack
 * of current transforms, clips and intermediate surfaces,
 * as evidenced by the pairs of push/pop callbacks. The
 * push/pop calls will be properly nested, so it is fine
 * to store the different kinds of object on a single stack.
 * 
 * Not all callbacks are required for all kinds of glyphs.
 * For rendering COLRv0 or non-color outline glyphs, the
 * gradient callbacks are not needed, and the composite
 * callback only needs to handle simple alpha compositing
 * (#HB_PAINT_COMPOSITE_MODE_SRC_OVER).
 * 
 * The paint-image callback is only needed for glyphs
 * with image blobs in the CBDT, sbix or SVG tables.
 * 
 * The custom-palette-color callback is only necessary if
 * you want to override colors from the font palette with
 * custom colors.
 *
 * Since: 7.0.0
 */
public struct paint_funcs_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_paint_funcs_get_type();
	}
}
