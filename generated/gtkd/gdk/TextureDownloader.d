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


module gdk.TextureDownloader;

private import gdk.Texture;
private import gdk.c.functions;
public  import gdk.c.types;
private import glib.Bytes;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkd.Loader;


/**
 * The `GdkTextureDownloader` is used to download the contents of a
 * [class@Gdk.Texture].
 * 
 * It is intended to be created as a short-term object for a single download,
 * but can be used for multipe downloads of different textures or with different
 * settings.
 * 
 * `GdkTextureDownloader` can be used to convert data between different formats.
 * Create a `GdkTexture` for the existing format and then download it in a
 * different format.
 *
 * Since: 4.10
 */
public class TextureDownloader
{
	/** the main Gtk struct */
	protected GdkTextureDownloader* gdkTextureDownloader;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GdkTextureDownloader* getTextureDownloaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkTextureDownloader;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gdkTextureDownloader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkTextureDownloader* gdkTextureDownloader, bool ownedRef = false)
	{
		this.gdkTextureDownloader = gdkTextureDownloader;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GDK) && ownedRef )
			gdk_texture_downloader_free(gdkTextureDownloader);
	}


	/** */
	public static GType getType()
	{
		return gdk_texture_downloader_get_type();
	}

	/**
	 * Creates a new texture downloader for @texture.
	 *
	 * Params:
	 *     texture = texture to download
	 *
	 * Returns: A new texture downloader
	 *
	 * Since: 4.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Texture texture)
	{
		auto __p = gdk_texture_downloader_new((texture is null) ? null : texture.getTextureStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GdkTextureDownloader*) __p);
	}

	/**
	 * Creates a copy of the downloader.
	 *
	 * This function is meant for language bindings.
	 *
	 * Returns: A copy of the downloader
	 *
	 * Since: 4.10
	 */
	public TextureDownloader copy()
	{
		auto __p = gdk_texture_downloader_copy(gdkTextureDownloader);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TextureDownloader)(cast(GdkTextureDownloader*) __p, true);
	}

	/**
	 * Downloads the given texture pixels into a `GBytes`. The rowstride will
	 * be stored in the stride value.
	 *
	 * This function will abort if it tries to download a large texture and
	 * fails to allocate memory. If you think that may happen, you should
	 * handle memory allocation yourself and use
	 * gdk_texture_downloader_download_into() once allocation succeeded.
	 *
	 * Params:
	 *     outStride = The stride of the resulting data in bytes.
	 *
	 * Returns: The downloaded pixels.
	 *
	 * Since: 4.10
	 */
	public Bytes downloadBytes(out size_t outStride)
	{
		auto __p = gdk_texture_downloader_download_bytes(gdkTextureDownloader, &outStride);

		if(__p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) __p, true);
	}

	/**
	 * Downloads the @texture into local memory.
	 *
	 * Params:
	 *     data = pointer to enough memory to be filled with the
	 *         downloaded data of the texture
	 *     stride = rowstride in bytes
	 *
	 * Since: 4.10
	 */
	public void downloadInto(char[] data, size_t stride)
	{
		gdk_texture_downloader_download_into(gdkTextureDownloader, data.ptr, stride);
	}

	/**
	 * Frees the given downloader and all its associated resources.
	 *
	 * Since: 4.10
	 */
	public void free()
	{
		gdk_texture_downloader_free(gdkTextureDownloader);
		ownedRef = false;
	}

	/**
	 * Gets the format that the data will be downloaded in.
	 *
	 * Returns: The format of the download
	 *
	 * Since: 4.10
	 */
	public GdkMemoryFormat getFormat()
	{
		return gdk_texture_downloader_get_format(gdkTextureDownloader);
	}

	/**
	 * Gets the texture that the downloader will download.
	 *
	 * Returns: The texture to download
	 *
	 * Since: 4.10
	 */
	public Texture getTexture()
	{
		auto __p = gdk_texture_downloader_get_texture(gdkTextureDownloader);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p);
	}

	/**
	 * Sets the format the downloader will download.
	 *
	 * By default, GDK_MEMORY_DEFAULT is set.
	 *
	 * Params:
	 *     format = the format to use
	 *
	 * Since: 4.10
	 */
	public void setFormat(GdkMemoryFormat format)
	{
		gdk_texture_downloader_set_format(gdkTextureDownloader, format);
	}

	/**
	 * Changes the texture the downloader will download.
	 *
	 * Params:
	 *     texture = the new texture to download
	 *
	 * Since: 4.10
	 */
	public void setTexture(Texture texture)
	{
		gdk_texture_downloader_set_texture(gdkTextureDownloader, (texture is null) ? null : texture.getTextureStruct());
	}
}
