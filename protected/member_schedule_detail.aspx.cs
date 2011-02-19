// Derived from template~protected~nonlanding.aspx.cs~template

using appcommon;
using Class_biz_availabilities;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI.WebControls;

namespace member_schedule_detail
  {
  public struct p_type
    {
    public ArrayList arraylist_selected_day_avail;
    public ArrayList arraylist_selected_night_avail;
    public ArrayList arraylist_unselected_day_avail;
    public ArrayList arraylist_unselected_night_avail;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public TClass_biz_availabilities biz_availabilities;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public DateTime start_of_earliest_unselected;
    public TClass_msg_protected.member_schedule_detail incoming;
    public DateTime end_of_latest_unselected;
    public k.subtype<int> num;
    public uint num_datagrid_rows;
    }

  public partial class TWebForm_member_schedule_detail: ki_web_ui.page_class
    {
    public class TWebForm_member_schedule_detail_Static
      {
      public const int TCI_SCHEDULE_ASSIGNMENT_ID = 0;
      public const int TCI_NOMINAL_DAY = 1;
      public const int TCI_SHIFT_NAME = 2;
      public const int TCI_COMMENT = 3;
      public const int TCI_COMMENT_EDIT_UPDATE_CANCEL = 4;
      public const int TCI_BE_SELECTED = 5;
      public const int TCI_ON_DUTY = 6;
      public const int TCI_OFF_DUTY = 7;
      public const int TCI_TIME_OFF = 8;
      public const int TCI_SHIFT_POPULATION_FROM_AGENCY = 9;
      public const int TCI_SHIFT_POPULATION_CITYWIDE = 10;
      public const int TCI_SWAP_EARLIER = 11;
      public const int TCI_SWAP_LATER = 12;
      public const int TCI_OTHERS_AVAILABLE = 13;
      public const int TCI_FORCE_OFF = 14;
      public const int TCI_FORCE_ON = 15;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.CancelCommand += new DataGridCommandEventHandler(DataGrid_control_CancelCommand);
      DataGrid_control.EditCommand += new DataGridCommandEventHandler(DataGrid_control_EditCommand);
      DataGrid_control.UpdateCommand += new DataGridCommandEventHandler(DataGrid_control_UpdateCommand);
      PreRender += TWebForm_member_schedule_detail_PreRender;
      }

    private void InjectPersistentClientSideScript()
      {
      EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        var month_of_interest = DateTime.Now.AddMonths(p.incoming.relative_month.val);
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - member_schedule_detail";
        Literal_name.Text = p.biz_members.FirstNameOfMemberId(p.incoming.member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(p.incoming.member_id);
        Literal_month.Text = month_of_interest.ToString("MMMM");
        //
        Literal_num_extra.Text = p.biz_availabilities.NumExtraForMemberForMonth(p.incoming.member_id,p.incoming.relative_month).val.ToString();
        var comment = p.biz_availabilities.SpecialRequestCommentsForMemberForMonth(p.incoming.member_id,p.incoming.relative_month);
        if (comment != k.EMPTY)
          {
          Label_special_request_comment.Text = comment;
          Label_special_request_comment.Font.Italic = true;
          }
        //
        Calendar_day.VisibleDate = month_of_interest;
        Calendar_night.VisibleDate = month_of_interest;
        //
        Bind();
        //
        InjectPersistentClientSideScript();
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("member_schedule_detail.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_availabilities = new TClass_biz_availabilities();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.arraylist_selected_day_avail = new ArrayList();
        p.arraylist_selected_night_avail = new ArrayList();
        p.arraylist_unselected_day_avail = new ArrayList();
        p.arraylist_unselected_night_avail = new ArrayList();
        p.be_interactive =  !(Session["mode:report"] != null);
        p.incoming = Message<TClass_msg_protected.member_schedule_detail>("protected","member_schedule_detail");
        p.num = new k.subtype<int>(0,62);
        p.num_datagrid_rows = 0;
        p.biz_schedule_assignments.GetInfoAboutMemberInMonth(p.incoming.member_id,p.incoming.relative_month,ref p.num,out p.start_of_earliest_unselected,out p.end_of_latest_unselected);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["member_schedule_detail.p"]);
        }
      }

    protected void Button_done_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    protected void Calendar_day_SelectionChanged(object sender, System.EventArgs e)
      {
      if ((Calendar_day.SelectedDate.Month == DateTime.Now.AddMonths(p.incoming.relative_month.val).Month))
        {
        p.biz_schedule_assignments.ForceAvail(p.incoming.member_id,Calendar_day.SelectedDate,"DAY",p.incoming.member_agency_id);
        }
      Bind();
      }

    protected void Calendar_night_SelectionChanged(object sender, System.EventArgs e)
      {
      if((Calendar_night.SelectedDate.Month == DateTime.Now.AddMonths(p.incoming.relative_month.val).Month))
        {
        p.biz_schedule_assignments.ForceAvail(p.incoming.member_id,Calendar_night.SelectedDate,"NIGHT",p.incoming.member_agency_id);
        }
      Bind();
      }

    private void Bind()
      {
      p.arraylist_selected_day_avail.Clear();
      p.arraylist_selected_night_avail.Clear();
      p.arraylist_unselected_day_avail.Clear();
      p.arraylist_unselected_night_avail.Clear();
      p.biz_schedule_assignments.GetInfoAboutMemberInMonth(p.incoming.member_id,p.incoming.relative_month,ref p.num,out p.start_of_earliest_unselected,out p.end_of_latest_unselected);
      p.biz_schedule_assignments.BindTimeOffAlertInvestigationBaseDataList(p.incoming.member_id,p.incoming.relative_month,p.incoming.member_agency_id,DataGrid_control);
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      TableRow_data.Visible = !p.be_datagrid_empty;
      TableRow_none.Visible = p.be_datagrid_empty;
      p.num_datagrid_rows = 0;
      }

    protected void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        var nominal_day = DateTime.Parse(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_NOMINAL_DAY].Text);
        e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(nominal_day);
        //
        var be_selected = (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_BE_SELECTED].Text == "1");
        if (be_selected)
          {
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_NOMINAL_DAY].Font.Bold = true;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].Font.Bold = true;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_TIME_OFF].Font.Bold = true;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Font.Bold = true;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_POPULATION_CITYWIDE].Font.Bold = true;
          //
          if (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_selected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_selected_night_avail.Add(nominal_day);
            }
          }
        else
          {
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_NOMINAL_DAY].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_TIME_OFF].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_POPULATION_CITYWIDE].ForeColor = Color.Gray;
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          //
          if (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_unselected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_unselected_night_avail.Add(nominal_day);
            }
          }
        //
        if (!be_selected || (DateTime.Parse(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_ON_DUTY].Text) < p.start_of_earliest_unselected))
          {
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        if (!be_selected || (DateTime.Parse(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_OFF_DUTY].Text) > p.end_of_latest_unselected))
          {
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (be_selected)
          {
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_FORCE_ON].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        else
          {
          (e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_FORCE_OFF].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        p.num_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          LinkButton link_button;
          var comment_edit_update_cancel_controls = e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls;
          if (comment_edit_update_cancel_controls.Count == 1)
            {
            link_button = (comment_edit_update_cancel_controls[0] as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Edit comment";
            }
          else
            {
            link_button = (comment_edit_update_cancel_controls[0] as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Save edit";
            // Skip comment_edit_update_cancel_controls[1].  It's a literal spacer.
            link_button = (comment_edit_update_cancel_controls[2] as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Cancel edit";
            //
            ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Columns = 9;
            ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).MaxLength = 9;
            ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Attributes.Add
              ("onkeydown","if (event.keyCode == 13) El('" + e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls[0].ClientID + "').click();");
            }
          link_button = ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Swap with earlier availability";
          link_button = ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Swap with later availability";
          link_button = ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_FORCE_OFF].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Force off";
          link_button = ((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_FORCE_ON].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Force on";
          //
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          }
        }
      }

    protected void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (e.CommandName == "Earlier")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(k.Safe(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      else if (e.CommandName == "Later")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(k.Safe(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      else if (e.CommandName == "ForceOn")
        {
        p.biz_schedule_assignments.ForceSelection(k.Safe(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),true);
        }
      else if (e.CommandName == "ForceOff")
        {
        p.biz_schedule_assignments.ForceSelection(k.Safe(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),false);
        }
      Bind();
      }

    private void DataGrid_control_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      p.biz_schedule_assignments.SetComment
        (k.Safe(e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe(((e.Item.Cells[TWebForm_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Text,k.safe_hint_type.DATE_TIME));
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void DataGrid_control_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void DataGrid_control_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      DataGrid_control.EditItemIndex = e.Item.ItemIndex;
      Bind();
      }

    protected void Calendar_day_DayRender(object sender, DayRenderEventArgs e)
      {
      var be_selected_day_avail = p.arraylist_selected_day_avail.Contains(e.Day.Date);
      var be_unselected_day_avail = p.arraylist_unselected_day_avail.Contains(e.Day.Date);
      if ((e.Day.Date.Month == DateTime.Now.AddMonths(p.incoming.relative_month.val).Month) && (!be_selected_day_avail) && (!be_unselected_day_avail))
        {
        e.Cell.ForeColor = Color.Blue;
        e.Day.IsSelectable = true;
        }
      if (be_selected_day_avail)
        {
        e.Cell.ForeColor = Color.White;
        e.Cell.BackColor = Color.Green;
        }
      else if (be_unselected_day_avail)
        {
        e.Cell.ForeColor = Color.Black;
        e.Cell.BackColor = Color.PaleGreen;
        }
      }

    protected void Calendar_night_DayRender(object sender, DayRenderEventArgs e)
      {
      var be_selected_night_avail = p.arraylist_selected_night_avail.Contains(e.Day.Date);
      var be_unselected_night_avail = p.arraylist_unselected_night_avail.Contains(e.Day.Date);
      if ((e.Day.Date.Month == DateTime.Now.AddMonths(p.incoming.relative_month.val).Month) && (!be_selected_night_avail) && (!be_unselected_night_avail))
        {
        e.Cell.ForeColor = Color.Blue;
        e.Day.IsSelectable = true;
        }
      if (be_selected_night_avail)
        {
        e.Cell.ForeColor = Color.White;
        e.Cell.BackColor = Color.Green;
        }
      else if (be_unselected_night_avail)
        {
        e.Cell.ForeColor = Color.Black;
        e.Cell.BackColor = Color.PaleGreen;
        }
      }

    private void TWebForm_member_schedule_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("member_schedule_detail.p", p);
      }

    } // end TWebForm_member_schedule_detail

  }
