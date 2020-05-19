using Class_biz_agencies;
using kix;
using System;
using System.Configuration;
using UserControl_schedule_proposal;

namespace watchbill
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_watchbill: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_filter;
      public TClass_biz_agencies biz_agencies;
      public string release_filter;
      public k.subtype<int> relative_month;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_watchbill_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - watchbill";
        //
        if (p.agency_filter.Length == 0)
          {
          Literal_agency.Text = "ALL RESCUE SQUADS";
          }
        else
          {
          Literal_agency.Text = p.biz_agencies.MediumDesignatorOf(p.agency_filter).ToUpper();
          }
        if (p.release_filter.Length == 0)
          {
          Literal_release_filter.Text = "all assigned personnel";
          }
        else if (p.release_filter == "1")
          {
          Literal_release_filter.Text = "only personnel who are released";
          }
        else if (p.release_filter == "0")
          {
          Literal_release_filter.Text = "only personnel who are not released";
          }
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
        p.biz_agencies = new TClass_biz_agencies();
        //
        p.agency_filter = k.Safe(Request["agency_id"],k.safe_hint_type.NUM);
        p.release_filter = k.Safe(Request["release_filter"],k.safe_hint_type.NUM);
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(k.Safe(Request["relative_month"],k.safe_hint_type.NUM));
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-watchbill-interactive", k.EMPTY);
        //
        var UserControl_schedule_proposal_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx") as TWebUserControl_schedule_proposal));
        PlaceHolder_schedule_proposal.Controls.Add(UserControl_schedule_proposal_control);
        UserControl_schedule_proposal_control.SetInteractivity(false);
        UserControl_schedule_proposal_control.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_watchbill_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      Session.Remove("mode:report");
      Session.Remove("mode:report/commanded-watchbill");
      }

    } // end TWebForm_watchbill

  }
