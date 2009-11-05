// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_vehicles;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_vehicles
  {
  public class TClass_biz_vehicles
    {
    private TClass_db_vehicles db_vehicles = null;

    public TClass_biz_vehicles() : base()
      {
      db_vehicles = new TClass_db_vehicles();
      }

    public string AgencyIdOfId(string id)
      {
      return db_vehicles.AgencyIdOfId(id);
      }

    public bool BeNotLessMileage
      (
      string id,
      string proposed_mileage
      )
      {
      return db_vehicles.BeNotLessMileage(id,proposed_mileage);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicles.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicles.BindDirectToListControl(target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string vehicle_kind_filter,
      string quarters_filter
      )
      {
      db_vehicles.BindBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,vehicle_kind_filter,quarters_filter);
      }

    public bool Delete(string id)
      {
      return db_vehicles.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string name,
      out string kind_id,
      out string bumper_number,
      out string model_year,
      out string chassis_model_id,
      out string custom_model_id,
      out string vin,
      out string fuel_id,
      out string license_plate,
      out string purchase_price
      )
      {
      return db_vehicles.Get
        (
        id,
        out agency_id,
        out name,
        out kind_id,
        out bumper_number,
        out model_year,
        out chassis_model_id,
        out custom_model_id,
        out vin,
        out fuel_id,
        out license_plate,
        out purchase_price
        );
      }

    public int AmbulanceFleetCondition
      (
      k.int_nonnegative num,
      k.decimal_nonnegative fraction
      )
      {
      var ambulance_fleet_condition = new k.subtype<int>(-1,1);
      db_vehicles.AmbulanceFleetCondition(num,fraction);
      ambulance_fleet_condition.val = 1;
      if (fraction.val <= decimal.Parse(ConfigurationManager.AppSettings["ambulances_up_citywide_alert_fraction"]))
        {
        ambulance_fleet_condition.val = 0;
        }
      if (num.val < int.Parse(ConfigurationManager.AppSettings["ambulances_up_citywide_alarm_num"]))
        {
        ambulance_fleet_condition.val = -1;
        }
      return ambulance_fleet_condition.val;
      }

    public string IdOf(object summary)
      {
      return db_vehicles.IdOf(summary);
      }

    public string NameOf(object summary)
      {
      return db_vehicles.NameOf(summary);
      }

    public string NameOfId(string id)
      {
      return db_vehicles.NameOfId(id);
      }

    public string RecentMileageOf(object summary)
      {
      return db_vehicles.RecentMileageOf(summary);
      }

    public void Set
      (
      string id,
      string agency_id,
      string name,
      string kind_id,
      string bumper_number,
      string model_year,
      string chassis_model_id,
      string custom_model_id,
      string vin,
      string fuel_id,
      string license_plate,
      string purchase_price
      )
      {
      db_vehicles.Set
        (
        id,
        agency_id,
        name,
        kind_id,
        bumper_number,
        model_year,
        chassis_model_id,
        custom_model_id,
        vin,
        fuel_id,
        license_plate,
        purchase_price
        );
      }

    public void SetMileage
      (
      string id,
      string mileage
      )
      {
      db_vehicles.SetMileage(id,mileage);
      }

    public object Summary(string vehicle_id)
      {
      return db_vehicles.Summary(vehicle_id);
      }

    } // end TClass_biz_vehicles

  }
