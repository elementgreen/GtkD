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


module gtk.SectionModelT;

public  import gobject.Signals;
public  import gtk.c.functions;
public  import gtk.c.types;
public  import std.algorithm;


/**
 * `GtkSectionModel` is an interface that adds support for sections to list models.
 * 
 * A `GtkSectionModel` groups successive items into so-called sections. List widgets
 * like `GtkListView` and `GtkGridView` then allow displaying section headers for
 * these sections by installing a header factory.
 * 
 * Many GTK list models support sections inherently, or they pass through the sections
 * of a model they are wrapping.
 * 
 * When the section groupings of a model change, the model will emit the
 * [signal@Gtk.SectionModel::sections-changed] signal by calling the
 * [method@Gtk.SectionModel.sections_changed] function. All sections in the given range
 * then need to be queried again.
 * The [signal@Gio.ListModel::items-changed] signal has the same effect, all sections in
 * that range are invalidated, too.
 *
 * Since: 4.12
 */
public template SectionModelT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkSectionModel* getSectionModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkSectionModel*)getStruct();
	}


	/**
	 * Query the section that covers the given position. The number of
	 * items in the section can be computed by `out_end - out_start`.
	 *
	 * If the position is larger than the number of items, a single
	 * range from n_items to G_MAXUINT will be returned.
	 *
	 * Params:
	 *     position = the position of the item to query
	 *     outStart = the position of the first item in the section
	 *     outEnd = the position of the first item not part of the section
	 *         anymore.
	 *
	 * Since: 4.12
	 */
	public void getSection(uint position, out uint outStart, out uint outEnd)
	{
		gtk_section_model_get_section(getSectionModelStruct(), position, &outStart, &outEnd);
	}

	/** */
	public void sectionsChanged(uint position, uint nItems)
	{
		gtk_section_model_sections_changed(getSectionModelStruct(), position, nItems);
	}

	/**
	 * Emitted when the start-of-section state of some of the items in @model changes.
	 *
	 * Note that this signal does not specify the new section state of the
	 * items, they need to be queried manually. It is also not necessary for
	 * a model to change the section state of any of the items in the section
	 * model, though it would be rather useless to emit such a signal.
	 *
	 * The [signal@Gio.ListModel::items-changed] implies the effect of the
	 * [signal@Gtk.SectionModel::sections-changed] signal for all the items
	 * it covers.
	 *
	 * Params:
	 *     position = The first item that may have changed
	 *     nItems = number of items with changes
	 *
	 * Since: 4.12
	 */
	gulong addOnSectionsChanged(void delegate(uint, uint, SectionModelIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "sections-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
