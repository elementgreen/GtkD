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


module gdk.GLTextureBuilder;

private import cairo.Region;
private import gdk.GLContext;
private import gdk.Texture;
private import gdk.c.functions;
public  import gdk.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * `GdkGLTextureBuilder` is a buider used to construct [class@Gdk.Texture] objects from
 * GL textures.
 * 
 * The operation is quite simple: Create a texture builder, set all the necessary
 * properties - keep in mind that the properties [property@Gdk.GLTextureBuilder:context],
 * [property@Gdk.GLTextureBuilder:id], [property@Gdk.GLTextureBuilder:width], and
 * [property@Gdk.GLTextureBuilder:height] are mandatory - and then call
 * [method@Gdk.GLTextureBuilder.build] to create the new texture.
 * 
 * `GdkGLTextureBuilder` can be used for quick one-shot construction of
 * textures as well as kept around and reused to construct multiple textures.
 *
 * Since: 4.12
 */
public class GLTextureBuilder : ObjectG
{
	/** the main Gtk struct */
	protected GdkGLTextureBuilder* gdkGLTextureBuilder;

	/** Get the main Gtk struct */
	public GdkGLTextureBuilder* getGLTextureBuilderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkGLTextureBuilder;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkGLTextureBuilder;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkGLTextureBuilder* gdkGLTextureBuilder, bool ownedRef = false)
	{
		this.gdkGLTextureBuilder = gdkGLTextureBuilder;
		super(cast(GObject*)gdkGLTextureBuilder, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_gl_texture_builder_get_type();
	}

	/**
	 * Creates a new texture builder.
	 *
	 * Returns: the new `GdkTextureBuilder`
	 *
	 * Since: 4.12
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gdk_gl_texture_builder_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GdkGLTextureBuilder*) __p, true);
	}

	/**
	 * Builds a new `GdkTexture` with the values set up in the builder.
	 *
	 * The `destroy` function gets called when the returned texture gets released;
	 * either when the texture is finalized or by an explicit call to
	 * [method@Gdk.GLTexture.release]. It should release all GL resources associated
	 * with the texture, such as the [property@Gdk.GLTextureBuilder:id] and the
	 * [property@Gdk.GLTextureBuilder:sync].
	 *
	 * Note that it is a programming error to call this function if any mandatory
	 * property has not been set.
	 *
	 * It is possible to call this function multiple times to create multiple textures,
	 * possibly with changing properties in between.
	 *
	 * Params:
	 *     destroy = destroy function to be called when the texture is
	 *         released
	 *     data = user data to pass to the destroy function
	 *
	 * Returns: a newly built `GdkTexture`
	 *
	 * Since: 4.12
	 */
	public Texture build(GDestroyNotify destroy, void* data)
	{
		auto __p = gdk_gl_texture_builder_build(gdkGLTextureBuilder, destroy, data);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p, true);
	}

	/**
	 * Gets the context previously set via gdk_gl_texture_builder_set_context() or
	 * %NULL if none was set.
	 *
	 * Returns: The context
	 *
	 * Since: 4.12
	 */
	public GLContext getContext()
	{
		auto __p = gdk_gl_texture_builder_get_context(gdkGLTextureBuilder);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(GLContext)(cast(GdkGLContext*) __p);
	}

	/**
	 * Gets the format previously set via gdk_gl_texture_builder_set_format().
	 *
	 * Returns: The format
	 *
	 * Since: 4.12
	 */
	public GdkMemoryFormat getFormat()
	{
		return gdk_gl_texture_builder_get_format(gdkGLTextureBuilder);
	}

	/**
	 * Gets whether the texture has a mipmap.
	 *
	 * Returns: Whether the texture has a mipmap
	 *
	 * Since: 4.12
	 */
	public bool getHasMipmap()
	{
		return gdk_gl_texture_builder_get_has_mipmap(gdkGLTextureBuilder) != 0;
	}

	/**
	 * Gets the height previously set via gdk_gl_texture_builder_set_height() or
	 * 0 if the height wasn't set.
	 *
	 * Returns: The height
	 *
	 * Since: 4.12
	 */
	public int getHeight()
	{
		return gdk_gl_texture_builder_get_height(gdkGLTextureBuilder);
	}

	/**
	 * Gets the texture id previously set via gdk_gl_texture_builder_set_id() or
	 * 0 if the id wasn't set.
	 *
	 * Returns: The id
	 *
	 * Since: 4.12
	 */
	public uint getId()
	{
		return gdk_gl_texture_builder_get_id(gdkGLTextureBuilder);
	}

	/**
	 * Gets the `GLsync` previously set via gdk_gl_texture_builder_set_sync().
	 *
	 * Returns: the `GLSync`
	 *
	 * Since: 4.12
	 */
	public void* getSync()
	{
		return gdk_gl_texture_builder_get_sync(gdkGLTextureBuilder);
	}

	/**
	 * Gets the region previously set via gdk_gl_texture_builder_set_update_region() or
	 * %NULL if none was set.
	 *
	 * Returns: The region
	 *
	 * Since: 4.12
	 */
	public Region getUpdateRegion()
	{
		auto __p = gdk_gl_texture_builder_get_update_region(gdkGLTextureBuilder);

		if(__p is null)
		{
			return null;
		}

		return new Region(cast(cairo_region_t*) __p);
	}

	/**
	 * Gets the texture previously set via gdk_gl_texture_builder_set_update_texture() or
	 * %NULL if none was set.
	 *
	 * Returns: The texture
	 *
	 * Since: 4.12
	 */
	public Texture getUpdateTexture()
	{
		auto __p = gdk_gl_texture_builder_get_update_texture(gdkGLTextureBuilder);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p);
	}

	/**
	 * Gets the width previously set via gdk_gl_texture_builder_set_width() or
	 * 0 if the width wasn't set.
	 *
	 * Returns: The width
	 *
	 * Since: 4.12
	 */
	public int getWidth()
	{
		return gdk_gl_texture_builder_get_width(gdkGLTextureBuilder);
	}

	/**
	 * Sets the context to be used for the texture. This is the context that owns
	 * the texture.
	 *
	 * The context must be set before calling [method@Gdk.GLTextureBuilder.build].
	 *
	 * Params:
	 *     context = The context the texture beongs to or %NULL to unset
	 *
	 * Since: 4.12
	 */
	public void setContext(GLContext context)
	{
		gdk_gl_texture_builder_set_context(gdkGLTextureBuilder, (context is null) ? null : context.getGLContextStruct());
	}

	/**
	 * Sets the format of the texture. The default is `GDK_MEMORY_R8G8B8A8_PREMULTIPLIED`.
	 *
	 * The format is the preferred format the texture data should be downloaded to. The
	 * format must be supported by the GL version of [property@Gdk.GLTextureBuilder:context].
	 *
	 * GDK's texture download code assumes that the format corresponds to the storage
	 * parameters of the GL texture in an obvious way. For example, a format of
	 * `GDK_MEMORY_R16G16B16A16_PREMULTIPLIED` is expected to be stored as `GL_RGBA16`
	 * texture, and `GDK_MEMORY_G8A8` is expected to be stored as `GL_RG8` texture.
	 *
	 * Setting the right format is particularly useful when using high bit depth textures
	 * to preserve the bit depth, to set the correct value for unpremultiplied textures
	 * and to make sure opaque textures are treated as such.
	 *
	 * Non-RGBA textures need to have swizzling parameters set up properly to be usable
	 * in GSK's shaders.
	 *
	 * Params:
	 *     format = The texture's format
	 *
	 * Since: 4.12
	 */
	public void setFormat(GdkMemoryFormat format)
	{
		gdk_gl_texture_builder_set_format(gdkGLTextureBuilder, format);
	}

	/**
	 * Sets whether the texture has a mipmap. This allows the renderer and other users of the
	 * generated texture to use a higher quality downscaling.
	 *
	 * Typically, the `glGenerateMipmap` function is used to generate a mimap.
	 *
	 * Params:
	 *     hasMipmap = Whether the texture has a mipmap
	 *
	 * Since: 4.12
	 */
	public void setHasMipmap(bool hasMipmap)
	{
		gdk_gl_texture_builder_set_has_mipmap(gdkGLTextureBuilder, hasMipmap);
	}

	/**
	 * Sets the height of the texture.
	 *
	 * The height must be set before calling [method@Gdk.GLTextureBuilder.build].
	 *
	 * Params:
	 *     height = The texture's height or 0 to unset
	 *
	 * Since: 4.12
	 */
	public void setHeight(int height)
	{
		gdk_gl_texture_builder_set_height(gdkGLTextureBuilder, height);
	}

	/**
	 * Sets the texture id of the texture. The texture id must remain unmodified
	 * until the texture was finalized. See [method@Gdk.GLTextureBuilder.build]
	 * for a longer discussion.
	 *
	 * The id must be set before calling [method@Gdk.GLTextureBuilder.build].
	 *
	 * Params:
	 *     id = The texture id to be used for creating the texture
	 *
	 * Since: 4.12
	 */
	public void setId(uint id)
	{
		gdk_gl_texture_builder_set_id(gdkGLTextureBuilder, id);
	}

	/**
	 * Sets the GLSync object to use for the texture.
	 *
	 * GTK will wait on this object before using the created `GdkTexture`.
	 *
	 * The `destroy` function that is passed to [method@Gdk.GLTextureBuilder.build]
	 * is responsible for freeing the sync object when it is no longer needed.
	 * The texture builder does not destroy it and it is the callers
	 * responsibility to make sure it doesn't leak.
	 *
	 * Params:
	 *     sync = the GLSync object
	 *
	 * Since: 4.12
	 */
	public void setSync(void* sync)
	{
		gdk_gl_texture_builder_set_sync(gdkGLTextureBuilder, sync);
	}

	/**
	 * Sets the region to be updated by this texture. Together with
	 * [property@Gdk.GLTextureBuilder:update-texture] this describes an
	 * update of a previous texture.
	 *
	 * When rendering animations of large textures, it is possible that
	 * consecutive textures are only updating contents in parts of the texture.
	 * It is then possible to describe this update via these two properties,
	 * so that GTK can avoid rerendering parts that did not change.
	 *
	 * An example would be a screen recording where only the mouse pointer moves.
	 *
	 * Params:
	 *     region = the region to update
	 *
	 * Since: 4.12
	 */
	public void setUpdateRegion(Region region)
	{
		gdk_gl_texture_builder_set_update_region(gdkGLTextureBuilder, (region is null) ? null : region.getRegionStruct());
	}

	/**
	 * Sets the texture to be updated by this texture. See
	 * [method@Gdk.GLTextureBuilder.set_update_region] for an explanation.
	 *
	 * Params:
	 *     texture = the texture to update
	 *
	 * Since: 4.12
	 */
	public void setUpdateTexture(Texture texture)
	{
		gdk_gl_texture_builder_set_update_texture(gdkGLTextureBuilder, (texture is null) ? null : texture.getTextureStruct());
	}

	/**
	 * Sets the width of the texture.
	 *
	 * The width must be set before calling [method@Gdk.GLTextureBuilder.build].
	 *
	 * Params:
	 *     width = The texture's width or 0 to unset
	 *
	 * Since: 4.12
	 */
	public void setWidth(int width)
	{
		gdk_gl_texture_builder_set_width(gdkGLTextureBuilder, width);
	}
}
