// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Class_db_field_situations
  {
  public class TClass_db_field_situations: TClass_db
    {
    internal class digest
      {
      internal string case_num;
      internal string address;
      internal string assignment;
      internal string time_initialized;
      internal string num_ambulances;
      internal string num_zone_cars;
      internal string num_squad_trucks;
      internal string num_supervisors;
      internal string num_holds;
      internal string num_hzcs;
      internal string num_lifeguards;
      internal string num_mci_trucks;
      internal string num_mrtks;
      internal string num_rbs;
      internal string num_sqs;
      internal string num_tacs;
      internal string num_bats;
      internal string num_cars;
      internal string num_engines;
      internal string num_fboas;
      internal string num_frsqs;
      internal string num_hazs;
      internal string num_ladders;
      internal string num_safes;
      internal string num_sups;
      internal string num_tankers;
      internal string be_emtals;
      internal string be_etby;
      internal string be_mrt;
      internal string be_pio;
      internal string be_pu;
      internal string be_rescue_area;
      internal string be_sqtm;
      internal string be_ftby;
      internal string be_mirt;
      internal string be_stech;
      }

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

    internal void DeleteAnyStillStale()
      {
      Open();
      new MySqlCommand("delete from field_situation where be_stale",connection).ExecuteNonQuery();
      Close();
      }

    internal Queue<digest> DigestQ()
      {
      var digest_q = new Queue<digest>();
      //
      var dr = new MySqlCommand
        (
        "select incident_num as case_num"
        + " , incident_address as address"
        + " , GROUP_CONCAT(call_sign order by list_order,call_sign) as assignment"
        + " , TIMESTAMP(incident_date,time_initialized) as time_initialized"
        + " , sum(call_sign REGEXP '^[[:digit:]]+[[:upper:]]+') as num_ambulances"
        + " , sum(call_sign REGEXP '^Z[[:digit:]]+') as num_zone_cars"
        + " , sum(call_sign REGEXP '^SQ[[:digit:]]+P?') as num_squad_trucks"
        + " , sum(call_sign REGEXP '^EMS[[:digit:]]+') as num_supervisors"
        + " , sum(call_sign REGEXP '^HOLD[[:digit:]]+') as num_holds"
        + " , sum(call_sign REGEXP '^HZC[[:digit:]]+') as num_hzcs"
        + " , sum(call_sign REGEXP '^LG[[:alnum:]]+') as num_lifeguards"
        + " , sum(call_sign REGEXP '^MCI[[:digit:]]+') as num_mci_trucks"
        + " , sum(call_sign REGEXP '^MRTK[[:digit:]]+') as num_mrtks"
        + " , sum(call_sign REGEXP '^RB[[:digit:]]+') as num_rbs"
        + " , sum(call_sign REGEXP '^SQ[[:digit:]]+P?') as num_sqs"
        + " , sum(call_sign REGEXP '^TAC[[:digit:]]+') as num_tacs"
        + " , sum(call_sign REGEXP '^BAT[[:digit:]]+') as num_bats"
        + " , sum(call_sign REGEXP '^CAR[[:digit:]]*') as num_cars"
        + " , sum(call_sign REGEXP '^N?E[[:digit:]]+P?') as num_engines"
        + " , sum(call_sign REGEXP '^FBOA[[:digit:]]+') as num_fboas"
        + " , sum(call_sign REGEXP '^FRSQ[[:digit:]]+P?') as num_frsqs"
        + " , sum(call_sign REGEXP '^HAZ[[:digit:]]+P?') as num_hazs"
        + " , sum(call_sign REGEXP '^L[[:digit:]]+P?') as num_ladders"
        + " , sum(call_sign REGEXP '^SAFE[[:digit:]]+') as num_safes"
        + " , sum(call_sign REGEXP '^SUP[[:digit:]]+') as num_sups"
        + " , sum(call_sign REGEXP '^T[[:digit:]]+P?') as num_tankers"
        + " , sum(call_sign = 'EMTALS') as be_emtals"
        + " , sum(call_sign = 'ETBY') as be_etby"
        + " , sum(call_sign = 'MRT') as be_mrt"
        + " , sum(call_sign = 'PIO') as be_pio"
        + " , sum(call_sign = 'PU') as be_pu"
        + " , sum(call_sign REGEXP '^R[[:digit:]]+') as be_rescue_area"
        + " , sum(call_sign = 'SQTM') as be_sqtm"
        + " , sum(call_sign = 'FTBY') as be_ftby"
        + " , sum(call_sign = 'MIRT') as be_mirt"
        + " , sum(call_sign = 'STECH') as be_stech"
        + " from"
        +   " ("
        +   " select incident_date"
        +   " , incident_num"
        +   " , incident_address"
        +   " , reduced.call_sign as call_sign"
        +   " , IF(reduced.call_sign in ('EMTALS','ETBY','FTBY','MIRT','MRT','SQTM'),0," // especially informative indicators
        +   "      IF(reduced.call_sign REGEXP 'R[[:digit:]]+',10," // rescue area
        +   "         IF(reduced.call_sign REGEXP 'TAC[[:digit:]]+',20," // tactical channel
        +   "            IF(reduced.call_sign REGEXP 'E[[:digit:]]+P?',30," // engine
        +   "               IF(reduced.call_sign REGEXP 'NE[[:digit:]]+P?',40," // navy engine
        +   "            IF(reduced.call_sign REGEXP 'L[[:digit:]]+P?',50," // ladder
        +   "                     IF(reduced.call_sign REGEXP 'FRSQ[[:digit:]]+P?',60," // fire squad
        +   "                        IF(reduced.call_sign REGEXP 'T[[:digit:]]+P?',70," // tanker
        +   "                           IF(reduced.call_sign REGEXP 'HAZ[[:digit:]]+P?',80," // hazmat truck
        +   "                              IF(reduced.call_sign REGEXP 'BTRK[[:digit:]]+',90," // brush truck
        +   "                                 IF(reduced.call_sign REGEXP 'SQ[[:digit:]]+P?',100," // squad truck
        +   "                                    IF(reduced.call_sign REGEXP '[[:digit:]]+[[:upper:]]+',110," // ambulance
        +   "                                       IF(reduced.call_sign REGEXP 'NR[[:digit:]]+.*',120," // navy rescue
        +   "                                          IF(reduced.call_sign REGEXP 'HOLD[[:digit:]]+',130," // holding for ambulance
        +   "                                             IF(reduced.call_sign REGEXP 'Z[[:digit:]]+',140," // zone car
        +   "                                                IF(reduced.call_sign REGEXP 'HZC[[:digit:]]+',150," // holding for zone car
        +   "                                                   IF(reduced.call_sign REGEXP 'EMS[[:digit:]]+',160," // EMS supervisor or chief
        +   "                                                      IF(reduced.call_sign REGEXP 'BRIG[[:digit:]]+',170," // brigade chief
        +   "                                                         IF(reduced.call_sign REGEXP 'BAT[[:digit:]]+',180," // battalion chief
        +   "                                                            IF(reduced.call_sign REGEXP 'CAR[[:digit:]]*',190," // fire >=div chief
        +   "                                                               200" // anybody else, alphabetically
        +   "                                                               )"
        +   "                                                            )"
        +   "                                                         )"
        +   "                                                      )"
        +   "                                                   )"
        +   "                                                )"
        +   "                                             )"
        +   "                                          )"
        +   "                                       )"
        +   "                                    )"
        +   "                                 )"
        +   "                              )"
        +   "                           )"
        +   "                        )"
        +   "                     )"
        +   "                  )"
        +   "               )"
        +   "            )"
        +   "         )"
        +   "      ) as list_order"
        +   " , DATE_FORMAT(time_initialized,'%H:%i') as time_initialized"
        +   " , DATE_FORMAT(time_of_alarm,'%H:%i') as time_of_alarm"
        +   " , DATE_FORMAT(time_enroute,'%H:%i') as time_enroute"
        +   " , DATE_FORMAT(time_on_scene,'%H:%i') as time_onscene"
        +   " , DATE_FORMAT(time_transporting,'%H:%i') as time_transporting"
        +   " , DATE_FORMAT(time_at_hospital,'%H:%i') as time_at_hospital"
        +   " from cad_record detail inner join"
        +   "   ("
        +   "   SELECT call_sign"
        +   "   , max(incident_num) as max_incident_num"
        +   "   FROM cad_record"
        +   "   where call_sign not in ('ARSN','EYES','FAST','FIGP','MISC')"
        +   "   group by call_sign"
        +   "   )"
        +   "   as reduced"
        +   "     on (reduced.call_sign=detail.call_sign and reduced.max_incident_num=detail.incident_num)"
        +   " where time_available is null"
        +   " )"
        +   " as active_case_assignment"
        + " group by incident_num"
        + " order by incident_num desc"
        ,
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        digest_q.Enqueue
          (
          new digest
            {
            case_num = dr["case_num"].ToString(),
            address = dr["address"].ToString(),
            assignment = dr["assignment"].ToString(),
            time_initialized = dr["time_initialized"].ToString(),
            num_ambulances = dr["num_ambulances"].ToString(),
            num_zone_cars = dr["num_zone_cars"].ToString(),
            num_squad_trucks = dr["num_squad_trucks"].ToString(),
            num_supervisors = dr["num_supervisors"].ToString(),
            num_holds = dr["num_holds"].ToString(),
            num_hzcs = dr["num_hzcs"].ToString(),
            num_lifeguards = dr["num_lifeguards"].ToString(),
            num_mci_trucks = dr["num_mci_trucks"].ToString(),
            num_mrtks = dr["num_mrtks"].ToString(),
            num_rbs = dr["num_rbs"].ToString(),
            num_sqs = dr["num_sqs"].ToString(),
            num_tacs = dr["num_tacs"].ToString(),
            num_bats = dr["num_bats"].ToString(),
            num_cars = dr["num_cars"].ToString(),
            num_engines = dr["num_engines"].ToString(),
            num_fboas = dr["num_fboas"].ToString(),
            num_frsqs = dr["num_frsqs"].ToString(),
            num_hazs = dr["num_hazs"].ToString(),
            num_ladders = dr["num_ladders"].ToString(),
            num_safes = dr["num_safes"].ToString(),
            num_sups = dr["num_sups"].ToString(),
            num_tankers = dr["num_tankers"].ToString(),
            be_emtals = dr["be_emtals"].ToString(),
            be_etby = dr["be_etby"].ToString(),
            be_mrt = dr["be_mrt"].ToString(),
            be_pio = dr["be_pio"].ToString(),
            be_pu = dr["be_pu"].ToString(),
            be_rescue_area = dr["be_rescue_area"].ToString(),
            be_sqtm = dr["be_sqtm"].ToString(),
            be_ftby = dr["be_ftby"].ToString(),
            be_mirt = dr["be_mirt"].ToString(),
            be_stech = dr["be_stech"].ToString(),
            }
          );
        }
      return digest_q;
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

    internal void MarkAllStale()
      {
      Open();
      new MySqlCommand("update field_situation set be_stale = TRUE",connection).ExecuteNonQuery();
      Close();
      }

    public void Set
      (
      string id,
      string case_num,
      string address,
      string assignment,
      string time_initialized,
      string nature,
      string impression_id,
      string num_ambulances,
      string num_zone_cars,
      string num_squad_trucks,
      string num_supervisors,
      string be_emtals,
      string be_etby,
      string num_holds,
      string num_hzcs,
      string num_lifeguards,
      string num_mci_trucks,
      string be_mrt,
      string num_mrtks,
      string be_pio,
      string be_pu,
      string be_rescue_area,
      string num_rbs,
      string num_sqs,
      string be_sqtm,
      string num_tacs,
      string num_bats,
      string num_cars,
      string num_engines,
      string num_fboas,
      string num_frsqs,
      string be_ftby,
      string num_hazs,
      string num_ladders,
      string be_mirt,
      string num_safes,
      string be_stech,
      string num_sups,
      string num_tankers
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "be_stale = FALSE"
      + " , case_num = NULLIF('" + case_num + "','')"
      + " , address = NULLIF('" + address + "','')"
      + " , assignment = NULLIF('" + assignment + "','')"
      + " , time_initialized = NULLIF('" + time_initialized + "','')"
      + " , nature = NULLIF('" + nature + "','')"
      + " , impression_id = NULLIF('" + impression_id + "','')"
      + " , num_ambulances = NULLIF('" + num_ambulances + "','')"
      + " , num_zone_cars = NULLIF('" + num_zone_cars + "','')"
      + " , num_squad_trucks = NULLIF('" + num_squad_trucks + "','')"
      + " , num_supervisors = NULLIF('" + num_supervisors + "','')"
      + " , be_emtals = NULLIF('" + be_emtals + "','')"
      + " , be_etby = NULLIF('" + be_etby + "','')"
      + " , num_holds = NULLIF('" + num_holds + "','')"
      + " , num_hzcs = NULLIF('" + num_hzcs + "','')"
      + " , num_lifeguards = NULLIF('" + num_lifeguards + "','')"
      + " , num_mci_trucks = NULLIF('" + num_mci_trucks + "','')"
      + " , be_mrt = NULLIF('" + be_mrt + "','')"
      + " , num_mrtks = NULLIF('" + num_mrtks + "','')"
      + " , be_pio = NULLIF('" + be_pio + "','')"
      + " , be_pu = NULLIF('" + be_pu + "','')"
      + " , be_rescue_area = NULLIF('" + be_rescue_area + "','')"
      + " , num_rbs = NULLIF('" + num_rbs + "','')"
      + " , num_sqs = NULLIF('" + num_sqs + "','')"
      + " , be_sqtm = NULLIF('" + be_sqtm + "','')"
      + " , num_tacs = NULLIF('" + num_tacs + "','')"
      + " , num_bats = NULLIF('" + num_bats + "','')"
      + " , num_cars = NULLIF('" + num_cars + "','')"
      + " , num_engines = NULLIF('" + num_engines + "','')"
      + " , num_fboas = NULLIF('" + num_fboas + "','')"
      + " , num_frsqs = NULLIF('" + num_frsqs + "','')"
      + " , be_ftby = NULLIF('" + be_ftby + "','')"
      + " , num_hazs = NULLIF('" + num_hazs + "','')"
      + " , num_ladders = NULLIF('" + num_ladders + "','')"
      + " , be_mirt = NULLIF('" + be_mirt + "','')"
      + " , num_safes = NULLIF('" + num_safes + "','')"
      + " , be_stech = NULLIF('" + be_stech + "','')"
      + " , num_sups = NULLIF('" + num_sups + "','')"
      + " , num_tankers = NULLIF('" + num_tankers + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"field_situation",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause,
        additional_match_condition:" or case_num = '" + case_num + "'"
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
