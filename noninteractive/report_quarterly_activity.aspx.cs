using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace report_quarterly_activity
  {
  public partial class TWebForm_report_quarterly_activity: Page
    {

    private struct p_type
      {
      public TClass_biz_role_member_map biz_role_member_map;
      }

    private p_type p;
  
    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      Title = ConfigurationManager.AppSettings["application_name"] + " - report_quarterly_activity";
      Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
      Label_application_name_2.Text = Label_application_name.Text;
      Label_application_name_3.Text = Label_application_name.Text;
      var url = ConfigurationManager.AppSettings["runtime_root_fullspec"];
      HyperLink_web_site.Text = url;
      HyperLink_web_site.NavigateUrl = url;

      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      // Set session objects referenced by UserControl_roster.
      //
      Session.Add("mode:report", k.EMPTY);
      Session.Add("mode:report/quarterly-behind-the-scenes-activity", k.EMPTY);
      p.biz_role_member_map = new TClass_biz_role_member_map();
      }

    protected override void Render(HtmlTextWriter writer)
      {
      //
      // Write the HTML stream into a StringBuilder.
      //
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        //
        // Don't use role_notification_map because this report would have to mention itself as an activity, which is undesirable.
        //
        to:p.biz_role_member_map.EmailTargetOf("Department Authority", "EMS")
        + k.COMMA + p.biz_role_member_map.EmailTargetOf("Department Deputy Chief", "EMS")
        + k.COMMA + p.biz_role_member_map.EmailTargetOf("Department Assistant Chief", "EMS")
        + k.COMMA + p.biz_role_member_map.EmailTargetOf("Department Division Chief", "EMS"),
        subject:"Report: Quarterly Behind-The-Scenes Activity",
        message_string:body,
        be_html:true,
        cc:ConfigurationManager.AppSettings["sender_email_address"]
        );
      Session.Abandon();
      }

    } // end TWebForm_report_quarterly_activity

  }
