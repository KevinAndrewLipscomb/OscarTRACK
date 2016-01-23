// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_donations;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace donation_ack_email_trigger
  {

  public partial class TWebForm_donation_ack_email_trigger: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_donations biz_donations;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_donation_ack_email_trigger_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - donation_ack_email_trigger";
        p.biz_donations.SendAck
          (
          working_directory:Server.MapPath("scratch"),
          urlencoded_agency_keyclick_designator:Server.UrlEncode(k.Safe(Request["agency"].ToString(),k.safe_hint_type.ALPHANUM)),
          urlencoded_member_email_address:Server.UrlEncode(k.Safe(Request["member_email_address"].ToString(),k.safe_hint_type.EMAIL_ADDRESS)),
          urlencoded_donor_name:Server.UrlEncode(k.Safe(Request["donor_name"].ToString(),k.safe_hint_type.ORG_NAME_ASTERICIZED)),
          urlencoded_amount:Server.UrlEncode(k.Safe(Request["amount"].ToString(),k.safe_hint_type.REAL_NUM)),
          urlencoded_date:Server.UrlEncode(k.Safe(Request["date"].ToString(),k.safe_hint_type.HYPHENATED_NUM)),
          urlencoded_donor_email_address:Server.UrlEncode(k.Safe(Request["donor_email_address"],k.safe_hint_type.EMAIL_ADDRESS_CSV))
          );
        AlertAndWindowHistoryBack(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "donacksent", "Donation acknowledgment sent.");
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisitUnlimited(InstanceId() + ".p");
      if (new ArrayList() {nature_of_visit_type.VISIT_COLD_CALL,nature_of_visit_type.VISIT_INITIAL}.Contains(nature_of_visit))
        {
        //
        // Initialize p.~ objects here.
        //
        p.biz_donations = new TClass_biz_donations();
        //
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
//
// ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
//
      }

    private void TWebForm_donation_ack_email_trigger_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_donation_ack_email_trigger

  }
