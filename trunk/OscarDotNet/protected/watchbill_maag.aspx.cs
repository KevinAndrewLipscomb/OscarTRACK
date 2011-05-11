using Class_biz_agencies;
using kix;
using System;
using System.Configuration;
using UserControl_watchbill_maag;

namespace watchbill_maag
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_watchbill_maag: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_filter;
      public TClass_biz_agencies biz_agencies;
      public k.subtype<int> relative_month;
      }

    private p_type p;

    private void InitializeComponent()
      {
      PreRender += TWebForm_watchbill_maag_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - watchbill_maag";
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
        var hashtable_of_shielded_request = HashtableOfShieldedRequest();
        p.agency_filter = hashtable_of_shielded_request["agency_id"].ToString();
        p.relative_month = new k.subtype<int>(0,1);
        p.relative_month.val = int.Parse(hashtable_of_shielded_request["relative_month"].ToString());
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-watchbill-maag", k.EMPTY);
        //
        var UserControl_watchbill_maag = ((LoadControl("~/usercontrol/app/UserControl_watchbill_maag.ascx") as TWebUserControl_watchbill_maag));
        PlaceHolder_watchbill_maag.Controls.Add(UserControl_watchbill_maag);
        UserControl_watchbill_maag.SetFilter(p.agency_filter,p.relative_month);
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_watchbill_maag_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      Session.Remove("mode:report");
      Session.Remove("mode:report/commanded-watchbill-maag");
      }

    } // end TWebForm_watchbill_maag

  }
