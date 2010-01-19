// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_members;
using Class_biz_notifications;
using Class_db_vehicles;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_vehicles
  {
  public class TClass_biz_vehicles
    {
    private TClass_biz_members biz_members = null;
    private TClass_biz_notifications biz_notifications = null;
    private TClass_db_vehicles db_vehicles = null;

    public TClass_biz_vehicles() : base()
      {
      biz_members = new TClass_biz_members();
      biz_notifications = new TClass_biz_notifications();
      db_vehicles = new TClass_db_vehicles();
      }

    public string AgencyIdOfId(string id)
      {
      return db_vehicles.AgencyIdOfId(id);
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

    public bool BeNotEarlierDmvInspectionDue
      (
      string id,
      DateTime proposed_date
      )
      {
      return db_vehicles.BeNotEarlierDmvInspectionDue(id,proposed_date);
      }

    public bool BeNotEarlierTargetPmMileage
      (
      string id,
      string proposed_mileage
      )
      {
      return db_vehicles.BeNotEarlierTargetPmMileage(id,proposed_mileage);
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

    public void ChangeQuarters
      (
      string vehicle_id,
      string quarters_id,
      DateTime effective_datetime,
      string mileage,
      string note,
      object summary
      )
      {
      db_vehicles.ChangeQuarters(vehicle_id,quarters_id,effective_datetime,mileage,note,summary);
      biz_notifications.IssueForVehicleQuartersChange(vehicle_id,quarters_id,effective_datetime,mileage,note);
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
      out string purchase_price,
      out string recent_mileage,
      out bool be_active,
      out string target_pm_mileage,
      out DateTime dmv_inspection_due
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
        out purchase_price,
        out recent_mileage,
        out be_active,
        out target_pm_mileage,
        out dmv_inspection_due
        );
      }

    public string IdOf(object summary)
      {
      return db_vehicles.IdOf(summary);
      }

    public void MarkDown
      (
      string vehicle_id,
      DateTime time_went_down,
      string nature_id,
      string mileage,
      string down_comment,
      object summary
      )
      {
      var dummy_int_nonnegative = new k.int_nonnegative();
      var dummy_decimal_nonnegative = new k.decimal_nonnegative();
      var saved_condition = new k.subtype<int>(-1,1);
      saved_condition.val = AmbulanceFleetCondition(dummy_int_nonnegative,dummy_decimal_nonnegative);
      db_vehicles.MarkDown
        (
        vehicle_id,
        time_went_down,
        nature_id,
        mileage,
        down_comment + biz_members.UserAttributionIndicator(),
        summary
        );
      biz_notifications.IssueForVehicleMarkedDown(vehicle_id,time_went_down,nature_id,mileage,down_comment);
      //
      var current_condition = new k.subtype<int>(-1,1);
      current_condition.val = AmbulanceFleetCondition(dummy_int_nonnegative,dummy_decimal_nonnegative);
      if (current_condition.val < saved_condition.val)
        {
        if (current_condition.val == 0)
          {
          biz_notifications.IssueAmbulanceFleetConditionAlert();
          }
        else if (current_condition.val < 0)
          {
          biz_notifications.IssueAmbulanceFleetConditionAlarm();
          }
        }
      }

    public void MarkUp
      (
      string vehicle_id,
      DateTime time_came_up,
      string down_comment,
      string up_comment,
      object summary
      )
      {
      var dummy_int_nonnegative = new k.int_nonnegative();
      var dummy_decimal_nonnegative = new k.decimal_nonnegative();
      var saved_condition = new k.subtype<int>(-1,1);
      saved_condition.val = AmbulanceFleetCondition(dummy_int_nonnegative,dummy_decimal_nonnegative);
      db_vehicles.MarkUp
        (
        vehicle_id,
        time_came_up,
        up_comment + biz_members.UserAttributionIndicator(),
        summary
        );
      biz_notifications.IssueForVehicleMarkedUp(vehicle_id,time_came_up,down_comment,up_comment);
      //
      var current_condition = new k.subtype<int>(-1,1);
      current_condition.val = AmbulanceFleetCondition(dummy_int_nonnegative,dummy_decimal_nonnegative);
      if (current_condition.val > saved_condition.val)
        {
        if (current_condition.val == 0)
          {
          biz_notifications.RetractAmbulanceFleetConditionAlarm();
          }
        else if (current_condition.val > 0)
          {
          biz_notifications.RetractAmbulanceFleetConditionAlert();
          }
        }
      }

    public string NameOf(object summary)
      {
      return db_vehicles.NameOf(summary);
      }

    public string NameOfId(string id)
      {
      return db_vehicles.NameOfId(id);
      }

    internal string NameWithCompetingBumperNumber(string id, string bumper_number)
      {
      return db_vehicles.NameWithCompetingBumperNumber(id,bumper_number);
      }

    internal string NameWithCompetingVin(string id, string vin)
      {
      return db_vehicles.NameWithCompetingVin(id,vin);
      }

    public string QuartersOf(object summary)
      {
      return db_vehicles.QuartersOf(summary);
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
      string purchase_price,
      bool be_active,
      string target_pm_mileage,
      DateTime dmv_inspection_due
      )
      {
      var effective_dmv_inspection_due = DateTime.MinValue;
      if (dmv_inspection_due != DateTime.MinValue)
        {
        effective_dmv_inspection_due = new DateTime(dmv_inspection_due.Year,dmv_inspection_due.Month,1).AddMonths(1).AddDays(-1);
        }
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
        purchase_price,
        be_active,
        target_pm_mileage,
        effective_dmv_inspection_due
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

    public string StatusOf(object summary)
      {
      return db_vehicles.StatusOf(summary);
      }

    public object Summary(string vehicle_id)
      {
      return db_vehicles.Summary(vehicle_id);
      }

    } // end TClass_biz_vehicles

  }
