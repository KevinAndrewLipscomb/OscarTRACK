using Class_biz_notifications;
using Class_biz_sms_gateways;
using Class_db;
using Class_db_agencies;
using Class_db_medical_release_levels;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace Class_db_members
{

    public static class Class_db_members_Static
    {

        public const int TCCI_DRILLDOWN_LINKBUTTON = 0;
        public const int TCCI_ID = 1;
        public const int TCCI_LAST_NAME = 2;
        public const int TCCI_FIRST_NAME = 3;
        public const int TCCI_CAD_NUM = 4;
        public const int TCCI_AGENCY = 5;
        public const int TCCI_SECTION_NUM = 6;
        public const int TCCI_MEDICAL_RELEASE_PECK_CODE = 7;
        public const int TCCI_MEDICAL_RELEASE_LEVEL = 8;
        public const int TCCI_BE_DRIVER_QUALIFIED = 9;
        public const int TCCI_ENROLLMENT = 10;
        public const int TCCI_LENGTH_OF_SERVICE = 11;
        public const int TCCI_COMMITMENT_LEVEL_CODE = 12;
        public const int TCCI_ENROLLMENT_OBLIGATION = 13;
        public const int TCCI_LEAVE = 14;
        public const int TCCI_OBLIGED_SHIFTS = 15;
        public const int TCCI_EMAIL_ADDRESS = 16;
        public const int TCCI_PHONE_NUM = 17;
        public static string CrewShiftsForecastMetricFromWhereClause(string relative_month)
          {
          return k.EMPTY
          + " IFNULL("
          +   " sum("
          +     " if"
          +       " (" 
          +         " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))"
          +         " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))),"
          +       " num_obliged_shifts,"
          +       " num_shifts"
          +       " )"
          +     " )/2"
          +   ","
          +     "0"
          +   ") as num_crew_shifts"
          + " from member"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join enrollment_history"
          +     " on"
          +       " ("
          +       " enrollment_history.member_id=member.id"
          +       " and"
          +         " ("
          +           " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))"
          +         " and"
          +           " ("
          +             " (enrollment_history.end_date is null)"
          +           " or"
          +             " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))"
          +           " )"
          +         " )"
          +       " )"
          +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
          +   " left join leave_of_absence"
          +     " on"
          +       " ("
          +       " leave_of_absence.member_id=member.id"
          +       " and "
          +         " ("
          +           " (leave_of_absence.start_date is null)"
          +         " or"
          +           " ("
          +             " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))"
          +           " and"
          +             " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))"
          +           " )"
          +         " )"
          +       " )"
          +   " join agency on (agency.id=member.agency_id)"
          + " where"
          +     " enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +   " and"
          +     " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
          }

    }

    public class member_summary
      {
      public string agency;
      public string agency_id;
      public bool be_driver_qualified;
      public string cad_num;
      public string enrollment;
      public string equivalent_los_start_date;
      public string first_name;
      public string first_release_as_aic_date;
      public string id;
      public string last_name;
      public string medical_release_level;
      public string length_of_service;
      public string peck_code;
      public string phone_num;
      public string phone_service_id;
      public string phone_service;
      public string section;
      public bool be_placeholder;
      public bool be_flight_medic;
      public bool be_marine_medic;
      public bool be_on_squad_truck_team;
      }

    public class TClass_db_members: TClass_db
    {

        private TClass_biz_notifications biz_notifications = null;
        private TClass_biz_sms_gateways biz_sms_gateways = null;
        private TClass_db_agencies db_agencies = null;
        private TClass_db_medical_release_levels db_medical_release_levels = null;
        private TClass_db_trail db_trail = null;

        public TClass_db_members() : base()
        {
            biz_notifications = new TClass_biz_notifications();
            biz_sms_gateways = new TClass_biz_sms_gateways();
            db_agencies = new TClass_db_agencies();
            db_medical_release_levels = new TClass_db_medical_release_levels();
            db_trail = new TClass_db_trail();
        }

        public void Add
          (
          string first_name,
          string last_name,
          string cad_num,
          uint medical_release_code,
          bool be_driver_qualified,
          uint agency_id,
          string email_address,
          DateTime enrollment_date,
          uint enrollment_code,
          string phone_num,
          string phone_service_id,
          string section_num
          )
          {
            string enrollment_date_string;
            string sql;
            enrollment_date_string = enrollment_date.ToString("yyyy-MM-dd");
            sql = "START TRANSACTION;" + " insert into member" + " set first_name = \"" + first_name.ToUpper() + "\"" + " , last_name = \"" + last_name.ToUpper() + "\"";
            if (cad_num != k.EMPTY)
            {
                sql = sql + " , cad_num = \"" + cad_num + "\"";
            }
            sql = sql + " , email_address = \"" + email_address + "\"" + " , medical_release_code = '" + medical_release_code.ToString() + "' , be_driver_qualified = " + be_driver_qualified.ToString() + " , agency_id = " + agency_id.ToString() + " , phone_num = \"" + phone_num + "\", phone_service_id = NULLIF('" + phone_service_id + "','')";
            if (new ArrayList(new uint[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 18, 19, 20, 21, 23, 24, 25, 26, 27}).Contains(enrollment_code))
            {
                sql = sql + " , equivalent_los_start_date = \"" + enrollment_date_string + "\"";
            }
            if (section_num.Length > 0)
              {
              sql += " , section_num = '" + section_num + "'";
              }
            sql = sql + ";" + " insert into enrollment_history" + " set member_id = (select max(id) from member)" + " , level_code = " + enrollment_code.ToString() + " , start_date = \"" + enrollment_date_string + "\"" + ";" + " COMMIT";
            this.Open();
            new MySqlCommand(db_trail.Saved(sql), this.connection).ExecuteNonQuery();
            this.Close();
          }

    internal string FirstReleaseAsAnAicDateOf(object summary)
      {
      return (summary as member_summary).first_release_as_aic_date;
      }

    public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date, uint enrollment_code, string phone_num, string phone_service_id)
          {
          Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, 17, phone_num, phone_service_id, section_num:k.EMPTY);
          }
        public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date)
        {
            Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, 17);
        }
        public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date, uint enrollment_code)
        {
            Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, enrollment_code, phone_num:k.EMPTY, phone_service_id:k.EMPTY);
        }

    public string AgencyIdOf(object summary)
      {
      return (summary as member_summary).agency_id;
      }

        public string AgencyOf(object summary)
        {
            return (summary as member_summary).agency;
        }

        public string AgencyIdOfId(string id)
        {
            string result;
            object agency_id_of_id_obj;
            this.Open();
            agency_id_of_id_obj = new MySqlCommand("SELECT agency_id FROM member WHERE id = \"" + id + "\"", this.connection).ExecuteScalar();
            this.Close();
            if ((agency_id_of_id_obj != null))
            {
                result = agency_id_of_id_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            return result;
        }

        internal bool BeDriverQualifiedOfId(string id)
          {
          Open();
          var be_driver_qualified_of_id = ("1" == new MySqlCommand("select be_driver_qualified from member where id = '" + id + "'",connection).ExecuteScalar().ToString());
          Close();
          return be_driver_qualified_of_id;
          }

        public bool BeDriverQualifiedOf(object summary)
        {
            return (summary as member_summary).be_driver_qualified;
        }

    public bool BeFlightMedicQualifiedOf(object summary)
      {
      return (summary as member_summary).be_flight_medic;
      }

    public bool BeMarineMedicQualifiedOf(object summary)
      {
      return (summary as member_summary).be_marine_medic;
      }

        public bool BeKnown(string cad_num)
        {
            bool result;
            this.Open();
            result = (new MySqlCommand("select 1 from member where cad_num = \"" + cad_num + "\"", this.connection).ExecuteScalar() != null);
            this.Close();
            return result;
        }

        public bool BeKnown(string first_name, string last_name, string cad_num)
        {
            bool result;
            string sql;
            sql = "select 1 from member where" + " (" + " first_name = \"" + first_name + "\"" + " and last_name = \"" + last_name + "\"";
            if (cad_num == "")
            {
                sql = sql + ")";
            }
            else
            {
                sql = sql + " and (cad_num = \"" + cad_num + "\" or cad_num is null or cad_num like \"9%\")) or (cad_num = \"" + cad_num + "\")";
            }
            this.Open();
            result = (new MySqlCommand(sql, this.connection).ExecuteScalar() != null);
            this.Close();
            return result;
        }

        internal bool BeRoleHolder(string id)
          {
          var be_role_holder = true;
          Open();
          be_role_holder = ("1" == new MySqlCommand("select (count(role_id) > 0) from member join role_member_map on (role_member_map.member_id=member.id) where id = '" + id + "'",connection).ExecuteScalar().ToString());
          Close();
          return be_role_holder;
          }

        internal bool BeRoleHolderBySharedSecret
          (
          string cad_num,
          out string claimed_role_name,
          out string claimed_member_name,
          out string claimed_member_id,
          out string claimed_member_email_address
          )
          {
          var be_role_holder_by_shared_secret = false;
          claimed_role_name = k.EMPTY;
          claimed_member_name = k.EMPTY;
          claimed_member_id = k.EMPTY;
          claimed_member_email_address = k.EMPTY;
          Open();
          var dr = new MySqlCommand
            (
            "select role.name as role_name"
            + " , concat(member.first_name,' ',member.last_name) as member_name"
            + " , member.id as member_id"
            + " , IFNULL(email_address,'') as email_address"
            + " from member"
            +   " join role_member_map on (role_member_map.member_id=member.id)"
            +   " join role on (role.id=role_member_map.role_id)"
            + " where cad_num = '" + cad_num + "'"
            + " order by role.pecking_order"
            + " limit 1",
            connection
            )
            .ExecuteReader();
          if (dr.Read())
            {
            claimed_role_name = dr["role_name"].ToString();
            claimed_member_name = dr["member_name"].ToString();
            claimed_member_id = dr["member_id"].ToString();
            claimed_member_email_address = dr["email_address"].ToString();
            be_role_holder_by_shared_secret = true;
            }
          dr.Close();
          Close();
          return be_role_holder_by_shared_secret;
          }

    public bool BeSquadTruckTeamQualifiedOf(object summary)
      {
      return (summary as member_summary).be_on_squad_truck_team;
      }

        public bool BeValidProfile(string id)
        {
            bool result;
            this.Open();
            result = ("1" == new MySqlCommand("select be_valid_profile from member where id = " + id, this.connection).ExecuteScalar().ToString());
            this.Close();
            return result;
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            string where_clause;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            where_clause = " where (enrollment_level.description in (\"Applicant\",\"Associate\",\"Regular\",\"Life\",\"Senior\",'Tenured BLS','Tenured ALS',\"Staff\",\"ALS Intern\",\"College\",\"Atypical\"," + "\"Recruit\",\"Admin\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"SpecOps\",\"Transferring\",\"Suspended\",\"New trainee\"))";
            if (agency_filter != k.EMPTY)
            {
                where_clause = where_clause + " and (agency_id = \"" + agency_filter + "\")";
            }
            this.Open();
            dr = new MySqlCommand("select member.id as member_id" + " , concat(last_name,\", \",first_name,\" (\",IFNULL(cad_num,\"\"),\")\") as member_designator" + " from member" + " join enrollment_history" + " on" + " (" + "   enrollment_history.member_id=member.id" + " and" + "   (enrollment_history.end_date is null)" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + where_clause + " order by member_designator", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["member_designator"].ToString(), dr["member_id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != k.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindCurrentDirectToListControl(object target)
        {
            BindCurrentDirectToListControl(target, k.EMPTY);
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter)
        {
            BindCurrentDirectToListControl(target, agency_filter, "-- Member --");
        }

        public void BindCurrentDirectToListControl(object target, string agency_filter, string unselected_literal)
        {
            BindCurrentDirectToListControl(target, agency_filter, unselected_literal, k.EMPTY);
        }

        internal void BindEvaluateesDirectToListControl
          (
          object target,
          string unselected_literal,
          string selected_value
          )
          {
          ((target) as ListControl).Items.Clear();
          if (unselected_literal.Length > 0)
            {
            ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
          Open();
          var dr = new MySqlCommand
            (
            "select member.id as member_id"
            + " , concat(last_name,', ',first_name,' (',IFNULL(cad_num,''),')') as member_designator"
            + " from member"
            +   " join enrollment_history"
            +     " on"
            +       " ("
            +       "   enrollment_history.member_id=member.id"
            +       " and"
            +       "   (enrollment_history.end_date is null)"
            +       " )"
            +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            + " where enrollment_level.description in ('Recruit','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','Transferring')"
            +   " and"
            +     " ("
            +       " ("
            +         " medical_release_code_description_map.pecking_order > 0"
            +       " and"
            +         " medical_release_code_description_map.pecking_order < (select pecking_order from medical_release_code_description_map where description = 'EMT-B')"
            +       " )"
            +     " or"
            +       " not be_driver_qualified"
            +     " )"
            + " order by member_designator",
            connection
            )
            .ExecuteReader();
          while (dr.Read())
            {
            ((target) as ListControl).Items.Add(new ListItem(dr["member_designator"].ToString(), dr["member_id"].ToString()));
            }
          dr.Close();
          Close();
          if (selected_value != k.EMPTY)
            {
            ((target) as ListControl).SelectedValue = selected_value;
            }
          }
        internal void BindEvaluateesDirectToListControl(object target, string unselected_literal)
          {
          BindEvaluateesDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
          }
        internal void BindEvaluateesDirectToListControl(object target)
          {
          BindEvaluateesDirectToListControl(target,"-- Evaluatee --");
          }

        internal void BindEvaluatorsDirectToListControl
          (
          object target,
          string unselected_literal,
          string selected_value
          )
          {
          ((target) as ListControl).Items.Clear();
          if (unselected_literal.Length > 0)
            {
            ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
          Open();
          var dr = new MySqlCommand
            (
            "select member.id as member_id"
            + " , concat(last_name,', ',first_name,' (',IFNULL(cad_num,''),')') as member_designator"
            + " from member"
            +   " join enrollment_history"
            +     " on"
            +       " ("
            +       "   enrollment_history.member_id=member.id"
            +       " and"
            +       "   (enrollment_history.end_date is null)"
            +       " )"
            +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            + " where enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','Transferring')"
            +   " and medical_release_code_description_map.pecking_order >= (select pecking_order from medical_release_code_description_map where description = 'EMT-B')"
            + " order by member_designator",
            connection
            )
            .ExecuteReader();
          while (dr.Read())
            {
            ((target) as ListControl).Items.Add(new ListItem(dr["member_designator"].ToString(), dr["member_id"].ToString()));
            }
          dr.Close();
          Close();
          if (selected_value != k.EMPTY)
            {
            ((target) as ListControl).SelectedValue = selected_value;
            }
          }
        internal void BindEvaluatorsDirectToListControl(object target, string unselected_literal)
          {
          BindEvaluatorsDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
          }
        internal void BindEvaluatorsDirectToListControl(object target)
          {
          BindEvaluatorsDirectToListControl(target,"-- Evaluator --");
          }

        public void BindRankedCoreOpsSize(object target, bool do_log)
        {
            string from_where_phrase;
            string metric_phrase;
            metric_phrase = " count(*)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Senior\",'Tenured BLS','Tenured ALS','Staff','ALS Intern','College',\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_core_ops_size (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_phrase + from_where_phrase + " group by agency.id" + ";" + " replace indicator_core_ops_size (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_phrase + from_where_phrase + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , " + metric_phrase + " as count" + from_where_phrase + " group by agency.id" + " order by count desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

    public void BindRankedCoreOpsSize(object target)
        {
            BindRankedCoreOpsSize(target, true);
        }

        public void BindRankedCrewShiftsForecast(object target, bool do_log)
        {
            string metric_from_where_clause;
            metric_from_where_clause = Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("0");
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_crew_shifts_forecast (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_from_where_clause + " group by agency.id" + ";" + " replace indicator_crew_shifts_forecast (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_from_where_clause + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , " + metric_from_where_clause + " group by agency.id" + " order by num_crew_shifts desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedCrewShiftsForecast(object target)
        {
            BindRankedCrewShiftsForecast(target, true);
        }

        public void BindRankedFleetTrackingParticipation
          (
          object target,
          bool do_log
          )
          {
          Open();
          if (do_log)
            {
            new MySqlCommand
              (
              db_trail.Saved
                (
                "START TRANSACTION"
                + ";"
                // Log squad-by-squad indicators.
                + " replace indicator_fleet_tracking_participation (year,month,be_agency_id_applicable,agency_id,value)"
                +   " select YEAR(CURDATE())"
                +     " , MONTH(CURDATE())"
                +     " , TRUE"
                +     " , agency.id"
                +     " , fleet_tracking_ops_tally"
                +         " /"
                +         " ("
                +         " sum("
                +           " if"
                +             " (" 
                +               " (leave_of_absence.start_date <= DATE_SUB(CURDATE(),INTERVAL 1 MONTH))"
                +               " and (leave_of_absence.end_date >= LAST_DAY(DATE_SUB(CURDATE(),INTERVAL 1 MONTH))),"
                +             " num_obliged_shifts,"
                +             " num_shifts"
                +             " )"
                +           " )/2"
                +         " )*100"
                +   " from member"
                +     " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
                +     " join enrollment_history"
                +       " on"
                +         " ("
                +         " enrollment_history.member_id=member.id"
                +         " and"
                +           " ("
                +             " (enrollment_history.start_date <= DATE_SUB(CURDATE(),INTERVAL 1 MONTH))"
                +           " and"
                +             " ("
                +               " (enrollment_history.end_date is null)"
                +             " or"
                +               " (enrollment_history.end_date >= LAST_DAY(DATE_SUB(CURDATE(),INTERVAL 1 MONTH)))"
                +             " )"
                +           " )"
                +         " )"
                +     " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
                +     " left join leave_of_absence"
                +       " on"
                +         " ("
                +         " leave_of_absence.member_id=member.id"
                +         " and "
                +           " ("
                +             " (leave_of_absence.start_date is null)"
                +           " or"
                +             " ("
                +               " (leave_of_absence.start_date <= DATE_SUB(CURDATE(),INTERVAL 1 MONTH))"
                +             " and"
                +               " (leave_of_absence.end_date >= LAST_DAY(DATE_SUB(CURDATE(),INTERVAL 1 MONTH)))"
                +             " )"
                +           " )"
                +         " )"
                +     " join agency on (agency.id=member.agency_id)"
                +   " where"
                +       " enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
                +     " and"
                +       " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString()
                +     " and agency.id <> 0"
                +   " group by agency.id"
                + ";"
                // Log citywide indicator.
                + " replace indicator_fleet_tracking_participation (year,month,be_agency_id_applicable,agency_id,value)"
                +   " select YEAR(CURDATE())"
                +     " , MONTH(CURDATE())"
                +     " , FALSE"
                +     " , 0"
                +     " , (select sum(fleet_tracking_ops_tally) from agency)"
                +       " /"
                +       " (select " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("-1") + ")"
                +       " *100"
                + ";"
                + " COMMIT"
                ),
              connection
              )
              .ExecuteNonQuery();
            db_agencies.CycleFleetTrackingOpsTallies();
            }
          ((target) as DataGrid).DataSource = new MySqlCommand
            (
            "select NULL as rank"
            + " , concat(medium_designator,' - ',long_designator) as agency"
            + " , value"
            + " from indicator_fleet_tracking_participation"
            +   " join agency on (agency.id=indicator_fleet_tracking_participation.agency_id)"
            + " where YEAR(STR_TO_DATE(concat(year,'-',month,'-1'),'%Y-%m-%d')) = YEAR(CURDATE())"
            +   " and MONTH(STR_TO_DATE(concat(year,'-',month,'-1'),'%Y-%m-%d')) = MONTH(CURDATE())"
            +   " and be_agency_id_applicable = TRUE"
            +   " and agency.id <> 0"
            + " order by value desc",
            connection
            )
            .ExecuteReader();
          ((target) as DataGrid).DataBind();
          Close();
          }

        public void BindRankedNumMembersInPipeline(object target, bool do_log)
        {
            string from_where_phrase;
            string metric_phrase;
            metric_phrase = " count(*)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.section_num)" + " where" + " (enrollment_level.description in (\"Recruit\",\"New trainee\"))" + " or" + " (" + " enrollment_level.description in (\"Regular\",'College')" + " and" + " medical_release_code_description_map.pecking_order < " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString() + " )";
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_num_members_in_pipeline (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_phrase + from_where_phrase + " group by agency.id" + ";" + " replace indicator_num_members_in_pipeline (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_phrase + from_where_phrase + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , " + metric_phrase + " as count" + from_where_phrase + " group by agency.id" + " order by count desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedNumMembersInPipeline(object target)
        {
            BindRankedNumMembersInPipeline(target, true);
        }

        public void BindRankedStandardEnrollment(object target, bool do_log)
        {
            string from_where_phrase;
            string metric_phrase;
            metric_phrase = " count(if((core_ops_commitment_level_code = 3),1,NULL))/count(*)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Senior\",'Tenured BLS','Tenured ALS','Staff','ALS Intern','College',\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString() + " and agency_id <> 0";
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_standard_enrollment (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_phrase + "*100" + from_where_phrase + " group by agency.id" + ";" + " replace indicator_standard_enrollment (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_phrase + "*100" + from_where_phrase + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , count(if((core_ops_commitment_level_code = 3),1,NULL)) as num_standard_enrollments" + " , count(*) as num_core_ops_members" + " , " + metric_phrase + " as factor" + from_where_phrase + " group by agency.id" + " order by factor desc, num_core_ops_members desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedStandardEnrollment(object target)
        {
            BindRankedStandardEnrollment(target, true);
        }

        public void BindRankedThirdSlotSaturation(object target, bool do_log)
          {
          var metric_phrase = k.EMPTY          
          + " sum("
          +   " if"
          +     " ("
          +     " enrollment_level.description in ('Recruit','Regular') and medical_release_code_description_map.description in ('Student','BLS Intern'),"
          +     " if"
          +       " (" 
          +         " (leave_of_absence.start_date <= CURDATE())"
          +         " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
          +       " num_obliged_shifts,"
          +       " if(enrollment_level.description = 'Regular',num_shifts,1)"  // assume a Student not on leave will occupy 1 shift
          +       " ),"
          +     " 0"
          +     " )"
          +   " )"
          + " /"
          + " ("
          +   " sum("
          +     " if"
          +       " ("
          +         " ("
          +           " enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +         " and"
          +           " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString()
          +         " ),"
          +       " if"
          +         " (" 
          +           " (leave_of_absence.start_date <= CURDATE())"
          +           " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
          +         " num_obliged_shifts,"
          +         " num_shifts"
          +         " ),"
          +       " 0"
          +       " )"
          +     " )"
          +   "/2"
          + " )";
          var from_where_phrase = k.EMPTY
          + " from member"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join enrollment_history"
          +     " on"
          +       " ("
          +       " enrollment_history.member_id=member.id"
          +       " and"
          +         " ("
          +           " (enrollment_history.start_date <= CURDATE())"
          +         " and"
          +           " ("
          +             " (enrollment_history.end_date is null)"
          +           " or"
          +             " (enrollment_history.end_date >= LAST_DAY(CURDATE()))"
          +           " )"
          +         " )"
          +       " )"
          +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
          +   " left join leave_of_absence"
          +     " on"
          +       " ("
          +       " leave_of_absence.member_id=member.id"
          +       " and "
          +         " ("
          +           " (leave_of_absence.start_date is null)"
          +         " or"
          +           " ("
          +             " (leave_of_absence.start_date <= CURDATE())"
          +           " and"
          +             " (leave_of_absence.end_date >= LAST_DAY(CURDATE()))"
          +           " )"
          +         " )"
          +       " )"
          +   " join agency on (agency.id=member.agency_id)"
          + " where"
          +     " enrollment_level.description in ('Associate','Recruit','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +   " and"
          +     " ("
          +       " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString()
          +     " or"
          +       " medical_release_code_description_map.description in ('Student','BLS Intern')"
          +     " )";
          Open();
          if (do_log)
            {
            new MySqlCommand
              (
              db_trail.Saved
                (
                "START TRANSACTION;"
                // Log squad-by-squad indicators.
                + " replace indicator_third_slot_saturation (year,month,be_agency_id_applicable,agency_id,value)"
                +   " select YEAR(CURDATE())"
                +   " , MONTH(CURDATE())"
                +   " , TRUE"
                +   " , agency.id"
                + " , IFNULL(" + metric_phrase + "*100,0)"
                +     from_where_phrase
                +   " group by agency.id"
                + ";"
                // Log citywide indicator.
                + " replace indicator_third_slot_saturation (year,month,be_agency_id_applicable,agency_id,value)"
                +   " select YEAR(CURDATE())"
                +   " , MONTH(CURDATE())"
                +   " , FALSE"
                +   " , 0"
                + " , IFNULL(" + metric_phrase + "*100,0)"
                +     from_where_phrase
                + ";"
                + " COMMIT"
                ),
                connection
              )
              .ExecuteNonQuery();
            }
          // Bind datagrid for display.
          ((target) as DataGrid).DataSource = new MySqlCommand
            (
            "select NULL as rank"
            + " , concat(medium_designator,\" - \",long_designator) as agency"
            + " , sum("
            +     " if"
            +       " ("
            +       " enrollment_level.description in ('Recruit','Regular') and medical_release_code_description_map.description in ('Student','BLS Intern'),"
            +       " if"
            +         " (" 
            +           " (leave_of_absence.start_date <= CURDATE())"
            +           " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
            +         " num_obliged_shifts,"
            +         " if(enrollment_level.description = 'Regular',num_shifts,1)"  // assume an Student not on leave will occupy 1 shift
            +         " ),"
            +       " 0"
            +       " )"
            +     " ) as num_third_shifts"
            + " , sum("
            +     " if"
            +       " ("
            +         " ("
            +           " enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
            +         " and"
            +           " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString()
            +         " ),"
            +       " if"
            +         " (" 
            +           " (leave_of_absence.start_date <= CURDATE())"
            +           " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
            +         " num_obliged_shifts,"
            +         " num_shifts"
            +         " ),"
            +       " 0"
            +       " )"
            +     " )/2 as num_crew_shifts"
            + " , " + metric_phrase + " as third_saturation_factor"
            +   from_where_phrase
            + " group by agency.id"
            + " order by third_saturation_factor",
            connection
            )
            .ExecuteReader();
          ((target) as DataGrid).DataBind();
          Close();
          }

        public void BindRankedThirdSlotSaturation(object target)
        {
            BindRankedThirdSlotSaturation(target, true);
        }

        public void BindRankedUtilization(object target, bool do_log)
        {
            string from_where_phrase;
            string metric_phrase;
            metric_phrase = " IFNULL(sum(" + " if" + " (" + " (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE()))," + " num_obliged_shifts," + " num_shifts" + " )" + " )/sum(num_shifts),0)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " left join leave_of_absence" + " on" + " (" + " leave_of_absence.member_id=member.id" + " and " + " (" + " (leave_of_absence.start_date is null)" + " or" + " (" + " (leave_of_absence.start_date <= CURDATE())" + " and" + " (leave_of_absence.end_date >= LAST_DAY(CURDATE()))" + " )" + " )" + " )" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Senior\",'Tenured BLS','Tenured ALS','Staff','ALS Intern','College',\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_phrase + "*100" + from_where_phrase + " group by agency.id" + ";" + " replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_phrase + "*100" + from_where_phrase + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , IFNULL(sum(" + " if" + " (" + " (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE()))," + " num_obliged_shifts," + " num_shifts" + " )" + " ),0) as num_cooked_shifts" + " , IFNULL(sum(num_shifts),0) as num_raw_shifts" + " , " + metric_phrase + " as utilization" + from_where_phrase + " group by agency.id" + " order by utilization desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedUtilization(object target)
        {
            BindRankedUtilization(target, true);
        }

    public void BindRoster
      (
      string member_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string relative_month,
      string agency_filter,
      Class_biz_enrollment.filter_type enrollment_filter = Class_biz_enrollment.filter_type.CURRENT,
      Class_biz_leave.filter_type leave_filter = Class_biz_leave.filter_type.NONE,
      Class_biz_medical_release_levels.filter_type med_release_level_filter = Class_biz_medical_release_levels.filter_type.ALL,
      uint section_filter = 0,
      bool running_only_filter = false,
      bool do_hide_staff_filter = false
      )
      {
      var any_relevant_leave = "(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))";
      sort_order = sort_order.Replace("%", (be_sort_order_ascending ? " asc" : " desc"));
      var filter = " where 1=1 ";
      filter += (agency_filter.Length > 0 ? " and agency_id = " + agency_filter + k.SPACE : k.EMPTY);
      if (enrollment_filter != Class_biz_enrollment.filter_type.ALL)
        {
        filter += " and enrollment_level.description ";
        if (enrollment_filter == Class_biz_enrollment.filter_type.CURRENT)
          {
          filter += " in ('Applicant','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Recruit','Admin'" + ",'Reduced (1)','Reduced (2)','Reduced (3)','SpecOps','Transferring','Suspended','New trainee') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.APPLICANT)
          {
          filter += " = 'Applicant' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.OPERATIONAL)
          {
          filter += " in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)'" + ",'Reduced (3)','SpecOps','New trainee') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.CORE_OPS)
          {
          filter += " in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)'" + ",'Reduced (3)','New trainee') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.STANDARD)
          {
          filter += " in ('Regular','Life','Senior','Tenured BLS','Tenured ALS') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.LIBERAL)
          {
          filter += " in ('Associate','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)'" + ",'Reduced (3)','New trainee') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.ASSOCIATE)
          {
          filter += " = 'Associate' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.REDUCED)
          {
          filter += " in ('Reduced (1)','Reduced (2)','Reduced (3)') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.REGULAR)
          {
          filter += " = 'Regular' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.LIFE)
          {
          filter += " = 'Life' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.SENIOR)
          {
          filter += " = 'Senior' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.TENURED_BLS)
          {
          filter += " = 'Tenured BLS' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.TENURED_ALS)
          {
          filter += " = 'Tenured ALS' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.STAFF)
          {
          filter += " = 'Staff' ";
          do_hide_staff_filter = false;
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.ALS_INTERN)
          {
          filter += " = 'ALS Intern' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.COLLEGE)
          {
          filter += " = 'College' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.ATYPICAL)
          {
          filter += " = 'Atypical' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.SPECOPS)
          {
          filter += " = 'SpecOps' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.RECRUIT)
          {
          filter += " = 'Recruit' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.ADMIN)
          {
          filter += " = 'Admin' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.TRANSFERRING)
          {
          filter += " = 'Transferring' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.SUSPENDED)
          {
          filter += " = 'Suspended' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.PAST)
          {
          filter += "  in ('Withdrew application','Unknown','Resigned','Retired','Disabled','Dismissed','Deceased') ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.WITHDREW_APPLICATION)
          {
          filter += " = 'Withdrew application' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.UNKNOWN)
          {
          filter += " = 'Unknown' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.RESIGNED)
          {
          filter += " = 'Resigned' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.RETIRED)
          {
          filter += " = 'Retired' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.DISABLED)
          {
          filter += " = 'Disabled' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.DISMISSED)
          {
          filter += " = 'Dismissed' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.DECEASED)
          {
          filter += " = 'Deceased' ";
          }
        else if (enrollment_filter == Class_biz_enrollment.filter_type.NEW_TRAINEE)
          {
          filter += " = 'New trainee' ";
          }
        if ((enrollment_filter >= Class_biz_enrollment.filter_type.CURRENT) && (enrollment_filter <= Class_biz_enrollment.filter_type.ADMIN))
          {
          if (leave_filter == Class_biz_leave.filter_type.OBLIGATED)
            {
            filter += " and (not(" + any_relevant_leave + ") or (leave_of_absence.start_date is null)) ";
            }
          else if (leave_filter == Class_biz_leave.filter_type.ON_LEAVE)
            {
            filter += " and " + any_relevant_leave + k.SPACE;
            }
          }
        }
      if (med_release_level_filter != Class_biz_medical_release_levels.filter_type.ALL)
        {
        filter += " and medical_release_code_description_map.description ";
        if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.NOT_RELEASED)
          {
          filter += " in ('None','Student','Test Candidate','BLS Intern') ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.NONE)
          {
          filter += " = 'none' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.IN_CLASS)
          {
          filter += " = 'Student' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.TEST_CANDIDATE)
          {
          filter += " = 'Test Candidate' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.TRAINEE)
          {
          filter += " = 'BLS Intern' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.RELEASED)
          {
          filter += " in ('EMT-B','EMT-ST','EMT-E','AEMT','EMT-CT','EMT-I','EMT-P','EMT-P-RSI') ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.RELEASED_BLS)
          {
          filter += " in ('EMT-B','EMT-ST','EMT-E','AEMT') ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_B)
          {
          filter += " = 'EMT-B' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_ST)
          {
          filter += " = 'EMT-ST' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_E)
          {
          filter += " = 'EMT-E' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.AEMT)
          {
          filter += " = 'AEMT' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.RELEASED_ALS)
          {
          filter += " in ('EMT-CT','EMT-I','EMT-P','EMT-P-RSI') ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_CT)
          {
          filter += " = 'EMT-CT' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_I)
          {
          filter += " = 'EMT-I' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_P_ANY)
          {
          filter += " in ('EMT-P','EMT-P-RSI') ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_P)
          {
          filter += " = 'EMT-P' ";
          }
        else if (med_release_level_filter == Class_biz_medical_release_levels.filter_type.EMT_P_RSI)
          {
          filter += " = 'EMT-P-RSI' ";
          }
        }
      if (section_filter > 0)
        {
        filter += " and section_num = " + ((uint)(section_filter)).ToString() + k.SPACE;
        }
      var kind_of_leave_selection_clause = "if(" + any_relevant_leave + ",kind_of_leave_code_description_map.description,'')";
      var obliged_shifts_selection_clause = "if(" + any_relevant_leave + ",num_obliged_shifts,num_shifts)";
      if (running_only_filter)
        {
        filter += " and " + obliged_shifts_selection_clause + " > 0 ";
        }
      filter += (do_hide_staff_filter ? " and enrollment_level.description <> 'Staff'" : k.EMPTY);
      var command_text = "select member.id as member_id"
      + " , last_name" 
      + " , first_name" 
      + " , cad_num" 
      + " , short_designator as agency" 
      + " , section_num" 
      + " , medical_release_code_description_map.pecking_order as medical_release_peck_code" 
      + " , medical_release_code_description_map.description as medical_release_description" 
      + " , if(be_driver_qualified,'Yes','No') as be_driver_qualified" 
      + " , enrollment_level.description as enrollment" 
      + " , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service"
      + " , core_ops_commitment_level_code" 
      + " , num_shifts as enrollment_obligation"
      + " , " + kind_of_leave_selection_clause + " as kind_of_leave" 
      + " , " + obliged_shifts_selection_clause + " as obliged_shifts" 
      + " , email_address" 
      + " , phone_num" 
      + " from member" 
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" 
      +   " join enrollment_history on" 
      +     " (" 
      +       " enrollment_history.member_id=member.id" 
      +     " and" 
      +       " (" 
      +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
      +       " and" 
      +         " (" 
      +           " (enrollment_history.end_date is null)" 
      +         " or" 
      +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
      +         " )" 
      +       " )" 
      +     " )" 
      +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
      +   " left join leave_of_absence on" 
      +     " (" 
      +       " leave_of_absence.member_id=member.id" 
      +     " and " 
      +       " (" 
      +         " (leave_of_absence.start_date is null)" 
      +       " or" 
      +         " (" 
      +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
      +         " and" 
      +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
      +         " )" 
      +       " )" 
      +     " )" 
      +   " left join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)" 
      +   " join agency on (agency.id=member.agency_id)" 
      + filter 
      + " order by " + sort_order;
      Open();
      ((target) as DataGrid).DataSource = new MySqlCommand(command_text,connection).ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    internal void BindScheduleAssignmentsAuditBaseDataList
      (
      string sort_order,
      bool be_sort_ascending,
      object target,
      k.subtype<int> relative_month,
      string agency_filter
      )
      {
      Open();
      ((target) as DataGrid).DataSource = new MySqlCommand
        (
        "select agency.short_designator as agency"
        + " , concat(member.last_name,', ',member.first_name) as name"
        + " , cad_num"
        + " , IF(medical_release_code_description_map.pecking_order >= 20,'YES','no') as be_released"
        + " , enrollment_level.description as enrollment_level"
        + " , IF(be_on_squad_truck_team,'YES','no') as be_on_squad_truck_team"
        + " , FORMAT(if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))),num_obliged_shifts,num_shifts)*12,1) as obligation"
        + " , IF(((condensed_schedule_assignment.member_id is not null) or IF(enrollment_level.description not in ('Staff','College','Atypical'),FALSE,NULL)),'yes','NO') as be_compliant"
        + " , FORMAT(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600),1) as num_avails"
        + " , FORMAT(IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0),1) as num_assignments"
        + " , FORMAT(IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0) - if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))),num_obliged_shifts,num_shifts)*12,1) as balance"
        + " , FORMAT(IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected*(post_id between 1 and 199)),0),1) as num_ambulance_hours"
        + " from member"
        +   " join agency on (agency.id=member.agency_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join enrollment_history on"
        +     " ("
        +       " enrollment_history.member_id=member.id"
        +     " and"
        +       " ("
        +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))"
        +       " and"
        +         " ("
        +           " (enrollment_history.end_date is null)"
        +         " or"
        +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)))"
        +         " )"
        +       " )"
        +     " )"
        +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
        +   " left join leave_of_absence on"
        +     " ("
        +       " leave_of_absence.member_id=member.id"
        +     " and"
        +       " ("
        +         " (leave_of_absence.start_date is null)"
        +       " or"
        +         " ("
        +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))"
        +         " and"
        +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)))"
        +         " )"
        +       " )"
        +     " )"
        +   " left join"
        +     " (select distinct member_id from schedule_assignment where MONTH(nominal_day) = MONTH(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))) as condensed_schedule_assignment on (condensed_schedule_assignment.member_id=member.id)"
        +   " left join schedule_assignment on (schedule_assignment.member_id=member.id and MONTH(nominal_day) = MONTH(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)))"
        + " where"
        +   " ("
        +     " ((MONTH(nominal_day) = MONTH(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))) or (nominal_day is null))"
        +   " and"
        +     " ("
        +       " ("
        +         " enrollment_level.description in ('Recruit','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Reduced (1)','Reduced (2)','Reduced (3)','New trainee','ALS Intern')"
        +       " and"
        +         " if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month.val.ToString() + " MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',1,num_shifts)) > 0"
        +       " )"
        +     " or"
        +       " (enrollment_level.description in ('Staff','College','Atypical','SpecOps'))"
        +     " )"
        +   " and"
        +     " (agency.id " + (agency_filter == k.EMPTY ? "<> 0" : "= '" + agency_filter + "'") + ")"
        +   " )"
        + " group by member.id"
        + " order by member.agency_id,be_released desc,last_name,first_name,cad_num",
        connection
        )
        .ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

        public void BindSpecialForRankedLengthOfService(object target)
        {
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand("select agency.id as agency" + " , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365" + " as length_of_service" + " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= CURDATE())" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(CURDATE()))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Senior\",'Tenured BLS','Tenured ALS','Staff','ALS Intern','College',\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString() + " and" + " core_ops_commitment_level_code > 1", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

    internal void BindSpecialRequestBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending, 
      object target,
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      var filter = " where month = '" + DateTime.Now.AddMonths(relative_month.val).ToString("MMM") + "'"
      + " and note is not null and note <> '' and note not like '%mesg(RETRACT)...from(OSCAR)%'";
      if (agency_filter != k.EMPTY)
        {
        filter += " and agency_id = '" + agency_filter + "'";
        }
      if (release_filter == "1")
        {
        filter += " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "0")
        {
        filter += " and medical_release_code_description_map.pecking_order < 20";
        }
      if (be_sort_order_ascending)
        {
        sort_order = sort_order.Replace("%", " asc");
        }
      else
        {
        sort_order = sort_order.Replace("%", " desc");
        }
      Open();
      (target as BaseDataList).DataSource = new MySqlCommand
        (
        "select concat(member.first_name,' ',member.last_name) as name"
        + " , member.id as member_id"
        + " , IF(medical_release_code_description_map.pecking_order >= 20,'YES','no') as be_released"
        + " , medical_release_code_description_map.watchbill_rendition as level"
        + " , note"
        + " from member"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join avail_sheet on (avail_sheet.odnmid=member.id)"
        + filter
        + " order by " + sort_order,
        connection
        )
        .ExecuteReader();
      (target as BaseDataList).DataBind();
      ((target as BaseDataList).DataSource as MySqlDataReader).Close();
      Close();
      }

        public string CadNumOf(object summary)
        {
            return (summary as member_summary).cad_num;
        }

        public string CadNumOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select cad_num from member where id = " + member_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public Queue CurrentMemberEmailAddresses
          (
          string agency_short_designator,
          bool be_core_ops_only
          )
          {
          var current_member_email_addresses = new Queue();
          var sql = "select email_address"
          + " from member"
          +   " join enrollment_history on"
          +     " ("
          +       " enrollment_history.member_id=member.id"
          +     " and"
          +       " ("
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))"
          +       " and"
          +         " ("
          +           " (enrollment_history.end_date is null)"
          +         " or"
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))"
          +         " )"
          +       " )"
          +     " )"
          +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)";
          if (agency_short_designator != k.EMPTY)
            {
            sql += " join agency on (agency.id=member.agency_id)";
            }
          sql += " where email_address is not null and email_address <> ''";
          if (be_core_ops_only)
            {
            sql += k.EMPTY
            + " and"
            +   " ("
            +     " enrollment_level.description in ('Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','Transferring','New trainee')"
            +   " or"
            +     " (enrollment_level.description = 'Recruit' and medical_release_code = '9')"
            +   " )";
            }
          else
            {
            sql += " and enrollment_level.description in ('Applicant','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Recruit','Admin','Reduced (1)','Reduced (2)','Reduced (3)','SpecOps','Transferring','Suspended','New trainee')";
            }
          if (agency_short_designator != k.EMPTY)
            {
            sql += " and agency.short_designator = '" + agency_short_designator + "'";
            }
          Open();
          var dr = new MySqlCommand(sql,connection).ExecuteReader();
          while (dr.Read())
            {
            current_member_email_addresses.Enqueue(dr["email_address"]);
            }
          dr.Close();
          Close();
          return current_member_email_addresses;
          }
        public Queue CurrentMemberEmailAddresses(string agency_short_designator)
          {
          return CurrentMemberEmailAddresses(agency_short_designator,false);
          }
        public Queue CurrentMemberEmailAddresses()
          {
          return CurrentMemberEmailAddresses("",false);
          }

        internal string EfficipaySignatureIdentifierOf(string id)
          {
          Open();
          var efficipay_signature_identifier_of =
            new MySqlCommand("select concat(cad_num,' ',LEFT(first_name,1),LOWER(SUBSTRING(first_name,2)),' ',LEFT(last_name,1),LOWER(SUBSTRING(last_name,2))) from member where id = '" + id + "'",connection).ExecuteScalar().ToString();
          Close();
          return efficipay_signature_identifier_of;
          }

        internal string EmailAddressByCadNum(string cad_num)
          {
          Open();
          var email_address_by_cad_num_obj = new MySqlCommand
            (
            "select email_address from member where cad_num = '" + cad_num + "'",
            connection
            )
            .ExecuteScalar();
          Close();
          if (email_address_by_cad_num_obj != null)
            {
            return email_address_by_cad_num_obj.ToString();
            }
          else
            {
            return k.EMPTY;
            }
          }

        public string EmailAddressOf(string member_id)
        {
            string result;
            object email_address_obj;
            this.Open();
            email_address_obj = new MySqlCommand("select email_address from member where id = \"" + member_id + "\"", this.connection).ExecuteScalar();
            if (email_address_obj != null)
            {
                result = email_address_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
            return result;
        }

        public string EnrollmentOf(object summary)
        {
            return (summary as member_summary).enrollment;
        }

        public string EnrollmentOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select description" + " from member" + " join enrollment_history on (enrollment_history.member_id=member.id)" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " where member.id = " + member_id + " and start_date <= CURDATE()" + " and ((end_date >= CURDATE()) or (end_date is null))" + " order by enrollment_history.id desc" + " limit 1", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        internal string EquivalentLengthOfServiceStartDateOf(object summary)
          {
          return (summary as member_summary).equivalent_los_start_date;
          }

        public string FirstNameOf(object summary)
        {
            return (summary as member_summary).first_name;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select first_name from member where id = '" + member_id + "'", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    internal void GetOscalertThresholdsAndSubscriptions
      (
      object summary,
      out string oscalert_threshold_general,
      out string oscalert_threshold_als,
      out bool do_oscalert_for_trap,
      out bool do_oscalert_for_airport_alert,
      out bool do_oscalert_for_mrt,
      out bool do_oscalert_for_sart
      )
      {
      oscalert_threshold_general = k.EMPTY;
      oscalert_threshold_als = k.EMPTY;
      do_oscalert_for_trap = false;
      do_oscalert_for_airport_alert = false;
      do_oscalert_for_mrt = false;
      do_oscalert_for_sart = false;
      Open();
      var dr = new MySqlCommand
        (
        "select IFNULL(general.description,'') as oscalert_threshold_general"
        + " , IFNULL(als.description,'') as oscalert_threshold_als"
        + " , do_oscalert_for_trap"
        + " , do_oscalert_for_airport_alert"
        + " , do_oscalert_for_mrt"
        + " , do_oscalert_for_sart"
        + " from member"
        +   " left join field_situation_impression general on (general.pecking_order=member.min_oscalert_peck_order_general)"
        +   " left join field_situation_impression als on (als.pecking_order=member.min_oscalert_peck_order_als)"
        + " where member.id = '" + (summary as member_summary).id + "'",
        connection
        )
        .ExecuteReader();
      if (dr.Read())
        {
        oscalert_threshold_general = dr["oscalert_threshold_general"].ToString();
        oscalert_threshold_als = dr["oscalert_threshold_als"].ToString();
        do_oscalert_for_trap = (dr["do_oscalert_for_trap"].ToString() == "1");
        do_oscalert_for_airport_alert = (dr["do_oscalert_for_airport_alert"].ToString() == "1");
        do_oscalert_for_mrt = (dr["do_oscalert_for_mrt"].ToString() == "1");
        do_oscalert_for_sart = (dr["do_oscalert_for_sart"].ToString() == "1");
        }
      dr.Close();
      Close();
      }

        public void GetProfile(string id, out string name, out bool be_valid_profile)
        {
            MySqlDataReader dr;
            this.Open();
            dr = new MySqlCommand("SELECT name," + "be_valid_profile " + "FROM member " + "WHERE id = \"" + id + "\"", this.connection).ExecuteReader();
            dr.Read();
            name = dr["name"].ToString();
            be_valid_profile = (dr["be_valid_profile"].ToString() == "1");
            dr.Close();
            this.Close();
        }

    internal void GetSmsInfoOfId
      (
      string id,
      out string email_address,
      out string phone_num_digits,
      out string carrier_name
      )
      {
      email_address = k.EMPTY;
      phone_num_digits = k.EMPTY;
      carrier_name = k.EMPTY;
      Open();
      var dr = new MySqlCommand
        (
        "select IFNULL(concat(phone_num,'@',hostname),'') as email_address"
        + " , IFNULL(phone_num,'') as phone_num_digits"
        + " , IFNULL(carrier_name,'') as carrier_name"
        + " from member"
        +   " join sms_gateway on (sms_gateway.id=member.phone_service_id)"
        + " where member.id = '" + id + "'",
        connection
        )
        .ExecuteReader();
      if (dr.Read())
        {
        email_address = dr["email_address"].ToString();
        phone_num_digits = dr["phone_num_digits"].ToString();
        carrier_name = dr["carrier_name"].ToString();
        }
      dr.Close();
      Close();
      }

    public string HighestTierOf(string id)
      {
      //
      // Note that tier_id=1 is the "highest" tier.  The default return value, therefore, indicates the lowest representable tier.
      //
      var highest_tier_of = new k.subtype<int>(0,255);
      highest_tier_of.val = highest_tier_of.LAST;
      //
      Open();
      var standard_tier_id_obj = new MySqlCommand
        ("select min(tier_id) from member join role_member_map on (role_member_map.member_id=member.id) join role on (role.id=role_member_map.role_id) where member.id = '" + id + "'",connection).ExecuteScalar();
      if ((standard_tier_id_obj != null) && (standard_tier_id_obj != DBNull.Value))
        {
        highest_tier_of.val = int.Parse(standard_tier_id_obj.ToString());
        }
      var special_tier_id_obj = new MySqlCommand
        ("select min(tier_id) from member join special_role_member_map on (special_role_member_map.member_id=member.id) join role on (role.id=special_role_member_map.role_id) where member.id = '" + id + "'",connection)
        .ExecuteScalar();
      if ((special_tier_id_obj != null) && (special_tier_id_obj != DBNull.Value))
        {
        highest_tier_of.val = Math.Min(highest_tier_of.val,int.Parse(special_tier_id_obj.ToString()));
        }
      Close();
      //
      return highest_tier_of.val.ToString();
      }

      internal Queue HoldoutQueue(bool be_before_deadline)
        {
        var holdout_q = new Queue();
        Open();
        var dr = new MySqlCommand
          (
          "select member.id as member_id"
          + " from member"
          +   " join agency on (agency.id=member.agency_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join enrollment_history on"
          +     " ("
          +       " enrollment_history.member_id=member.id"
          +     " and"
          +       " ("
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))"
          +       " and"
          +         " ("
          +           " (enrollment_history.end_date is null)"
          +         " or"
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))"
          +         " )"
          +       " )"
          +     " )"
          +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
          +   " left join leave_of_absence on"
          +     " ("
          +       " leave_of_absence.member_id=member.id"
          +     " and"
          +       " ("
          +         " (leave_of_absence.start_date is null)"
          +       " or"
          +         " ("
          +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))"
          +         " and"
          +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))"
          +         " )"
          +       " )"
          +     " )"
          +   " left join"
          +     " (select distinct odnmid from avail_sheet where month = '" + DateTime.Now.AddMonths(1).ToString("MMM") + "') as condensed_avail_sheet on (condensed_avail_sheet.odnmid=member.id)"
          +   " left join"
          +     " (select distinct member_id from schedule_assignment where MONTH(nominal_day) = MONTH(ADDDATE(CURDATE(),INTERVAL 1 MONTH))) as condensed_schedule_assignment on (condensed_schedule_assignment.member_id=member.id)"
          + " where enrollment_level.description in ('Recruit','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +   " and if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))),num_obliged_shifts,IF(medical_release_code_description_map.description = 'Student',1,IF((enrollment_level.description = 'College' and " + be_before_deadline.ToString() + "),TRUE,num_shifts)))"
          +   " and (condensed_avail_sheet.odnmid is null)"
          +   " and (condensed_schedule_assignment.member_id is null)"
          +   " and be_ok_to_nag"
          ,
          connection
          )
          .ExecuteReader();
        while (dr.Read())
          {
          holdout_q.Enqueue(dr["member_id"]);
          }
        dr.Close();
        Close();
        return holdout_q;
        }

        public string IdOf(object summary)
        {
            return (summary as member_summary).id;
        }

    internal string IdOfEmailAddress(string email_address)
      {
      Open();
      var id_of_email_address_obj = new MySqlCommand("select id from member where email_address = '" + email_address + "'",connection).ExecuteScalar();
      Close();
      return (id_of_email_address_obj == null ? k.EMPTY : id_of_email_address_obj.ToString());
      }

        public string IdOfFirstnameLastnameCadnum(string first_name, string last_name, string cad_num)
        {
            string result;
            object id_obj;
            string sql;
            sql = "select id from member where first_name = \"" + first_name + "\" and last_name = \"" + last_name + "\"";
            if (cad_num != k.EMPTY)
            {
                sql = sql + " and cad_num = \"" + cad_num + "\"";
            }
            this.Open();
            id_obj = new MySqlCommand(sql, this.connection).ExecuteScalar();
            this.Close();
            if (id_obj != null)
            {
                result = id_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            return result;
        }

        public string IdOfRoleHolder(string role_name)
        {
            string result;
            object member_id_obj;
            this.Open();
            member_id_obj = new MySqlCommand("select member.id" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role on (role.id=role_member_map.role_id)" + " join agency on (agency.id=member.agency_id)" + " where role.name = \"" + role_name + "\"", this.connection).ExecuteScalar();
            if (member_id_obj != null)
            {
                result = member_id_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
            return result;
        }

    public string IdOfRoleHolderAtAgency
      (
      string role_name,
      string agency_short_designator
      )
      {
      object member_id_obj;
      Open();
      member_id_obj = new MySqlCommand
        (
        "select member.id"
        + " from member"
        +   " join role_member_map on (role_member_map.member_id=member.id)"
        +   " join role on (role.id=role_member_map.role_id)"
        +   " join agency on (agency.id=member.agency_id)"
        + " where role.name = '" + role_name + "'"
        +   " and agency.short_designator = '" + agency_short_designator + "'",
        connection
        )
        .ExecuteScalar();
      if (member_id_obj == null)
        {
        member_id_obj = new MySqlCommand
          (
          "select member.id"
          + " from member"
          +   " join special_role_member_map on (special_role_member_map.member_id=member.id)"
          +   " join role on (role.id=special_role_member_map.role_id)"
          +   " join agency on (agency.id=special_role_member_map.agency_id)"
          + " where role.name = '" + role_name + "'"
          +   " and agency.short_designator = '" + agency_short_designator + "'",
          connection
          )
          .ExecuteScalar();
        }
      Close();
      return (member_id_obj != null ? member_id_obj.ToString() : k.EMPTY);
      }

        public string IdOfUserId(string user_id)
        {
            string result;
            object member_id_obj;
            this.Open();
            member_id_obj = new MySqlCommand("select member_id from user_member_map where user_id = " + user_id, this.connection).ExecuteScalar();
            if (member_id_obj != null)
            {
                result = member_id_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
            return result;
        }

        public string LastNameOf(object summary)
        {
            return (summary as member_summary).last_name;
        }

        public string LastNameOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select last_name from member where id = '" + member_id + "'", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    public void MakeMemberStatusStatements()
      {
      var kind_of_leave = k.EMPTY;
      var length_of_service = k.EMPTY;
      var any_relevant_leave = "(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))";
      Open();
      var dr = new MySqlCommand
        (
        "select last_name"
        + " , first_name"
        + " , cad_num"
        + " , short_designator as agency"
        + " , section_num"
        + " , medical_release_code_description_map.description as medical_release_description"
        + " , if(be_driver_qualified,'Yes','No') as be_driver_qualified"
        + " , enrollment_level.description as enrollment"
        + " , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service"
        + " , if(" + any_relevant_leave + ",kind_of_leave_code_description_map.description,'') as kind_of_leave"
        + " , if(" + any_relevant_leave + ",num_obliged_shifts,num_shifts) as obliged_shifts"
        + " , email_address"
        + " , phone_num"
        + " , IFNULL(carrier_name,'') as phone_service"
        + " , IFNULL(GROUP_CONCAT(role.name ORDER BY role.pecking_order SEPARATOR ', '),'Member') as role_list"
        + " from member"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        +   " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )"
        +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
        +   " left join leave_of_absence" + " on" + " (" + " leave_of_absence.member_id=member.id" + " and " + " (" + " (leave_of_absence.start_date is null)" + " or" + " (" + " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )"
        +   " left join kind_of_leave_code_description_map" + " on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        +   " join agency on (agency.id=member.agency_id)"
        +   " left join sms_gateway on (sms_gateway.id=member.phone_service_id)"
        +   " left join role_member_map on (role_member_map.member_id=member.id)"
        +   " left join role on (role.id=role_member_map.role_id)"
        + " where enrollment_level.description in ('Applicant','Operational','Associate','Regular','Life','Senior','Tenured BLS','Tenured ALS','Staff','ALS Intern','College','Atypical','Recruit','Admin','Reduced (1)','Reduced (2)','Reduced (3)','SpecOps','Transferring','Suspended')"
        +   " and email_address is not null"
        +   " and TRIM(email_address) <> ''"
        + " group by member.id"
        + " order by RAND()",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        length_of_service = (dr["length_of_service"] != DBNull.Value ? ((decimal)(dr["length_of_service"])).ToString("F2") + " years" : k.EMPTY);
        kind_of_leave = dr["kind_of_leave"].ToString().ToUpper();
        if (kind_of_leave == k.EMPTY)
          {
          kind_of_leave = "NONE";
          }
        biz_notifications.IssueMemberStatusStatement
          (
          dr["email_address"].ToString(),
          dr["first_name"].ToString().ToUpper(),
          dr["last_name"].ToString().ToUpper(),
          dr["cad_num"].ToString(),
          dr["agency"].ToString(),
          dr["section_num"].ToString(),
          dr["medical_release_description"].ToString().ToUpper(),
          dr["be_driver_qualified"].ToString().ToUpper(),
          dr["enrollment"].ToString().ToUpper(),
          length_of_service,
          kind_of_leave,
          dr["obliged_shifts"].ToString(),
          dr["phone_num"].ToString(),
          dr["phone_service"].ToString(),
          dr["role_list"].ToString()
          );
        }
      dr.Close();
      Close();
      }

        internal string MedicalReleaseLevelCodeOf(string id)
          {
          Open();
          var medical_release_level_code_of = new MySqlCommand("select code from member join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code) where id = '" + id + "'", connection)
            .ExecuteScalar().ToString();
          Close();
          return medical_release_level_code_of;
          }

        public string MedicalReleaseLevelOf(object summary)
        {
            return (summary as member_summary).medical_release_level;
        }

        public string MedicalReleaseLevelOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select description" + " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " where id = " + member_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string NamesSimilarTo(string first_name, string last_name, string separator)
        {
            string result;
            MySqlDataReader dr;
            string names_similar_to;
            names_similar_to = k.EMPTY;
            this.Open();
            dr = new MySqlCommand("select concat(first_name,\" \",last_name,\" (\",IFNULL(cad_num,\"\"),\")\") as hit" + " from member" + " where SUBSTRING_INDEX(DOUBLE_METAPHONE(last_name),\";\",1) in" + " (" + " SUBSTRING_INDEX(DOUBLE_METAPHONE(\"" + last_name + "\"),\";\",1)" + " ," + " SUBSTRING_INDEX(DOUBLE_METAPHONE(\"" + last_name + "\"),\";\",-1)" + " )" + " or SUBSTRING_INDEX(DOUBLE_METAPHONE(last_name),\";\",-1) in" + " (" + " SUBSTRING_INDEX(DOUBLE_METAPHONE(\"" + first_name + "\"),\";\",1)" + " ," + " SUBSTRING_INDEX(DOUBLE_METAPHONE(\"" + first_name + "\"),\";\",-1)" + " )", this.connection).ExecuteReader();
            while (dr.Read())
            {
                names_similar_to = names_similar_to + dr["hit"].ToString() + separator;
            }
            dr.Close();
            this.Close();
            result = names_similar_to;
            return result;
        }

        public string PhoneNumOf(string member_id)
        {
            string result;
            object phone_num_obj;
            this.Open();
            phone_num_obj = new MySqlCommand("select phone_num from member where id = \"" + member_id + "\"", this.connection).ExecuteScalar();
            if (phone_num_obj != null)
            {
                result = phone_num_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
            return result;
        }

        internal string PhoneNumOfSummary(object summary)
          {
          return (summary as member_summary).phone_num;
          }

        public string OverallFleetTrackingParticipation()
          {
          var result = k.EMPTY;
          Open();
          object overall_fleet_tracking_participation_obj = new MySqlCommand
            (
            "select FORMAT(value,0)"
            + " from indicator_fleet_tracking_participation"
            + " where YEAR(STR_TO_DATE(concat(year,'-',month,'-1'),'%Y-%m-%d')) = YEAR(CURDATE())"
            +   " and MONTH(STR_TO_DATE(concat(year,'-',month,'-1'),'%Y-%m-%d')) = MONTH(CURDATE())"
            +   " and not be_agency_id_applicable",
            connection
            )
            .ExecuteScalar();
          if (overall_fleet_tracking_participation_obj != null)
            {
            result = overall_fleet_tracking_participation_obj.ToString();
            }
          Close();
          return result;
          }

        public string PeckCodeOf(object summary)
        {
            return (summary as member_summary).peck_code;
        }

    public string PhoneServiceIdOf(object summary)
      {
      return (summary as member_summary).phone_service_id;
      }

    public string PhoneServiceOf(object summary)
      {
      return (summary as member_summary).phone_service;
      }

        public string RetentionOf(object summary)
        {
            return (summary as member_summary).length_of_service;
        }

        public string SectionOf(object summary)
        {
            return (summary as member_summary).section;
        }

        internal string SectionOfId(string id)
          {
          Open();
          var section_of_id = new MySqlCommand("select section_num from member where id = '" + id + "'",connection).ExecuteScalar().ToString();
          Close();
          return section_of_id;
          }

        public void SetAgency(string agency_id, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member SET agency_id = " + agency_id + " WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).agency = db_agencies.ShortDesignatorOf(agency_id);
        }

        public void SetCadNum(string cad_num, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member" + " SET cad_num = \"" + cad_num + "\"" + " WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).cad_num = cad_num;
        }

        public void SetDriverQualification(bool be_driver_qualified, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member" + " SET be_driver_qualified = " + be_driver_qualified.ToString() + " WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).be_driver_qualified = be_driver_qualified;
        }

        public void SetEmailAddress(string id, string email_address)
          {
          Open();
          new MySqlCommand(db_trail.Saved("UPDATE member" + " SET email_address = \"" + email_address + "\"" + " WHERE id = '" + id + "'"), connection).ExecuteNonQuery();
          Close();
          }

    public void SetFlightMedicQualification
      (
      bool be_flight_medic,
      object summary
      )
      {
      Open();
      new MySqlCommand(db_trail.Saved("UPDATE member SET be_flight_medic = " + be_flight_medic.ToString() + " WHERE id = '" + (summary as member_summary).id + "'"),connection).ExecuteNonQuery();
      Close();
      (summary as member_summary).be_flight_medic = be_flight_medic;
      }

    public void SetMarineMedicQualification
      (
      bool be_marine_medic,
      object summary
      )
      {
      Open();
      new MySqlCommand(db_trail.Saved("UPDATE member SET be_marine_medic = " + be_marine_medic.ToString() + " WHERE id = '" + (summary as member_summary).id + "'"),connection).ExecuteNonQuery();
      Close();
      (summary as member_summary).be_marine_medic = be_marine_medic;
      }

        public void SetName(string first, string last, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member" + " SET first_name = \"" + first + "\"" + " , last_name = \"" + last + "\"" + "  WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).first_name = first;
            (summary as member_summary).last_name = last;
        }

        public void SetSection(string section_num, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member SET section_num = " + section_num + " WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).section = section_num;
        }

        internal void SetLengthOfService
          (
          decimal length_of_service,
          object summary
          )
          {
          var length_of_service_timespan = new TimeSpan
            (
            days:(int)(length_of_service*365),
            hours:0,
            minutes:0,
            seconds:0
            );

          Open();
          new MySqlCommand(db_trail.Saved("UPDATE member SET equivalent_los_start_date = '" + (DateTime.Today - length_of_service_timespan).ToString("yyyy-MM-dd") + "' WHERE id = '" + IdOf(summary) + "'"),connection).ExecuteNonQuery();
          Close();
          (summary as member_summary).length_of_service = length_of_service.ToString("F4");
          }

    public void SetMedicalReleaseCode
      (
      string code,
      object summary
      )
      {
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "UPDATE member SET medical_release_code = '" + code + "'"
          + " , first_release_as_aic_date = IF(first_release_as_aic_date is null and (select pecking_order from medical_release_code_description_map where code = '" + code + "') >= 20,CURDATE(),first_release_as_aic_date)"
          + " WHERE id = '" + (summary as member_summary).id + "'"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      (summary as member_summary).medical_release_level = db_medical_release_levels.DescriptionOf(code);
      }

    internal void SetOscalertSettings
      (
      string phone_service_id,
      string oscalert_threshold_general,
      string oscalert_threshold_als,
      bool do_oscalert_for_trap,
      bool do_oscalert_for_airport_alert,
      bool do_oscalert_for_mrt,
      bool do_oscalert_for_sart,
      object summary
      )
      {
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "update member"
          + " set phone_service_id = '" + phone_service_id + "'"
          +   " , min_oscalert_peck_order_general = (select pecking_order from field_situation_impression where description = '" + oscalert_threshold_general + "')"
          +   " , min_oscalert_peck_order_als = (select pecking_order from field_situation_impression where description = '" + oscalert_threshold_als + "')"
          +   " , do_oscalert_for_trap = " + do_oscalert_for_trap.ToString()
          +   " , do_oscalert_for_airport_alert = " + do_oscalert_for_airport_alert.ToString()
          +   " , do_oscalert_for_mrt = " + do_oscalert_for_mrt.ToString()
          +   " , do_oscalert_for_sart = " + do_oscalert_for_sart.ToString()
          + " where id = '" + (summary as member_summary).id + "'"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      (summary as member_summary).phone_service_id = phone_service_id;
      (summary as member_summary).phone_service = biz_sms_gateways.CarrierNameOfId(id:phone_service_id);
      }

    internal void SetOscalertThresholds
      (
      string oscalert_threshold_general,
      string oscalert_threshold_als,
      bool do_clear_subscriptions,
      object summary
      )
      {
      var sql = k.EMPTY
      + "update member"
      + " set min_oscalert_peck_order_general = (select pecking_order from field_situation_impression where description = '" + oscalert_threshold_general + "')"
      + " , min_oscalert_peck_order_als = (select pecking_order from field_situation_impression where description = '" + oscalert_threshold_als + "')";
      if (do_clear_subscriptions)
        {
        sql += k.EMPTY
        + " , do_oscalert_for_trap = FALSE"
        + " , do_oscalert_for_airport_alert = FALSE"
        + " , do_oscalert_for_mrt = FALSE"
        + " , do_oscalert_for_sart = FALSE";
        }
      Open();
      new MySqlCommand(db_trail.Saved(sql + " where id = '" + (summary as member_summary).id + "'"),connection).ExecuteNonQuery();
      Close();
      }

    public void SetPhoneNumAndClearCellularProvider(string phone_num, object summary)
      {
      Open();
      new MySqlCommand(db_trail.Saved("UPDATE member SET phone_num = '" + phone_num + "', phone_service_id = NULL WHERE id = '" + (summary as member_summary).id) + "'",connection).ExecuteNonQuery();
      Close();
      (summary as member_summary).phone_num = phone_num;
      (summary as member_summary).phone_service_id = k.EMPTY;
      (summary as member_summary).phone_service = k.EMPTY;
      }

        public void SetProfile(string id, string name)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member " + "SET name = \"" + name + "\"" + ", be_valid_profile = TRUE " + "WHERE id = \"" + id + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

    public void SetSquadTruckTeamQualification
      (
      bool be_on_squad_truck_team,
      object summary
      )
      {
      Open();
      new MySqlCommand(db_trail.Saved("UPDATE member SET be_on_squad_truck_team = " + be_on_squad_truck_team.ToString() + " WHERE id = '" + (summary as member_summary).id + "'"),connection).ExecuteNonQuery();
      Close();
      (summary as member_summary).be_on_squad_truck_team = be_on_squad_truck_team;
      }

        public object Summary
          (
          string member_id,
          string relative_month = "0"
          )
          {
          member_summary the_summary = null;
          var be_found = false;
          Open();
          var dr = new MySqlCommand
            (
            "select last_name" 
            + " , first_name" 
            + " , cad_num" 
            + " , short_designator as agency" 
            + " , agency_id"
            + " , section_num" 
            + " , medical_release_code_description_map.pecking_order as medical_release_peck_code" 
            + " , medical_release_code_description_map.description as medical_release_description" 
            + " , IF(first_release_as_aic_date is not null and first_release_as_aic_date > '0001-01-01',DATE_FORMAT(first_release_as_aic_date,'%Y-%m-%d'),'') as first_release_as_aic_date"
            + " , be_driver_qualified" 
            + " , enrollment_level.description as enrollment" 
            + " , IF(enrollment_level.description in ('Withdrew application','Resigned','Retired','Disabled','Unknown','Dismissed','Deceased'),'',(TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365) as length_of_service"
            + " , phone_num" 
            + " , IFNULL(phone_service_id,'') as phone_service_id"
            + " , IFNULL(sms_gateway.carrier_name,'') as phone_service"
            + " , IFNULL(DATE_FORMAT(equivalent_los_start_date,'%Y-%m-%d'),'') as equivalent_los_start_date"
            + " , be_placeholder"
            + " , be_flight_medic"
            + " , be_marine_medic"
            + " , be_on_squad_truck_team"
            + " from member" 
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" 
            +   " join enrollment_history on" 
            +     " (" 
            +       " enrollment_history.member_id=member.id" 
            +     " and" 
            +       " (" 
            +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
            +       " and" 
            +         " (" 
            +           " (enrollment_history.end_date is null)" 
            +         " or" 
            +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
            +         " )" 
            +       " )" 
            +     " )" 
            +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
            +   " join agency on (agency.id=member.agency_id)"
            +   " left join sms_gateway on (sms_gateway.id=member.phone_service_id)"
            + " where member.id = '" + member_id + "'",
            connection
            )
            .ExecuteReader();
          be_found = dr.Read();
          if (!be_found)
            {
            //
            // This is the zebra case where the member has been set up to transition to a new status at date that is in the future but still within this month, and so will not match any row given the above query.  Since we
            // must provide *some* summary, re-run the query without the call to LAST_DAY.  We could probably combine these two queries, but the above has proven so reliable for so long that we're reticent to modify it for
            // the sake of a zebra case.
            //
            dr.Close();
            dr = new MySqlCommand
              (
              "select last_name" 
              + " , first_name" 
              + " , cad_num" 
              + " , short_designator as agency" 
              + " , agency_id"
              + " , section_num" 
              + " , medical_release_code_description_map.pecking_order as medical_release_peck_code" 
              + " , medical_release_code_description_map.description as medical_release_description" 
              + " , IF(first_release_as_aic_date is not null and first_release_as_aic_date > '0001-01-01',DATE_FORMAT(first_release_as_aic_date,'%Y-%m-%d'),'') as first_release_as_aic_date"
              + " , be_driver_qualified" 
              + " , enrollment_level.description as enrollment" 
              + " , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service"
              + " , phone_num"
              + " , IFNULL(phone_service_id,'') as phone_service_id"
              + " , IFNULL(sms_gateway.carrier_name,'') as phone_service"
              + " , IFNULL(DATE_FORMAT(equivalent_los_start_date,'%Y-%m-%d'),'') as equivalent_los_start_date"
              + " , be_placeholder"
              + " , be_flight_medic"
              + " , be_marine_medic"
              + " , be_on_squad_truck_team"
              + " from member" 
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" 
              +   " join enrollment_history on" 
              +     " (" 
              +       " enrollment_history.member_id=member.id" 
              +     " and" 
              +       " (" 
              +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
              +       " and" 
              +         " (" 
              +           " (enrollment_history.end_date is null)" 
              +         " or" 
              +           " (enrollment_history.end_date >= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" // no LAST_DAY
              +         " )" 
              +       " )" 
              +     " )" 
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
              +   " join agency on (agency.id=member.agency_id)"
              +   " left join sms_gateway on (sms_gateway.id=member.phone_service_id)"
              + " where member.id = '" + member_id + "'",
              connection
              )
              .ExecuteReader();
            be_found = dr.Read();
            }
          if (be_found)
            {
            the_summary = new member_summary()
              {
              agency = dr["agency"].ToString(),
              agency_id = dr["agency_id"].ToString(),
              be_driver_qualified = (dr["be_driver_qualified"].ToString() == "1"),
              cad_num = dr["cad_num"].ToString(),
              enrollment = dr["enrollment"].ToString(),
              equivalent_los_start_date = dr["equivalent_los_start_date"].ToString(),
              first_name = dr["first_name"].ToString(),
              id = member_id,
              last_name = dr["last_name"].ToString(),
              medical_release_level = dr["medical_release_description"].ToString(),
              first_release_as_aic_date = dr["first_release_as_aic_date"].ToString(),
              length_of_service = dr["length_of_service"].ToString(),
              peck_code = dr["medical_release_peck_code"].ToString(),
              phone_num = dr["phone_num"].ToString(),
              phone_service_id = dr["phone_service_id"].ToString(),
              phone_service = dr["phone_service"].ToString(),
              section = dr["section_num"].ToString(),
              be_placeholder = (dr["be_placeholder"].ToString() == "1"),
              be_flight_medic = (dr["be_flight_medic"].ToString() == "1"),
              be_marine_medic = (dr["be_marine_medic"].ToString() == "1"),
              be_on_squad_truck_team = (dr["be_on_squad_truck_team"].ToString() == "1")
              };
            }
          dr.Close();
          Close();
          return the_summary;
          }

        public string UserIdOf(string member_id)
        {
            string result;
            object user_id_obj;
            this.Open();
            user_id_obj = new MySqlCommand("select user_id from user_member_map where member_id = " + member_id, this.connection).ExecuteScalar();
            if (user_id_obj != null)
            {
                result = user_id_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
            return result;
        }

    } // end TClass_db_members

}

