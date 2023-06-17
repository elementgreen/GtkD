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


module gstreamer.DebugMessage;

private import glib.Str;
private import glib.c.functions;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/** */
public struct DebugMessage
{

	/**
	 * Gets the string representation of a #GstDebugMessage. This function is used
	 * in debug handlers to extract the message.
	 *
	 * Returns: the string representation of a #GstDebugMessage.
	 */
	public static string get(GstDebugMessage* message)
	{
		return Str.toString(gst_debug_message_get(message));
	}

	/**
	 * Get the id of the object that emitted this message. This function is used in
	 * debug handlers. Can be empty.
	 *
	 * Returns: The emitter of a #GstDebugMessage.
	 *
	 * Since: 1.22
	 */
	public static string getId(GstDebugMessage* message)
	{
		return Str.toString(gst_debug_message_get_id(message));
	}
}
