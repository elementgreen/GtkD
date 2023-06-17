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


module gstinterfaces.VideoSEIUserDataUnregisteredMeta;

private import gobject.ObjectG;
private import gstinterfaces.c.functions;
public  import gstinterfaces.c.types;
private import gstreamer.MetaInfo;


/**
 * H.264 H.265 metadata from SEI User Data Unregistered messages
 *
 * Since: 1.22
 */
public struct VideoSEIUserDataUnregisteredMeta
{

	/**
	 * Returns: #GstMetaInfo pointer that describes #GstVideoSEIUserDataUnregisteredMeta.
	 *
	 * Since: 1.22
	 */
	public static MetaInfo getInfo()
	{
		auto __p = gst_video_sei_user_data_unregistered_meta_get_info();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MetaInfo)(cast(GstMetaInfo*) __p);
	}
}
