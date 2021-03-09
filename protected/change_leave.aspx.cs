using appcommon;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace change_leave
  {
  public partial class TWebForm_change_leave: ki_web_ui.page_class
    {
    private struct p_type
    {
        public TClass_biz_leaves biz_leaves;
        public TClass_biz_members biz_members;
        public TClass_biz_schedule_assignments biz_schedule_assignments;
        public string effective_start_month_offset;
        public string saved_effective_start_month_offset;
        public string saved_note;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_leave_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string cad_num_string;
            uint i;
            if (IsPostBack)
            {
                if ((Session[InstanceId() + ".p"] != null))
                {
                    p = (p_type)(Session[InstanceId() + ".p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_leave";
                    p.biz_leaves = new TClass_biz_leaves();
                    p.biz_members = new TClass_biz_members();
                    p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
                    cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (cad_num_string.Length == 0)
                    {
                        cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + cad_num_string + ")";
                    Label_saved_start_month.Text = DateTime.Parse(p.biz_leaves.StartMonthOf(Session["leave_item"]) + "-01").ToString("MMM yyyy");
                    Label_saved_end_month.Text = DateTime.Parse(p.biz_leaves.EndMonthOf(Session["leave_item"]) + "-01").ToString("MMM yyyy");
                    Label_saved_kind_of_leave.Text = p.biz_leaves.KindOf(Session["leave_item"]);
                    Label_saved_num_obliged_shifts.Text = p.biz_leaves.NumObligedShiftsOfTcc(Session["leave_item"]);
                    p.saved_note = p.biz_leaves.NoteOfTcc(Session["leave_item"]);
                    // Start month
                    if (p.biz_leaves.StartMonthOf(Session["leave_item"]).CompareTo(DateTime.Today.ToString("yyyy-MM")) > 0)
                    {
                        p.biz_leaves.BindStartMonthDropDownList(DropDownList_start_month, false);
                        i = 0;
                        while (DropDownList_start_month.Items[(int)i].Text != Label_saved_start_month.Text)
                        {
                            i++;
                        }
                        DropDownList_start_month.SelectedIndex = (int)i;
                        p.saved_effective_start_month_offset = k.Safe(DropDownList_start_month.SelectedValue, k.safe_hint_type.NUM);
                    }
                    else
                    {
                        DropDownList_start_month.Visible = false;
                        RequiredFieldValidator_start_month.Enabled = false;
                        p.saved_effective_start_month_offset = Math.Round((decimal)(((TimeSpan)(DateTime.Parse(p.biz_leaves.StartMonthOf(Session["leave_item"]) + "-01") - new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1))).Days / 30)).ToString("F0");
                    }
                    p.effective_start_month_offset = p.saved_effective_start_month_offset;
                    // End month
                    p.biz_leaves.BindEndMonthDropDownList(DropDownList_end_month, false, (short.Parse(p.saved_effective_start_month_offset) < 0));
                    i = 0;
                    while (DropDownList_end_month.Items[(int)i].Text != Label_saved_end_month.Text)
                    {
                        i++;
                    }
                    DropDownList_end_month.SelectedIndex = (int)i;
                    // Kind of leave
                    p.biz_leaves.BindKindDropDownList
                      (
                      target:DropDownList_kind_of_leave,
                      use_select:false
                      );
                    //
                    var saved_kind_of_leave_mapped_to_currently_valid_equivalent = Label_saved_kind_of_leave.Text
                      .Replace("Maternity","Medical")
                      .Replace("Educational","Personal");
                    var kind_of_leave_index = new k.subtype<int>(the_first:0,the_last:DropDownList_kind_of_leave.Items.Count);
                    while (DropDownList_kind_of_leave.Items[kind_of_leave_index.val].Text != saved_kind_of_leave_mapped_to_currently_valid_equivalent)
                      {
                      kind_of_leave_index.val++;
                      }
                    DropDownList_kind_of_leave.SelectedIndex = kind_of_leave_index.val;
                    //
                    // Num obligated shifts
                    p.biz_leaves.BindNumObligatedShiftsDropDownList(p.biz_members.EnrollmentOf(Session["member_summary"]), DropDownList_num_obligated_shifts);
                    DropDownList_num_obligated_shifts.SelectedValue = p.biz_leaves.NumObligedShiftsOfTcc(Session["leave_item"]);
                    // Note
                    TextBox_note.Text = p.saved_note;
                }
            }
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_cancel);
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void CustomValidator_actual_change_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (p.effective_start_month_offset != p.saved_effective_start_month_offset) || (DropDownList_end_month.SelectedItem.Text != Label_saved_end_month.Text) || (DropDownList_kind_of_leave.SelectedItem.Text != Label_saved_kind_of_leave.Text) || (DropDownList_num_obligated_shifts.SelectedValue != Label_saved_num_obliged_shifts.Text) || (TextBox_note.Text != p.saved_note);
        }

        protected void DropDownList_start_month_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.effective_start_month_offset = k.Safe(DropDownList_start_month.SelectedValue, k.safe_hint_type.NUM);
        }

        protected void CustomValidator_overlap_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_leaves.BeOverlap(p.biz_members.IdOf(Session["member_summary"]), p.effective_start_month_offset, k.Safe(DropDownList_end_month.SelectedValue, k.safe_hint_type.NUM), p.biz_leaves.IdOf(Session["leave_item"]));
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_leaves.Change(p.biz_leaves.IdOf(Session["leave_item"]), p.biz_members.IdOf(Session["member_summary"]), Label_saved_start_month.Text, Label_saved_end_month.Text, Label_saved_kind_of_leave.Text, Label_saved_num_obliged_shifts.Text, p.saved_note, p.effective_start_month_offset, k.Safe(DropDownList_end_month.SelectedValue, k.safe_hint_type.HYPHENATED_NUM), k.Safe(DropDownList_kind_of_leave.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_num_obligated_shifts.SelectedValue, k.safe_hint_type.NUM), k.Safe(TextBox_note.Text, k.safe_hint_type.PUNCTUATED));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void CustomValidator_end_month_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = p.biz_leaves.BeValid(p.effective_start_month_offset, args.Value);
        }

        private void TWebForm_change_leave_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    protected void CustomValidator_duty_selection_conflict_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (DropDownList_num_obligated_shifts.SelectedItem.Text != "0") || !p.biz_schedule_assignments.BeMemberSelectedDuringFuturePartOfPeriod
        (
        member_id:p.biz_members.IdOf(Session["member_summary"]),
        relative_start_month:int.Parse(p.effective_start_month_offset),
        relative_end_month:int.Parse(k.Safe(DropDownList_end_month.SelectedValue,k.safe_hint_type.HYPHENATED_NUM))
        );
      }

    protected void DropDownList_kind_of_leave_SelectedIndexChanged(object sender, EventArgs e)
      {
      if (DropDownList_kind_of_leave.SelectedItem.Text == "Medical")
        {
        DropDownList_num_obligated_shifts.ClearSelection();
        DropDownList_num_obligated_shifts.Items.FindByValue("0").Selected = true;
        DropDownList_num_obligated_shifts.Enabled = false;
        }
      else
        {
        DropDownList_num_obligated_shifts.Enabled = true;
        }
      }

    } // end TWebForm_change_leave

}
