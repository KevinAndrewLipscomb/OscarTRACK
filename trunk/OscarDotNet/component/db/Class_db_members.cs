using Class_biz_enrollment;
using Class_biz_medical_release_levels;
using Class_biz_leave;
using Class_biz_notifications;
using Class_biz_sections;
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
          + " sum("
          +   " if"
          +     " (" 
          +       " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))"
          +       " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))),"
          +     " num_obliged_shifts,"
          +     " num_shifts"
          +     " )"
          +   " )/2 as num_crew_shifts"
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
          +     " enrollment_level.description in ('Associate','Regular','Life','Tenured','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +   " and"
          +     " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
          }

    }

    public class member_summary
      {
      public string agency;
      public bool be_driver_qualified;
      public string cad_num;
      public string enrollment;
      public string first_name;
      public string id;
      public string last_name;
      public string medical_release_level;
      public string length_of_service;
      public string peck_code;
      public string phone_num;
      public string section;
      }

    public class TClass_db_members: TClass_db
    {
        private TClass_biz_notifications biz_notifications = null;
        private TClass_db_agencies db_agencies = null;
        private TClass_db_medical_release_levels db_medical_release_levels = null;
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_members() : base()
        {
            // TODO: Add any constructor code here
            biz_notifications = new TClass_biz_notifications();
            db_agencies = new TClass_db_agencies();
            db_medical_release_levels = new TClass_db_medical_release_levels();
            db_trail = new TClass_db_trail();
        }
        public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date, uint enrollment_code, string phone_num)
        {
            string enrollment_date_string;
            string sql;
            enrollment_date_string = enrollment_date.ToString("yyyy-MM-dd");
            sql = "START TRANSACTION;" + " insert into member" + " set first_name = \"" + first_name.ToUpper() + "\"" + " , last_name = \"" + last_name.ToUpper() + "\"";
            if (cad_num != k.EMPTY)
            {
                sql = sql + " , cad_num = \"" + cad_num + "\"";
            }
            sql = sql + " , email_address = \"" + email_address + "\"" + " , medical_release_code = " + medical_release_code.ToString() + " , be_driver_qualified = " + be_driver_qualified.ToString() + " , agency_id = " + agency_id.ToString() + " , phone_num = \"" + phone_num + "\"";
            if (new ArrayList(new uint[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 18, 21}).Contains(enrollment_code))
            {
                sql = sql + " , equivalent_los_start_date = \"" + enrollment_date_string + "\"";
            }
            sql = sql + ";" + " insert into enrollment_history" + " set member_id = (select max(id) from member)" + " , level_code = " + enrollment_code.ToString() + " , start_date = \"" + enrollment_date_string + "\"" + ";" + " COMMIT";
            this.Open();
            new MySqlCommand(db_trail.Saved(sql), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date)
        {
            Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, 17);
        }

        public void Add(string first_name, string last_name, string cad_num, uint medical_release_code, bool be_driver_qualified, uint agency_id, string email_address, DateTime enrollment_date, uint enrollment_code)
        {
            Add(first_name, last_name, cad_num, medical_release_code, be_driver_qualified, agency_id, email_address, enrollment_date, enrollment_code, "");
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

        public bool BeDriverQualifiedOf(object summary)
        {
            return (summary as member_summary).be_driver_qualified;
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

        internal bool BeRoleHolderByCadNum(string cad_num)
          {
          Open();
          var result = ("1" == new MySqlCommand("select (count(role_id) > 0) from member join role_member_map on (role_member_map.member_id=member.id) where cad_num = '" + cad_num + "'",connection).ExecuteScalar().ToString());
          Close();
          return result;
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
            where_clause = " where (enrollment_level.description in (\"Applicant\",\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\"," + "\"Recruit\",\"Admin\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"SpecOps\",\"Transferring\",\"Suspended\",\"New trainee\"))";
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

        public void BindRankedCoreOpsSize(object target, bool do_log)
        {
            string from_where_phrase;
            string metric_phrase;
            metric_phrase = " count(*)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
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
                +       " enrollment_level.description in ('Associate','Regular','Life','Tenured','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
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
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " (enrollment_level.description in (\"Recruit\",\"New trainee\"))" + " or" + " (" + " enrollment_level.description in (\"Regular\")" + " and" + " medical_release_code_description_map.pecking_order < " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString() + " )";
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
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
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
          +     " enrollment_level.description in ('Recruit','Regular') and medical_release_code_description_map.description in ('EMT Intern','Trainee'),"
          +     " if"
          +       " (" 
          +         " (leave_of_absence.start_date <= CURDATE())"
          +         " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
          +       " num_obliged_shifts,"
          +       " if(enrollment_level.description = 'Regular',num_shifts,2)"  // assume an EMT Intern not on leave will occupy 2 shifts
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
          +           " enrollment_level.description in ('Associate','Regular','Life','Tenured','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
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
          +     " enrollment_level.description in ('Associate','Recruit','Regular','Life','Tenured','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
          +   " and"
          +     " ("
          +       " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString()
          +     " or"
          +       " medical_release_code_description_map.description in ('EMT Intern','Trainee')"
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
                + " , " + metric_phrase + "*100"
                +     from_where_phrase
                +   " group by agency.id"
                + ";"
                // Log citywide indicator.
                + " replace indicator_third_slot_saturation (year,month,be_agency_id_applicable,agency_id,value)"
                +   " select YEAR(CURDATE())"
                +   " , MONTH(CURDATE())"
                +   " , FALSE"
                +   " , 0"
                + " , " + metric_phrase + "*100"
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
            +       " enrollment_level.description in ('Recruit','Regular') and medical_release_code_description_map.description in ('EMT Intern','Trainee'),"
            +       " if"
            +         " (" 
            +           " (leave_of_absence.start_date <= CURDATE())"
            +           " and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),"
            +         " num_obliged_shifts,"
            +         " if(enrollment_level.description = 'Regular',num_shifts,2)"  // assume an EMT Intern not on leave will occupy 2 shifts
            +         " ),"
            +       " 0"
            +       " )"
            +     " ) as num_third_shifts"
            + " , sum("
            +     " if"
            +       " ("
            +         " ("
            +           " enrollment_level.description in ('Associate','Regular','Life','Tenured','Atypical','Reduced (1)','Reduced (2)','Reduced (3)','New trainee')"
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
            metric_phrase = " sum(" + " if" + " (" + " (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE()))," + " num_obliged_shifts," + " num_shifts" + " )" + " )/sum(num_shifts)";
            from_where_phrase = " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " left join leave_of_absence" + " on" + " (" + " leave_of_absence.member_id=member.id" + " and " + " (" + " (leave_of_absence.start_date is null)" + " or" + " (" + " (leave_of_absence.start_date <= CURDATE())" + " and" + " (leave_of_absence.end_date >= LAST_DAY(CURDATE()))" + " )" + " )" + " )" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString();
            this.Open();
            if (do_log)
            {
                // Log squad-by-squad indicators.
                // Log citywide indicator.
                new MySqlCommand(db_trail.Saved("START TRANSACTION;" + " replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , TRUE" + " , agency.id" + " , " + metric_phrase + "*100" + from_where_phrase + " group by agency.id" + ";" + " replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)" + " select YEAR(CURDATE())" + " , MONTH(CURDATE())" + " , FALSE" + " , 0" + " , " + metric_phrase + "*100" + from_where_phrase + ";" + " COMMIT"), this.connection).ExecuteNonQuery();
            }
            // Bind datagrid for display.
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , sum(" + " if" + " (" + " (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE()))," + " num_obliged_shifts," + " num_shifts" + " )" + " ) as num_cooked_shifts" + " , sum(num_shifts) as num_raw_shifts" + " , " + metric_phrase + " as utilization" + from_where_phrase + " group by agency.id" + " order by utilization desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedUtilization(object target)
        {
            BindRankedUtilization(target, true);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter, uint section_filter, bool running_only_filter)
        {
            string any_relevant_leave;
            string command_text;
            string filter;
            string kind_of_leave_selection_clause;
            string obliged_shifts_selection_clause;
            any_relevant_leave = "(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))";
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            filter = " where 1=1 ";
            if (agency_filter != k.EMPTY)
            {
                filter = filter + " and agency_id = " + agency_filter + k.SPACE;
            }
            if (enrollment_filter != Class_biz_enrollment.filter_type.ALL)
            {
                filter = filter + " and enrollment_level.description ";
                switch(enrollment_filter)
                {
                    case Class_biz_enrollment.filter_type.CURRENT:
                        filter = filter + " in (\"Applicant\",\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Recruit\",\"Admin\"" + ",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"SpecOps\",\"Transferring\",\"Suspended\",\"New trainee\") ";
                        break;
                    case Class_biz_enrollment.filter_type.APPLICANT:
                        filter = filter + " = \"Applicant\" ";
                        break;
                    case Class_biz_enrollment.filter_type.OPERATIONAL:
                        filter = filter + " in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\"" + ",\"Reduced (3)\",\"SpecOps\",\"New trainee\") ";
                        break;
                    case Class_biz_enrollment.filter_type.STANDARD_OPS:
                        filter = filter + " in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\"" + ",\"Reduced (3)\",\"New trainee\") ";
                        break;
                    case Class_biz_enrollment.filter_type.ASSOCIATE:
                        filter = filter + " = \"Associate\" ";
                        break;
                    case Class_biz_enrollment.filter_type.REDUCED:
                        filter = filter + " in (\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\") ";
                        break;
                    case Class_biz_enrollment.filter_type.REGULAR:
                        filter = filter + " = \"Regular\" ";
                        break;
                    case Class_biz_enrollment.filter_type.LIFE:
                        filter = filter + " = \"Life\" ";
                        break;
                    case Class_biz_enrollment.filter_type.TENURED:
                        filter = filter + " = \"Tenured\" ";
                        break;
                    case Class_biz_enrollment.filter_type.ATYPICAL:
                        filter = filter + " = \"Atypical\" ";
                        break;
                    case Class_biz_enrollment.filter_type.SPECOPS:
                        filter = filter + " = \"SpecOps\" ";
                        break;
                    case Class_biz_enrollment.filter_type.RECRUIT:
                        filter = filter + " = \"Recruit\" ";
                        break;
                    case Class_biz_enrollment.filter_type.ADMIN:
                        filter = filter + " = \"Admin\" ";
                        break;
                    case Class_biz_enrollment.filter_type.TRANSFERRING:
                        filter = filter + " = \"Transferring\" ";
                        break;
                    case Class_biz_enrollment.filter_type.SUSPENDED:
                        filter = filter + " = \"Suspended\" ";
                        break;
                    case Class_biz_enrollment.filter_type.PAST:
                        filter = filter + "  in (\"Withdrew application\",\"Unknown\",\"Resigned\",\"Retired\",\"Disabled\",\"Dismissed\") ";
                        break;
                    case Class_biz_enrollment.filter_type.WITHDREW_APPLICATION:
                        filter = filter + " = \"Withdrew application\" ";
                        break;
                    case Class_biz_enrollment.filter_type.UNKNOWN:
                        filter = filter + " = \"Unknown\" ";
                        break;
                    case Class_biz_enrollment.filter_type.RESIGNED:
                        filter = filter + " = \"Resigned\" ";
                        break;
                    case Class_biz_enrollment.filter_type.RETIRED:
                        filter = filter + " = \"Retired\" ";
                        break;
                    case Class_biz_enrollment.filter_type.DISABLED:
                        filter = filter + " = \"Disabled\" ";
                        break;
                    case Class_biz_enrollment.filter_type.DISMISSED:
                        filter = filter + " = \"Dismissed\" ";
                        break;
                    case Class_biz_enrollment.filter_type.DECEASED:
                        filter = filter + " = \"Deceased\" ";
                        break;
                    case Class_biz_enrollment.filter_type.NEW_TRAINEE:
                        filter = filter + " = \"New trainee\" ";
                        break;
                }
                switch(enrollment_filter)
                {
                    // Modify the A .. B: Class_biz_enrollment.filter_type.CURRENT .. Class_biz_enrollment.filter_type.ADMIN
                    case Class_biz_enrollment.filter_type.CURRENT:
                        switch(leave_filter)
                        {
                            case Class_biz_leave.filter_type.OBLIGATED:
                                filter = filter + " and (not(" + any_relevant_leave + ") or (leave_of_absence.start_date is null)) ";
                                break;
                            case Class_biz_leave.filter_type.ON_LEAVE:
                                filter = filter + " and " + any_relevant_leave + k.SPACE;
                                break;
                        }
                        break;
                }
            }
            if (med_release_level_filter != Class_biz_medical_release_levels.filter_type.ALL)
            {
                filter = filter + " and medical_release_code_description_map.description ";
                switch(med_release_level_filter)
                {
                    case Class_biz_medical_release_levels.filter_type.NOT_RELEASED:
                        filter = filter + " in (\"None\",\"EMT Intern\",\"Trainee\") ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.NONE:
                        filter = filter + " = \"none\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.IN_CLASS:
                        filter = filter + " = \"EMT Intern\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.TRAINEE:
                        filter = filter + " = \"Trainee\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.RELEASED:
                        filter = filter + " in (\"EMT-B\",\"EMT-ST\",\"EMT-E\",\"EMT-CT\",\"EMT-I\",\"EMT-P\") ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_B:
                        filter = filter + " = \"EMT-B\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_ST:
                        filter = filter + " = \"EMT-ST\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_E:
                        filter = filter + " = \"EMT-E\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_CT:
                        filter = filter + " = \"EMT-CT\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_I:
                        filter = filter + " = \"EMT-I\" ";
                        break;
                    case Class_biz_medical_release_levels.filter_type.EMT_P:
                        filter = filter + " = \"EMT-P\" ";
                        break;
                }
            }
            if (section_filter > 0)
            {
                filter = filter + " and section_num = " + ((uint)(section_filter)).ToString() + k.SPACE;
            }
            kind_of_leave_selection_clause = "if(" + any_relevant_leave + ",kind_of_leave_code_description_map.description,\"\")";
            obliged_shifts_selection_clause = "if(" + any_relevant_leave + ",num_obliged_shifts,num_shifts)";
            if (running_only_filter)
            {
                filter = filter + " and " + obliged_shifts_selection_clause + " > 0 ";
            }
            // column 1
            // column 2
            // column 3
            // column 4
            // column 5
            // column 6
            // column 7
            // column 8
            // column 9
            // column 10
            // column 11
            // column 12
            // column 13
            // column 14
            // column 15
            // column 16
            // column 17
            command_text = "select member.id as member_id"
            + " , last_name" 
            + " , first_name" 
            + " , cad_num" 
            + " , short_designator as agency" 
            + " , section_num" 
            + " , medical_release_code_description_map.pecking_order as medical_release_peck_code" 
            + " , medical_release_code_description_map.description as medical_release_description" 
            + " , if(be_driver_qualified,\"Yes\",\"No\") as be_driver_qualified" 
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
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand(command_text, this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, Class_biz_enrollment.filter_type.CURRENT);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, Class_biz_leave.filter_type.BOTH);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, Class_biz_medical_release_levels.filter_type.ALL);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, med_release_level_filter, 0);
        }

        public void BindRoster(string member_id, string sort_order, bool be_sort_order_ascending, object target, string relative_month, string agency_filter, Class_biz_enrollment.filter_type enrollment_filter, Class_biz_leave.filter_type leave_filter, Class_biz_medical_release_levels.filter_type med_release_level_filter, uint section_filter)
        {
            BindRoster(member_id, sort_order, be_sort_order_ascending, target, relative_month, agency_filter, enrollment_filter, leave_filter, med_release_level_filter, section_filter, false);
        }

        public void BindSpecialForRankedLengthOfService(object target)
        {
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand("select agency.id as agency" + " , (TO_DAYS(CURDATE()) - TO_DAYS((select min(start_date) from enrollment_history where member_id = member.id and level_code in (1,2,3,4,5,6,7,8,9,18))))/365" + " as length_of_service" + " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= CURDATE())" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(CURDATE()))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " join agency on (agency.id=member.agency_id)" + " where" + " enrollment_level.description in (\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"New trainee\")" + " and" + " medical_release_code_description_map.pecking_order >= " + ((uint)(Class_db_medical_release_levels_Static.LOWEST_RELEASED_PECK_CODE)).ToString() + " and" + " core_ops_commitment_level_code > 1", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
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

        public Queue CurrentMemberEmailAddresses(string agency_short_designator)
        {
            Queue result;
            Queue current_member_email_addresses;
            MySqlDataReader dr;
            string sql;
            current_member_email_addresses = new Queue();
            sql = "select email_address" + " from member" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)";
            if (agency_short_designator != k.EMPTY)
            {
                sql = sql + " join agency on (agency.id=member.agency_id)";
            }
            sql = sql + " where email_address is not null" + " and email_address <> \"\"" + " and enrollment_level.description in" + " (" + " \"Applicant\"" + " , \"Associate\"" + " , \"Regular\"" + " , \"Life\"" + " , \"Tenured\"" + " , \"Atypical\"" + " , \"Recruit\"" + " , \"Admin\"" + " , \"Reduced (1)\"" + " , \"Reduced (2)\"" + " , \"Reduced (3)\"" + " , \"SpecOps\"" + " , \"Transferring\"" + " , \"Suspended\"" + " , \"New trainee\"" + " )";
            if (agency_short_designator != k.EMPTY)
            {
                sql = sql + " and agency.short_designator = \"" + agency_short_designator + "\"";
            }
            this.Open();
            dr = new MySqlCommand(sql, this.connection).ExecuteReader();
            while (dr.Read())
            {
                current_member_email_addresses.Enqueue(dr["email_address"]);
            }
            dr.Close();
            this.Close();
            result = current_member_email_addresses;

            return result;
        }

        public Queue CurrentMemberEmailAddresses()
        {
            return CurrentMemberEmailAddresses("");
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

        public string FirstNameOf(object summary)
        {
            return (summary as member_summary).first_name;
        }

        public string FirstNameOfMemberId(string member_id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select first_name from member where id = " + member_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
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

        public string HighestTierOf(string id)
        {
            string result;
            object tier_id_obj;
            // Note that tier_id=1 is the "highest" tier.
            this.Open();
            tier_id_obj = new MySqlCommand("select min(tier_id)" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role on (role.id=role_member_map.role_id)" + " where member.id = " + id, this.connection).ExecuteScalar();
            if (tier_id_obj != null)
            {
                result = tier_id_obj.ToString();
            }
            else
            {
                result = Int32.MaxValue.ToString();
            }
            this.Close();
            return result;
        }

        public string IdOf(object summary)
        {
            return (summary as member_summary).id;
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

        public string IdOfRoleHolderAtAgency(string role_name, string agency_short_designator)
        {
            string result;
            object member_id_obj;
            this.Open();
            member_id_obj = new MySqlCommand("select member.id" + " from member" + " join role_member_map on (role_member_map.member_id=member.id)" + " join role on (role.id=role_member_map.role_id)" + " join agency on (agency.id=member.agency_id)" + " where role.name = \"" + role_name + "\"" + " and agency.short_designator = \"" + agency_short_designator + "\"", this.connection).ExecuteScalar();
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
            result = new MySqlCommand("select last_name from member where id = " + member_id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public void MakeMemberStatusStatements()
        {
            string any_relevant_leave;
            MySqlDataReader dr;
            string kind_of_leave;
            string length_of_service;
            any_relevant_leave = "(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))";
            this.Open();
            dr = new MySqlCommand("select last_name" + " , first_name" + " , cad_num" + " , short_designator as agency" + " , section_num" + " , medical_release_code_description_map.description as medical_release_description" + " , if(be_driver_qualified,\"Yes\",\"No\") as be_driver_qualified" + " , enrollment_level.description as enrollment" + " , (TO_DAYS(CURDATE()) - TO_DAYS((select min(start_date) from enrollment_history where member_id = member.id and level_code in (1,2,3,4,5,6,7,8,9,18))))/365" + " as length_of_service" + " , if(" + any_relevant_leave + ",kind_of_leave_code_description_map.description,\"\") as kind_of_leave" + " , if(" + any_relevant_leave + ",num_obliged_shifts,num_shifts) as obliged_shifts" + " , email_address" + " , phone_num" + " from member" + " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" + " join enrollment_history" + " on" + " (" + " enrollment_history.member_id=member.id" + " and" + " (" + " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (" + " (enrollment_history.end_date is null)" + " or" + " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " left join leave_of_absence" + " on" + " (" + " leave_of_absence.member_id=member.id" + " and " + " (" + " (leave_of_absence.start_date is null)" + " or" + " (" + " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))" + " and" + " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))" + " )" + " )" + " )" + " left join kind_of_leave_code_description_map" + " on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)" + " join agency on (agency.id=member.agency_id)" + " where enrollment_level.description in (\"Applicant\",\"Operational\",\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\"" + " , \"Recruit\",\"Admin\",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"SpecOps\",\"Transferring\",\"Suspended\")" + " and email_address is not null" + " and TRIM(email_address) <> \"\"" + " order by RAND()", this.connection).ExecuteReader();
            while (dr.Read())
            {
                if (dr["length_of_service"] != DBNull.Value)
                {
                    length_of_service = ((decimal)(dr["length_of_service"])).ToString("F2") + " years";
                }
                else
                {
                    length_of_service = k.EMPTY;
                }
                kind_of_leave = dr["kind_of_leave"].ToString().ToUpper();
                if (kind_of_leave == k.EMPTY)
                {
                    kind_of_leave = "NONE";
                }
                biz_notifications.IssueMemberStatusStatement(dr["email_address"].ToString(), dr["first_name"].ToString().ToUpper(), dr["last_name"].ToString().ToUpper(), dr["cad_num"].ToString(), dr["agency"].ToString(), dr["section_num"].ToString(), dr["medical_release_description"].ToString().ToUpper(), dr["be_driver_qualified"].ToString().ToUpper(), dr["enrollment"].ToString().ToUpper(), length_of_service, kind_of_leave, dr["obliged_shifts"].ToString(), dr["phone_num"].ToString());
            }
            dr.Close();
            this.Close();
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
            this.Close();
            result = names_similar_to;
            return result;
        }

        public string OfficershipOf(string member_id)
        {
            string result;
            object rank_name_obj;
            this.Open();
            rank_name_obj = new MySqlCommand("select rank.name" + " from member join officership on (officership.member_id=member.id)" + " join rank on (rank.code=officership.rank_code)" + " where member.id = " + member_id, this.connection).ExecuteScalar();
            if (rank_name_obj != null)
            {
                result = rank_name_obj.ToString();
            }
            else
            {
                result = k.EMPTY;
            }
            this.Close();
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

        public string RetentionOf(object summary)
        {
            return (summary as member_summary).length_of_service;
        }

        public string SectionOf(object summary)
        {
            return (summary as member_summary).section;
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
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member" + " SET email_address = \"" + email_address + "\"" + " WHERE id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
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

        public void SetMedicalReleaseCode(string code, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member SET medical_release_code = " + code + " WHERE id = '" + (summary as member_summary).id + "'"), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).medical_release_level = db_medical_release_levels.DescriptionOf(code);
        }

        public void SetPhoneNum(string phone_num, object summary)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member SET phone_num = " + phone_num + " WHERE id = " + (summary as member_summary).id), this.connection).ExecuteNonQuery();
            this.Close();
            (summary as member_summary).phone_num = k.FormatAsNanpPhoneNum(phone_num);
        }

        public void SetProfile(string id, string name)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("UPDATE member " + "SET name = \"" + name + "\"" + ", be_valid_profile = TRUE " + "WHERE id = \"" + id + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public object Summary(string member_id)
          {
          this.Open();
          var dr =
            (
            new MySqlCommand
              (
              "select last_name" 
              + " , first_name" 
              + " , cad_num" 
              + " , short_designator as agency" 
              + " , section_num" 
              + " , medical_release_code_description_map.pecking_order as medical_release_peck_code" 
              + " , medical_release_code_description_map.description as medical_release_description" 
              + " , be_driver_qualified" 
              + " , enrollment_level.description as enrollment" 
              + " , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service"
              + " , phone_num" 
              + " from member" 
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)" 
              +   " join enrollment_history on" 
              +     " (" 
              +       " enrollment_history.member_id=member.id" 
              +     " and" 
              +       " (" 
              +         " (enrollment_history.start_date <= CURDATE())" 
              +       " and" 
              +         " (" 
              +           " (enrollment_history.end_date is null)" 
              +         " or" 
              +           " (enrollment_history.end_date >= LAST_DAY(CURDATE()))" 
              +         " )" 
              +       " )" 
              +     " )" 
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
              +   " join agency on (agency.id=member.agency_id)"
              + " where member.id = '" + member_id + "'",
              connection
              )
              .ExecuteReader()
            );
          dr.Read();
          var the_summary = new member_summary()
            {
            agency = dr["agency"].ToString(),
            be_driver_qualified = (dr["be_driver_qualified"].ToString() == "1"),
            cad_num = dr["cad_num"].ToString(),
            enrollment = dr["enrollment"].ToString(),
            first_name = dr["first_name"].ToString(),
            id = member_id,
            last_name = dr["last_name"].ToString(),
            medical_release_level = dr["medical_release_description"].ToString(),
            length_of_service = dr["length_of_service"].ToString(),
            peck_code = dr["medical_release_peck_code"].ToString(),
            phone_num = dr["phone_num"].ToString(),
            section = dr["section_num"].ToString()
            };
          dr.Close();
          this.Close();
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

