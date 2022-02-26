// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_agencies;
using Class_biz_notifications;
using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace mark_vehicle_up
  {

  public partial class TWebForm_mark_vehicle_up: ki_web_ui.page_class
    {

    private struct p_type
      {
      public bool be_ok_to_send_ready_notification;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_notifications biz_notifications;
      public TClass_biz_vehicle_usability_history biz_vehicle_usability_history;
      public TClass_biz_vehicles biz_vehicles;
      public string down_comment;
      public string vehicle_id;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_mark_vehicle_up_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - mark_vehicle_up";
      if (!IsPostBack)
        {
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
        UserControl_drop_down_datetime_control.minute_intervals = 5;
        UserControl_drop_down_datetime_control.selectedvalue = DateTime.Now.ToUniversalTime().AddMinutes(-((Double)(Session["client_timezone_offset"])));
        TextBox_prior_note.Text = p.down_comment;
        //
        TableCell_readiness_details_spacer.Visible = p.be_ok_to_send_ready_notification;
        TableCell_readiness_details.Visible = p.be_ok_to_send_ready_notification;
        //
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_notifications = new TClass_biz_notifications();
        p.biz_vehicle_usability_history = new TClass_biz_vehicle_usability_history();
        p.biz_vehicles = new TClass_biz_vehicles();
        //
        p.be_ok_to_send_ready_notification = k.Has((string[])(Session["privilege_array"]), "send-vehicle-shuttle-needed-notifications");
        p.vehicle_id = p.biz_vehicles.IdOf(Session["vehicle_summary"]);
        //
        p.down_comment = p.biz_vehicle_usability_history.LatestDownComment(p.vehicle_id);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_mark_vehicle_up_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (IsValid)
        {
        p.biz_vehicles.MarkUp
          (
          p.vehicle_id,
          UserControl_drop_down_datetime_control.selectedvalue,
          k.Safe(TextBox_target_pm_mileage.Text,k.safe_hint_type.NUM),
          p.down_comment,
          k.Safe(TextBox_note_to_append.Text,k.safe_hint_type.MEMO).Trim(),
          Session["vehicle_summary"]
          );
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    protected void CustomValidator_date_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = UserControl_drop_down_datetime_control.isvalid;
      }

    protected void CustomValidator_datetime_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicle_usability_history.BeLater(p.vehicle_id,UserControl_drop_down_datetime_control.selectedvalue);
      }

    protected void CustomValidator_target_pm_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      var be_valid = p.biz_vehicles.BeNotEarlierTargetPmMileage(p.vehicle_id,k.Safe(TextBox_target_pm_mileage.Text,k.safe_hint_type.NUM)) || CheckBox_target_pm_mileage.Checked;
      CheckBox_target_pm_mileage.Visible = !be_valid;
      args.IsValid = be_valid;
      }

    protected void Button_notify_ready_Click(object sender, EventArgs e)
      {
      var vehicle_agency_id = p.biz_vehicles.AgencyIdOfId(p.biz_vehicles.IdOf(Session["vehicle_summary"]));
      p.biz_notifications.IssueForVehicleReady
        (
        vehicle_name:p.biz_vehicles.NameOf(Session["vehicle_summary"]),
        vehicle_agency_id:vehicle_agency_id,
        vehicle_agency_designator:p.biz_agencies.ShortDesignatorOf(vehicle_agency_id),
        where:k.Safe(TextBox_ready_where.Text,k.safe_hint_type.PUNCTUATED),
        comment:k.Safe(TextBox_ready_comment.Text,k.safe_hint_type.PUNCTUATED)
        );
      AlertAndBackTrack
        (
        cause:k.alert_cause_type.USER,
        state:k.alert_state_type.SUCCESS,
        key:"readysent",
        value:"Message sent"
        );
      }

    } // end TWebForm_mark_vehicle_up

  }
