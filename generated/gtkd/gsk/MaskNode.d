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


module gsk.MaskNode;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node masking one child node with another.
 *
 * Since: 4.10
 */
public class MaskNode : RenderNode
{
	/** the main Gtk struct */
	protected GskMaskNode* gskMaskNode;

	/** Get the main Gtk struct */
	public GskMaskNode* getMaskNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskMaskNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskMaskNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskMaskNode* gskMaskNode, bool ownedRef = false)
	{
		this.gskMaskNode = gskMaskNode;
		super(cast(GskRenderNode*)gskMaskNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_mask_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will mask a given node by another.
	 *
	 * The @mask_mode determines how the 'mask values' are derived from
	 * the colors of the @mask. Applying the mask consists of multiplying
	 * the 'mask value' with the alpha of the source.
	 *
	 * Params:
	 *     source = The source node to be drawn
	 *     mask = The node to be used as mask
	 *     maskMode = The mask mode to use
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(RenderNode source, RenderNode mask, GskMaskMode maskMode)
	{
		auto __p = gsk_mask_node_new((source is null) ? null : source.getRenderNodeStruct(), (mask is null) ? null : mask.getRenderNodeStruct(), maskMode);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskMaskNode*) __p);
	}

	/**
	 * Retrieves the mask `GskRenderNode` child of the @node.
	 *
	 * Returns: the mask child node
	 *
	 * Since: 4.10
	 */
	public RenderNode getMask()
	{
		auto __p = gsk_mask_node_get_mask(cast(GskRenderNode*)gskMaskNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/**
	 * Retrieves the mask mode used by @node.
	 *
	 * Returns: the mask mode
	 *
	 * Since: 4.10
	 */
	public GskMaskMode getMaskMode()
	{
		return gsk_mask_node_get_mask_mode(cast(GskRenderNode*)gskMaskNode);
	}

	/**
	 * Retrieves the source `GskRenderNode` child of the @node.
	 *
	 * Returns: the source child node
	 *
	 * Since: 4.10
	 */
	public RenderNode getSource()
	{
		auto __p = gsk_mask_node_get_source(cast(GskRenderNode*)gskMaskNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}
}
