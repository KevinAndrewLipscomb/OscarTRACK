// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_field_situations
  {
  public class TClass_db_field_situations: TClass_db
    {
    private class field_situation_summary
      {
      public string id;
      }

    private TClass_db_trail db_trail = null;

    public TClass_db_field_situations() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(case_num,'-'),'|',IFNULL(address,'-'),'|',IFNULL(assignment,'-'),'|',IFNULL(time_initialized,'-'),'|',IFNULL(nature,'-'),'|',IFNULL(impression_id,'-'),'|',IFNULL(be_etby,'-'))";
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from field_situation"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select field_situation.id as id"
        + " from field_situation",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(case_num,'-'),'|',IFNULL(address,'-'),'|',IFNULL(assignment,'-'),'|',IFNULL(time_initialized,'-'),'|',IFNULL(nature,'-'),'|',IFNULL(impression_id,'-'),'|',IFNULL(be_etby,'-')) USING utf8) as spec"
        + " FROM field_situation"
        + " order by spec",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from field_situation where id = \"" + id + "\""), connection).ExecuteNonQuery();
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

    internal void DigestCadRecords()
      {
      Open();
//select id
//, incident_date
//, incident_num
//, incident_address
//, reduced.call_sign
//, DATE_FORMAT(time_initialized,'%H:%i') as time_initialized
//, DATE_FORMAT(time_of_alarm,'%H:%i') as time_of_alarm
//, DATE_FORMAT(time_enroute,'%H:%i') as time_enroute
//, DATE_FORMAT(time_on_scene,'%H:%i') as time_onscene
//, DATE_FORMAT(time_transporting,'%H:%i') as time_transporting
//, DATE_FORMAT(time_at_hospital,'%H:%i') as time_at_hospital
//, nature
//from cad_record detail inner join
//  (
//  SELECT call_sign
//  , max(incident_num) as max_incident_num
//  FROM cad_record
//  where call_sign not in ('ARSN','EYES','FAST','FIGP','MISC')
//  group by call_sign
//  )
//  as reduced
//    on (reduced.call_sign=detail.call_sign and reduced.max_incident_num=detail.incident_num)
//where time_available is null
//order by incident_num desc, id desc
      Close();
      }

    public bool Get
      (
      string id,
      out string case_num,
      out string address,
      out string assignment,
      out DateTime time_initialized,
      out string nature,
      out string impression_id,
      out string num_ambulances,
      out string num_zone_cars,
      out string num_squad_trucks,
      out string num_supervisors,
      out bool be_emtals,
      out bool be_etby,
      out string num_holds,
      out string num_hzcs,
      out string num_lifeguards,
      out string num_mci_trucks,
      out bool be_mrt,
      out string num_mrtks,
      out bool be_pio,
      out bool be_pu,
      out bool be_rescue_area,
      out string num_rbs,
      out string num_sqs,
      out bool be_sqtm,
      out string num_tacs,
      out string num_bats,
      out string num_cars,
      out string num_engines,
      out string num_fboas,
      out string num_frsqs,
      out bool be_ftby,
      out string num_hazs,
      out string num_ladders,
      out bool be_mirt,
      out string num_safes,
      out bool be_stech,
      out string num_sups,
      out string num_tankers
      )
      {
      case_num = k.EMPTY;
      address = k.EMPTY;
      assignment = k.EMPTY;
      time_initialized = DateTime.MinValue;
      nature = k.EMPTY;
      impression_id = k.EMPTY;
      num_ambulances = k.EMPTY;
      num_zone_cars = k.EMPTY;
      num_squad_trucks = k.EMPTY;
      num_supervisors = k.EMPTY;
      be_emtals = false;
      be_etby = false;
      num_holds = k.EMPTY;
      num_hzcs = k.EMPTY;
      num_lifeguards = k.EMPTY;
      num_mci_trucks = k.EMPTY;
      be_mrt = false;
      num_mrtks = k.EMPTY;
      be_pio = false;
      be_pu = false;
      be_rescue_area = false;
      num_rbs = k.EMPTY;
      num_sqs = k.EMPTY;
      be_sqtm = false;
      num_tacs = k.EMPTY;
      num_bats = k.EMPTY;
      num_cars = k.EMPTY;
      num_engines = k.EMPTY;
      num_fboas = k.EMPTY;
      num_frsqs = k.EMPTY;
      be_ftby = false;
      num_hazs = k.EMPTY;
      num_ladders = k.EMPTY;
      be_mirt = false;
      num_safes = k.EMPTY;
      be_stech = false;
      num_sups = k.EMPTY;
      num_tankers = k.EMPTY;
      var result = false;
      //
      Open();
      var dr = new MySqlCommand("select * from field_situation where CAST(id AS CHAR) = \"" + id + "\"", connection).ExecuteReader();
      if (dr.Read())
        {
        case_num = dr["case_num"].ToString();
        address = dr["address"].ToString();
        assignment = dr["assignment"].ToString();
        time_initialized = DateTime.Parse(dr["time_initialized"].ToString());
        nature = dr["nature"].ToString();
        impression_id = dr["impression_id"].ToString();
        num_ambulances = dr["num_ambulances"].ToString();
        num_zone_cars = dr["num_zone_cars"].ToString();
        num_squad_trucks = dr["num_squad_trucks"].ToString();
        num_supervisors = dr["num_supervisors"].ToString();
        be_emtals = (dr["be_emtals"].ToString() == "1");
        be_etby = (dr["be_etby"].ToString() == "1");
        num_holds = dr["num_holds"].ToString();
        num_hzcs = dr["num_hzcs"].ToString();
        num_lifeguards = dr["num_lifeguards"].ToString();
        num_mci_trucks = dr["num_mci_trucks"].ToString();
        be_mrt = (dr["be_mrt"].ToString() == "1");
        num_mrtks = dr["num_mrtks"].ToString();
        be_pio = (dr["be_pio"].ToString() == "1");
        be_pu = (dr["be_pu"].ToString() == "1");
        be_rescue_area = (dr["be_rescue_area"].ToString() == "1");
        num_rbs = dr["num_rbs"].ToString();
        num_sqs = dr["num_sqs"].ToString();
        be_sqtm = (dr["be_sqtm"].ToString() == "1");
        num_tacs = dr["num_tacs"].ToString();
        num_bats = dr["num_bats"].ToString();
        num_cars = dr["num_cars"].ToString();
        num_engines = dr["num_engines"].ToString();
        num_fboas = dr["num_fboas"].ToString();
        num_frsqs = dr["num_frsqs"].ToString();
        be_ftby = (dr["be_ftby"].ToString() == "1");
        num_hazs = dr["num_hazs"].ToString();
        num_ladders = dr["num_ladders"].ToString();
        be_mirt = (dr["be_mirt"].ToString() == "1");
        num_safes = dr["num_safes"].ToString();
        be_stech = (dr["be_stech"].ToString() == "1");
        num_sups = dr["num_sups"].ToString();
        num_tankers = dr["num_tankers"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public void Set
      (
      string id,
      string case_num,
      string address,
      string assignment,
      DateTime time_initialized,
      string nature,
      string impression_id,
      string num_ambulances,
      string num_zone_cars,
      string num_squad_trucks,
      string num_supervisors,
      bool be_emtals,
      bool be_etby,
      string num_holds,
      string num_hzcs,
      string num_lifeguards,
      string num_mci_trucks,
      bool be_mrt,
      string num_mrtks,
      bool be_pio,
      bool be_pu,
      bool be_rescue_area,
      string num_rbs,
      string num_sqs,
      bool be_sqtm,
      string num_tacs,
      string num_bats,
      string num_cars,
      string num_engines,
      string num_fboas,
      string num_frsqs,
      bool be_ftby,
      string num_hazs,
      string num_ladders,
      bool be_mirt,
      string num_safes,
      bool be_stech,
      string num_sups,
      string num_tankers
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "case_num = NULLIF('" + case_num + "','')"
      + " , address = NULLIF('" + address + "','')"
      + " , assignment = NULLIF('" + assignment + "','')"
      + " , time_initialized = NULLIF('" + time_initialized.ToString() + "','')"
      + " , nature = NULLIF('" + nature + "','')"
      + " , impression_id = NULLIF('" + impression_id + "','')"
      + " , num_ambulances = NULLIF('" + num_ambulances + "','')"
      + " , num_zone_cars = NULLIF('" + num_zone_cars + "','')"
      + " , num_squad_trucks = NULLIF('" + num_squad_trucks + "','')"
      + " , num_supervisors = NULLIF('" + num_supervisors + "','')"
      + " , be_emtals = NULLIF('" + be_emtals.ToString() + "','')"
      + " , be_etby = NULLIF('" + be_etby.ToString() + "','')"
      + " , num_holds = NULLIF('" + num_holds + "','')"
      + " , num_hzcs = NULLIF('" + num_hzcs + "','')"
      + " , num_lifeguards = NULLIF('" + num_lifeguards + "','')"
      + " , num_mci_trucks = NULLIF('" + num_mci_trucks + "','')"
      + " , be_mrt = NULLIF('" + be_mrt.ToString() + "','')"
      + " , num_mrtks = NULLIF('" + num_mrtks + "','')"
      + " , be_pio = NULLIF('" + be_pio.ToString() + "','')"
      + " , be_pu = NULLIF('" + be_pu.ToString() + "','')"
      + " , be_rescue_area = NULLIF('" + be_rescue_area.ToString() + "','')"
      + " , num_rbs = NULLIF('" + num_rbs + "','')"
      + " , num_sqs = NULLIF('" + num_sqs + "','')"
      + " , be_sqtm = NULLIF('" + be_sqtm.ToString() + "','')"
      + " , num_tacs = NULLIF('" + num_tacs + "','')"
      + " , num_bats = NULLIF('" + num_bats + "','')"
      + " , num_cars = NULLIF('" + num_cars + "','')"
      + " , num_engines = NULLIF('" + num_engines + "','')"
      + " , num_fboas = NULLIF('" + num_fboas + "','')"
      + " , num_frsqs = NULLIF('" + num_frsqs + "','')"
      + " , be_ftby = NULLIF('" + be_ftby.ToString() + "','')"
      + " , num_hazs = NULLIF('" + num_hazs + "','')"
      + " , num_ladders = NULLIF('" + num_ladders + "','')"
      + " , be_mirt = NULLIF('" + be_mirt.ToString() + "','')"
      + " , num_safes = NULLIF('" + num_safes + "','')"
      + " , be_stech = NULLIF('" + be_stech.ToString() + "','')"
      + " , num_sups = NULLIF('" + num_sups + "','')"
      + " , num_tankers = NULLIF('" + num_tankers + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"field_situation",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause
        );
      }

    internal object Summary(string id)
      {
      Open();
      var dr =
        (
        new MySqlCommand
          (
          "SELECT *"
          + " FROM field_situation"
          + " where id = '" + id + "'",
          connection
          )
          .ExecuteReader()
        );
      dr.Read();
      var the_summary = new field_situation_summary()
        {
        id = id
        };
      Close();
      return the_summary;
      }

    } // end TClass_db_field_situations

  }
