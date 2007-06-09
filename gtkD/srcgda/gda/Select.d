/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = libgda-GdaSelect.html
 * outPack = gda
 * outFile = Select
 * strct   = GdaSelect
 * realStrct=
 * ctorStrct=
 * clss    = Select
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gda_select_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- gda.DataModel
 * structWrap:
 * 	- GdaDataModel* -> DataModel
 * 	- GdaSelect* -> Select
 * module aliases:
 * local aliases:
 */

module gda.Select;

private import gdac.gdatypes;

private import gdac.gda;


private import gda.DataModel;




/**
 * Description
 */
public class Select
{
	
	/** the main Gtk struct */
	protected GdaSelect* gdaSelect;
	
	
	public GdaSelect* getSelectStruct()
	{
		return gdaSelect;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gdaSelect;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GdaSelect* gdaSelect)
	{
		assert(gdaSelect !is null, "struct gdaSelect is null on constructor");
		this.gdaSelect = gdaSelect;
	}
	
	/**
	 */
	
	
	/**
	 * Creates a new GdaSelect object, which allows programs to filter
	 * GdaDataModel's based on a given SQL SELECT command.
	 * A GdaSelect is just another GdaDataModel-based class, so it
	 * can be used in the same way any other data model class is.
	 * Returns :
	 *  the newly created object.
	 */
	public static DataModel newSelect()
	{
		// GdaDataModel* gda_select_new (void);
		return new DataModel( gda_select_new() );
	}
	
	/**
	 * Adds a data model as a source of data for the GdaSelect object. When
	 * the select object is run (via gda_select_run), it will parse the SQL
	 * and get the required data from the source data models.
	 * sel :
	 *  a GdaSelect object.
	 * name :
	 *  name to identify the data model (usually a table name).
	 * source :
	 *  a GdaDataModel from which to get data.
	 */
	public void addSource(char[] name, DataModel source)
	{
		// void gda_select_add_source (GdaSelect *sel,  const gchar *name,  GdaDataModel *source);
		gda_select_add_source(gdaSelect, Str.toStringz(name), (source is null) ? null : source.getDataModelStruct());
	}
	
	/**
	 * Sets the SQL command to be used on the given GdaSelect object
	 * for filtering rows from the source data model (which is
	 * set with gda_select_set_source).
	 * sel :
	 *  a GdaSelect object.
	 * sql :
	 *  the SQL command to be used for filtering rows.
	 */
	public void setSql(char[] sql)
	{
		// void gda_select_set_sql (GdaSelect *sel,  const gchar *sql);
		gda_select_set_sql(gdaSelect, Str.toStringz(sql));
	}
	
	/**
	 * Runs the query and fills in the GdaSelect object with the
	 * rows that matched the SQL command (which can be set with
	 * gda_select_set_sql) associated with this GdaSelect
	 * object.
	 * After calling this function, if everything is successful,
	 * the GdaSelect object will contain the matched rows, which
	 * can then be accessed like a normal GdaDataModel.
	 * sel :
	 *  a GdaSelect object.
	 * Returns :
	 *  TRUE if successful, FALSE if there was an error.
	 */
	public int run()
	{
		// gboolean gda_select_run (GdaSelect *sel);
		return gda_select_run(gdaSelect);
	}
}