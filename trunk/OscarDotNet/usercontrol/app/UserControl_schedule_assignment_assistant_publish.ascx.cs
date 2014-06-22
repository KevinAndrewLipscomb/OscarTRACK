using Class_biz_members;
using Class_biz_privileges;
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
    public bool be_ok_to_edit_schedule_for_selected_special_agency;
    public bool be_ok_to_edit_schedule_tier_department_only;
    public bool be_user_privileged_to_see_all_squads;
    public bool be_virgin_watchbill;
    public TClass_biz_members biz_members;
    public TClass_biz_privileges biz_privileges;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public string own_agency;
    public k.subtype<int> relative_month;
    public string release_filter;
    public string user_member_id;
    public string user_id;
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
        RequireConfirmation
          (
          c:Button_publish,
          prompt:"During this login session, did you thoroughly review the Alerts, the Special requests, and the yellow highlighted portions of your Watchbill?  If not, you may have missed assignments we made to your schedule"
          + " as a result of another editor performing a Refresh, which imports new availabilities." + k.NEW_LINE
          + k.NEW_LINE
          + "Click OK to proceed with publishing."
          );
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
        p.be_loaded = IsPostBack && ((Session["M_S_G_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_publish");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_privileges = new TClass_biz_privileges();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_ok_to_edit_schedule = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_ok_to_edit_schedule_tier_department_only = p.biz_schedule_assignments.BeOkToEditScheduleTierDepartmentOnly(privilege_array:Session["privilege_array"] as string[]);
        p.be_user_privileged_to_see_all_squads = k.Has((Session["privilege_array"] as string[]), "see-all-squads");
        p.own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.user_id = p.biz_user.IdNum();
        //
        p.user_member_id = p.biz_members.IdOfUserId(p.user_id);
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
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_publish Fresh()
      {
      Session.Remove(InstanceId() + ".p");
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
      p.be_ok_to_edit_schedule_for_selected_special_agency = p.biz_privileges.HasForSpecialAgency(member_id:p.user_member_id,privilege_name:"edit-schedule",agency_id:p.agency_filter);
      //
      ManageAblements();
      }

    protected void CustomValidator_full_schedule_format_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (!CheckBox_full.Checked || (RadioButton_scalable.Checked || RadioButton_month_at_a_glance.Checked));
      }

    protected void Button_publish_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        if (p.biz_schedule_assignments.BeAdventitiousChangeDetected(p.user_id,p.relative_month,p.be_virgin_watchbill))
          {
          Alert
            (
            k.alert_cause_type.APPDATA,
            k.alert_state_type.FAILURE,
            key:"othrevdet",
            value:"It turns out that after you logged in (or previously attempted to PUBLISH your schedule in this login session), another editor *did* perform a Refresh that imported new availabilities into your schedule,"
            + " some of which have been selected for duty.  This may have occurred even *while* you were reading the previous prompt.  We strongly encourage you to review the Submitters list (sorted by time of submission), the"
            + " Alerts, the Special requests, and the yellow highlighted areas of your Watchbill *again* before publishing." + k.NEW_LINE
            + k.NEW_LINE
            + "Publishing has been canceled.  The PUBLISH button will be disabled until you navigate away from the Publish tab.",
            be_using_scriptmanager:true
            );
          }
        else
          {
          var working_directory = Server.MapPath("scratch");
          if (CheckBox_full.Checked)
            {
            p.biz_schedule_assignments.PublishFullWatchbill
              (
              p.agency_filter,
              p.release_filter,
              p.relative_month,
              RadioButton_scalable.Checked,
              working_directory
              );
            Alert(k.alert_cause_type.USER,k.alert_state_type.SUCCESS,"publishing","The server is now publishing the watchbill.",be_using_scriptmanager:true);
            }
          p.biz_schedule_assignments.PublishPendingNotifications
            (
            p.relative_month,
            p.be_virgin_watchbill,
            working_directory
            );
          }
        Button_publish.Enabled = false;
        }
      }

    private void ManageAblements()
      {
      p.be_virgin_watchbill = p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,p.relative_month);
      if (p.biz_schedule_assignments.BeOkToPublishFullWatchbill(p.be_ok_to_edit_schedule,p.user_member_id,p.agency_filter))
        {
        CheckBox_full.Checked = p.be_virgin_watchbill;
        CheckBox_full.Enabled = !p.be_virgin_watchbill;
        RadioButton_scalable.Enabled = true;
        RadioButton_month_at_a_glance.Enabled = true;
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
      Button_publish.Enabled = ((p.be_ok_to_edit_schedule || p.be_ok_to_edit_schedule_tier_department_only) && ((p.agency_filter == p.own_agency) || !p.be_virgin_watchbill)) || p.be_ok_to_edit_schedule_for_selected_special_agency;
      }

    }

  }
