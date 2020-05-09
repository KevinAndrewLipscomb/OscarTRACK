// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_vehicles
  {
  public class vehicle_summary
    {
    public string agency;
    public string bumper_number;
    public string chassis_make;
    public string chassis_model;
    public string custom_make;
    public string custom_model;
    public string dmv_inspection_due;
    public string fuel_description;
    public string id;
    public string kind;
    public string recent_mileage;
    public string miles_from_pm;
    public string model_year;
    public string name;
    public string quarters;
    public string status;
    public string tag;
    public string vin;
    public string recent_mileage_update_time;
    public bool be_four_or_all_wheel_drive;
    public string deployment_guidance;
    public bool can_receive_legacy_cot_fastener;
    }

  public class TClass_db_vehicles: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_vehicles() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal string ActiveNameWithCompetingLicensePlate
      (
      string id,
      string license_plate
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select IFNULL(name,'') from vehicle where be_active and license_plate = '" + license_plate + "' and id <> '" + id + "'",
        connection
        );
      var be_license_plate_collision_obj = my_sql_command.ExecuteScalar();
      Close();
      if (be_license_plate_collision_obj == null)
        {
        return k.EMPTY;
        }
      else
        {
        return be_license_plate_collision_obj.ToString();
        }
      }

    public string AgencyIdOfId(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select agency_id from vehicle where id = '" + id + "'",connection);
      var agency_id_of_id = my_sql_command.ExecuteScalar().ToString();
      Close();
      return agency_id_of_id;
      }

    public void AmbulanceFleetCondition
      (
      k.int_nonnegative num,
      k.decimal_nonnegative fraction
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select (count(vehicle.id) - count(time_went_down)) as num"
        + " , ((count(vehicle.id) - count(time_went_down))/count(vehicle.id)) as fraction"
        + " from vehicle"
        +   " join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)"
        +   " left join vehicle_usability_history on"
        +     " ("
        +       " vehicle_usability_history.vehicle_id=vehicle.id"
        +     " and"
        +       " vehicle_usability_history.time_came_up is null"
        +     " )"
        + " where be_active"
        +   " and (vehicle_kind.description = 'Ambulance')"
        ,
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      num.val = int.Parse(dr["num"].ToString());
      fraction.val = decimal.Parse(dr["fraction"].ToString());
      dr.Close();
      Close();
      }

    internal bool BeFourOrAllWheelDriveOf(object summary)
      {
      return (summary as vehicle_summary).be_four_or_all_wheel_drive;
      }

    internal bool BeNameActive(string name)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select count(*) from vehicle where name = '" + name + "' and be_active",connection);
      var be_name_active = ("0" != my_sql_command.ExecuteScalar().ToString());
      Close();
      return be_name_active;
      }

    public bool BeNotEarlierDmvInspectionDue
      (
      string id,
      DateTime proposed_date
      )
      {
      var be_not_earlier_dmv_inspection_due = true;
      if (proposed_date != DateTime.MinValue)
        {
        Open();
        using var my_sql_command = new MySqlCommand
          (
          "select dmv_inspection_due from vehicle where id = '" + id + "'",
          connection
          );
        var current_dmv_inspection_due = my_sql_command.ExecuteScalar();
        if (current_dmv_inspection_due != DBNull.Value)
          {
          be_not_earlier_dmv_inspection_due = (DateTime.Parse(current_dmv_inspection_due.ToString()) <= proposed_date);
          }
        Close();
        }
      return be_not_earlier_dmv_inspection_due;
      }

    public bool BeNotEarlierTargetPmMileage
      (
      string id,
      string proposed_mileage
      )
      {
      var be_not_earlier_target_pm_mileage = true;
      if (proposed_mileage != k.EMPTY)
        {
        Open();
        using var my_sql_command = new MySqlCommand
          (
          "select target_pm_mileage from vehicle where id = '" + id + "'",
          connection
          );
        var current_target_pm_mileage = my_sql_command.ExecuteScalar();
        if (current_target_pm_mileage != DBNull.Value)
          {
          be_not_earlier_target_pm_mileage = (uint.Parse(current_target_pm_mileage.ToString()) <= uint.Parse(proposed_mileage));
          }
        Close();
        }
      return be_not_earlier_target_pm_mileage;
      }

    public bool BeNotLessMileage
      (
      string id,
      string proposed_mileage
      )
      {
      var be_not_less_mileage = true;
      if (proposed_mileage != k.EMPTY)
        {
        Open();
        using var my_sql_command = new MySqlCommand
          (
          "select recent_mileage from vehicle where id = '" + id + "'",
          connection
          );
        var recent_mileage = my_sql_command.ExecuteScalar();
        if (recent_mileage != DBNull.Value)
          {
          be_not_less_mileage = (uint.Parse(recent_mileage.ToString()) <= uint.Parse(proposed_mileage));
          }
        Close();
        }
      return be_not_less_mileage;
      }

    internal bool BeDown(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select (time_came_up is null) as be_down from vehicle_usability_history where vehicle_id = '" + id + "' order by id desc limit 1",connection);
      var be_down_obj = my_sql_command.ExecuteScalar();
      Close();
      return ((be_down_obj != null) && (be_down_obj.ToString() == "1"));
      }

    public bool Bind(string partial_spec, object target)
      {
      bool result;
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) USING utf8) as spec"
        + " from vehicle"
        + " where concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        );
      dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      result = ((target) as ListControl).Items.Count > 0;
      return result;
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
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select vehicle.id as vehicle_id"
        + " , vehicle.name as vehicle_name"
        + " , IFNULL(deployment_guidance,'') as deployment_guidance"
        + " , count(gripe.vehicle_id) as num_gripes"
        + " , IF(vehicle_down_nature.id is null,'UP','DOWN') as status"
        + " , IF(vehicle_down_nature.id is null,-1,TIMESTAMPDIFF(MINUTE,time_went_down,NOW()) DIV 1440) as down_duration"
        + " , IFNULL(vehicle_quarters.medium_designator,'???') as quarters"
        + " , IFNULL(recent_mileage,'???') as last_known_mileage"
        + " , IFNULL(CAST(recent_mileage AS signed) - CAST(target_pm_mileage AS signed),'???') as miles_from_pm"
        + " , IFNULL(DATE_FORMAT(dmv_inspection_due,'%Y-%m-%d'),'???') as dmv_inspection_due"
        + " , IFNULL(model_year,'') as model_year"
        + " , chassis_make.name as chassis_make"
        + " , chassis_model.name as chassis_model"
        + " , IF(be_four_or_all_wheel_drive,'YES','no') as be_four_or_all_wheel_drive"
        + " , IFNULL(custom_make.name,'') as custom_make"
        + " , IFNULL(custom_model.name,'') as custom_model"
        + " , IFNULL(fuel.description,'') as fuel_description"
        + " , vehicle_kind.description as vehicle_kind"
        + " , agency.short_designator as agency"
        + " , IFNULL(bumper_number,'') as bumper_number"
        + " , IFNULL(license_plate,'') as tag"
        + " , IFNULL(vin,'') as vin"
        + " , IFNULL(DATE_FORMAT(recent_mileage_update_time,'%Y-%m-%d %H:%i'),'') as recent_mileage_update_time"
        + " , be_target_pm_mileage_meaningful"
        + " , be_dmv_inspection_due_meaningful"
        + " , IF(vehicle_kind.description = 'Ambulance',IF(can_receive_legacy_cot_fastener,'YES','no'),'') as can_receive_legacy_cot_fastener"
        + " from vehicle"
        +   " join agency on (agency.id=vehicle.agency_id)"
        +   " join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)"
        +   " join chassis_model on (chassis_model.id=vehicle.chassis_model_id)"
        +   " join chassis_make on (chassis_make.id=chassis_model.make_id)"
        +   " left join custom_model on (custom_model.id=vehicle.custom_model_id)"
        +   " left join custom_make on (custom_make.id=custom_model.make_id)"
        +   " left join fuel on (fuel.id=vehicle.fuel_id)"
        +   " left join vehicle_usability_history on"
        +     " ("
        +       " vehicle_usability_history.vehicle_id=vehicle.id"
        +     " and"
        +       " vehicle_usability_history.time_came_up is null"
        +     " )"
        +   " left join vehicle_down_nature on (vehicle_down_nature.id=vehicle_usability_history.nature_id)"
        +   " left join vehicle_quarters_history on"
        +     " ("
        +       " vehicle_quarters_history.vehicle_id=vehicle.id"
        +     " and"
        +       " vehicle_quarters_history.end_datetime is null"
        +     " )"
        +   " left join vehicle_quarters on (vehicle_quarters.id=vehicle_quarters_history.quarters_id)"
        +   " left join gripe on (gripe.vehicle_id=vehicle.id)"
        + " where vehicle.be_active"
        +     (agency_filter.Length > 0 ? " and agency_id = '" + agency_filter + "'" : k.EMPTY)
        +     (vehicle_kind_filter.Length > 0 ? " and kind_id = '" + vehicle_kind_filter + "'" : k.EMPTY)
        +     (be_four_or_all_wheel_drive_filter ? " and be_four_or_all_wheel_drive" : k.EMPTY)
        +     (quarters_filter.Length > 0 ? " and vehicle_quarters.id = '" + quarters_filter + "'" : k.EMPTY)
        +     (can_receive_legacy_cot_fastener_filter ? " and can_receive_legacy_cot_fastener" : k.EMPTY)
        + " group by vehicle.id"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      MySqlDataReader dr;
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) USING utf8) as spec"
        + " FROM vehicle"
        + " order by spec",
        connection
        );
      dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    internal void BindActiveKindAndNameDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      ((target) as ListControl).Items.Add(new ListItem("-- Unit --",k.EMPTY));
      using var my_sql_command = new MySqlCommand
        ("SELECT vehicle.id as vehicle_id, concat('Ambulance ',name) as spec FROM vehicle join vehicle_kind on (vehicle_kind.id=vehicle.kind_id) where be_active and description = 'Ambulance' order by name",connection)
        ;
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["vehicle_id"].ToString()));
        }
      dr.Close();
      Close();
      }

    internal void BindRankedUpAndCurrent(object target)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " SET @num_up_and_current = 0"
        + ";"
        + " SET @n = 0"
        + ";"
        + " SELECT NULL as `rank`"
        + " , concat(medium_designator,' - ',long_designator) as agency"
        + " , @num_vehicles_up_and_current :="
        +     " ("
        +     " select count(*)"
        +     " from vehicle"
        +       " join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)"
        +       " left join vehicle_usability_history on"
        +         " ("
        +           " vehicle_usability_history.vehicle_id=vehicle.id"
        +         " and"
        +           " vehicle_usability_history.time_came_up is null"
        +         " )"
        +       " left join vehicle_down_nature on (vehicle_down_nature.id=vehicle_usability_history.nature_id)"
        +     " where agency_id = v.agency_id"
        +       " and be_active"
        +       " and vehicle_down_nature.id is null"
        +       " and ((recent_mileage <= target_pm_mileage) or not be_target_pm_mileage_meaningful)"
        +       " and ((dmv_inspection_due >= CURDATE()) or not be_dmv_inspection_due_meaningful)"
        +     " )"
        +     " as num_vehicles_up_and_current"
        + " , @num_vehicles :="
        +     " ("
        +     " select count(*)"
        +     " from vehicle"
        +     " where agency_id = v.agency_id"
        +       " and be_active"
        +     " )"
        +     " as num_vehicles"
        + " , @num_vehicles_up_and_current/@num_vehicles as factor"
        + " from vehicle v"
        +   " join agency on (agency.id=v.agency_id)"
        + " group by agency_id"
        + " order by factor desc"
        + ";"
        + " COMMIT",
        connection
        );
      ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    internal string BumperNumberOf(object summary)
      {
      return (summary as vehicle_summary).bumper_number;
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
      var sql = "START TRANSACTION"
      + "; "
      + "update vehicle_quarters_history"
      + " set end_datetime = '" + effective_datetime.ToString("yyyy-MM-dd HH:mm") + "'"
      + " where vehicle_id = '" + vehicle_id + "'"
      +   " and end_datetime is null"
      + "; "
      + "insert vehicle_quarters_history"
      + " set vehicle_id = '" + vehicle_id + "'"
      + " , quarters_id = '" + quarters_id + "'"
      + " , start_datetime = '" + effective_datetime.ToString("yyyy-MM-dd HH:mm") + "'"
      + " , note = NULLIF('" + note + "','')"
      + "; ";
      if (mileage != k.EMPTY)
        {
        var this_minute = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
        sql += "update vehicle set recent_mileage = '" + mileage + "', recent_mileage_update_time = '" + this_minute + "' where id = '" + vehicle_id + "'; ";
        (summary as vehicle_summary).recent_mileage_update_time = this_minute;
        }
      sql += "COMMIT";
      Open();
      using var my_sql_command_1 = new MySqlCommand(db_trail.Saved(sql),connection);
      my_sql_command_1.ExecuteNonQuery();
      //
      using var my_sql_command_2 = new MySqlCommand("select medium_designator from vehicle_quarters where id = '" + quarters_id + "'",connection);
      (summary as vehicle_summary).quarters = my_sql_command_2.ExecuteScalar().ToString();
      //
      Close();
      }

    internal string ChassisMakeOf(object summary)
      {
      return (summary as vehicle_summary).chassis_make;
      }

    internal string ChassisModelOf(object summary)
      {
      return (summary as vehicle_summary).chassis_model;
      }

    internal string CustomMakeOf(object summary)
      {
      return (summary as vehicle_summary).custom_make;
      }

    internal string CustomModelOf(object summary)
      {
      return (summary as vehicle_summary).custom_model;
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from vehicle where id = \"" + id + "\""), connection);
        my_sql_command.ExecuteNonQuery();
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
      Close();
      return result;
      }

    internal string DmvInspectionDueOf(object summary)
      {
      return (summary as vehicle_summary).dmv_inspection_due;
      }

    internal string FuelOf(object summary)
      {
      return (summary as vehicle_summary).fuel_description;
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
      bool result;
      MySqlDataReader dr;
      //
      agency_id = k.EMPTY;
      name = k.EMPTY;
      kind_id = k.EMPTY;
      bumper_number = k.EMPTY;
      model_year = k.EMPTY;
      chassis_model_id = k.EMPTY;
      custom_model_id = k.EMPTY;
      vin = k.EMPTY;
      fuel_id = k.EMPTY;
      license_plate = k.EMPTY;
      purchase_price = k.EMPTY;
      recent_mileage = k.EMPTY;
      be_active = false;
      target_pm_mileage = k.EMPTY;
      dmv_inspection_due = DateTime.MinValue;
      recent_mileage_update_time = DateTime.MinValue;
      be_four_or_all_wheel_drive = false;
      deployment_guidance = k.EMPTY;
      can_receive_legacy_cot_fastener = false;
      result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand("select * from vehicle where CAST(id AS CHAR) = '" + id + "'", connection);
      dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        agency_id = dr["agency_id"].ToString();
        name = dr["name"].ToString();
        kind_id = dr["kind_id"].ToString();
        bumper_number = dr["bumper_number"].ToString();
        model_year = dr["model_year"].ToString();
        chassis_model_id = dr["chassis_model_id"].ToString();
        custom_model_id = dr["custom_model_id"].ToString();
        vin = dr["vin"].ToString();
        fuel_id = dr["fuel_id"].ToString();
        license_plate = dr["license_plate"].ToString();
        purchase_price = dr["purchase_price"].ToString();
        recent_mileage = dr["recent_mileage"].ToString();
        be_active = ("1" == dr["be_active"].ToString());
        target_pm_mileage = dr["target_pm_mileage"].ToString();
        if (dr["dmv_inspection_due"] != DBNull.Value)
          {
          dmv_inspection_due = DateTime.Parse(dr["dmv_inspection_due"].ToString());
          }
        else
          {
          dmv_inspection_due = DateTime.MinValue;
          }
        if (dr["recent_mileage_update_time"] != DBNull.Value)
          {
          recent_mileage_update_time = DateTime.Parse(dr["recent_mileage_update_time"].ToString());
          }
        else
          {
          recent_mileage_update_time = DateTime.MinValue;
          }
        be_four_or_all_wheel_drive = (dr["be_four_or_all_wheel_drive"].ToString() == "1");
        deployment_guidance = dr["deployment_guidance"].ToString();
        can_receive_legacy_cot_fastener = ("1" == dr["can_receive_legacy_cot_fastener"].ToString());
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string IdOf(object summary)
      {
      return (summary as vehicle_summary).id;
      }

    internal string KindOf(object summary)
      {
      return (summary as vehicle_summary).kind;
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
      var sql = "insert vehicle_usability_history"
      + " set vehicle_id = '" + vehicle_id + "'"
      + " , time_went_down = '" + time_went_down.ToString("yyyy-MM-dd HH:mm") + "'"
      + " , nature_id = '" + nature_id + "'"
      + " , mileage = NULLIF('" + mileage + "','')"
      + " , down_comment = NULLIF('" + down_comment + "','')";
      if (mileage != k.EMPTY)
        {
        var this_minute = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
        sql = "START TRANSACTION;"
        + sql
        + ";"
        + "update vehicle set recent_mileage = '" + mileage + "', recent_mileage_update_time = '" + this_minute + "' where id = '" + vehicle_id + "'"
        + ";"
        + " COMMIT";
        (summary as vehicle_summary).recent_mileage_update_time = this_minute;
        }
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved(sql),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      (summary as vehicle_summary).status = "DOWN";
      }

    public void MarkUp
      (
      string vehicle_id,
      DateTime time_came_up,
      string new_target_pm_mileage,
      string up_comment,
      object summary
      )
      {
      var sql = k.EMPTY
      + "update vehicle_usability_history"
      + " set time_came_up = '" + time_came_up.ToString("yyyy-MM-dd HH:mm") + "'"
      + " , up_comment = NULLIF('" + up_comment + "','')"
      + " where vehicle_id = '" + vehicle_id +"' and time_came_up is null";
      if (new_target_pm_mileage.Length > 0)
        {
        sql = k.EMPTY
        + "START TRANSACTION"
        + ";"
        + k.SPACE + sql
        + ";"
        + " update vehicle set target_pm_mileage = '" + new_target_pm_mileage + "' where id = '" + vehicle_id + "'"
        + ";"
        + " COMMIT";
        }
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved(sql),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      (summary as vehicle_summary).status = "UP";
      }

    internal string MilesFromPmOf(object summary)
      {
      return (summary as vehicle_summary).miles_from_pm;
      }

    internal string ModelYearOf(object summary)
      {
      return (summary as vehicle_summary).model_year;
      }

    public string NameOf(object summary)
      {
      return (summary as vehicle_summary).name;
      }

    public string NameOfId(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select name from vehicle where id = '" + id + "'",connection);
      var name_of_id = my_sql_command.ExecuteScalar().ToString();
      Close();
      return name_of_id;
      }

    internal string NameWithCompetingBumperNumber(string id, string bumper_number)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select IFNULL(name,'') from vehicle where bumper_number = '" + bumper_number + "' and id <> '" + id + "'",
        connection
        );
      var be_bumper_number_collision_obj = my_sql_command.ExecuteScalar();
      Close();
      if (be_bumper_number_collision_obj == null)
        {
        return k.EMPTY;
        }
      else
        {
        return be_bumper_number_collision_obj.ToString();
        }
      }

    internal string NameWithCompetingVin(string id, string vin)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select name from vehicle where vin = '" + vin + "' and id <> '" + id + "'",
        connection
        );
      var name_with_competing_vin_obj = my_sql_command.ExecuteScalar();
      Close();
      if (name_with_competing_vin_obj == null)
        {
        return k.EMPTY;
        }
      else
        {
        return name_with_competing_vin_obj.ToString();
        }
      }

    public string QuartersOf(object summary)
      {
      return (summary as vehicle_summary).quarters;
      }

    public string RecentMileageOf(object summary)
      {
      return (summary as vehicle_summary).recent_mileage;
      }

    public string RecentMileageUpdateTimeOf(object summary)
      {
      return (summary as vehicle_summary).recent_mileage_update_time;
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
      string deployment_guidance,
      bool can_receive_legacy_cot_fastener
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + " agency_id = NULLIF('" + agency_id + "','')"
      + " , name = NULLIF('" + name + "','')"
      + " , kind_id = NULLIF('" + kind_id + "','')"
      + " , bumper_number = NULLIF('" + bumper_number + "','')"
      + " , model_year = NULLIF('" + model_year + "','')"
      + " , chassis_model_id = NULLIF('" + chassis_model_id + "','')"
      + " , custom_model_id = NULLIF('" + custom_model_id + "','')"
      + " , vin = NULLIF('" + vin + "','')"
      + " , fuel_id = NULLIF('" + fuel_id + "','')"
      + " , license_plate = NULLIF('" + license_plate + "','')"
      + " , purchase_price = NULLIF('" + purchase_price + "','')"
      + " , be_active = " + be_active.ToString()
      + " , target_pm_mileage = NULLIF('" + target_pm_mileage + "','')"
      + " , dmv_inspection_due = NULLIF('" + dmv_inspection_due.ToString("yyyy-MM-dd") + "','0001-01-01')"
      + " , be_four_or_all_wheel_drive = " + be_four_or_all_wheel_drive.ToString()
      + " , deployment_guidance = NULLIF('" + deployment_guidance + "','')"
      + " , can_receive_legacy_cot_fastener = " + can_receive_legacy_cot_fastener.ToString()
      + k.EMPTY;
      var sql = k.EMPTY
      + "insert vehicle"
      + " set id = NULLIF('" + id + "','')"
      + " , " + childless_field_assignments_clause
      + " on duplicate key update "
      + childless_field_assignments_clause;
      if (be_mode_add)
        {
        sql = "START TRANSACTION;"
        + sql
        + ";"
        + " insert vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)"
        + " select vehicle.id as vehicle_id"
        + " , (select id from vehicle_quarters where medium_designator = 'EMS HQ') as quarters_id"
        + " , NOW() as start_datetime"
        + " from vehicle"
        + " where vehicle.name = '" + name + "'"
        + " and be_active = TRUE"
        + ";"
        + " COMMIT";
        }
      Open();
      using var my_sql_command = new MySqlCommand(db_trail.Saved(sql),connection);
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    public DateTime SetMileage
      (
      string id,
      string mileage
      )
      {
      Open();
      //
      using var my_sql_command_1 = new MySqlCommand("select IFNULL(DATE_FORMAT(recent_mileage_update_time,'%Y-%m-%d %H:%i'),'0001-01-01') from vehicle where id = '" + id + "'",connection);
      var set_mileage = DateTime.Parse((my_sql_command_1.ExecuteScalar().ToString()));
      //
      using var my_sql_command_2 = new MySqlCommand
        (
        db_trail.Saved("update vehicle set recent_mileage = '" + mileage + "', recent_mileage_update_time = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "' where id = '" + id + "'"),
        connection
        );
      my_sql_command_2.ExecuteNonQuery();
      //
      Close();
      return set_mileage;
      }

    public object Summary(string vehicle_id)
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select vehicle.name as vehicle_name"
        + " , IF(vehicle_down_nature.id is null,'UP','DOWN') as status"
        + " , IFNULL(vehicle_quarters.medium_designator,'???') as quarters"
        + " , IFNULL(CAST(recent_mileage AS signed) - CAST(target_pm_mileage AS signed),'???') as miles_from_pm"
        + " , IFNULL(recent_mileage,'') as recent_mileage"
        + " , IFNULL(DATE_FORMAT(dmv_inspection_due,'%Y-%m-%d'),'') as dmv_inspection_due"
        + " , IFNULL(model_year,'') as model_year"
        + " , chassis_make.name as chassis_make"
        + " , chassis_model.name as chassis_model"
        + " , IFNULL(custom_make.name,'') as custom_make"
        + " , IFNULL(custom_model.name,'') as custom_model"
        + " , IFNULL(fuel.description,'') as fuel_description"
        + " , vehicle_kind.description as vehicle_kind"
        + " , agency.short_designator as agency"
        + " , IFNULL(bumper_number,'') as bumper_number"
        + " , IFNULL(license_plate,'') as tag"
        + " , IFNULL(vin,'') as vin"
        + " , IFNULL(DATE_FORMAT(recent_mileage_update_time,'%Y-%m-%d %H:%i'),'') as recent_mileage_update_time"
        + " , be_four_or_all_wheel_drive"
        + " , IFNULL(deployment_guidance,'') as deployment_guidance"
        + " from vehicle"
        +   " join agency on (agency.id=vehicle.agency_id)"
        +   " join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)"
        +   " join chassis_model on (chassis_model.id=vehicle.chassis_model_id)"
        +   " join chassis_make on (chassis_make.id=chassis_model.make_id)"
        +   " left join custom_model on (custom_model.id=vehicle.custom_model_id)"
        +   " left join custom_make on (custom_make.id=custom_model.make_id)"
        +   " join fuel on (fuel.id=vehicle.fuel_id)"
        +   " left join vehicle_usability_history on"
        +     " ("
        +       " vehicle_usability_history.vehicle_id=vehicle.id"
        +     " and"
        +       " vehicle_usability_history.time_came_up is null"
        +     " )"
        +   " left join vehicle_down_nature on (vehicle_down_nature.id=vehicle_usability_history.nature_id)"
        +   " left join vehicle_quarters_history on"
        +     " ("
        +       " vehicle_quarters_history.vehicle_id=vehicle.id"
        +     " and"
        +       " vehicle_quarters_history.end_datetime is null"
        +     " )"
        +   " left join vehicle_quarters on (vehicle_quarters.id=vehicle_quarters_history.quarters_id)"
        + " where vehicle.id = '" + vehicle_id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      dr.Read();
      var the_summary = new vehicle_summary()
        {
        agency = dr["agency"].ToString(),
        bumper_number = dr["bumper_number"].ToString(),
        chassis_make = dr["chassis_make"].ToString(),
        chassis_model = dr["chassis_model"].ToString(),
        custom_make = dr["custom_make"].ToString(),
        custom_model = dr["custom_model"].ToString(),
        dmv_inspection_due = dr["dmv_inspection_due"].ToString(),
        fuel_description = dr["fuel_description"].ToString(),
        id = vehicle_id,
        kind = dr["vehicle_kind"].ToString(),
        recent_mileage = dr["recent_mileage"].ToString(),
        miles_from_pm = dr["miles_from_pm"].ToString(),
        model_year = dr["model_year"].ToString(),
        name = dr["vehicle_name"].ToString(),
        quarters = dr["quarters"].ToString(),
        status = dr["status"].ToString(),
        tag = dr["tag"].ToString(),
        vin = dr["vin"].ToString(),
        recent_mileage_update_time = dr["recent_mileage_update_time"].ToString(),
        be_four_or_all_wheel_drive = (dr["be_four_or_all_wheel_drive"].ToString() == "1"),
        deployment_guidance = dr["deployment_guidance"].ToString()
        };
      Close();
      return the_summary;
      }

    public string StatusOf(object summary)
      {
      return (summary as vehicle_summary).status;
      }

    internal string TagOf(object summary)
      {
      return (summary as vehicle_summary).tag;
      }

    internal string VinOf(object summary)
      {
      return (summary as vehicle_summary).vin;
      }

    } // end TClass_db_vehicles

  }
