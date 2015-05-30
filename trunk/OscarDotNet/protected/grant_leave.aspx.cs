using AjaxControlToolkit;
using appcommon;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace grant_leave
{
    public struct p_type
      {
        public TClass_biz_leaves biz_leaves;
        public TClass_biz_members biz_members;
        public TClass_biz_schedule_assignments biz_schedule_assignments;
      }

    public partial class TWebForm_grant_leave: ki_web_ui.page_class
    {
        private p_type p;

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_grant_leave_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string cad_num_string;
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
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - grant_leave";
                    p.biz_leaves = new TClass_biz_leaves();
                    p.biz_members = new TClass_biz_members();
                    p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
                    cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
                    if (cad_num_string == k.EMPTY)
                    {
                        cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
                    }
                    Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + cad_num_string + ")";
                    p.biz_leaves.BindStartMonthDropDownList(DropDownList_start_month);
                    p.biz_leaves.BindEndMonthDropDownList(DropDownList_end_month);
                    p.biz_leaves.BindKindDropDownList(DropDownList_kind_of_leave);
                    p.biz_leaves.BindNumObligatedShiftsDropDownList(p.biz_members.EnrollmentOf(Session["member_summary"]), DropDownList_num_obligated_shifts);
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

        protected void CustomValidator_overlap_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_leaves.BeOverlap(p.biz_members.IdOf(Session["member_summary"]), k.Safe(DropDownList_start_month.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_end_month.SelectedValue, k.safe_hint_type.NUM));
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_leaves.Grant(p.biz_members.IdOf(Session["member_summary"]), k.Safe(DropDownList_start_month.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_end_month.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_kind_of_leave.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_num_obligated_shifts.SelectedValue, k.safe_hint_type.NUM), k.Safe(TextBox_note.Text, k.safe_hint_type.PUNCTUATED));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void CustomValidator_end_month_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = p.biz_leaves.BeValid(DropDownList_start_month.SelectedValue, args.Value);
        }

        private void TWebForm_grant_leave_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    protected void CustomValidator_duty_selection_conflict_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (DropDownList_num_obligated_shifts.SelectedItem.Text != "0") || !p.biz_schedule_assignments.BeMemberSelectedDuringFuturePartOfPeriod
        (
        member_id:p.biz_members.IdOf(Session["member_summary"]),
        relative_start_month:int.Parse(k.Safe(DropDownList_start_month.SelectedValue,k.safe_hint_type.NUM)),
        relative_end_month:int.Parse(k.Safe(DropDownList_end_month.SelectedValue,k.safe_hint_type.NUM))
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

    } // end TWebForm_grant_leave

}
