// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_agency_satellite_stations;

namespace Class_biz_agency_satellite_stations
  {
  public class TClass_biz_agency_satellite_stations
    {
    private readonly TClass_db_agency_satellite_stations db_agency_satellite_stations = null;

    public TClass_biz_agency_satellite_stations() : base()
      {
      db_agency_satellite_stations = new TClass_db_agency_satellite_stations();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_agency_satellite_stations.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_agency_satellite_stations.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_agency_satellite_stations.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string satellite_station_id
      )
      {
      return db_agency_satellite_stations.Get
        (
        id,
        out agency_id,
        out satellite_station_id
        );
      }

    public void Set
      (
      string id,
      string agency_id,
      string satellite_station_id
      )
      {
      db_agency_satellite_stations.Set
        (
        id,
        agency_id,
        satellite_station_id
        );
      }

    } // end TClass_biz_agency_satellite_stations

  }
