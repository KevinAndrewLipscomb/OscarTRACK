// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_enrollment;
using Class_biz_leaves;
using Class_biz_members;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace adjust_length_of_service
  {
  public partial class TWebForm_adjust_length_of_service: ki_web_ui.page_class
    {

    private struct p_type
      {
      public bool be_leave_datagrid_empty;
      public bool be_enrollment_datagrid_empty;
      public TClass_biz_enrollment biz_enrollment;
      public TClass_biz_leaves biz_leaves;
      public TClass_biz_members biz_members;
      public TClass_msg_protected.adjust_length_of_service incoming;
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
        Label_member_name.Text = p.biz_members.FirstNameOf(p.incoming.summary) + k.SPACE + p.biz_members.LastNameOf(p.incoming.summary) + " (CAD # " + p.biz_members.CadNumOf(p.incoming.summary) + ")";
        //
        var member_id = p.biz_members.IdOf(p.incoming.summary);
        //
        p.biz_leaves.BindMemberRecords
          (
          member_id:member_id,
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
          member_id:member_id,
          target:DataGrid_member_history
          );
        // Manage control visibilities.
        p.be_enrollment_datagrid_empty = (p.num_enrollment_datagrid_rows.val == 0);
        TableRow_no_member_status_history.Visible = p.be_enrollment_datagrid_empty;
        DataGrid_member_history.Visible = !p.be_enrollment_datagrid_empty;
        }
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
        p.incoming = Message<TClass_msg_protected.adjust_length_of_service>("protected","adjust_length_of_service");
        p.num_enrollment_datagrid_rows = new k.int_nonnegative();
        p.num_leave_datagrid_rows = new k.int_nonnegative();
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
      //p.biz_members.SetLengthOfService(p.saved_first_name, p.saved_last_name, k.Safe(TextBox_first_name.Text, k.safe_hint_type.HUMAN_NAME).ToUpper(), k.Safe(TextBox_last_name.Text, k.safe_hint_type.HUMAN_NAME).ToUpper(), Session["member_summary"]);
      BackTrack();
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    protected void CustomValidator_time_to_subtract_ServerValidate(object source, ServerValidateEventArgs args)
      {

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

    } // end TWebForm_adjust_length_of_service

  }
