// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;
using UserControl_member_schedule_detail;

namespace UserControl_member_schedule_detail_bls_interns
  {
  public partial class TWebUserControl_member_schedule_detail_bls_interns: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_MEMBER_ID = 0;
      public const int TCI_CONTENT = 1;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public uint num_personnel;
      public k.subtype<int> relative_month;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Bind();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_member_schedule_detail_bls_interns")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_member_schedule_detail_bls_interns");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_member_schedule_detail_bls_interns")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_member_schedule_detail_bls_interns");
//        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        //
        p.relative_month = new k.subtype<int>(0,1);
        //
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_member_schedule_detail_bls_interns_PreRender;
      }

    private void TWebUserControl_member_schedule_detail_bls_interns_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_member_schedule_detail_bls_interns Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        p.num_personnel++;
        }
      }

    private void Bind()
      {
      p.relative_month.val = (DateTime.Today.Day <= int.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_actually_wait_for_schedule_availabilities"]) ? 0 : 1);
      p.biz_members.BindRoster
        (
        sort_order:"last_name,first_name,cad_num",
        be_sort_order_ascending:true,
        target:DataGrid_control,
        relative_month:p.relative_month.val.ToString(),
        agency_filter:k.EMPTY,
        enrollment_filter: Class_biz_enrollment.filter_type.CURRENT,
        leave_filter:Class_biz_leave.filter_type.OBLIGATED,
        med_release_level_filter:Class_biz_medical_release_levels.filter_type.TRAINEE
        );
      TWebUserControl_member_schedule_detail member_schedule_detail;
      for (var i = 0; i < p.num_personnel; i++)
        {
        member_schedule_detail = (DataGrid_control.Items[i].Cells[Static.TCI_CONTENT].FindControl("UserControl_member_schedule_detail") as TWebUserControl_member_schedule_detail);
        member_schedule_detail.SetFilter
          (
          member_agency_id:"0",
          relative_month:p.relative_month,
          member_id:DataGrid_control.Items[i].Cells[Static.TCI_MEMBER_ID].Text
          );
        member_schedule_detail.SetBulkMode();
        //
        }
      p.be_datagrid_empty = (p.num_personnel == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_personnel.Text = p.num_personnel.ToString();
      p.num_personnel = 0;
      }

    } // end TWebUserControl_member_schedule_detail_bls_interns

  }