// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_ambulance_staffing_timeline_chart
  {
  public partial class TWebUserControl_ambulance_staffing_timeline_chart: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_NOMINAL_DAY = 0;
      public const int TCI_SPACER_1 = 1;
      public const int TCI_D0000 = 2;
      public const int TCI_D0030 = 3;
      public const int TCI_D0100 = 4;
      public const int TCI_D0130 = 5;
      public const int TCI_D0200 = 6;
      public const int TCI_D0230 = 7;
      public const int TCI_D0300 = 8;
      public const int TCI_D0330 = 9;
      public const int TCI_D0400 = 10;
      public const int TCI_D0430 = 11;
      public const int TCI_D0500 = 12;
      public const int TCI_D0530 = 13;
      public const int TCI_D0600 = 14;
      public const int TCI_D0630 = 15;
      public const int TCI_D0700 = 16;
      public const int TCI_D0730 = 17;
      public const int TCI_D0800 = 18;
      public const int TCI_D0830 = 19;
      public const int TCI_D0900 = 20;
      public const int TCI_D0930 = 21;
      public const int TCI_D1000 = 22;
      public const int TCI_D1030 = 23;
      public const int TCI_D1100 = 24;
      public const int TCI_D1130 = 25;
      public const int TCI_SPACER_2 = 26;
      public const int TCI_N0000 = 27;
      public const int TCI_N0030 = 28;
      public const int TCI_N0100 = 29;
      public const int TCI_N0130 = 30;
      public const int TCI_N0200 = 31;
      public const int TCI_N0230 = 32;
      public const int TCI_N0300 = 33;
      public const int TCI_N0330 = 34;
      public const int TCI_N0400 = 35;
      public const int TCI_N0430 = 36;
      public const int TCI_N0500 = 37;
      public const int TCI_N0530 = 38;
      public const int TCI_N0600 = 39;
      public const int TCI_N0630 = 40;
      public const int TCI_N0700 = 41;
      public const int TCI_N0730 = 42;
      public const int TCI_N0800 = 43;
      public const int TCI_N0830 = 44;
      public const int TCI_N0900 = 45;
      public const int TCI_N0930 = 46;
      public const int TCI_N1000 = 47;
      public const int TCI_N1030 = 48;
      public const int TCI_N1100 = 49;
      public const int TCI_N1130 = 50;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public k.subtype<int> relative_month;
      public string sort_order;
      }

    private p_type p;

    protected void Page_Load(object sender, EventArgs e)
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

    protected override void OnInit(EventArgs e)
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_S_G_S")
          {
          p.be_loaded &= ((Session["M_S_G_PlaceHolder_content"] as string) == "S");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_ambulance_staffing_timeline_chart")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_ambulance_staffing_timeline_chart");
//        }
        }
      else
        {
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.relative_month = new k.subtype<int>(0,1);
        p.sort_order = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      DataGrid_control.SortCommand += new DataGridSortCommandEventHandler(DataGrid_control_SortCommand);
      DataGrid_control.ItemCommand += new DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebUserControl_ambulance_staffing_timeline_chart_PreRender;
      }

    private void TWebUserControl_ambulance_staffing_timeline_chart_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_ambulance_staffing_timeline_chart Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      var msg_protected_overview = new TClass_msg_protected.overview();
      msg_protected_overview.target = "/schedule/assignment-assistant/" + p.relative_month.val.ToString() + "/proposal/" + k.Safe((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0] as LinkButton).Text,k.safe_hint_type.NUM);
      MessageDropCrumbAndTransferTo
        (
        msg:msg_protected_overview,
        folder_name:"protected",
        aspx_name:"overview"
        );
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (e.Item.ItemType == ListItemType.Header)
        {
        e.Item.Cells[Static.TCI_NOMINAL_DAY].Text = DateTime.Now.AddMonths(p.relative_month.val).ToString("MMM").ToUpper();
        }
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        link_button = ((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0]) as LinkButton);
        link_button.Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(link_button.Text));
        if (p.be_interactive)
          {
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          }
        //
        for (var i = new k.subtype<int>(2,e.Item.Cells.Count); i.val < i.LAST; i.val++)
          {
          if (i.val != Static.TCI_SPACER_2)
            {
            var cell = e.Item.Cells[i.val];
            var n = new k.decimal_nonnegative(decimal.Parse(cell.Text));
            if (n.val < int.Parse(ConfigurationManager.AppSettings["num_staffed_ambulances_desired"]))
              {
              cell.BackColor = Color.Yellow;
              }
            if (n.val < int.Parse(ConfigurationManager.AppSettings["num_staffed_ambulances_required"]))
              {
              cell.ForeColor = Color.White;
              cell.BackColor = Color.Red;
              }
            if ((i.val < Static.TCI_SPACER_2) && (i.val%2 == 1))
              {
              cell.Style.Add(key:"border-right",value:"1px solid WhiteSmoke");
              }
            else if ((i.val > Static.TCI_SPACER_2) && (i.val%2 == 1))
              {
              cell.Style.Add(key:"border-left",value:"1px solid WhiteSmoke");
              }
            }
          }
        //
        // Remove all cell controls from viewstate except for the one at TCI_ID.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        e.Item.Cells[Static.TCI_NOMINAL_DAY].EnableViewState = true;
        }
      }

    private void DataGrid_control_SortCommand(object source, DataGridSortCommandEventArgs e)
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
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void Bind()
      {
      p.biz_schedule_assignments.BindAmbulanceStaffingTimeLineChartBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.agency_filter,p.relative_month);
      }

    internal void SetP
      (
      string agency_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.relative_month = relative_month;
      Bind();
      }
    } // end TWebUserControl_ambulance_staffing_timeline_chart

  }