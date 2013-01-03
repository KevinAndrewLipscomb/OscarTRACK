using Class_biz_agencies;
using kix;
using System;
using System.Configuration;
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

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_lineup_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - lineup";
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
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-lineup", k.EMPTY);
        //
        var UserControl_schedule_proposal_control = ((LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx") as TWebUserControl_schedule_proposal));
        PlaceHolder_schedule_proposal.Controls.Add(UserControl_schedule_proposal_control);
        UserControl_schedule_proposal_control.SetInteractivity(false);
        UserControl_schedule_proposal_control.SetFilter
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
