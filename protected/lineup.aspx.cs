using Class_biz_agencies;
using kix;
using System;
using System.Configuration;
using UserControl_schedule_assignment_assistant_alert_travel_gap;
using UserControl_schedule_proposal;

namespace lineup
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_lineup: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_agencies biz_agencies;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_lineup_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - lineup";
      if (!IsPostBack)
        {
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit_unlimited = NatureOfVisitUnlimited(InstanceId() + ".p");
      if(
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_COLD_CALL)
        ||
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_INITIAL)
        )
        {
        //
        // Handle the case where session variables, assumed to exist by code in this page, have been lost.
        //
        if (Session["member_id"] == null)
          {
          Server.Transfer("~/timeout.aspx");
          }
        //
        p.biz_agencies = new TClass_biz_agencies();
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-lineup", k.EMPTY);
        //
        var UserControl_schedule_proposal_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx") as TWebUserControl_schedule_proposal));
        AddIdentifiedControlToPlaceHolder
          (
          c:UserControl_schedule_proposal_control,
          id:"UserControl_schedule_proposal_control",
          p:PlaceHolder_schedule_proposal
          );
        UserControl_schedule_proposal_control.SetInteractivity(false);
        UserControl_schedule_proposal_control.SetFilter
          (
          agency_filter:k.EMPTY,
          release_filter:k.EMPTY,
          relative_month:new k.subtype<int>(0,0)
          );
        //
        var UserControl_schedule_assignment_assistant_alert_travel_gap_muster = ((LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_travel_gap.ascx") as TWebUserControl_schedule_assignment_assistant_alert_travel_gap));
        AddIdentifiedControlToPlaceHolder
          (
          c:UserControl_schedule_assignment_assistant_alert_travel_gap_muster,
          id:"UserControl_schedule_assignment_assistant_alert_travel_gap_muster",
          p:PlaceHolder_schedule_assignment_assistant_alert_travel_gap_muster
          );
        UserControl_schedule_assignment_assistant_alert_travel_gap_muster.SetInteractivity(false);
        UserControl_schedule_assignment_assistant_alert_travel_gap_muster.SetBeForMuster(true);
        UserControl_schedule_assignment_assistant_alert_travel_gap_muster.SetFilter
          (
          agency_filter:k.EMPTY,
          release_filter:k.EMPTY,
          relative_month:new k.subtype<int>(0,0)
          );
        //
        var UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal = ((LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_travel_gap.ascx") as TWebUserControl_schedule_assignment_assistant_alert_travel_gap));
        AddIdentifiedControlToPlaceHolder
          (
          c:UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal,
          id:"UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal",
          p:PlaceHolder_schedule_assignment_assistant_alert_travel_gap_dismissal
          );
        UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal.SetInteractivity(false);
        UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal.SetBeForMuster(false);
        UserControl_schedule_assignment_assistant_alert_travel_gap_dismissal.SetFilter
          (
          agency_filter:k.EMPTY,
          release_filter:k.EMPTY,
          relative_month:new k.subtype<int>(0,0)
          );
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_lineup_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      Session.Remove("mode:report");
      Session.Remove("mode:report/commanded-lineup");
      }

    } // end TWebForm_lineup

  }
