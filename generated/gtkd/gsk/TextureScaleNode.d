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


module gsk.TextureScaleNode;

private import gdk.Texture;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node for a `GdkTexture`.
 *
 * Since: 4.10
 */
public class TextureScaleNode : RenderNode
{
	/** the main Gtk struct */
	protected GskTextureScaleNode* gskTextureScaleNode;

	/** Get the main Gtk struct */
	public GskTextureScaleNode* getTextureScaleNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskTextureScaleNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskTextureScaleNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskTextureScaleNode* gskTextureScaleNode, bool ownedRef = false)
	{
		this.gskTextureScaleNode = gskTextureScaleNode;
		super(cast(GskRenderNode*)gskTextureScaleNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_texture_scale_node_get_type();
	}

	/**
	 * Creates a node that scales the texture to the size given by the
	 * bounds using the filter and then places it at the bounds' position.
	 *
	 * Note that further scaling and other transformations which are
	 * applied to the node will apply linear filtering to the resulting
	 * texture, as usual.
	 *
	 * This node is intended for tight control over scaling applied
	 * to a texture, such as in image editors and requires the
	 * application to be aware of the whole render tree as further
	 * transforms may be applied that conflict with the desired effect
	 * of this node.
	 *
	 * Params:
	 *     texture = the texture to scale
	 *     bounds = the size of the texture to scale to
	 *     filter = how to scale the texture
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Texture texture, Rect bounds, GskScalingFilter filter)
	{
		auto __p = gsk_texture_scale_node_new((texture is null) ? null : texture.getTextureStruct(), (bounds is null) ? null : bounds.getRectStruct(), filter);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskTextureScaleNode*) __p);
	}

	/**
	 * Retrieves the `GskScalingFilter` used when creating this `GskRenderNode`.
	 *
	 * Returns: the `GskScalingFilter`
	 *
	 * Since: 4.10
	 */
	public GskScalingFilter getFilter()
	{
		return gsk_texture_scale_node_get_filter(cast(GskRenderNode*)gskTextureScaleNode);
	}

	/**
	 * Retrieves the `GdkTexture` used when creating this `GskRenderNode`.
	 *
	 * Returns: the `GdkTexture`
	 *
	 * Since: 4.10
	 */
	public Texture getTexture()
	{
		auto __p = gsk_texture_scale_node_get_texture(cast(GskRenderNode*)gskTextureScaleNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p);
	}
}
