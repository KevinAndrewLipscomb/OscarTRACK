using appcommon;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_user;
using Class_db_leaves;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace leave_detail
  {

  public partial class TWebForm_leave_detail: ki_web_ui.page_class
    {

    public static class Static
      {
      public const string CLEAR_TO_RETURN_TO_DUTY_CONFIRMATION_PROMPT = k.EMPTY
      + "This will clear the member's Medical Leave and allow the member to be scheduled for duty effective immediately." + k.NEW_LINE
      + k.NEW_LINE
      + "Proceed?";
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_sort_order_ascending;
      public bool be_user_privileged_to_clear_medical_leave;
      public bool be_user_privileged_to_grant_leave;
      public bool be_user_privileged_to_see_personnel_status_notes;
      public TClass_biz_leaves biz_leaves;
      public TClass_biz_members biz_members;
      public TClass_biz_privileges biz_privileges;
      public TClass_biz_user biz_user;
      public string cad_num_string;
      public uint num_datagrid_rows;
      public string sort_order;
      }

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
                    p.biz_privileges = new TClass_biz_privileges();
                    p.biz_user = new TClass_biz_user();
                    //
                    var priv_of_interest = k.EMPTY;
                    var target_member_id = p.biz_members.IdOf(Session["member_summary"]);
                    var target_member_agency_id = p.biz_members.AgencyIdOf(Session["member_summary"]);
                    var user_member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
                    //
                    var be_authorized_tier_or_same_agency = p.biz_members.BeAuthorizedTierOrSameAgency(user_member_id,target_member_id);
                    //
                    p.be_sort_order_ascending = false;
                    //
                    priv_of_interest = "clear-medical-leave";
                    p.be_user_privileged_to_clear_medical_leave = k.Has((string[])(Session["privilege_array"]),priv_of_interest);
                    //
                    priv_of_interest = "grant-leave";
                    p.be_user_privileged_to_grant_leave = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && be_authorized_tier_or_same_agency)
                      || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:target_member_agency_id);
                    //
                    priv_of_interest = "see-personnel-status-notes";
                    p.be_user_privileged_to_see_personnel_status_notes = (k.Has((string[])(Session["privilege_array"]),priv_of_interest) && p.biz_members.BeAuthorizedTierOrSameAgency(user_member_id,p.biz_members.IdOf(Session["member_summary"])))
                      || p.biz_privileges.HasForSpecialAgency(member_id:user_member_id,privilege_name:priv_of_interest,agency_id:target_member_agency_id);
                    //
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

    private void DataGrid_leaves_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (e.CommandName == "Select")
        {
        SessionSet("leave_item", e.Item);
        ((Session["waypoint_stack"]) as Stack).Push("leave_detail.aspx");
        Server.Transfer("change_leave.aspx");
        }
      else if (e.CommandName == "ClearToReturnToDuty")
        {
        p.biz_leaves.ClearImmediately
          (
          id:e.Item.Cells[Class_db_leaves_Static.TCCI_ID].Text,
          member_id:p.biz_members.IdOf(Session["member_summary"])
          );
        Bind();
        }
      }

        private void DataGrid_leaves_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            p.biz_leaves.Delete(k.Safe(e.Item.Cells[Class_db_leaves_Static.TCCI_ID].Text, k.safe_hint_type.NUM));
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
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        //
        // We are dealing with a data row, not a header or footer row.
        //
        ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Visible = false;
        //
        var relativity = p.biz_leaves.RelativityOf(e.Item.Cells[Class_db_leaves_Static.TCCI_START_DATE].Text, e.Item.Cells[Class_db_leaves_Static.TCCI_END_DATE].Text);
        if (relativity == relativity_type.PAST)
          {
          ((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
          ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
          }
        else if (relativity == relativity_type.ESTABLISHED)
          {
          ((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
          if (((e.Item.Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Text == "Medical") && !p.be_user_privileged_to_clear_medical_leave) || (e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "0"))
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
            }
          else
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
            }
          if(p.biz_leaves.BeOkToClearImmediately
              (
              kind_of_leave:e.Item.Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Text,
              be_user_privileged_to_clear_medical_leave:p.be_user_privileged_to_clear_medical_leave,
              be_canonical:(e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "1"),
              specific_end_date:DateTime.Parse(e.Item.Cells[Class_db_leaves_Static.TCCI_SPECIFIC_END_DATE].Text)
              )
            )
          //then
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Visible = true;
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Text =
              k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Text);
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).ToolTip = "Clear immediately to return to duty";
            RequireConfirmation
              (
              c: (e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton,
              prompt: Static.CLEAR_TO_RETURN_TO_DUTY_CONFIRMATION_PROMPT
              );
            }
          }
        else if (relativity == relativity_type.FORMATIVE)
          {
          if (((e.Item.Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Text == "Medical") && !p.be_user_privileged_to_clear_medical_leave) || (e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "0"))
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Visible = false;
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Visible = false;
            }
          else
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text);
            RequireConfirmation(((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton), "Are you sure you want to delete this leave-of-absence?");
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
            }
          if(p.biz_leaves.BeOkToClearImmediately
              (
              kind_of_leave:e.Item.Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Text,
              be_user_privileged_to_clear_medical_leave:p.be_user_privileged_to_clear_medical_leave,
              be_canonical:(e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "1"),
              specific_end_date:DateTime.Parse(e.Item.Cells[Class_db_leaves_Static.TCCI_SPECIFIC_END_DATE].Text)
              )
            )
          //then
            {
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Visible = true;
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Text =
              k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).Text);
            ((e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton).ToolTip = "Clear immediately to return to duty";
            RequireConfirmation
              (
              c: (e.Item.Cells[Class_db_leaves_Static.TCCI_CLEAR_TO_RETURN_TO_DUTY].Controls[0]) as LinkButton,
              prompt: Static.CLEAR_TO_RETURN_TO_DUTY_CONFIRMATION_PROMPT
              );
            }
          }
        else if (relativity == relativity_type.FUTURE)
          {
          ((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton).Text);
          RequireConfirmation(((e.Item.Cells[Class_db_leaves_Static.TCCI_DELETE].Controls[0]) as LinkButton), "Are you sure you want to delete this leave-of-absence?");
          ((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text = k.ExpandTildePath(((e.Item.Cells[Class_db_leaves_Static.TCCI_EDIT].Controls[0]) as LinkButton).Text);
          }
        if (e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "0")
          {
          e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Attributes.Add("style","color:gray");
          e.Item.Cells[Class_db_leaves_Static.TCCI_START_DATE].Attributes.Add("style","color:gray");
          e.Item.Cells[Class_db_leaves_Static.TCCI_END_DATE].Attributes.Add("style","color:gray");
          e.Item.Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Attributes.Add("style","color:gray");
          e.Item.Cells[Class_db_leaves_Static.TCCI_NUM_SHIFTS].Attributes.Add("style","color:gray");
          e.Item.Cells[Class_db_leaves_Static.TCCI_NOTE].Attributes.Add("style","color:gray");
          }
        e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text = (e.Item.Cells[Class_db_leaves_Static.TCCI_BE_CANONICAL].Text == "1" ? "BIZ-CYCLE" : "PRECISION");
        p.num_datagrid_rows++;
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
            DataGrid_leaves.Columns[Class_db_leaves_Static.TCCI_EDIT].Visible = p.be_user_privileged_to_grant_leave;
            DataGrid_leaves.Columns[Class_db_leaves_Static.TCCI_DELETE].Visible = p.be_user_privileged_to_grant_leave;
            DataGrid_leaves.Columns[Class_db_leaves_Static.TCCI_NOTE].Visible = p.be_user_privileged_to_see_personnel_status_notes;
            p.biz_leaves.BindMemberRecords(p.biz_members.IdOf(Session["member_summary"]), p.sort_order, p.be_sort_order_ascending, DataGrid_leaves);
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            DataGrid_leaves.Visible = !p.be_datagrid_empty;
            // Clear aggregation vars for next bind, if any.
            p.num_datagrid_rows = 0;

        }

    } // end TWebForm_leave_detail

  }
