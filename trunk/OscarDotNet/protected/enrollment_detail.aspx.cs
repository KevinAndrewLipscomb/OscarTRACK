using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


using Class_biz_enrollment;
using Class_biz_members;
using Class_biz_user;
using appcommon;
namespace enrollment_detail
{
    public partial class TWebForm_enrollment_detail: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_member_history.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid_member_history_ItemCommand);
            this.DataGrid_member_history.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_member_history_ItemDataBound);
            this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_enrollment_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - enrollment_detail";
                Label_member_designator.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]) + " (CAD # " + p.cad_num_string + ")";
                LinkButton_add_new_enrollment_status.Visible = p.biz_members.BeUserAuthorizedToEditEnrollments(p.biz_members.IdOfUserId(p.biz_user.IdNum()), Session["e_item"], k.Has((string[])(Session["privilege_array"]), "edit-enrollments"), k.Has((string[])(Session["privilege_array"]), "edit-enrollments-of-trainees-only"));
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
                if ((Session["enrollment_detail.p"] != null))
                {
                    p = (p_type)(Session["enrollment_detail.p"]);
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
                    p.biz_user = new TClass_biz_user();
                    p.num_datagrid_rows = 0;
                    p.cad_num_string = p.biz_members.CadNumOf(Session["e_item"]);
                    if (p.cad_num_string == k.EMPTY)
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
            SessionSet("enrollment_detail.p", p);
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
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
            }
        }

        private void Bind()
        {
            p.biz_enrollment.BindMemberHistory(p.biz_members.IdOf(Session["e_item"]), DataGrid_member_history);
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
            public TClass_biz_enrollment biz_enrollment;
            public TClass_biz_members biz_members;
            public TClass_biz_user biz_user;
            public string cad_num_string;
            public uint num_datagrid_rows;
        } // end p_type

    } // end TWebForm_enrollment_detail

}
