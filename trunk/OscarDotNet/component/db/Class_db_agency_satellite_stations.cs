// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_agency_satellite_stations
  {
  public class TClass_db_agency_satellite_stations: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_agency_satellite_stations() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal bool BeStationSatelliteOfAgency
      (
      string station_num,
      string agency_id
      )
      {
      var be_station_satellite_of_agency = false;
      Open();
      be_station_satellite_of_agency = "1" == new MySqlCommand("select IFNULL((select 1 from agency_satellite_station where agency_id = '" + agency_id + "' and satellite_station_id = '" + station_num + "'),0)",connection).ExecuteScalar().ToString();
      Close();
      return be_station_satellite_of_agency;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(agency_id,'-'),'|',IFNULL(a.short_designator,'-'),'|',IFNULL(a.medium_designator,'-'),'|',IFNULL(a.long_designator,'-'),'|',IFNULL(satellite_station_id,'-'),'|',IFNULL(s.short_designator,'-'),'|',IFNULL(s.medium_designator,'-'),'|',IFNULL(s.long_designator,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select agency_satellite_station.id as agency_satellite_station_id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from agency_satellite_station"
        +   " join agency a on (a.id=agency_satellite_station.agency_id)"
        +   " join agency s on (s.id=agency_satellite_station.satellite_station_id)"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["agency_satellite_station_id"].ToString()));
        }
      dr.Close();
      this.Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl(object target)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(agency_id,'-'),'|',IFNULL(satellite_station_id,'-')) USING utf8) as spec"
        + " FROM agency_satellite_station"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from agency_satellite_station where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
        }
      catch(System.Exception e)
        {
        if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
          {
          result = false;
          }
        else
          {
          throw e;
          }
        }
      this.Close();
      return result;
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string satellite_station_id
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      agency_id = k.EMPTY;
      satellite_station_id = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from agency_satellite_station where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        satellite_station_id = dr["satellite_station_id"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void Set
      (
      string id,
      string agency_id,
      string satellite_station_id
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "agency_id = NULLIF('" + agency_id + "','')"
      + " , satellite_station_id = NULLIF('" + satellite_station_id + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert agency_satellite_station"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          this.connection
        )
        .ExecuteNonQuery();
      this.Close();
      }

    } // end TClass_db_agency_satellite_stations

  }
