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


module gdk.DragSurfaceIF;

private import gdk.DragSurfaceSize;
private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.Signals;
private import std.algorithm;


/**
 * A `GdkDragSurface` is an interface for surfaces used during DND.
 */
public interface DragSurfaceIF{
	/** Get the main Gtk struct */
	public GdkDragSurface* getDragSurfaceStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gdk_drag_surface_get_type();
	}

	/**
	 * Present @drag_surface.
	 *
	 * Params:
	 *     width = the unconstrained drag_surface width to layout
	 *     height = the unconstrained drag_surface height to layout
	 *
	 * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
	 */
	public bool present(int width, int height);

	/**
	 * Emitted when the size for the surface needs to be computed, when it is
	 * present.
	 *
	 * This signal will normally be emitted during the native surface layout
	 * cycle when the surface size needs to be recomputed.
	 *
	 * It is the responsibility of the drag surface user to handle this signal
	 * and compute the desired size of the surface, storing the computed size
	 * in the [struct@Gdk.DragSurfaceSize] object that is passed to the signal
	 * handler, using [method@Gdk.DragSurfaceSize.set_size].
	 *
	 * Failing to set a size so will result in an arbitrary size being used as
	 * a result.
	 *
	 * Params:
	 *     size = the size of the drag surface
	 *
	 * Since: 4.12
	 */
	gulong addOnComputeSize(void delegate(DragSurfaceSize, DragSurfaceIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
