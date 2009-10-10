using System.Configuration;

using kix;

using System;

using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;




using System.Collections;
using Class_biz_agencies;
using Class_biz_enrollment;
using Class_biz_leave;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_sections;
using Class_biz_user;
using appcommon;
using Class_db_members;
namespace UserControl_roster
{
    public partial class TWebUserControl_roster: ki_web_ui.usercontrol_class
    {
        private p_type p;

        private struct p_type
        {
            public string agency_filter;
            public bool be_datagrid_empty;
            public bool be_loaded;
            public bool be_phone_list;
            public bool be_sort_order_ascending;
            public bool be_user_privileged_to_see_all_squads;
            public TClass_biz_agencies biz_agencies;
            public TClass_biz_enrollment biz_enrollment;
            public TClass_biz_leave biz_leave;
            public TClass_biz_medical_release_levels biz_medical_release_levels;
            public TClass_biz_members biz_members;
            public TClass_biz_sections biz_sections;
            public TClass_biz_user biz_user;
            public string distribution_list;
            public Class_biz_enrollment.filter_type enrollment_filter;
            public Class_biz_leave.filter_type leave_filter;
            public Class_biz_medical_release_levels.filter_type med_release_level_filter;
            public uint num_cooked_shifts;
            // takes into account leaves
            public uint num_core_ops_members;
            public uint num_datagrid_rows;
            public uint num_raw_shifts;
            // does not take into account leaves
            public uint num_standard_commitments;
            public string page_request_rawurl;
            public uint relative_month;
            public bool running_only_filter;
            public uint section_filter;
            public string sort_order;
            public ArrayList years_of_service_array_list;
        } // end p_type

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                LinkButton_add_member.Visible = k.Has((string[])(Session["privilege_array"]), "add-members");
                p.biz_agencies.BindListControlShort(DropDownList_agency_filter);
                DropDownList_agency_filter.SelectedValue = p.agency_filter;
                p.biz_sections.BindListControl(DropDownList_section_filter, "0*");
                DropDownList_section_filter.SelectedValue = ((uint)(p.section_filter)).ToString();
                TableData_section_filter.Visible = p.agency_filter != k.EMPTY;
                DropDownList_med_release_filter.SelectedValue = ((Class_biz_medical_release_levels.filter_type)(p.med_release_level_filter)).ToString().ToLower();
                DropDownList_enrollment_filter.SelectedValue = ((Class_biz_enrollment.filter_type)(p.enrollment_filter)).ToString().ToLower();
                RadioButtonList_which_month.SelectedValue = p.relative_month.ToString();
                DropDownList_leave_filter.SelectedValue = ((Class_biz_leave.filter_type)(p.leave_filter)).ToString().ToLower();
                CheckBox_running_only.Checked = p.running_only_filter;
                CheckBox_phone_list.Checked = p.be_phone_list;
                if (Session["mode:report"] == null)
                {
                    Label_author_email_address.Text = p.biz_user.EmailAddress();
                    ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_member);
                }
                else
                {
                    R.Enabled = false;
                    R.Columns[Class_db_members.Class_db_members_Static.TCCI_DRILLDOWN_LINKBUTTON].Visible = false;
                    R.AllowSorting = false;
                    DropDownList_leave_filter.Enabled = false;
                    DropDownList_enrollment_filter.Enabled = false;
                    RadioButtonList_which_month.Enabled = false;
                    LinkButton_add_member.Enabled = false;
                    DropDownList_med_release_filter.Enabled = false;
                    DropDownList_section_filter.Enabled = false;
                    TextBox_quick_message_subject.Enabled = false;
                    TextBox_quick_message_body.Enabled = false;
                    RequiredFieldValidator_quick_message_body.Enabled = false;
                    Button_send.Enabled = false;
                    DropDownList_agency_filter.Enabled = false;
                    CheckBox_running_only.Enabled = false;
                    CheckBox_phone_list.Enabled = false;
                }
                Bind();
                Anchor_quick_message_shortcut.HRef = p.page_request_rawurl + "#QuickMessage";
                Anchor_quick_message_shortcut.Visible = k.Has((string[])(Session["privilege_array"]), "send-quickmessages");
                Table_quick_message.Visible = k.Has((string[])(Session["privilege_array"]), "send-quickmessages");
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_roster.p"] != null)
            {
                p = (p_type)(Session["UserControl_roster.p"]);
                // only necessary because the roster is a special case that is deliberately not always freshened by its parent binder
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "P") && ((Session["M_P_PlaceHolder_content"] as string) == "R");
            }
            else
            {
                p.be_loaded = false;
                p.biz_agencies = new TClass_biz_agencies();
                p.biz_enrollment = new TClass_biz_enrollment();
                p.biz_leave = new TClass_biz_leave();
                p.biz_medical_release_levels = new TClass_biz_medical_release_levels();
                p.biz_members = new TClass_biz_members();
                p.biz_sections = new TClass_biz_sections();
                p.biz_user = new TClass_biz_user();
                p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
                if (p.be_user_privileged_to_see_all_squads)
                {
                    p.agency_filter = k.EMPTY;
                }
                else
                {
                    p.agency_filter = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
                }
                p.be_sort_order_ascending = true;
                p.enrollment_filter = Class_biz_enrollment.filter_type.CURRENT;
                p.distribution_list = k.EMPTY;
                p.leave_filter = Class_biz_leave.filter_type.BOTH;
                p.med_release_level_filter = Class_biz_medical_release_levels.filter_type.ALL;
                p.be_phone_list = (Session["mode:report/monthly-current-phone-list"] != null);
                p.section_filter = 0;
                p.num_cooked_shifts = 0;
                p.num_core_ops_members = 0;
                p.num_datagrid_rows = 0;
                p.num_raw_shifts = 0;
                p.num_standard_commitments = 0;
                p.page_request_rawurl = Page.Request.RawUrl;
                p.relative_month = 0;
                p.running_only_filter = false;
                p.sort_order = "last_name,first_name,cad_num";
                p.years_of_service_array_list = new ArrayList();
                if (HttpContext.Current.User.IsInRole("Squad Scheduler") || HttpContext.Current.User.IsInRole("Department Scheduler") || (Session["mode:report/monthly-core-ops-roster"] != null))
                {
                    p.enrollment_filter = Class_biz_enrollment.filter_type.STANDARD_OPS;
                    p.relative_month = 1;
                }
                else if (Session["mode:report/monthly-emt-intern-roster"] != null)
                {
                    p.enrollment_filter = Class_biz_enrollment.filter_type.CURRENT;
                    p.relative_month = 0;
                    p.med_release_level_filter = Class_biz_medical_release_levels.filter_type.IN_CLASS;
                }
                else if (Session["mode:report/monthly-trainee-roster"] != null)
                {
                    p.enrollment_filter = Class_biz_enrollment.filter_type.CURRENT;
                    p.relative_month = 0;
                    p.med_release_level_filter = Class_biz_medical_release_levels.filter_type.TRAINEE;
                }
                else if (Session["mode:report/monthly-applicant-roster"] != null)
                {
                    p.enrollment_filter = Class_biz_enrollment.filter_type.APPLICANT;
                    p.relative_month = 0;
                }
                else if (Session["mode:report/monthly-recruits-who-are-not-yet-emt-interns-roster"] != null)
                {
                    p.enrollment_filter = Class_biz_enrollment.filter_type.RECRUIT;
                    p.relative_month = 0;
                    p.med_release_level_filter = Class_biz_medical_release_levels.filter_type.NONE;
                }
            }

        }

        protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            bool saved_checkbox_phone_list_enabled;
            p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue, k.safe_hint_type.NUM);
            TableData_section_filter.Visible = (p.agency_filter != k.EMPTY);
            // Always reset section filter when agency filter changes.
            DropDownList_section_filter.SelectedIndex = 0;
            p.section_filter = 0;
            saved_checkbox_phone_list_enabled = CheckBox_phone_list.Enabled;
            CheckBox_phone_list.Enabled = (p.agency_filter == p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()))) || p.be_user_privileged_to_see_all_squads || p.biz_agencies.BeOkToSharePhoneListWithSiblings(p.agency_filter);
            if (CheckBox_phone_list.Enabled != saved_checkbox_phone_list_enabled)
            {
                CheckBox_phone_list.Checked = false;
                p.be_phone_list = false;
            }
            Bind();
        }

        protected void Button_send_Click(object sender, System.EventArgs e)
        {
            // from
            // to
            // subject
            // body
            // be_html
            // cc
            // bcc
            // reply_to
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], Label_distribution_list.Text, TextBox_quick_message_subject.Text, "-- From " + p.biz_user.Roles()[0] + k.SPACE + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + k.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString()) + " (" + p.biz_user.EmailAddress() + ") [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE + k.NEW_LINE + TextBox_quick_message_body.Text, false, k.EMPTY, p.biz_user.EmailAddress(), p.biz_user.EmailAddress());
            TextBox_quick_message_subject.Text = k.EMPTY;
            TextBox_quick_message_body.Text = k.EMPTY;
            Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "messagsnt", "Message sent", true);
            // Apparently we must call RegisterPostBackControl on all the linkbuttons again.
            Bind();

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.R.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.R_ItemDataBound);
            this.R.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.R_SortCommand);
            this.R.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.R_ItemCommand);
            this.PreRender += this.TWebUserControl_roster_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void DropDownList_section_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.section_filter = uint.Parse(DropDownList_section_filter.SelectedValue);
            Bind();
        }

        protected void DropDownList_med_release_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.med_release_level_filter = (Class_biz_medical_release_levels.filter_type)(Class_biz_medical_release_levels.filter_type.Parse((p.med_release_level_filter).GetType(), DropDownList_med_release_filter.SelectedValue, true));
            Bind();
        }

        protected void LinkButton_add_member_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("add_member.aspx");
        }

        protected void RadioButtonList_which_month_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.relative_month = uint.Parse(RadioButtonList_which_month.SelectedValue);
            Bind();
        }

        protected void DropDownList_leave_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.leave_filter = (Class_biz_leave.filter_type)(Class_biz_leave.filter_type.Parse((p.leave_filter).GetType(), DropDownList_leave_filter.SelectedValue, true));
            Bind();
        }

        protected void DropDownList_enrollment_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.enrollment_filter = (Class_biz_enrollment.filter_type)(Class_biz_enrollment.filter_type.Parse((p.enrollment_filter).GetType(), DropDownList_enrollment_filter.SelectedValue, true));
            switch(p.enrollment_filter)
            {
                // Modify the A .. B: Class_biz_enrollment.filter_type.CURRENT .. Class_biz_enrollment.filter_type.ADMIN
                case Class_biz_enrollment.filter_type.CURRENT:
                    Label_leave_filter.Enabled = true;
                    DropDownList_leave_filter.Enabled = true;
                    break;
                default:
                    Label_leave_filter.Enabled = false;
                    DropDownList_leave_filter.SelectedIndex = 0;
                    DropDownList_leave_filter.Enabled = false;
                    p.leave_filter = Class_biz_leave.filter_type.NONE;
                    break;
            }
            Bind();
        }

        private void R_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.EditItem, ListItemType.Item, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
            {
                // We are dealing with a data row, not a header or footer row.
                SessionSet("member_summary",p.biz_members.Summary(k.Safe(e.Item.Cells[Class_db_members_Static.TCCI_ID].Text,k.safe_hint_type.NUM)));
                DropCrumbAndTransferTo("member_detail.aspx");
            }
        }

        private void R_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.EditItem, ListItemType.Item, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
            {
                // We are dealing with a data row, not a header or footer row.
                ((e.Item.Cells[Class_db_members_Static.TCCI_DRILLDOWN_LINKBUTTON].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_members_Static.TCCI_DRILLDOWN_LINKBUTTON].Controls[0]) as LinkButton).Text);
                if (!(Session["mode:report"] != null))
                {
                    ScriptManager.GetCurrent(Page).RegisterPostBackControl(((e.Item.Cells[Class_db_members_Static.TCCI_DRILLDOWN_LINKBUTTON].Controls[0]) as LinkButton));
                }
                if (e.Item.Cells[Class_db_members_Static.TCCI_CAD_NUM].Text == "&nbsp;")
                {
                    e.Item.Cells[Class_db_members_Static.TCCI_CAD_NUM].Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                if (p.biz_enrollment.BePastDescription(e.Item.Cells[Class_db_members_Static.TCCI_ENROLLMENT].Text))
                {
                    e.Item.Cells[Class_db_members_Static.TCCI_LENGTH_OF_SERVICE].Text = "&nbsp;";
                }
                if (p.biz_medical_release_levels.BeReleased(e.Item.Cells[Class_db_members_Static.TCCI_MEDICAL_RELEASE_PECK_CODE].Text))
                {
                    if (e.Item.Cells[Class_db_members_Static.TCCI_ENROLLMENT_OBLIGATION].Text != "&nbsp;")
                    {
                        p.num_raw_shifts = p.num_raw_shifts + uint.Parse(e.Item.Cells[Class_db_members_Static.TCCI_ENROLLMENT_OBLIGATION].Text);
                    }
                    if (e.Item.Cells[Class_db_members_Static.TCCI_OBLIGED_SHIFTS].Text != "&nbsp;")
                    {
                        p.num_cooked_shifts = p.num_cooked_shifts + uint.Parse(e.Item.Cells[Class_db_members_Static.TCCI_OBLIGED_SHIFTS].Text);
                    }
                    if (e.Item.Cells[Class_db_members_Static.TCCI_COMMITMENT_LEVEL_CODE].Text.CompareTo("1") > 0)
                    {
                        p.num_core_ops_members = p.num_core_ops_members + 1;
                        if (e.Item.Cells[Class_db_members_Static.TCCI_LENGTH_OF_SERVICE].Text != "&nbsp;")
                        {
                            p.years_of_service_array_list.Add(decimal.Parse(e.Item.Cells[Class_db_members_Static.TCCI_LENGTH_OF_SERVICE].Text));
                        }
                        if (e.Item.Cells[Class_db_members_Static.TCCI_COMMITMENT_LEVEL_CODE].Text == "3")
                        {
                            p.num_standard_commitments = p.num_standard_commitments + 1;
                        }
                    }
                }
                if (e.Item.Cells[Class_db_members_Static.TCCI_EMAIL_ADDRESS].Text != "&nbsp;")
                {
                    p.distribution_list = p.distribution_list + e.Item.Cells[Class_db_members_Static.TCCI_EMAIL_ADDRESS].Text + k.COMMA_SPACE;
                }
                if (e.Item.Cells[Class_db_members_Static.TCCI_PHONE_NUM].Text != k.EMPTY)
                {
                    e.Item.Cells[Class_db_members_Static.TCCI_PHONE_NUM].Text = k.FormatAsNanpPhoneNum(e.Item.Cells[Class_db_members_Static.TCCI_PHONE_NUM].Text);
                }
                //
                // Remove all cell controls from viewstate except for the one at TCCI_ID.
                //
                foreach (TableCell cell in e.Item.Cells)
                  {
                  cell.EnableViewState = false;
                  }
                e.Item.Cells[Class_db_members_Static.TCCI_ID].EnableViewState = true;
                //
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
            }

        }

        private void TWebUserControl_roster_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_roster.p", p);
        }

        private void R_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
        {
            if (e.SortExpression == p.sort_order)
            {
                p.be_sort_order_ascending = !p.be_sort_order_ascending;
            }
            else
            {
                p.sort_order = k.Safe(e.SortExpression, k.safe_hint_type.KI_SORT_EXPRESSION);
                p.be_sort_order_ascending = true;
            }
            R.EditItemIndex =  -1;
            Bind();
        }

        private void Bind()
        {
            bool be_raw_shifts_nonzero;
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_AGENCY].Visible = (p.agency_filter == k.EMPTY);
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_SECTION_NUM].Visible = (p.agency_filter != k.EMPTY) && (p.section_filter == 0);
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_MEDICAL_RELEASE_LEVEL].Visible = !p.biz_medical_release_levels.BeLeaf(p.med_release_level_filter) && (!(p.enrollment_filter == Class_biz_enrollment.filter_type.ADMIN));
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_ENROLLMENT].Visible = !p.biz_enrollment.BeLeaf(p.enrollment_filter);
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_LENGTH_OF_SERVICE].Visible = !p.be_phone_list;
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_LEAVE].Visible = (p.leave_filter != Class_biz_leave.filter_type.OBLIGATED);
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_OBLIGED_SHIFTS].Visible = !(p.enrollment_filter == Class_biz_enrollment.filter_type.ADMIN);
            R.Columns[Class_db_members.Class_db_members_Static.TCCI_PHONE_NUM].Visible = p.be_phone_list;
            p.biz_members.BindRoster(Session["member_id"].ToString(), p.sort_order, p.be_sort_order_ascending, R, p.relative_month.ToString(), p.agency_filter, p.enrollment_filter, p.leave_filter, p.med_release_level_filter, p.section_filter, p.running_only_filter);
            be_raw_shifts_nonzero = (p.num_raw_shifts > 0);
            Label_core_ops_commitment_factor.Visible = be_raw_shifts_nonzero;
            Label_core_ops_commitment_caption.Visible = be_raw_shifts_nonzero;
            Label_utilization.Visible = be_raw_shifts_nonzero;
            Label_utilization_caption.Visible = be_raw_shifts_nonzero;
            Label_num_crew_shifts.Text = decimal.Divide(Convert.ToDecimal(p.num_cooked_shifts),2).ToString();
            Label_num_rows.Text = p.num_datagrid_rows.ToString();
            Table_years_of_service_percentiles.Visible = (p.num_core_ops_members > 0);
            if (be_raw_shifts_nonzero)
            {
                Label_utilization.Text = decimal.Divide(Convert.ToDecimal(p.num_cooked_shifts),Convert.ToDecimal(p.num_raw_shifts)).ToString("P0");
            }
            if (p.num_core_ops_members > 0)
            {
                Label_core_ops_commitment_factor.Text = decimal.Divide(Convert.ToDecimal(p.num_standard_commitments),Convert.ToDecimal(p.num_core_ops_members)).ToString("P0");
                p.years_of_service_array_list.Sort();
                Label_percentile_25_value.Text = k.Percentile(25, p.years_of_service_array_list).ToString("F2");
                Label_median_value.Text = k.Median(p.years_of_service_array_list).ToString("F2");
                Label_percentile_75_value.Text = k.Percentile(75, p.years_of_service_array_list).ToString("F2");
            }
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            TableRow_data.Visible = !p.be_datagrid_empty;
            Table_quick_message.Visible = k.Has((string[])(Session["privilege_array"]), "send-quickmessages") && !p.be_datagrid_empty && !p.be_phone_list;
            Label_distribution_list.Text = (p.distribution_list + k.SPACE).TrimEnd(new char[] {Convert.ToChar(k.COMMA), Convert.ToChar(k.SPACE)});
            // Clear aggregation vars for next bind, if any.
            p.distribution_list = k.EMPTY;
            p.num_cooked_shifts = 0;
            p.num_core_ops_members = 0;
            p.num_datagrid_rows = 0;
            p.num_raw_shifts = 0;
            p.num_standard_commitments = 0;
            p.years_of_service_array_list.Clear();
            if (!(Session["mode:report"] != null))
            {
                ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_member);
            }

        }

        public TWebUserControl_roster Fresh()
        {
            TWebUserControl_roster result;
            Session.Remove("UserControl_roster.p");
            result = this;
            return result;
        }

        protected void CheckBox_phone_list_CheckedChanged(object sender, System.EventArgs e)
        {
            p.be_phone_list = CheckBox_phone_list.Checked;
            Anchor_quick_message_shortcut.Visible = !p.be_phone_list;
            Table_quick_message.Visible = !p.be_phone_list;
            Bind();
        }

        protected void CheckBox_running_only_CheckedChanged(object sender, System.EventArgs e)
        {
            p.running_only_filter = CheckBox_running_only.Checked;
            Bind();
        }

    } // end TWebUserControl_roster

}