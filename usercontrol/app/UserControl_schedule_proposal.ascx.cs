using Class_biz_agencies;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;

namespace UserControl_schedule_proposal
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_medical_release_levels biz_medical_release_levels;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public string depth_filter;
    public uint num_datagrid_rows;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_proposal: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_proposal_Static
      {
      public const int TCI_NOMINAL_DAY = 0;
      public const int TCI_DISPLAY_SEQ_NUM = 1;
      public const int TCI_D_SPACER_MAJOR = 2;
      public const int TCI_D_NUM_UNITS_FROM_AGENCY = 3;
      public const int TCI_D_SLASH = 4;
      public const int TCI_D_NUM_UNITS_CITYWIDE = 5;
      public const int TCI_D_SPACER_MINOR = 6;
      public const int TCI_D_ASSIGNMENT_ID = 7;
      public const int TCI_D_POST_ID = 8;
      public const int TCI_D_AGENCY_SHORT_DESIGNATOR = 9;
      public const int TCI_D_POST_CARDINALITY = 10;
      public const int TCI_D_MEDICAL_RELEASE_DESCRIPTION = 11;
      public const int TCI_D_COLON = 12;
      public const int TCI_D_NAME = 13;
      public const int TCI_D_BE_DRIVER_QUALIFIED = 14;
      public const int TCI_D_BE_SELECTED = 15;
      public const int TCI_D_COMMENT = 16;
      public const int TCI_N_SPACER_MAJOR = 17;
      public const int TCI_N_NUM_UNITS_FROM_AGENCY = 18;
      public const int TCI_N_SLASH = 19;
      public const int TCI_N_NUM_UNITS_CITYWIDE = 20;
      public const int TCI_N_SPACER_MINOR = 21;
      public const int TCI_N_ASSIGNMENT_ID = 22;
      public const int TCI_N_POST_ID = 23;
      public const int TCI_N_AGENCY_SHORT_DESIGNATOR = 24;
      public const int TCI_N_POST_CARDINALITY = 25;
      public const int TCI_N_MEDICAL_RELEASE_DESCRIPTION = 26;
      public const int TCI_N_COLON = 27;
      public const int TCI_N_NAME = 28;
      public const int TCI_N_BE_DRIVER_QUALIFIED = 29;
      public const int TCI_N_BE_SELECTED = 30;
      public const int TCI_N_COMMENT = 31;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter);
        DropDownList_agency_filter.SelectedValue = p.agency_filter;
        DropDownList_release_filter.SelectedValue = p.release_filter;
        DropDownList_depth.SelectedValue = p.depth_filter;
        RadioButtonList_which_month.SelectedValue = p.relative_month.val.ToString();
        RadioButtonList_which_month.Enabled = p.biz_schedule_assignments.BeOkToWorkOnNextMonth();
        p.biz_medical_release_levels.BindBaseDataList(DataList_key);
        //
        p.biz_schedule_assignments.Update(p.relative_month.val.ToString());
        Bind();
        //
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_proposal.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_proposal.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_PlaceHolder_content"] as string) == "UserControl_schedule_proposal");
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
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        if (p.be_user_privileged_to_see_all_squads)
          {
          p.agency_filter = k.EMPTY;
          }
        else
          {
          p.agency_filter = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
          }
        if (HttpContext.Current.User.IsInRole("Squad Scheduler") || HttpContext.Current.User.IsInRole("Department Scheduler"))
          {
          p.depth_filter = k.EMPTY;
          }
        else
          {
          p.depth_filter = "1";
          }
        p.num_datagrid_rows = 0;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_proposal_PreRender;
      }

    private void TWebUserControl_schedule_proposal_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_proposal.p", p);
      }

    public TWebUserControl_schedule_proposal Fresh()
      {
      Session.Remove("UserControl_schedule_proposal.p");
      return this;
      }

    protected void Button_refresh_Click(object sender, System.EventArgs e)
      {
      Bind();
      }

    protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void DropDownList_release_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.release_filter = k.Safe(DropDownList_release_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void DropDownList_depth_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.depth_filter = k.Safe(DropDownList_depth.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void RadioButtonList_which_month_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.relative_month.val = int.Parse(k.Safe(RadioButtonList_which_month.SelectedValue,k.safe_hint_type.NUM));
      p.biz_schedule_assignments.Update(p.relative_month.val.ToString());
      Bind();
      }

    private void Bind()
      {
      A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].Visible = (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_D_SLASH].Visible = (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].Visible = (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_N_SLASH].Visible = (p.agency_filter != k.EMPTY);
      var num_members = new k.int_nonnegative();
      var num_crew_shifts = new k.decimal_nonnegative();
      p.biz_schedule_assignments.BindBaseDataList(p.agency_filter,p.release_filter,p.depth_filter,p.relative_month,A,ref num_members,ref num_crew_shifts);
      Literal_num_members.Text = num_members.val.ToString();
      Literal_num_crew_shifts.Text = num_crew_shifts.val.ToString("F1");
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      A.Visible = !p.be_datagrid_empty;
      p.num_datagrid_rows = 0;
      }

    protected void A_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      //LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (e.Item.ItemType == ListItemType.Header)
        {
        e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = DateTime.Now.AddMonths(p.relative_month.val).ToString("MMM").ToUpper();
        }
      else if (be_any_kind_of_item)
        {
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_DISPLAY_SEQ_NUM].Text == "1")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = "<br/>" + p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text));
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_SLASH].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_SLASH].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          }
        //
        e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COMMENT].Text =
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COMMENT].Text.Substring(0,Math.Min(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COMMENT].Text.Length,15));
        e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COMMENT].Text =
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COMMENT].Text.Substring(0,Math.Min(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COMMENT].Text.Length,15));
        //
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED].Text == "1")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_ID].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_AGENCY_SHORT_DESIGNATOR].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COLON].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NAME].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_DRIVER_QUALIFIED].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COMMENT].Font.Bold = true;
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_ID].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_AGENCY_SHORT_DESIGNATOR].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COLON].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NAME].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_DRIVER_QUALIFIED].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COMMENT].ForeColor = Color.Gray;
          }
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED].Text == "1")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_ID].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_AGENCY_SHORT_DESIGNATOR].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COLON].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NAME].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_DRIVER_QUALIFIED].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COMMENT].Font.Bold = true;
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_ID].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_AGENCY_SHORT_DESIGNATOR].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COLON].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NAME].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_DRIVER_QUALIFIED].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COMMENT].ForeColor = Color.Gray;
          }
        //
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text != "&nbsp;")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Font.Italic = (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text == "P")
          || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text == "I")
          || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text == "C");
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_COLON].Text = k.EMPTY;
          }
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text != "&nbsp;")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Font.Italic = (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text == "P")
          || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text == "I")
          || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text == "C");
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_COLON].Text = k.EMPTY;
          }
        //
        p.num_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          //link_button = ((e.Item.Cells[UserControl_template_datagrid_sortable_Static.TCI_SELECT].Controls[0]) as LinkButton);
          //link_button.Text = k.ExpandTildePath(link_button.Text);
          //ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].EnableViewState = true;
          }
        }
      }

    }

  }
