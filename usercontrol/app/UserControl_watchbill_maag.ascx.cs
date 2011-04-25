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
        var report_compressed_font_family = ConfigurationManager.AppSettings["report_compressed_font_family"];
        EstablishGoogleWebFontLoader("google: { families: [" + report_compressed_font_family + "] }");
        //A.Style.Add("font-family",report_compressed_font_family);
        //A.Style.Add("letter-spacing","-0.05em");
        //A.Style.Add("word-spacing","-0.12em");
        //
        Calendar_day.Caption = "RESCUE " + p.agency_filter + " DAYS -- http://frompaper2web.com/OscarTRACK";
        Calendar_night.Caption = "RESCUE " + p.agency_filter + " NIGHTS -- http://frompaper2web.com/OscarTRACK";
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[Parent.ClientID + ".UserControl_watchbill_maag.p"] != null)
        {
        p = (p_type)(Session[Parent.ClientID + ".UserControl_watchbill_maag.p"]);
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
      SessionSet(Parent.ClientID + ".UserControl_watchbill_maag.p",p);
      }

    public TWebUserControl_watchbill_maag Fresh()
      {
      Session.Remove("UserControl_watchbill_maag.p");
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
      }

    private void CalendarDayRender
      (
      string shift_name,
      DayRenderEventArgs e
      )
      {
      var data_grid = new DataGrid();
      data_grid.ItemDataBound += new DataGridItemEventHandler(data_grid_ItemDataBound);
      p.biz_schedule_assignments.BindBaseDataListForMaag(p.agency_filter,p.relative_month,shift_name,e.Day.DayNumberText,data_grid);
      data_grid.GridLines = GridLines.None;
      data_grid.ItemStyle.Font.Size = FontUnit.XXSmall;
      data_grid.ItemStyle.HorizontalAlign = HorizontalAlign.Left;
      data_grid.ItemStyle.VerticalAlign = VerticalAlign.Top;
      data_grid.ItemStyle.Wrap = false;
      data_grid.ShowHeader = false;
      e.Cell.Controls.Add(data_grid);
      e.Cell.HorizontalAlign = HorizontalAlign.Left;
      e.Cell.VerticalAlign = VerticalAlign.Top;
      if (p.num_selections.val == 0)
        {
        e.Cell.BackColor = Color.Yellow;
        }
      p.num_selections.val = 0;
      p.saved_unit_spec = k.EMPTY;
      }

    void data_grid_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
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
