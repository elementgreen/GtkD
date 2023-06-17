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


module atk.HyperlinkImplIF;

private import atk.Hyperlink;
private import atk.c.functions;
public  import atk.c.types;
private import gobject.ObjectG;


/**
 * A queryable interface which allows AtkHyperlink instances
 * associated with an AtkObject to be obtained.  AtkHyperlinkImpl
 * corresponds to AT-SPI's Hyperlink interface, and differs from
 * AtkHyperlink in that AtkHyperlink is an object type, rather than an
 * interface, and thus cannot be directly queried. FTW
 */
public interface HyperlinkImplIF{
	/** Get the main Gtk struct */
	public AtkHyperlinkImpl* getHyperlinkImplStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return atk_hyperlink_impl_get_type();
	}

	/**
	 * Gets the hyperlink associated with this object.
	 *
	 * Returns: an AtkHyperlink object which points to this
	 *     implementing AtkObject.
	 *
	 * Since: 1.12
	 */
	public Hyperlink getHyperlink();
}
