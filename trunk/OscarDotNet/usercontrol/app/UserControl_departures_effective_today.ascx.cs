// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_enrollment;
using System;
using System.Web.UI.WebControls;

namespace UserControl_departures_effective_today
  {
  public partial class TWebUserControl_departures_effective_today: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_DEPARTURE = 0;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public TClass_biz_enrollment biz_enrollment;
      public uint num_departures;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
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
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_departures_effective_today")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_departures_effective_today");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_departures_effective_today")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_departures_effective_today");
//        }
        }
      else
        {
        p.biz_enrollment = new TClass_biz_enrollment();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.num_departures = 0;
        }
      }

    private void InitializeComponent()
      {
      PreRender += TWebUserControl_departures_effective_today_PreRender;
      }

    private void TWebUserControl_departures_effective_today_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_departures_effective_today Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void Bind()
      {
      p.biz_enrollment.BindDeparturesEffectiveToday(DataGrid_control);
      p.be_datagrid_empty = (p.num_departures == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_departures.Text = p.num_departures.ToString();
      p.num_departures = 0;
      }

    internal bool BeAny()
      {
      return !p.be_datagrid_empty;
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().Contains("Item"))
        {
        p.num_departures++;
        }
      }

    } // end TWebUserControl_departures_effective_today

  }