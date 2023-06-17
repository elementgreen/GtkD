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


module gstinterfaces.VideoCodecAlphaMeta;

private import gobject.ObjectG;
private import gstinterfaces.c.functions;
public  import gstinterfaces.c.types;
private import gstreamer.MetaInfo;


/**
 * This meta is primarily for internal use in GStreamer elements to support
 * VP8/VP9 transparent video stored into WebM or Matroska containers, or
 * transparent static AV1 images. Nothing prevents you from using this meta
 * for custom purposes, but it generally can't be used to easily to add support
 * for alpha channels to CODECs or formats that don't support that out of the
 * box.
 *
 * Since: 1.20
 */
public struct VideoCodecAlphaMeta
{

	/**
	 * Returns: #GstMetaInfo pointer that describes #GstVideoCodecAlphaMeta.
	 *
	 * Since: 1.20
	 */
	public static MetaInfo getInfo()
	{
		auto __p = gst_video_codec_alpha_meta_get_info();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MetaInfo)(cast(GstMetaInfo*) __p);
	}
}
