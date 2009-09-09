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


using Class_biz_members;
using Class_biz_officerships;
using appcommon;
using Class_db_officerships;
namespace officership_detail
{
    public partial class TWebForm_officership_detail: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_officerships.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid_officerships_ItemCommand);
            this.DataGrid_officerships.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_officerships_ItemDataBound);
            this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_officership_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string cad_num_string;
            if (IsPostBack)
            {
                if ((Session["officership_detail.p"] != null))
                {
                    p = (p_type)(Session["officership_detail.p"]);
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
                    Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - officership_detail";
                    // Initialize implementation-wide vars.
                    p.biz_members = new TClass_biz_members();
                    p.biz_officerships = new TClass_biz_officerships();
                    p.num_datagrid_rows = 0;
                    cad_num_string = p.biz_members.CadNumOf(Session["e_item"]);
                    if (cad_num_string == k.EMPTY)
                    {
                        cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    Label_member_designator.Text = p.biz_members.FirstNameOf(Session["e_item"]) + k.SPACE + p.biz_members.LastNameOf(Session["e_item"]) + " (CAD # " + cad_num_string + ")";
                    Bind();
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        private void TWebForm_officership_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("officership_detail.p", p);
        }

        private void DataGrid_officerships_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
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

        private void DataGrid_officerships_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                if (e.Item.Cells[Class_db_officerships_Static.TCCI_END_DATE].Text == "&nbsp;")
                {
                    e.Item.Cells[Class_db_officerships_Static.TCCI_END_DATE].Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                }
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
            }
        }

        private void Bind()
        {
            p.biz_officerships.Bind(p.biz_members.IdOf(Session["e_item"]), DataGrid_officerships);
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            DataGrid_officerships.Visible = !p.be_datagrid_empty;
            // Clear aggregation vars for next bind, if any.
            p.num_datagrid_rows = 0;

        }

        private struct p_type
        {
            public bool be_datagrid_empty;
            public TClass_biz_members biz_members;
            public TClass_biz_officerships biz_officerships;
            public uint num_datagrid_rows;
        } // end p_type

    } // end TWebForm_officership_detail

}
