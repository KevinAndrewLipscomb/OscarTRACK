// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_gripes;
using Class_biz_members;
using Class_biz_notifications;
using Class_biz_roles;
using Class_biz_user;
using Class_db_agencies;
using Class_db_vehicle_kinds;
using Class_db_vehicles;
using kix;
using System;
using System.Configuration;

namespace Class_biz_vehicles
  {
  public class TClass_biz_vehicles
    {
    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_gripes biz_gripes = null;
    private readonly TClass_biz_notifications biz_notifications = null;
    private readonly TClass_biz_roles biz_roles = null;
    private readonly TClass_biz_user biz_user = null;
    private readonly TClass_db_agencies db_agencies = null;
    private readonly TClass_db_vehicles db_vehicles = null;
    private readonly TClass_db_vehicle_kinds db_vehicle_kinds = null;

    public TClass_biz_vehicles() : base()
      {
      biz_members = new TClass_biz_members();
      biz_gripes = new TClass_biz_gripes();
      biz_notifications = new TClass_biz_notifications();
      biz_roles = new TClass_biz_roles();
      biz_user = new TClass_biz_user();
      db_agencies = new TClass_db_agencies();
      db_vehicles = new TClass_db_vehicles();
      db_vehicle_kinds = new TClass_db_vehicle_kinds();
      }

    internal string ActiveNameWithCompetingLicensePlate
      (
      string id,
      string license_plate
      )
      {
      return db_vehicles.ActiveNameWithCompetingLicensePlate(id,license_plate);
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

    internal bool BeDown(string id)
      {
      return db_vehicles.BeDown(id);
      }

    internal bool BeFourOrAllWheelDriveOf(object summary)
      {
      return db_vehicles.BeFourOrAllWheelDriveOf(summary);
      }

    internal bool BeGoodCombinationKindTargetPmMileage
      (
      string kind_id,
      string target_pm_mileage
      )
      {
      return !(db_vehicle_kinds.BeTargetPmMileageMeaningful(kind_id) && (target_pm_mileage.Length == 0));
      }

    internal bool BeNameActive(string name)
      {
      return db_vehicles.BeNameActive(name);
      }

    public bool BeNotEarlierDmvInspectionDue
      (
      string id,
      DateTime proposed_date
      )
      {
      var agency_id_of_id = int.Parse(db_vehicles.AgencyIdOfId(id));
      return !(((agency_id_of_id > 0) && (agency_id_of_id < 200)) || (agency_id_of_id == 203))
        || db_vehicles.BeNotEarlierDmvInspectionDue(id,proposed_date);
      }

    public bool BeNotEarlierTargetPmMileage
      (
      string id,
      string proposed_mileage
      )
      {
      var agency_id_of_id = int.Parse(db_vehicles.AgencyIdOfId(id));
      return !(((agency_id_of_id > 0) && (agency_id_of_id < 200)) || (agency_id_of_id == 203))
        || db_vehicles.BeNotEarlierTargetPmMileage(id,proposed_mileage);
      }

    public bool BeNotLessMileage
      (
      string id,
      string proposed_mileage
      )
      {
      return db_vehicles.BeNotLessMileage(id,proposed_mileage);
      }

    internal bool BeOkToDefaultAgencyFilterToAll
      (
      bool be_ok_to_see_all_squads,
      string[] roles
      )
      {
      return be_ok_to_see_all_squads && (int.Parse(biz_roles.TierOfName(roles[0])) == 1);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicles.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string vehicle_kind_filter,
      bool be_four_or_all_wheel_drive_filter,
      string quarters_filter,
      bool can_receive_legacy_cot_fastener_filter
      )
      {
      db_vehicles.BindBaseDataList(sort_order, be_sort_order_ascending, target, agency_filter, vehicle_kind_filter, be_four_or_all_wheel_drive_filter,quarters_filter,can_receive_legacy_cot_fastener_filter);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicles.BindDirectToListControl(target);
      }

    internal void BindActiveKindAndNameDirectToListControl(object target)
      {
      db_vehicles.BindActiveKindAndNameDirectToListControl(target);
      }

    internal void BindRankedUpAndCurrent(object target)
      {
      db_vehicles.BindRankedUpAndCurrent(target);
      }

    internal string BumperNumberOf(object summary)
      {
      return db_vehicles.BumperNumberOf(summary);
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

    internal string ChassisMakeOf(object summary)
      {
      return db_vehicles.ChassisMakeOf(summary);
      }

    internal string ChassisModelOf(object summary)
      {
      return db_vehicles.ChassisModelOf(summary);
      }

    internal string CustomMakeOf(object summary)
      {
      return db_vehicles.CustomMakeOf(summary);
      }

    internal string CustomModelOf(object summary)
      {
      return db_vehicles.CustomModelOf(summary);
      }

    public bool Delete(string id)
      {
      return db_vehicles.Delete(id);
      }

    internal string DmvInspectionDueOf(object summary)
      {
      return db_vehicles.DmvInspectionDueOf(summary);
      }

    internal string FuelOf(object summary)
      {
      return db_vehicles.FuelOf(summary);
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
      out DateTime dmv_inspection_due,
      out DateTime recent_mileage_update_time,
      out bool be_four_or_all_wheel_drive,
      out string deployment_guidance,
      out bool can_receive_legacy_cot_fastener
      )
      {
      var result = db_vehicles.Get
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
        out dmv_inspection_due,
        out recent_mileage_update_time,
        out be_four_or_all_wheel_drive,
        out deployment_guidance,
        out can_receive_legacy_cot_fastener
        );
      if (target_pm_mileage == 0xFFFFFFFF.ToString("d")) // max MySQL int value
        {
        target_pm_mileage = k.EMPTY;
        }
      return result;
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
        biz_members.UserAttributionIndicator() + down_comment,
        summary
        );
      db_agencies.IncrementFleetTrackingOpsTally(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum())));
      biz_notifications.IssueForVehicleMarkedDown(vehicle_id,time_went_down,nature_id,mileage,down_comment);
      if (!biz_gripes.BeVehicleLogEmpty(vehicle_id))
        {
        biz_notifications.IssueGripeSheetReview(vehicle_id,biz_gripes.VehicleLog(vehicle_id));
        }
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

    internal string KindOf(object summary)
      {
      return db_vehicles.KindOf(summary);
      }

    public void MarkUp
      (
      string vehicle_id,
      DateTime time_came_up,
      string new_target_pm_mileage,
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
        new_target_pm_mileage,
        biz_members.UserAttributionIndicator() + up_comment,
        summary
        );
      db_agencies.IncrementFleetTrackingOpsTally(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum())));
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

    internal string MilesFromPmOf(object summary)
      {
      return db_vehicles.MilesFromPmOf(summary);
      }

    internal string ModelYearOf(object summary)
      {
      return db_vehicles.ModelYearOf(summary);
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

    public string RecentMileageUpdateTimeOf(object summary)
      {
      return db_vehicles.RecentMileageUpdateTimeOf(summary);
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
      DateTime dmv_inspection_due,
      bool be_four_or_all_wheel_drive,
      bool be_mode_add,
      string saved_kind_id,
      string deployment_guidance,
      string saved_deployment_guidance,
      bool can_receive_legacy_cot_fastener
      )
      {
      var agency_id_int = new k.int_nonnegative(val:int.Parse(agency_id));
      var effective_dmv_inspection_due = DateTime.MinValue;
      if(
          (
            (agency_id_int.val > 0)
          &&
            (agency_id_int.val < 200)
          )
        ||
          (agency_id_int.val == 203) // MRT
        )
      //then
        {
        if (dmv_inspection_due != DateTime.MinValue)
          {
          effective_dmv_inspection_due = new DateTime(dmv_inspection_due.Year,dmv_inspection_due.Month,1).AddMonths(1).AddDays(-1);
          }
        }
      else
        {
        target_pm_mileage = 0xFFFFFFFF.ToString("d");
        effective_dmv_inspection_due = DateTime.MaxValue; // max MySQL date
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
        effective_dmv_inspection_due,
        be_four_or_all_wheel_drive,
        be_mode_add,
        deployment_guidance,
        can_receive_legacy_cot_fastener
        );
      if (saved_kind_id.Length == 0)
        {
        biz_notifications.IssueForNewVehicle(agency_id,name,kind_id,bumper_number,model_year,chassis_model_id,custom_model_id,vin,fuel_id,license_plate,purchase_price,target_pm_mileage,dmv_inspection_due,be_four_or_all_wheel_drive);
        }
      else if (kind_id != saved_kind_id)
        {
        biz_notifications.IssueForVehicleKindChanged(id,saved_kind_id,kind_id);
        }
      if ((id.Length > 0) && (deployment_guidance != saved_deployment_guidance))
        {
        biz_notifications.IssueForVehicleDeploymentGuidanceChanged(id,saved_deployment_guidance,deployment_guidance);
        }
      }

    public void SetMileage
      (
      string id,
      string mileage
      )
      {
      var prior_mileage_update_time = db_vehicles.SetMileage(id,mileage);
      if (DateTime.Now - prior_mileage_update_time > new TimeSpan(12,0,0))
        {
        db_agencies.IncrementFleetTrackingOpsTally(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum())));
        }
      }

    public string StatusOf(object summary)
      {
      return db_vehicles.StatusOf(summary);
      }

    public object Summary(string vehicle_id)
      {
      return db_vehicles.Summary(vehicle_id);
      }

    internal string TagOf(object summary)
      {
      return db_vehicles.TagOf(summary);
      }

    internal string VinOf(object summary)
      {
      return db_vehicles.VinOf(summary);
      }

    } // end TClass_biz_vehicles

  }
