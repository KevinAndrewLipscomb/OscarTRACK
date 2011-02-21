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
    public bool be_ok_to_edit_post;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_medical_release_levels biz_medical_release_levels;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public string depth_filter;
    public uint num_datagrid_rows;
    public string own_agency;
    public k.subtype<int> relative_month;
    public string release_filter;
    public ListItem[] proto_post_list_item_array;
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
      public const int TCI_D_MEMBER_AGENCY_ID = 9;
      public const int TCI_D_AGENCY_SHORT_DESIGNATOR = 10;
      public const int TCI_D_POST_DESIGNATOR = 11;
      public const int TCI_D_POST_CARDINALITY = 12;
      public const int TCI_D_POST_CARDINALITY_DESIGNATOR = 13;
      public const int TCI_D_MEDICAL_RELEASE_DESCRIPTION = 14;
      public const int TCI_D_COLON = 15;
      public const int TCI_D_NAME = 16;
      public const int TCI_D_BE_DRIVER_QUALIFIED = 17;
      public const int TCI_D_BE_SELECTED = 18;
      public const int TCI_D_COMMENT = 19;
      public const int TCI_N_SPACER_MAJOR = 20;
      public const int TCI_N_NUM_UNITS_FROM_AGENCY = 21;
      public const int TCI_N_SLASH = 22;
      public const int TCI_N_NUM_UNITS_CITYWIDE = 23;
      public const int TCI_N_SPACER_MINOR = 24;
      public const int TCI_N_ASSIGNMENT_ID = 25;
      public const int TCI_N_POST_ID = 26;
      public const int TCI_N_MEMBER_AGENCY_ID = 27;
      public const int TCI_N_AGENCY_SHORT_DESIGNATOR = 28;
      public const int TCI_N_POST_DESIGNATOR = 29;
      public const int TCI_N_POST_CARDINALITY = 30;
      public const int TCI_N_POST_CARDINALITY_DESIGNATOR = 31;
      public const int TCI_N_MEDICAL_RELEASE_DESCRIPTION = 32;
      public const int TCI_N_COLON = 33;
      public const int TCI_N_NAME = 34;
      public const int TCI_N_BE_DRIVER_QUALIFIED = 35;
      public const int TCI_N_BE_SELECTED = 36;
      public const int TCI_N_COMMENT = 37;
      //
      public const int CI_DESIGNATOR_DROPDOWNLIST = 1;
      public const int CI_DESIGNATOR_LABEL = 3;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        DropDownList_depth.SelectedValue = p.depth_filter;
        p.biz_medical_release_levels.BindBaseDataList(DataList_key);
        DropDownList_depth.Enabled = p.be_interactive;
        Panel_warning_to_save.Visible = p.be_interactive;
        //
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
        p.agency_filter = k.EMPTY;
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_ok_to_edit_post = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        if (HttpContext.Current.User.IsInRole("Squad Scheduler") || HttpContext.Current.User.IsInRole("Department Scheduler"))
          {
          p.depth_filter = k.EMPTY;
          }
        else
          {
          p.depth_filter = "1";
          }
        p.num_datagrid_rows = 0;
        p.own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        //
        var proto_post_list_item_collection = new ListItemCollection();
        p.biz_agencies.BindEmsPostListItemCollectionShort(proto_post_list_item_collection);
        p.proto_post_list_item_array = new ListItem[proto_post_list_item_collection.Count];
        proto_post_list_item_collection.CopyTo(p.proto_post_list_item_array,0);
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

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.relative_month = relative_month;
      Bind();
      }

    internal void SetInteractivity(bool be_interactive)
      {
      p.be_interactive = be_interactive;
      if (!be_interactive)
        {
        p.depth_filter = "1";
        DropDownList_depth.SelectedValue = "1";
        }
      }

    protected void DropDownList_depth_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.depth_filter = k.Safe(DropDownList_depth.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    private void Bind()
      {
      A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_D_SLASH].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
      A.Columns[UserControl_schedule_proposal_Static.TCI_N_SLASH].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
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
          if (p.be_interactive)
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
          if (p.be_interactive)
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
        DropDownList post_drop_down_list;
        DropDownList post_cardinality_drop_down_list;
        String post_id;
        //
        post_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_ID].Text,k.safe_hint_type.NUM);
        post_drop_down_list = ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
        post_cardinality_drop_down_list = ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
        if ((post_id != k.EMPTY) && (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED].Text == "1"))
          {
          foreach (ListItem list_item in p.proto_post_list_item_array)
            {
            post_drop_down_list.Items.Add(new ListItem(list_item.Text,list_item.Value));
            post_drop_down_list.Items[post_drop_down_list.Items.Count - 1].Selected = (list_item.Value == post_id);
            }
          p.biz_schedule_assignments.BindPostCardinalityListControl(post_cardinality_drop_down_list,e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY].Text);
          if (p.be_interactive)
            {
            post_drop_down_list.Enabled = p.be_ok_to_edit_post && (p.be_user_privileged_to_see_all_squads || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].Text == p.own_agency));
            post_cardinality_drop_down_list.Enabled = p.be_ok_to_edit_post && (p.be_user_privileged_to_see_all_squads || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].Text == p.own_agency));
            }
          else
            {
            ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_LABEL]) as Label).Text = post_drop_down_list.SelectedItem.Text;
            ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_LABEL]) as Label).Text = post_cardinality_drop_down_list.Text;
            post_drop_down_list.Visible = false;
            post_cardinality_drop_down_list.Visible = false;
            }
          }
        else
          {
          post_drop_down_list.Visible = false;
          post_cardinality_drop_down_list.Visible = false;
          }
        post_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_ID].Text,k.safe_hint_type.NUM);
        post_drop_down_list = ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
        post_cardinality_drop_down_list = ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
        if ((post_id != k.EMPTY) && (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED].Text == "1"))
          {
          foreach (ListItem list_item in p.proto_post_list_item_array)
            {
            post_drop_down_list.Items.Add(new ListItem(list_item.Text,list_item.Value));
            post_drop_down_list.Items[post_drop_down_list.Items.Count - 1].Selected = (list_item.Value == post_id);
            }
          p.biz_schedule_assignments.BindPostCardinalityListControl(post_cardinality_drop_down_list,e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY].Text);
          if (p.be_interactive)
            {
            post_drop_down_list.Enabled = p.be_interactive && p.be_ok_to_edit_post && (p.be_user_privileged_to_see_all_squads || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].Text == p.own_agency));
            post_cardinality_drop_down_list.Enabled = p.be_interactive && p.be_ok_to_edit_post && (p.be_user_privileged_to_see_all_squads || (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].Text == p.own_agency));
            }
          else
            {
            ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_LABEL]) as Label).Text = post_drop_down_list.SelectedItem.Text;
            ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_DESIGNATOR].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_LABEL]) as Label).Text = post_cardinality_drop_down_list.Text;
            post_drop_down_list.Visible = false;
            post_cardinality_drop_down_list.Visible = false;
            }
          }
        else
          {
          post_drop_down_list.Visible = false;
          post_cardinality_drop_down_list.Visible = false;
          }
        //
        p.num_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          //LinkButton link_button;
          //link_button = ((e.Item.Cells[UserControl_template_datagrid_sortable_Static.TCI_SELECT].Controls[0]) as LinkButton);
          //link_button.Text = k.ExpandTildePath(link_button.Text);
          //ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_DESIGNATOR].EnableViewState = true;
          }
        }
      }

    protected void DropDownList_d_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.SetPost
        (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM));
      }

    protected void DropDownList_n_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.SetPost
        (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM));
      }

    protected void DropDownList_d_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.SetPostCardinality
        (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA));
      }

    protected void DropDownList_n_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.SetPostCardinality
        (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA));
      }

    protected void Button_save_Click(object sender, EventArgs e)
      {
      Bind();
      }

    }

  }
