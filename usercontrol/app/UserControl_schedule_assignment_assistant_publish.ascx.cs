using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_publish
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_ok_to_edit_schedule;
    public bool be_user_privileged_to_see_all_squads;
    public bool be_virgin_watchbill;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_publish: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_publish_Static
      {
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_assignment_assistant_publish.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_publish.p"]);
        p.be_loaded = IsPostBack && ((Session["M_S_G_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_publish");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_ok_to_edit_schedule = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_user_privileged_to_see_all_squads = k.Has((Session["privilege_array"] as string[]), "see-all-squads");
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
      PreRender += TWebUserControl_schedule_assignment_assistant_publish_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_publish_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_assignment_assistant_publish.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_publish Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_publish.p");
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
      //
      ManageAblements();
      //
      HyperLink_preview_print_scalable.Text = k.ExpandTildePath(HyperLink_preview_print_scalable.Text);
      HyperLink_preview_print_scalable.NavigateUrl = "~/protected/watchbill.aspx"
      + "?agency_id=" + p.agency_filter
      + "&release_filter=" + p.release_filter
      + "&relative_month=" + p.relative_month.val;
      HyperLink_preview_print_month_at_a_glance.Text = k.ExpandTildePath(HyperLink_preview_print_month_at_a_glance.Text);
      HyperLink_preview_print_month_at_a_glance.NavigateUrl = "~/protected/watchbill.aspx"
      + "?agency_id=" + p.agency_filter
      + "&release_filter=" + p.release_filter
      + "&relative_month=" + p.relative_month.val;
      }

    protected void CustomValidator_full_schedule_format_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (!CheckBox_full.Checked || (RadioButton_scalable.Checked || RadioButton_month_at_a_glance.Checked));
      }

    protected void Button_publish_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        var working_directory = Server.MapPath("scratch");
        if (CheckBox_full.Checked)
          {
          p.biz_schedule_assignments.PublishFullWatchbill(p.agency_filter,p.release_filter,p.relative_month,working_directory);
          Alert(k.alert_cause_type.USER,k.alert_state_type.SUCCESS,"publishing","The server is now publishing the watchbill.",true);
          }
        p.biz_schedule_assignments.PublishPendingNotifications(p.agency_filter,p.relative_month,p.be_virgin_watchbill,working_directory);
        Button_publish.Enabled = false;
        }
      }

    private void ManageAblements()
      {
      if (p.biz_schedule_assignments.BeOkToPublishFullWatchbill(p.be_ok_to_edit_schedule,p.biz_members.IdOfUserId(p.biz_user.IdNum()),p.agency_filter))
        {
        p.be_virgin_watchbill = p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,p.relative_month);
        CheckBox_full.Checked = p.be_virgin_watchbill;
        CheckBox_full.Enabled = !p.be_virgin_watchbill;
        RadioButton_scalable.Checked = true;  // delete this line when month-at-a-glance is implemented
        //RadioButton_scalable.Enabled = true;  // uncomment when month-at-a-glance is implemented
        //RadioButton_month_at_a_glance.Enabled = true;  // uncomment when month-at-a-glance is implemented
        }
      else
        {
        CheckBox_full.Checked = false;
        CheckBox_full.Enabled = false;
        RadioButton_scalable.Checked = false;
        RadioButton_scalable.Enabled = false;
        RadioButton_month_at_a_glance.Checked = false;
        RadioButton_month_at_a_glance.Enabled = false;
        }
      Button_publish.Enabled = p.be_ok_to_edit_schedule;
      }

    }

  }
