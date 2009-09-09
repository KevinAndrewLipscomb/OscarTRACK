using MySql.Data.MySqlClient;
using kix;
using System;


using System.Collections;
using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using Class_db_members;
namespace Class_db_agencies
{
    public struct commensuration_rec_type
    {
        public string agency_id;
        public decimal commensuration_factor;
        public bool be_agency_id_applicable;
    } // end commensuration_rec_type

    public struct serial_indicator_rec_type
    {
        public uint year;
        public uint month;
        public double value;
    } // end serial_indicator_rec_type

    public class TClass_db_agencies: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_agencies() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool Bind(string partial_short_designator, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT short_designator FROM agency WHERE short_designator like \"" + partial_short_designator + "%\" order by short_designator", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["short_designator"].ToString(), dr["short_designator"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        private void BindListControl(string unselected_literal, string designator_clause, object target, string selected_id)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, ""));
            }
            dr = new MySqlCommand("SELECT id" + " , " + designator_clause + " as designator" + " from agency" + " where be_active = TRUE" + " order by short_designator", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["designator"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            if (selected_id != k.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_id;
            }
            this.Close();
        }

        private void BindListControl(string unselected_literal, string designator_clause, object target)
        {
            BindListControl(unselected_literal, designator_clause, target, "");
        }

        public void BindListControlShort(object target, string selected_id, bool be_available_option_all, string unselected_literal)
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

        public void BindListControlShort(object target)
        {
            BindListControlShort(target, "");
        }

        public void BindListControlShort(object target, string selected_id)
        {
            BindListControlShort(target, selected_id, true);
        }

        public void BindListControlShort(object target, string selected_id, bool be_available_option_all)
        {
            BindListControlShort(target, selected_id, be_available_option_all, "All");
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

        public void BindListControlShortDashLong(object target)
        {
            BindListControlShortDashLong(target, "");
        }

        public void BindListControlShortDashLong(object target, string selected_id)
        {
            BindListControlShortDashLong(target, selected_id, true);
        }

        public void BindListControlShortDashLong(object target, string selected_id, bool be_available_option_all)
        {
            BindListControlShortDashLong(target, selected_id, be_available_option_all, "-- Select --");
        }

        public void BindForCommensuration(object target)
        {
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand("select agency.id as agency_id" + " , concat(medium_designator,\" - \",long_designator) as designator" + " , " + Class_db_members_Static.CrewShiftsForecastMetricFromWhereClause("1") + " and agency.id < 200" + " and be_active" + " group by agency.id" + " order by agency.id", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindForControlCharts(string indicator, object target)
        {
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand("select distinct if(be_agency_id_applicable,concat(medium_designator,\" - \",long_designator),\"CITYWIDE\") as designator" + " , id" + " , be_agency_id_applicable" + " from indicator_" + indicator + " join agency on (agency.id=indicator_" + indicator + ".agency_id)" + " order by be_agency_id_applicable,id", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindRankedCommensuration(object target)
        {
            this.Open();
            ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , value" + " from indicator_commensuration" + " join agency on (agency.id=indicator_commensuration.agency_id)" + " where year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and be_agency_id_applicable = TRUE" + " order by value desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void Delete(string short_designator)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("delete from agency where short_designator = " + short_designator), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public bool Get(string short_designator, out string medium_designator, out string long_designator, out bool be_active)
        {
            bool result;
            MySqlDataReader dr;

            medium_designator = k.EMPTY;
            long_designator = k.EMPTY;
            be_active = false;
            result = false;
            this.Open();
            dr = new MySqlCommand("select * from agency where short_designator = \"" + short_designator + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                short_designator = dr["short_designator"].ToString();
                medium_designator = dr["medium_designator"].ToString();
                long_designator = dr["long_designator"].ToString();
                be_active = (dr["be_active"].ToString() == "1");
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public string IdOfShortDesignator(string short_designator)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select id from agency where short_designator = \"" + short_designator + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string LongDesignatorOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select long_designator from agency where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string MediumDesignatorOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select medium_designator from agency where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string OverallCommensuration()
        {
            string result;
            object overall_commensuration_obj;
            result = k.EMPTY;
            this.Open();
            overall_commensuration_obj = new MySqlCommand("select FORMAT(value,0)" + " from indicator_commensuration" + " where year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and not be_agency_id_applicable", this.connection).ExecuteScalar();
            if (overall_commensuration_obj != null)
            {
                result = overall_commensuration_obj.ToString();
            }
            this.Close();
            return result;
        }

        public Queue SerialIndicatorData(string indicator, string agency_id, string be_agency_id_applicable)
        {
            Queue result;
            string additional_where_clause;
            MySqlDataReader dr;
            string dependent_parameter_name;
            serial_indicator_rec_type serial_indicator_rec;
            Queue serial_indicator_rec_q;
            if (indicator == "median_length_of_service")
            {
                dependent_parameter_name = "m";
                additional_where_clause = " and be_trendable";
            }
            else
            {
                dependent_parameter_name = "value";
                additional_where_clause = k.EMPTY;
            }
            serial_indicator_rec_q = new Queue();
            this.Open();
            dr = new MySqlCommand("select year,month," + dependent_parameter_name + " from indicator_" + indicator + " where agency_id = " + agency_id + " and be_agency_id_applicable = " + be_agency_id_applicable + additional_where_clause, this.connection).ExecuteReader();
            while (dr.Read())
            {
                serial_indicator_rec.year = uint.Parse(dr["year"].ToString());
                serial_indicator_rec.month = uint.Parse(dr["month"].ToString());
                serial_indicator_rec.value = System.Double.Parse(dr[dependent_parameter_name].ToString());
                serial_indicator_rec_q.Enqueue(serial_indicator_rec);
            }
            dr.Close();
            this.Close();
            result = serial_indicator_rec_q;

            return result;
        }

        public void Set(string short_designator, string medium_designator, string long_designator, bool be_active)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("replace agency" + " set short_designator = \"" + short_designator + "\"" + " , medium_designator = \"" + medium_designator + "\"" + " , long_designator = \"" + long_designator + "\"" + " , be_active = " + be_active.ToString()), this.connection).ExecuteNonQuery();
            this.Close();
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
            for (i = 1; i <= commensuration_rec_q.Count; i ++ )
            {
                commensuration_rec = (commensuration_rec_type)(commensuration_rec_q.Dequeue());
                sql = sql + " (" + year + k.COMMA + month + k.COMMA + commensuration_rec.be_agency_id_applicable.ToString() + k.COMMA + commensuration_rec.agency_id + k.COMMA + (commensuration_rec.commensuration_factor * 100).ToString("F0") + " ),";
            }
            this.Open();
            new MySqlCommand(db_trail.Saved(sql.Substring(0, sql.Length - 1)), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public string ShortDesignatorOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select short_designator from agency where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    } // end TClass_db_agencies

}
