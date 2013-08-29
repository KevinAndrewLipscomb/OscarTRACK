using appcommon;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_user;
using Class_db_leaves;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace leave_detail
{

  public static class leave_detail_Static
    {
    public const int TCCI_ID = 0;
    public const int TCCI_START_DATE = 1;
    public const int TCCI_END_DATE = 2;
    public const int TCCI_KIND_OF_LEAVE = 3;
    public const int TCCI_NUM_OBLIGED_SHIFTS = 4;
    public const int TCCI_NOTE = 5;
    public const int TCCI_EDIT = 6;
    public const int TCCI_DELETE = 7;
    }

    public partial class TWebForm_leave_detail: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_leaves.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid_leaves_ItemCommand);
            this.DataGrid_leaves.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid_leaves_SortCommand);
            this.DataGrid_leaves.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid_leaves_DeleteCommand);
            this.DataGrid_leaves.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_leaves_ItemDataBound);
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_leave_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - leave_detail";
                Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + p.cad_num_string + ")";
                LinkButton_new.Visible = (p.be_user_privileged_to_grant_leave && !p.biz_members.BeTransferring(Session["member_summary"]));
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
                    p.biz_leaves = new TClass_biz_leaves();
                    p.biz_members = new TClass_biz_members();
                    p.biz_user = new TClass_biz_user();
                    p.be_sort_order_ascending = false;
                    p.be_user_privileged_to_grant_leave = k.Has((string[])(Session["privilege_array"]), "grant-leave") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), p.biz_members.IdOf(Session["member_summary"]));
                    p.be_user_privileged_to_see_personnel_status_notes = k.Has((string[])(Session["privilege_array"]), "see-personnel-status-notes") && p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum()), p.biz_members.IdOf(Session["member_summary"]));
                    p.num_datagrid_rows = 0;
                    p.sort_order = "start_date%";
                    p.cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (p.cad_num_string == k.EMPTY)
                    {
                        p.cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                }
            }
        }

        private void DataGrid_leaves_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                SessionSet("leave_item", e.Item);
                ((Session["waypoint_stack"]) as Stack).Push("leave_detail.aspx");
                Server.Transfer("change_leave.aspx");
            }
        }

        private void DataGrid_leaves_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            p.biz_leaves.Delete(k.Safe(e.Item.Cells[(int)(p.biz_leaves.TcciOfId())].Text, k.safe_hint_type.NUM));
            DataGrid_leaves.EditItemIndex =  -1;
            Bind();
        }

        protected void LinkButton_new_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("grant_leave.aspx");
        }

        private void TWebForm_leave_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        private void DataGrid_leaves_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                switch(p.biz_leaves.RelativityOf(e.Item.Cells[Class_db_leaves_Static.TCCI_START_DATE].Text, e.Item.Cells[Class_db_leaves_Static.TCCI_END_DATE].Text))
                {
                    case Class_biz_leaves.relativity_type.PAST:
                        ((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
                        ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
                        break;
                    case Class_biz_leaves.relativity_type.ESTABLISHED:
                        ((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
                        if ((e.Item.Cells[leave_detail_Static.TCCI_KIND_OF_LEAVE].Text == "Medical") && !k.Has((string[])(Session["privilege_array"]),"clear-medical-leave"))
                          {
                          ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
                          }
                        else
                          {
                          ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
                          }
                        break;
                    case Class_biz_leaves.relativity_type.FORMATIVE:
                        if ((e.Item.Cells[leave_detail_Static.TCCI_KIND_OF_LEAVE].Text == "Medical") && !k.Has((string[])(Session["privilege_array"]),"clear-medical-leave"))
                          {
                          ((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
                          ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
                          }
                        else
                          {
                          ((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text);
                          RequireConfirmation(((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton), "Are you sure you want to delete this leave-of-absence?");
                          ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
                          }
                        break;
                    case Class_biz_leaves.relativity_type.FUTURE:
                        ((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text);
                        RequireConfirmation(((e.Item.Cells[leave_detail_Static.TCCI_DELETE].Controls[0]) as LinkButton), "Are you sure you want to delete this leave-of-absence?");
                        ((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[leave_detail_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
                        break;
                }
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
            }
        }

        private void DataGrid_leaves_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
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
            DataGrid_leaves.EditItemIndex =  -1;
            Bind();
        }

        private void Bind()
        {
            DataGrid_leaves.Columns[leave_detail_Static.TCCI_EDIT].Visible = p.be_user_privileged_to_grant_leave;
            DataGrid_leaves.Columns[leave_detail_Static.TCCI_DELETE].Visible = p.be_user_privileged_to_grant_leave;
            DataGrid_leaves.Columns[leave_detail_Static.TCCI_NOTE].Visible = p.be_user_privileged_to_see_personnel_status_notes;
            p.biz_leaves.BindMemberRecords(p.biz_members.IdOf(Session["member_summary"]), p.sort_order, p.be_sort_order_ascending, DataGrid_leaves);
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            DataGrid_leaves.Visible = !p.be_datagrid_empty;
            // Clear aggregation vars for next bind, if any.
            p.num_datagrid_rows = 0;

        }

        private struct p_type
        {
            public bool be_datagrid_empty;
            public bool be_sort_order_ascending;
            public bool be_user_privileged_to_grant_leave;
            public bool be_user_privileged_to_see_personnel_status_notes;
            public TClass_biz_leaves biz_leaves;
            public TClass_biz_members biz_members;
            public TClass_biz_user biz_user;
            public string cad_num_string;
            public uint num_datagrid_rows;
            public string sort_order;
        } // end p_type

    } // end TWebForm_leave_detail

}

