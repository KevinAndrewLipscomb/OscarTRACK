using Class_biz_user;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace donation_ack_email
  {
  public partial class TWebForm_donation_ack_email: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string agency_keyclick_designator;
      public TClass_biz_user biz_user;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - donation_ack_email";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      p.biz_user = new TClass_biz_user();
      //
      p.agency_keyclick_designator = k.Safe(Request["agency"].ToString(),k.safe_hint_type.ALPHANUM);
      //
      UserControl_donation_ack_email_control.SetP
        (
        agency_keyclick_designator:p.agency_keyclick_designator,
        donor_name:k.Safe(Request["donor_name"].ToString(),k.safe_hint_type.ORG_NAME_ASTERICIZED),
        amount:k.Safe(Request["amount"].ToString(),k.safe_hint_type.REAL_NUM),
        donation_date:k.Safe(Request["date"].ToString(),k.safe_hint_type.HYPHENATED_NUM)
        );
//
// Uncomment the following line to disable partial page rendering.
//
//ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      }

    protected void LinkButton_log_in_Click(object sender, EventArgs e)
      {
      Server.Transfer("~/Default.aspx");
      }

    protected override void Render(HtmlTextWriter writer)
      {
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      var user_email_address = p.biz_user.EmailAddress();
      k.SmtpMailSend
        (
        from:p.agency_keyclick_designator + "@" + ConfigurationManager.AppSettings["host_domain_name"],
        to:Request["donor_email_address"],
        subject:"Donation acknowledgement",
        message_string:body,
        be_html:true,
        cc:user_email_address,
        bcc:k.EMPTY,
        reply_to:user_email_address
        );
      }

    } // end TWebForm_donation_ack_email

  }
