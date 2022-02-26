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
      public string member_email_address;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - donation_ack_email";
      if (!IsPostBack)
        {
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      SessionSet("dae_agency",Request["agency"]);
      SessionSet("dae_member_email_address",Request["member_email_address"]);
      SessionSet("dae_donor_name",Request["donor_name"]);
      SessionSet("dae_amount",Request["amount"]);
      SessionSet("dae_date",Request["date"]);
      SessionSet("dae_donor_email_address",Request["donor_email_address"]);
      //
      p.agency_keyclick_designator = k.Safe(Request["agency"],k.safe_hint_type.ALPHANUM);
      p.member_email_address = k.Safe(Request["member_email_address"],k.safe_hint_type.EMAIL_ADDRESS);
      //
      UserControl_donation_ack_email_control.SetP
        (
        agency_keyclick_designator:p.agency_keyclick_designator,
        member_email_address:p.member_email_address,
        donor_name:k.Safe(Request["donor_name"],k.safe_hint_type.ORG_NAME_ASTERICIZED),
        amount:k.Safe(Request["amount"],k.safe_hint_type.REAL_NUM),
        donation_date:k.Safe(Request["date"],k.safe_hint_type.HYPHENATED_NUM)
        );
//
// Uncomment the following line to disable partial page rendering.
//
//ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
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
        from:p.agency_keyclick_designator + "@" + ConfigurationManager.AppSettings["host_domain_name"],
        to:k.Safe(Request["donor_email_address"],k.safe_hint_type.EMAIL_ADDRESS_CSV),
        subject:"THANKS for your donation!",
        message_string:body,
        be_html:true,
        cc:p.member_email_address,
        bcc:k.EMPTY,
        reply_to:p.member_email_address
        );
      }

    } // end TWebForm_donation_ack_email

  }
