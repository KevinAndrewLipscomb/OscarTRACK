using appcommon;
using Class_biz_enrollment;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_user;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace enrollment_detail
{
    public partial class TWebForm_enrollment_detail: ki_web_ui.page_class
    {

    private static class Static
      {
      public const int TCCI_ID = 0;
      public const int TCCI_START_DATE = 1;
      public const int TCCI_DESCRIPTION = 2;
      public const int TCCI_NOTE = 3;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataGrid_member_history.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(DataGrid_member_history_ItemCommand);
            DataGrid_member_history.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_member_history_ItemDataBound);
            PreRender += TWebForm_enrollment_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - enrollment_detail";
            if (!IsPostBack)
            {
                Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + p.cad_num_string + ")";
                var priv_of_interest = "edit-enrollments";
                LinkButton_add_new_enrollment_status.Visible = p.biz_members.BeUserAuthorizedToEditEnrollments(p.biz_members.IdOfUserId(p.biz_user.IdNum()), Session["member_summary"], k.Has((string[])(Session["privilege_array"]),priv_of_interest), k.Has((string[])(Session["privilege_array"]), "edit-enrollments-of-trainees-only"))
                  || p.biz_privileges.HasForSpecialAgency(member_id:p.user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);
                Bind();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session[InstanceId() + ".p"] != null))
                {
                    p = (p_type)(Session[InstanceId() + ".p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    p.biz_enrollment = new TClass_biz_enrollment();
                    p.biz_members = new TClass_biz_members();
                    p.biz_privileges = new TClass_biz_privileges();
                    p.biz_user = new TClass_biz_user();
                    //
                    var priv_of_interest = k.EMPTY;
                    var target_member_id = p.biz_members.IdOf(Session["member_summary"]);
                    //
                    p.target_member_agency_id = p.biz_members.AgencyIdOf(Session["member_summary"]);
                    p.user_member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
                    //
                    priv_of_interest = "see-personnel-status-notes";
                    p.be_user_privileged_to_see_personnel_status_notes = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && p.biz_members.BeAuthorizedTierOrSameAgency(p.user_member_id,target_member_id))
                      || p.biz_privileges.HasForSpecialAgency(member_id:p.user_member_id,privilege_name:priv_of_interest,agency_id:p.target_member_agency_id);;
                    p.num_datagrid_rows = 0;
                    p.cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (p.cad_num_string.Length == 0)
                    {
                        p.cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                }
            }
        }

        protected void LinkButton_add_new_enrollment_status_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("add_new_enrollment_status.aspx");
        }

        private void TWebForm_enrollment_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        private void DataGrid_member_history_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                if (e.CommandName == "Select")
                {
                    ((System.Collections.Stack)(Session["waypoint_stack"])).Push("emsof_request_status_filter.aspx");
                    Server.Transfer("full_request_review_approve.aspx");
                }
            }
        }

        private void DataGrid_member_history_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                p.num_datagrid_rows++;
            }
        }

        private void Bind()
        {
            DataGrid_member_history.Columns[Static.TCCI_NOTE].Visible = p.be_user_privileged_to_see_personnel_status_notes;
            p.biz_enrollment.BindMemberHistory(p.biz_members.IdOf(Session["member_summary"]), DataGrid_member_history);
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            DataGrid_member_history.Visible = !p.be_datagrid_empty;
            // Clear aggregation vars for next bind, if any.
            p.num_datagrid_rows = 0;

        }

        private struct p_type
        {
            public bool be_datagrid_empty;
            public bool be_user_privileged_to_see_personnel_status_notes;
            public TClass_biz_enrollment biz_enrollment;
            public TClass_biz_members biz_members;
            public TClass_biz_privileges biz_privileges;
            public TClass_biz_user biz_user;
            public string cad_num_string;
            public uint num_datagrid_rows;
            public string target_member_agency_id;
            public string user_member_id;
        }

    } // end TWebForm_enrollment_detail

}
