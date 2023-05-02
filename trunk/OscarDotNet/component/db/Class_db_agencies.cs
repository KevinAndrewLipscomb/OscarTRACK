using Class_db;
using Class_db_members;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web.UI.WebControls;

namespace Class_db_agencies
{
    internal struct commensuration_rec_type
    {
        public string agency_id;
        public decimal commensuration_factor;
        public bool be_agency_id_applicable;
    }

    internal struct serial_indicator_rec_type
    {
        public uint year;
        public uint month;
        public double value;
    }

    public class TClass_db_agencies: TClass_db
    {
        private readonly TClass_db_trail db_trail = null;

        //Constructor  Create()
        public TClass_db_agencies() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }

        internal bool BeEfficipayEnabled(string id)
          {
          Open();
          using var my_sql_command = new MySqlCommand("select be_efficipay_enabled from agency where id = '" + id + "'",connection);
          var be_efficipay_enabled = ("1" == my_sql_command.ExecuteScalar().ToString());
          Close();
          return be_efficipay_enabled;
          }

    internal SortedList<string,bool> BeNotificationPendingForAllInScope(k.subtype<int> relative_month)
      {
      var be_notification_pending_for_all_in_scope = new SortedList<string,bool>();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select agency_id as agency"
        + " , sum(not be_notification_pending) as sum"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        + " where trigger_managed_year_month = EXTRACT(YEAR_MONTH from DATE_ADD(CURDATE(),INTERVAL " + relative_month.val + " MONTH))"
        + " group by agency_id"
        + " order by agency_id",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        be_notification_pending_for_all_in_scope.Add(key:dr["agency"].ToString(),value:dr["sum"].ToString() == "0");
        }
      Close();
      return be_notification_pending_for_all_in_scope;
      }

    internal bool BeKeyclickEnabled(string id)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select be_keyclick_enabled from agency where id = '" + id + "'",connection);
      var be_keyclick_enabled = ("1" == my_sql_command.ExecuteScalar().ToString());
      Close();
      return be_keyclick_enabled;
      }

        public bool Bind(string partial_spec, object target)
          {
          var concat_clause = "concat(id,'|',short_designator,'|',long_designator,'|',keyclick_enumerator,'|',oscar_classic_enumerator)";
          Open();
          ((target) as ListControl).Items.Clear();
          using var my_sql_command = new MySqlCommand
            (
            "select id"
            + " , CONVERT(" + concat_clause + " USING utf8) as spec"
            + " from agency"
            + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
            + " order by id",
            connection
            );
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          return ((target) as ListControl).Items.Count > 0;
          }

        private void BindEmsPostListControl(string unselected_literal,string designator_clause,object target,string selected_id)
          {
          Open();
          (target as ListControl).Items.Clear();
          if (unselected_literal.Length > 0)
            {
            (target as ListControl).Items.Add(new ListItem(unselected_literal, ""));
            }
          using var my_sql_command = new MySqlCommand("SELECT id" + " , " + designator_clause + " as designator" + " from agency" + " where be_ems_post = TRUE" + " order by short_designator", connection);
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListControl).Items.Add(new ListItem(dr["designator"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          if (selected_id.Length > 0)
            {
            (target as ListControl).SelectedValue = selected_id;
            }
          Close();
          }

        public void BindEmsPostListControlShort(object target,string selected_id,bool be_available_option_all,string unselected_literal)
          {
          if (be_available_option_all)
            {
            BindEmsPostListControl(unselected_literal, "short_designator", target, selected_id);
            }
          else
            {
            BindEmsPostListControl(k.EMPTY, "short_designator", target, selected_id);
            }
          }
        public void BindEmsPostListControlShort(object target,string selected_id,bool be_available_option_all)
          {
          BindEmsPostListControlShort(target, selected_id, be_available_option_all, "All");
          }
        public void BindEmsPostListControlShort(object target,string selected_id)
          {
          BindEmsPostListControlShort(target, selected_id, true);
          }
        public void BindEmsPostListControlShort(object target)
          {
          BindEmsPostListControlShort(target, "");
          }

        private void BindListControl(string unselected_literal,string designator_clause,object target,string selected_id)
          {
          Open();
          (target as ListControl).Items.Clear();
          if (unselected_literal.Length > 0)
            {
            (target as ListControl).Items.Add(new ListItem(unselected_literal, ""));
            }
          using var my_sql_command = new MySqlCommand("SELECT id" + " , " + designator_clause + " as designator" + " from agency" + " where be_active = TRUE" + " order by short_designator", connection);
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListControl).Items.Add(new ListItem(dr["designator"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          if (selected_id.Length > 0)
            {
            (target as ListControl).SelectedValue = selected_id;
            }
          Close();
          }

        internal void BindListControlKeyclickEnumerator
          (
          object target,
          string unselected_literal = "All",
          string selected_value = ""
          )
          {
          var trespass_nonparticipant_quoted_csv_list = ConfigurationManager.AppSettings["trespass_nonparticipant_quoted_csv_list"];
          Open();
          (target as ListControl).Items.Clear();
          if (unselected_literal.Length > 0)
            {
            (target as ListControl).Items.Add(new ListItem(unselected_literal, ""));
            }
          using var my_sql_command = new MySqlCommand
            (
            cmdText:new StringBuilder()
              .Append($"SELECT keyclick_enumerator")
              .Append($" ,long_designator")
              .Append($" from agency")
              .Append($" where keyclick_enumerator is not null")
              .Append(  $" and keyclick_enumerator not in ({trespass_nonparticipant_quoted_csv_list})")
              .Append($" order by id")
              .ToString(),
            connection:connection
            );
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListControl).Items.Add(new ListItem(text:dr["long_designator"].ToString(), value:dr["keyclick_enumerator"].ToString()));
            }
          dr.Close();
          if (selected_value.Length > 0)
            {
            (target as ListControl).SelectedValue = selected_value;
            }
          Close();
          }

        public void BindListControlShort(object target,string selected_id,bool be_available_option_all,string unselected_literal)
          {
          if (be_available_option_all)
            {
            BindListControl(unselected_literal, "short_designator", target, selected_id);
            }
          else
            {
            BindListControl(k.EMPTY, "short_designator", target, selected_id);
            }
          }
        public void BindListControlShort(object target,string selected_id,bool be_available_option_all)
          {
          BindListControlShort(target, selected_id, be_available_option_all, "All");
          }
        public void BindListControlShort(object target,string selected_id)
          {
          BindListControlShort(target, selected_id, true);
          }
        public void BindListControlShort(object target)
          {
          BindListControlShort(target, "");
          }

        public void BindListControlShortDashLong(object target, string selected_id, bool be_available_option_all, string option_all_text)
          {
          if (be_available_option_all)
            {
            BindListControl(option_all_text, "concat(short_designator,\" - \",long_designator)", target, selected_id);
            }
          else
            {
            BindListControl(k.EMPTY, "concat(short_designator,\" - \",long_designator)", target, selected_id);
            }
          }
        public void BindListControlShortDashLong(object target, string selected_id, bool be_available_option_all)
          {
          BindListControlShortDashLong(target, selected_id, be_available_option_all, "-- Select --");
          }
        public void BindListControlShortDashLong(object target, string selected_id)
          {
          BindListControlShortDashLong(target, selected_id, true);
          }
        public void BindListControlShortDashLong(object target)
          {
          BindListControlShortDashLong(target, "");
          }

        internal void BindListControlShortDashLongSatelliteStations(object target)
          {
          Open();
          (target as ListControl).Items.Clear();
          (target as ListControl).Items.Add(new ListItem("-- Select --",k.EMPTY));
          using var my_sql_command = new MySqlCommand("SELECT id,short_designator as designator from agency where not be_active order by short_designator", connection);
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListControl).Items.Add(new ListItem(dr["designator"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          Close();
          }

        internal void BindEmsPostListItemCollectionShort
          (
          string tier,
          string agency_filter,
          string post_footprint,
          bool be_condensed,
          bool be_user_squad_truck_team_scheduler,
          bool be_user_volunteer_field_supervisor_team_scheduler,
          bool be_user_mci_team_scheduler,
          bool be_user_bike_team_scheduler,
          object target
          )
          {
          Open();
          (target as ListItemCollection).Clear();
          using var my_sql_command = new MySqlCommand
            (
            "select agency.id,agency.short_designator"
            + " from agency"
            +   " left join agency_satellite_station on (agency_satellite_station.satellite_station_id=agency.id)"
            + " where be_ems_post"
            +     (tier == "1" ? k.EMPTY : " and (('" + agency_filter + "' in (agency.id,agency_id)) or (agency.id in (0" + (post_footprint.Length > 0 ? k.COMMA + post_footprint : k.EMPTY) + "))" + (be_condensed ? k.EMPTY : " or (agency.id < 200) or (agency.id between 700 and 799)") + ")")
                    // Agency IDs less than 200 are volunteer rescue squad posts.
                    // Agency IDs in the 700 range are Special Event posts.
            +     (be_user_squad_truck_team_scheduler ? " or short_designator = 'SQT' or short_designator like 'Q%'" : k.EMPTY)
            +     (be_user_volunteer_field_supervisor_team_scheduler ? " or short_designator = 'VFS'" : k.EMPTY)
            +     (be_user_mci_team_scheduler ? " or short_designator = 'MCI'" : k.EMPTY)
            +     (be_user_bike_team_scheduler ? " or short_designator = 'BKT'" : k.EMPTY)
            + " order by agency.id",
            connection
            );
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListItemCollection).Add(new ListItem(dr["short_designator"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          Close();
          }


        internal void BindEvalPostDirectToListControl(object target)
          {
          Open();
          (target as ListControl).Items.Clear();
          (target as ListControl).Items.Add(new ListItem("-- Post --",""));
          using var my_sql_command = new MySqlCommand("SELECT id,short_designator from agency where be_ems_post and agency.id > 0 and agency.id < 200 order by short_designator",connection);
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            (target as ListControl).Items.Add(new ListItem(dr["short_designator"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          Close();
          }

        public void BindForCommensuration(object target)
        {
            Open();
            using var my_sql_command = new MySqlCommand("select agency.id as agency_id" + " , concat(medium_designator,\" - \",long_designator) as designator" + " , " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id < 200" + " and be_active" + " group by agency.id" + " order by agency.id", connection);
            ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
            ((target) as DataGrid).DataBind();
            Close();
        }

        public void BindForControlCharts(string indicator, object target)
        {
            Open();
            if (indicator == "third_slot_saturation")
              {
              using var my_sql_command = new MySqlCommand
                (
                "select distinct 'CITYWIDE' as designator"
                + " , 0 as id"
                + " , 0 as be_agency_id_applicable",
                connection
                );
              ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
              ((target) as DataGrid).DataBind();
              }
            else
              {
              using var my_sql_command = new MySqlCommand("select distinct if(be_agency_id_applicable,concat(medium_designator,\" - \",long_designator),\"CITYWIDE\") as designator" + " , id" + " , be_agency_id_applicable" + " from indicator_" + indicator + " join agency on (agency.id=indicator_" + indicator + ".agency_id)" + " order by be_agency_id_applicable,id", connection);
              ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
              ((target) as DataGrid).DataBind();
              }
            Close();
        }

        public bool BindPostForConfigBusinessObjects(string partial_spec, object target)
          {
          var concat_clause = "concat(id,'|',short_designator,'|',long_designator)";
          Open();
          ((target) as ListControl).Items.Clear();
          using var my_sql_command = new MySqlCommand
            (
            "select id"
            + " , CONVERT(" + concat_clause + " USING utf8) as spec"
            + " from agency"
            + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
            +   " and be_ems_post"
            +   " and keyclick_enumerator is null"
            + " order by id",
            connection
            );
          var dr = my_sql_command.ExecuteReader();
          while (dr.Read())
            {
            ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
            }
          dr.Close();
          return ((target) as ListControl).Items.Count > 0;
          }

        public void BindRankedCommensuration(object target)
          {
          Open();
          using var my_sql_command = new MySqlCommand
            (
            "select NULL as `rank`"
            + " , concat(medium_designator,' - ',long_designator) as agency"
            + " , value"
            + " from indicator_commensuration"
            +   " join agency on (agency.id=indicator_commensuration.agency_id)"
            + " where year = YEAR(CURDATE())"
            +   " and month = MONTH(CURDATE())"
            +   " and agency_id <> 0"
            +   " and be_agency_id_applicable = TRUE"
            + " order by value desc",
            connection
            );
          ((target) as DataGrid).DataSource = my_sql_command.ExecuteReader();
          ((target) as DataGrid).DataBind();
          Close();
          }

        public void CycleFleetTrackingOpsTallies()
          {
          Open();
          using var my_sql_command = new MySqlCommand(db_trail.Saved("update agency set fleet_tracking_ops_tally = 0"), connection);
          my_sql_command.ExecuteNonQuery();
          Close();
          }

        public bool Delete(string id)
          {
          var result = true;
          Open();
          try
            {
            using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from agency where id = '" + id + "'"),connection);
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
              throw;
              }
            }
          Close();
          return result;
          }

        public bool Get
          (
          string id,
          out string short_designator,
          out string medium_designator,
          out string long_designator,
          out bool be_active,
          out string keyclick_enumerator,
          out string oscar_classic_enumerator,
          out bool be_ems_post,
          out string door_code,
          out bool be_ok_to_nag,
          out bool be_ok_to_send_duty_reminders,
          out string address,
          out bool be_keyclick_enabled,
          out bool be_efficipay_enabled
          )
          {
          short_designator = k.EMPTY;
          medium_designator = k.EMPTY;
          long_designator = k.EMPTY;
          be_active = false;
          keyclick_enumerator = k.EMPTY;
          oscar_classic_enumerator = k.EMPTY;
          be_ems_post = false;
          door_code = k.EMPTY;
          be_ok_to_nag = true;
          be_ok_to_send_duty_reminders = false;
          address = k.EMPTY;
          be_keyclick_enabled = false;
          be_efficipay_enabled = false;
          var result = false;
          Open();
          using var my_sql_command = new MySqlCommand("select * from agency where CAST(id AS CHAR) = '" + id + "'", connection);
          var dr = my_sql_command.ExecuteReader();
          if (dr.Read())
            {
            short_designator = dr["short_designator"].ToString();
            medium_designator = dr["medium_designator"].ToString();
            long_designator = dr["long_designator"].ToString();
            be_active = (dr["be_active"].ToString() == "1");
            keyclick_enumerator = dr["keyclick_enumerator"].ToString();
            oscar_classic_enumerator = dr["oscar_classic_enumerator"].ToString();
            be_ems_post = (dr["be_ems_post"].ToString() == "1");
            door_code = dr["door_code"].ToString();
            be_ok_to_nag = (dr["be_ok_to_nag"].ToString() == "1");
            be_ok_to_send_duty_reminders = (dr["be_ok_to_send_duty_reminders"].ToString() == "1");
            address = dr["address"].ToString();
            be_keyclick_enabled = (dr["be_keyclick_enabled"].ToString() == "1");
            be_efficipay_enabled = (dr["be_efficipay_enabled"].ToString() == "1");
            result = true;
            }
          dr.Close();
          Close();
          return result;
          }

    public string IdOfShortDesignator(string short_designator)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select id from agency where short_designator = \"" + short_designator + "\"", connection);
      var result = my_sql_command.ExecuteScalar()?.ToString() ?? null;
      Close();
      return result;
      }

    internal string IdResponsibleForPost(string post_id)
          {
          Open();
          using var my_sql_command = new MySqlCommand
            (
            "select IFNULL(IF((select be_active from agency where id = '" + post_id + "'),'" + post_id + "',(select agency_id from agency_satellite_station where satellite_station_id = '" + post_id + "')),0)",
            connection
            );
          var id_responsible_for_post = my_sql_command.ExecuteScalar().ToString();
          Close();
          return id_responsible_for_post;
          }

        public void IncrementFleetTrackingOpsTally(string id)
          {
          Open();
          using var my_sql_command = new MySqlCommand(db_trail.Saved("update agency set fleet_tracking_ops_tally = fleet_tracking_ops_tally + 1 where id = '" + id + "'"), connection);
          my_sql_command.ExecuteNonQuery();
          Close();
          }

        internal string KeyclickEnumeratorOf(string id)
          {
          var keyclick_enumerator_of = k.EMPTY;
          Open();
          using var my_sql_command = new MySqlCommand("select keyclick_enumerator from agency where id = '" + id + "'",connection);
          var keyclick_enumerator_of_obj = my_sql_command.ExecuteScalar();
          Close();
          if (keyclick_enumerator_of_obj != DBNull.Value)
            {
            keyclick_enumerator_of = keyclick_enumerator_of_obj.ToString();
            }
          return keyclick_enumerator_of;
          }

        internal void LogCommensurationData
          (
          k.decimal_nonnegative num_actual_crew_shifts_r01,
          k.decimal_nonnegative num_actual_crew_shifts_r02,
          k.decimal_nonnegative num_actual_crew_shifts_r04,
          k.decimal_nonnegative num_actual_crew_shifts_r05,
          k.decimal_nonnegative num_actual_crew_shifts_r06,
          k.decimal_nonnegative num_actual_crew_shifts_r09,
          k.decimal_nonnegative num_actual_crew_shifts_r13,
          k.decimal_nonnegative num_actual_crew_shifts_r14,
          k.decimal_nonnegative num_actual_crew_shifts_r16,
          k.decimal_nonnegative num_actual_crew_shifts_r17,
          k.decimal_nonnegative num_actual_crew_shifts_ems,
          k.decimal_nonnegative num_actual_crew_shifts_all
          )
          {
          var this_day_next_month = DateTime.Today.AddMonths(1);
          var year = this_day_next_month.Year.ToString();
          var month = this_day_next_month.Month.ToString();
          Open();
          using var my_sql_command = new MySqlCommand
            (
            "replace indicator_commensuration (year,month,be_agency_id_applicable,agency_id,value) values"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "1" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '1')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r01.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "2" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '2')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r02.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "4" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '4')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r04.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "5" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '5')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r05.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "6" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '6')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r06.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "9" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '9')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r09.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "13" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '13')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r13.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "14" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '14')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r14.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "16" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '16')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r16.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "17" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '17')) = 0,0,ROUND(100*" + num_actual_crew_shifts_r17.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "TRUE" + k.COMMA + "0" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id = '0')) = 0,0,ROUND(100*" + num_actual_crew_shifts_ems.val + "/@num_forecast))),"
            + " (" + year + k.COMMA + month + k.COMMA + "FALSE" + k.COMMA + "0" + k.COMMA + "IF((@num_forecast := (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + ")) = 0,0,ROUND(100*" + num_actual_crew_shifts_all.val + "/@num_forecast)))"
            ,
            connection
            );
          my_sql_command.ExecuteNonQuery();
          Close();
          }

        public string LongDesignatorOf(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select long_designator from agency where id = '" + id + "'", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

    internal string LongDesignatorOfKeyclickEnumerator(string keyclick_enumerator)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select long_designator from agency where keyclick_enumerator = '" + keyclick_enumerator + "'", connection);
      var long_designator_of_keyclick_enumerator = my_sql_command.ExecuteScalar().ToString();
      Close();
      return long_designator_of_keyclick_enumerator;
      }

        public string MediumDesignatorOf(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select medium_designator from agency where id = '" + id + "'", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

        internal string OscarClassicEnumeratorOf(string id)
          {
          var oscar_classic_enumerator_of = k.EMPTY;
          Open();
          using var my_sql_command = new MySqlCommand("select oscar_classic_enumerator from agency where id = '" + id + "'",connection);
          var oscar_classic_enumerator_of_obj = my_sql_command.ExecuteScalar();
          Close();
          if (oscar_classic_enumerator_of_obj != DBNull.Value)
            {
            oscar_classic_enumerator_of = oscar_classic_enumerator_of_obj.ToString();
            }
          return oscar_classic_enumerator_of;
          }

        public string OverallCommensuration()
        {
            string result;
            object overall_commensuration_obj;
            result = k.EMPTY;
            Open();
            using var my_sql_command = new MySqlCommand("select FORMAT(value,0)" + " from indicator_commensuration" + " where year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and not be_agency_id_applicable", connection);
            overall_commensuration_obj = my_sql_command.ExecuteScalar();
            if (overall_commensuration_obj != null)
            {
                result = overall_commensuration_obj.ToString();
            }
            Close();
            return result;
        }

    public Queue SerialIndicatorData
      (
      string indicator,
      string agency_id,
      string be_agency_id_applicable
      )
      {
      var additional_where_clause = k.EMPTY;
      var dependent_parameter_name = k.EMPTY;
      serial_indicator_rec_type serial_indicator_rec;
      if (indicator == "median_length_of_service")
        {
        dependent_parameter_name = "m";
        additional_where_clause = " and be_trendable";
        }
      else
        {
        dependent_parameter_name = "value";
        }
      var serial_indicator_rec_q = new Queue();
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select year,month," + dependent_parameter_name
        + " from indicator_" + indicator
        + " where agency_id = '" + agency_id + "'"
        +   " and be_agency_id_applicable = '" + be_agency_id_applicable + "'"
        +     additional_where_clause,
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        serial_indicator_rec.year = uint.Parse(dr["year"].ToString());
        serial_indicator_rec.month = uint.Parse(dr["month"].ToString());
        serial_indicator_rec.value = Double.Parse(dr[dependent_parameter_name].ToString());
        serial_indicator_rec_q.Enqueue(serial_indicator_rec);
        }
      dr.Close();
      Close();
      return serial_indicator_rec_q;
      }

        public void Set
          (
          string id,
          string short_designator,
          string medium_designator,
          string long_designator,
          bool be_active,
          string keyclick_enumerator,
          string oscar_classic_enumerator,
          bool be_ems_post,
          string door_code,
          bool be_ok_to_nag,
          bool be_ok_to_send_duty_reminders,
          string address,
          bool be_keyclick_enabled,
          bool be_efficipay_enabled
          )
          {
          var childless_field_assignments_clause = k.EMPTY
          + "short_designator = '" + short_designator + "'"
          + " , medium_designator = '" + medium_designator + "'"
          + " , long_designator = '" + long_designator + "'"
          + " , be_active = " + be_active.ToString()
          + " , keyclick_enumerator = NULLIF('" + keyclick_enumerator.ToUpper() + "','')"
          + " , oscar_classic_enumerator = NULLIF('" + oscar_classic_enumerator + "','')"
          + " , be_ems_post = " + be_ems_post.ToString()
          + " , door_code = NULLIF('" + door_code + "','')"
          + " , be_ok_to_nag = " + be_ok_to_nag.ToString()
          + " , be_ok_to_send_duty_reminders = " + be_ok_to_send_duty_reminders.ToString()
          + " , address = NULLIF('" + address + "','')"
          + " , be_keyclick_enabled = " + be_keyclick_enabled.ToString()
          + " , be_efficipay_enabled = " + be_efficipay_enabled.ToString()
          + k.EMPTY;
          Open();
          using var my_sql_command = new MySqlCommand
            (
            db_trail.Saved
              (
              "insert agency"
              + " set id = NULLIF('" + id + "','')"
              + " , " + childless_field_assignments_clause
              + " on duplicate key update "
              + childless_field_assignments_clause
              ),
             connection
             );
          my_sql_command.ExecuteNonQuery();
          Close();
          }

        public void SetCommensuration(Queue commensuration_rec_q)
        {
            commensuration_rec_type commensuration_rec;
            uint i;
            string month;
            string sql;
            DateTime this_day_next_month;
            string year;
            this_day_next_month = DateTime.Today.AddMonths(1);
            year = this_day_next_month.Year.ToString();
            month = this_day_next_month.Month.ToString();
            sql = "replace indicator_commensuration (year,month,be_agency_id_applicable,agency_id,value) values";
            uint commensuration_rec_q_count = (uint)(commensuration_rec_q.Count);
            for (i = 1; i <= commensuration_rec_q_count; i ++ )
            {
                commensuration_rec = (commensuration_rec_type)(commensuration_rec_q.Dequeue());
                sql = sql + " (" + year + k.COMMA + month + k.COMMA + commensuration_rec.be_agency_id_applicable.ToString() + k.COMMA + commensuration_rec.agency_id + k.COMMA + (commensuration_rec.commensuration_factor * 100).ToString("F0") + " ),";
            }
            Open();
            using var my_sql_command = new MySqlCommand(db_trail.Saved(sql.Substring(0, sql.Length - 1)), connection);
            my_sql_command.ExecuteNonQuery();
            Close();
        }

        public string ShortDesignatorOf(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select short_designator from agency where id = '" + id + "'", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

    internal string WebAddressOfKeyclickEnumerator(string keyclick_enumerator)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select web_address from agency where keyclick_enumerator = '" + keyclick_enumerator + "'", connection);
      var web_address_of_keyclick_enumerator = my_sql_command.ExecuteScalar().ToString();
      Close();
      return web_address_of_keyclick_enumerator;
      }

    } // end TClass_db_agencies

}
