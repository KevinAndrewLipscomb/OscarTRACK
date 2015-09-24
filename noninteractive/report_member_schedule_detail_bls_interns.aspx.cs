using kix;
using System;
using System.Configuration;

namespace report_member_schedule_detail_bls_interns
  {

  public partial class TWebForm_report_member_schedule_detail_bls_interns: ki_web_ui.page_class
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = ConfigurationManager.AppSettings["application_name"] + " - report_member_schedule_detail_bls_interns";
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      SessionSet("mode:report",k.EMPTY);
      }

    //protected override void Render(HtmlTextWriter writer)
    //  {
    //  var biz_role_member_map = new TClass_biz_role_member_map();
    //  //
    //  // Write the HTML stream into a StringBuilder.
    //  //
    //  var sb = new StringBuilder();
    //  base.Render(new HtmlTextWriter(new StringWriter(sb)));
    //  //
    //  // Send output stream as an email message.
    //  //
    //  var state_strike_team_executive_email_target = biz_role_member_map.EmailTargetForPennsylvania(role_name:"State Strike Team Executive");
    //  k.SmtpMailSend
    //    (
    //    from:ConfigurationManager.AppSettings["sender_email_address"],
    //    to:state_strike_team_executive_email_target + k.COMMA + biz_role_member_map.EmailTargetForPennsylvania(role_name:"State Strike Team Manager"),
    //    subject:"Region Strike Team Officers in State",
    //    message_string:sb.ToString(),
    //    be_html:true,
    //    cc:k.EMPTY,
    //    bcc:k.EMPTY,
    //    reply_to:state_strike_team_executive_email_target
    //    );
    //  }

    } // end TWebForm_report_member_schedule_detail_bls_interns

  }
