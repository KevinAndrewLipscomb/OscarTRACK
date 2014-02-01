// Derived from template~protected~nonlanding.aspx.cs~template

using AjaxControlToolkit;
using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_members;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace adjust_length_of_service
  {
  public partial class TWebForm_adjust_length_of_service: ki_web_ui.page_class
    {

    private struct p_type
      {
      public decimal adjusted_years_of_service;
      public string base_equivalent_los_start_date;
      public string base_years_of_service;
      public bool be_leave_datagrid_empty;
      public bool be_enrollment_datagrid_empty;
      public TClass_biz_enrollment biz_enrollment;
      public TClass_biz_leaves biz_leaves;
      public TClass_biz_members biz_members;
      public string member_id;
      public k.int_nonnegative num_enrollment_datagrid_rows;
      public k.int_nonnegative num_leave_datagrid_rows;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebForm_adjust_length_of_service_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - adjust_length_of_service";
        //
        Label_member_name.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + p.biz_members.CadNumOf(Session["member_summary"]) + ")";
        //
        p.biz_leaves.BindMemberRecords
          (
          member_id:p.member_id,
          sort_order:"start_date%",
          be_sort_order_ascending:false,
          target:DataGrid_leaves
          );
        // Manage control visibilities.
        p.be_leave_datagrid_empty = (p.num_leave_datagrid_rows.val == 0);
        TableRow_no_leave_history.Visible = p.be_leave_datagrid_empty;
        DataGrid_leaves.Visible = !p.be_leave_datagrid_empty;
        //
        p.biz_enrollment.BindMemberHistory
          (
          member_id:p.member_id,
          target:DataGrid_member_history
          );
        // Manage control visibilities.
        p.be_enrollment_datagrid_empty = (p.num_enrollment_datagrid_rows.val == 0);
        TableRow_no_member_status_history.Visible = p.be_enrollment_datagrid_empty;
        DataGrid_member_history.Visible = !p.be_enrollment_datagrid_empty;
        //
        Literal_equivalent_los_start_date.Text = p.base_equivalent_los_start_date;
        Literal_base_years_of_service.Text = p.base_years_of_service;
        Literal_adjusted_length_of_service.Text = p.base_years_of_service;
        //
        for (var i = new k.subtype<int>(-1,9); i.val < i.LAST; i.val++)
          {
          DropDownList_years_to_subtract.Items.Add(new ListItem((i.val + 1).ToString(),(i.val + 1).ToString()));
          }
        for (var i = new k.subtype<int>(-1,11); i.val < i.LAST; i.val++)
          {
          DropDownList_months_to_subtract.Items.Add(new ListItem((i.val + 1).ToString(),(i.val + 1).ToString()));
          }
        for (var i = new k.subtype<int>(-1,30); i.val < i.LAST; i.val++)
          {
          DropDownList_days_to_subtract.Items.Add(new ListItem((i.val + 1).ToString(),(i.val + 1).ToString()));
          }
        //
        Literal_member_first_name.Text = p.biz_members.FirstNameOf(Session["member_summary"]);
        Literal_member_first_name_2.Text = Literal_member_first_name.Text;
        Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        Literal_application_name_2.Text = Literal_application_name.Text;
        }
      ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
      ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_cancel);
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_enrollment = new TClass_biz_enrollment();
        p.biz_leaves = new TClass_biz_leaves();
        p.biz_members = new TClass_biz_members();
        //
        p.num_enrollment_datagrid_rows = new k.int_nonnegative();
        p.num_leave_datagrid_rows = new k.int_nonnegative();
        //
        p.base_equivalent_los_start_date = p.biz_members.EquivalentLengthOfServiceStartDateOf(Session["member_summary"]);
        p.base_years_of_service = p.biz_members.RetentionOf(Session["member_summary"]);
        p.member_id = p.biz_members.IdOf(Session["member_summary"]);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      //
      // ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      //
      }

    private void TWebForm_adjust_length_of_service_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      p.biz_members.SetLengthOfService
        (
        years_subtracted:k.Safe(DropDownList_years_to_subtract.Text,k.safe_hint_type.NUM),
        months_subtracted:k.Safe(DropDownList_months_to_subtract.Text,k.safe_hint_type.NUM),
        days_subtracted:k.Safe(DropDownList_days_to_subtract.Text,k.safe_hint_type.NUM),
        length_of_service:p.adjusted_years_of_service,
        rationale:k.Safe(TextBox_rationale.Text,k.safe_hint_type.MEMO),
        summary:Session["member_summary"]
        );
      BackTrack();
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    protected void DataGrid_leaves_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (new ArrayList() {ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.Item,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        p.num_leave_datagrid_rows.val++;
        }
      }

    protected void DataGrid_member_history_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (new ArrayList() {ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.Item,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        p.num_enrollment_datagrid_rows.val++;
        }
      }

    protected void DropDownList_years_to_subtract_SelectedIndexChanged(object sender, EventArgs e)
      {
      Recalculate();
      }

    protected void DropDownList_months_to_subtract_SelectedIndexChanged(object sender, EventArgs e)
      {
      Recalculate();
      }

    protected void DropDownList_days_to_subtract_SelectedIndexChanged(object sender, EventArgs e)
      {
      Recalculate();
      }

    private void Recalculate()
      {
      p.adjusted_years_of_service =
        decimal.Parse(p.base_years_of_service)
      -
        decimal.Divide
          (
            (
              int.Parse(k.Safe(DropDownList_years_to_subtract.Text,k.safe_hint_type.NUM))*365
            +
              int.Parse(k.Safe(DropDownList_months_to_subtract.Text,k.safe_hint_type.NUM))*30
            +
              int.Parse(k.Safe(DropDownList_days_to_subtract.Text,k.safe_hint_type.NUM))
            )
          ,
          365
          );
      Literal_adjusted_length_of_service.Text = p.adjusted_years_of_service.ToString("F4");
      }

    } // end TWebForm_adjust_length_of_service

  }
