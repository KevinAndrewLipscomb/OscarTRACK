// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

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
    }

  public class TClass_db_vehicles: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_vehicles() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public string AgencyIdOfId(string id)
      {
      Open();
      var agency_id_of_id = new MySqlCommand("select agency_id from vehicle where id = '" + id + "'",connection).ExecuteScalar().ToString();
      Close();
      return agency_id_of_id;
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
        var current_dmv_inspection_due = new MySqlCommand
          (
          "select dmv_inspection_due from vehicle where id = '" + id + "'",
          connection
          )
          .ExecuteScalar();
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
        var current_target_pm_mileage = new MySqlCommand
          (
          "select target_pm_mileage from vehicle where id = '" + id + "'",
          connection
          )
          .ExecuteScalar();
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
        var recent_mileage = new MySqlCommand
          (
          "select recent_mileage from vehicle where id = '" + id + "'",
          connection
          )
          .ExecuteScalar();
        if (recent_mileage != DBNull.Value)
          {
          be_not_less_mileage = (uint.Parse(recent_mileage.ToString()) <= uint.Parse(proposed_mileage));
          }
        Close();
        }
      return be_not_less_mileage;
      }

    public bool Bind(string partial_spec, object target)
      {
      bool result;
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) USING utf8) as spec"
        + " from vehicle"
        + " where concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) like '%" + partial_spec.ToUpper() + "%'"
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
      string quarters_filter
      )
      {
      if (be_sort_order_ascending)
        {
        sort_order = sort_order.Replace("%", " asc");
        }
      else
        {
        sort_order = sort_order.Replace("%", " desc");
        }
      var filter = " where vehicle.be_active ";
      if (agency_filter != k.EMPTY)
        {
        filter += " and agency_id = '" + agency_filter + "'" + k.SPACE;
        }
      if (vehicle_kind_filter != k.EMPTY)
        {
        filter += " and kind_id = '" + vehicle_kind_filter + "'" + k.SPACE;
        }
      if (quarters_filter != k.EMPTY)
        {
        filter += " and vehicle_quarters.id = '" + quarters_filter + "'" + k.SPACE;
        }
      Open();
      (target as BaseDataList).DataSource = 
        (
        new MySqlCommand
          (
          "select vehicle.id as vehicle_id"
          + " , vehicle.name as vehicle_name"
          + " , IF(vehicle_down_nature.id is null,'UP','DOWN') as status"
          + " , IFNULL(vehicle_quarters.medium_designator,'???') as quarters"
          + " , IFNULL(recent_mileage,'???') as last_known_mileage"
          + " , IFNULL(CAST(recent_mileage - target_pm_mileage AS signed),'???') as miles_from_pm"
          + " , IFNULL(DATE_FORMAT(dmv_inspection_due,'%Y-%m-%d'),'???') as dmv_inspection_due"
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
          + filter
          + " order by " + sort_order,
          connection
          )
        .ExecuteReader()
        );
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      MySqlDataReader dr;
      this.Open();
      ((target) as ListControl).Items.Clear();
      dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(name,'-'),'|',IFNULL(bumper_number,'-'),'|',IFNULL(model_year,'-'),'|',IFNULL(vin,'-'),'|',IFNULL(license_plate,'-')) USING utf8) as spec"
        + " FROM vehicle"
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
        new MySqlCommand(db_trail.Saved("delete from vehicle where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
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
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from vehicle where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
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
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    public void AmbulanceFleetCondition
      (
      k.int_nonnegative num,
      k.decimal_nonnegative fraction
      )
      {
      Open();
      var dr = new MySqlCommand
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
        )
        .ExecuteReader();
      dr.Read();
      num.val = int.Parse(dr["num"].ToString());
      fraction.val = decimal.Parse(dr["fraction"].ToString());
      dr.Close();
      Close();
      }

    public string IdOf(object summary)
      {
      return (summary as vehicle_summary).id;
      }

    public string NameOf(object summary)
      {
      return (summary as vehicle_summary).name;
      }

    public string NameOfId(string id)
      {
      Open();
      var name_of_id = new MySqlCommand("select name from vehicle where id = '" + id + "'",connection).ExecuteScalar().ToString();
      Close();
      return name_of_id;
      }

    public string RecentMileageOf(object summary)
      {
      return (summary as vehicle_summary).recent_mileage;
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
      string recent_mileage,
      bool be_active,
      string target_pm_mileage,
      DateTime dmv_inspection_due
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
      + " , recent_mileage = NULLIF('" + recent_mileage + "','')"
      + " , be_active = " + be_active.ToString()
      + " , target_pm_mileage = NULLIF('" + target_pm_mileage + "','')"
      + " , dmv_inspection_due = NULLIF(LAST_DAY('" + dmv_inspection_due.ToString("yyyy-MM-dd") + "'),'')"
      + k.EMPTY;
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert vehicle"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    public void SetMileage
      (
      string id,
      string mileage
      )
      {
      Open();
      new MySqlCommand
        (
        db_trail.Saved("update vehicle set recent_mileage = '" + mileage + "' where id = '" + id + "'"),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    public object Summary(string vehicle_id)
      {
      Open();
      var dr =
        (
        new MySqlCommand
          (
          "select vehicle.name as vehicle_name"
          + " , IF(vehicle_down_nature.id is null,'UP','DOWN') as status"
          + " , IFNULL('?','') as quarters"
          + " , IFNULL('?','') as miles_from_pm"
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
          + " where vehicle.id = '" + vehicle_id + "'",
          connection
          )
          .ExecuteReader()
        );
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
        vin = dr["vin"].ToString()
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_vehicles

  }
