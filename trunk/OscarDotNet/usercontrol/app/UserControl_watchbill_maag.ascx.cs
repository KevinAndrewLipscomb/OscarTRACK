using Class_biz_agencies;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UserControl_watchbill_maag
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_medical_release_levels biz_medical_release_levels;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public k.int_nonnegative num_selections;
    public k.subtype<int> relative_month;
    public string report_compressed_font_family;
    public string saved_unit_spec;
    }

  public partial class TWebUserControl_watchbill_maag: ki_web_ui.usercontrol_class
    {

    public static class UserControl_watchbill_maag_Static
      {
      public const int TCI_POST_DESIGNATOR = 0;
      public const int TCI_POST_CARDINALITY = 1;
      public const int TCI_MEDICAL_RELEASE_DESCRIPTION = 2;
      public const int TCI_NAME = 3;
      public const int TCI_BE_DRIVER_QUALIFIED = 4;
      public const int TCI_MEMBER_AGENCY_ID = 5;
      public const int TCI_COMMENT = 6;
      public const int TCI_BE_CHALLENGE = 7;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        EstablishGoogleWebFontLoader("google: { families: [" + p.report_compressed_font_family + "] }");
        //
        var referrer = "http://frompaper2web.com/OscarTRACK";
        if (Session["mode:report/commanded-watchbill-maag-noninteractive"] != null)
          {
          referrer = "<a href=\"" + referrer + "\">" + referrer + "</a>";
          }
        var scope = (p.agency_filter == k.EMPTY ? "AGGREGATED" : (p.agency_filter == "0" ? "AGENCY 404" : "RESCUE " + p.agency_filter));
        Calendar_day.Caption = "<b><big><big><big><big>" + scope + " DAYS -- " + referrer + "</big></big></big></big></b>";
        Calendar_night.Caption = "<b><big><big><big><big>" + scope + " NIGHTS -- " + referrer + "</big></big></big></big></b>";
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["PlaceHolder_content"] as string) == "C");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_medical_release_levels = new TClass_biz_medical_release_levels();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.agency_filter = k.EMPTY;
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.num_selections = new k.int_nonnegative();
        p.relative_month = new k.subtype<int>(0,1);
        p.report_compressed_font_family = ConfigurationManager.AppSettings["report_compressed_font_family"];
        p.saved_unit_spec = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_watchbill_maag_PreRender;
      }

    private void TWebUserControl_watchbill_maag_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p",p);
      }

    public TWebUserControl_watchbill_maag Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.relative_month = relative_month;
      Calendar_day.VisibleDate = DateTime.Today.AddMonths(p.relative_month.val);
      Calendar_night.VisibleDate = DateTime.Today.AddMonths(p.relative_month.val);
      }

    private void CalendarDayRender
      (
      string shift_name,
      DayRenderEventArgs e
      )
      {
      e.Cell.HorizontalAlign = HorizontalAlign.Left;
      e.Cell.VerticalAlign = VerticalAlign.Top;
      if (p.agency_filter != k.EMPTY)
        {
        if (!e.Day.IsOtherMonth)
          {
          var data_grid = new DataGrid();
          data_grid.ItemDataBound += new DataGridItemEventHandler(data_grid_ItemDataBound);
          p.biz_schedule_assignments.BindBaseDataListForMaag(p.agency_filter,p.relative_month,shift_name,e.Day.DayNumberText,data_grid);
          data_grid.GridLines = GridLines.None;
          data_grid.ItemStyle.Font.Size = FontUnit.Point(8);
          data_grid.ItemStyle.HorizontalAlign = HorizontalAlign.Left;
          data_grid.ItemStyle.VerticalAlign = VerticalAlign.Top;
          data_grid.ItemStyle.Wrap = false;
          data_grid.ShowHeader = false;
          e.Cell.Controls.Add(data_grid);
          if (p.num_selections.val == 0)
            {
            e.Cell.BackColor = Color.Yellow;
            }
          }
        p.num_selections.val = 0;
        p.saved_unit_spec = k.EMPTY;
        }
      else
        {
        if (!e.Day.IsOtherMonth)
          {
          var num_crew_shifts = p.biz_schedule_assignments.NumCrewShifts(p.agency_filter,p.relative_month,e.Day.DayNumberText,shift_name);
          var table = new Table();
          table.CellPadding = 20;
          table.Width = Unit.Percentage(100);
          var row = new TableRow();
          var cell = new TableCell();
          cell.HorizontalAlign = HorizontalAlign.Center;
          cell.VerticalAlign = VerticalAlign.Middle;
          var label = new Label();
          label.Text = num_crew_shifts.val.ToString("F1");
          label.Font.Size = FontUnit.XLarge;
          label.Font.Bold = true;
          cell.Controls.Add(label);
          row.Controls.Add(cell);
          table.Controls.Add(row);
          e.Cell.Controls.Add(table);
          if (num_crew_shifts.val < 12)
            {
            e.Cell.BackColor = Color.Yellow;
            }
          if (num_crew_shifts.val < 8)
            {
            e.Cell.ForeColor = Color.White;
            e.Cell.BackColor = Color.Red;
            }
          }
        }
      }

    void data_grid_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        var current_unit_spec = e.Item.Cells[UserControl_watchbill_maag_Static.TCI_POST_DESIGNATOR].Text + "--" + e.Item.Cells[UserControl_watchbill_maag_Static.TCI_POST_CARDINALITY].Text;
        if (current_unit_spec != p.saved_unit_spec)
          {
          e.Item.Style.Add("border-top","thin solid silver");
          }
        if (e.Item.Cells[UserControl_watchbill_maag_Static.TCI_BE_CHALLENGE].Text == "1")
          {
          e.Item.BackColor = Color.Yellow;
          }
        e.Item.Cells[UserControl_watchbill_maag_Static.TCI_BE_CHALLENGE].Visible = false;
        //
        e.Item.Cells[UserControl_watchbill_maag_Static.TCI_MEDICAL_RELEASE_DESCRIPTION].Font.Italic = (new ArrayList() {"P","I","C"}).Contains(e.Item.Cells[UserControl_watchbill_maag_Static.TCI_MEDICAL_RELEASE_DESCRIPTION].Text);
        //
        var member_agency_id = k.Safe(e.Item.Cells[UserControl_watchbill_maag_Static.TCI_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
        e.Item.Cells[UserControl_watchbill_maag_Static.TCI_MEMBER_AGENCY_ID].Text = (member_agency_id == p.agency_filter ? k.EMPTY : "<" + member_agency_id);
        //
        e.Item.Cells[UserControl_watchbill_maag_Static.TCI_COMMENT].Text = e.Item.Cells[UserControl_watchbill_maag_Static.TCI_COMMENT].Text.Substring(0,Math.Min(e.Item.Cells[UserControl_watchbill_maag_Static.TCI_COMMENT].Text.Length,15));
        //
        p.saved_unit_spec = current_unit_spec;
        p.num_selections.val++;
        }
      }

    protected void Calendar_day_DayRender(object sender, DayRenderEventArgs e)
      {
      CalendarDayRender("DAY",e);
      }

    protected void Calendar_night_DayRender(object sender, DayRenderEventArgs e)
      {
      CalendarDayRender("NIGHT",e);
      }

    }

  }
