using Class_biz_agencies;
using Class_biz_vehicles;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.Text;
using System.Web.UI;
using System.IO;
using UserControl_eval;
using System.Web;

namespace report_commanded_eval
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_report_commanded_eval: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_vehicles biz_vehicles;
      public TClass_biz_role_member_map biz_role_member_map;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_report_commanded_eval_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = ConfigurationManager.AppSettings["application_name"] + " - report_commanded_eval";
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
        p.biz_vehicles = new TClass_biz_vehicles();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        Session.Add("mode:report", k.EMPTY);
        Session.Add("mode:report/commanded-eval", k.EMPTY);
        //
        var UserControl_eval = ((LoadControl("~/usercontrol/app/UserControl_eval.ascx") as TWebUserControl_eval));
        PlaceHolder_eval.Controls.Add(UserControl_eval);
        UserControl_eval.Set
          (
          id:k.Safe(Request["eval_id"],k.safe_hint_type.NUM),
          user_member_id:k.EMPTY,
          be_user_evaluatee:false
          );
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_report_commanded_eval_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
      base.Render(html_text_writer);
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:p.biz_role_member_map.EmailTargetOf("Department BLS ID Coordinator","EMS") + k.COMMA + p.biz_role_member_map.EmailTargetOf("Squad Training Officer",p.biz_agencies.ShortDesignatorOf(Request["target_agency_id"])),
        subject:"Eval archived",
        message_string:body,
        be_html:true
        );
      Session.Abandon();
      }

    } // end TWebForm_report_commanded_eval

  }
