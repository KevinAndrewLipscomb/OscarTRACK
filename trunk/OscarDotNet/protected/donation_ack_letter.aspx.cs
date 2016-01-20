using kix;
using System;
using System.Configuration;

namespace donation_ack_letter
  {
  public partial class TWebForm_donation_ack_letter: ki_web_ui.page_class
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
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - donation_ack_letter";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      UserControl_donation_ack_letter_control.SetP
        (
        agency_keyclick_designator:k.Safe(Request["agency"].ToString(),k.safe_hint_type.ALPHANUM),
        donor_name:k.Safe(Request["donor_name"].ToString(),k.safe_hint_type.ORG_NAME_ASTERICIZED),
        address:k.Safe(Request["address"].ToString(),k.safe_hint_type.POSTAL_STREET_ADDRESS),
        city:k.Safe(Request["city"].ToString(),k.safe_hint_type.POSTAL_CITY),
        state:k.Safe(Request["state"].ToString(),k.safe_hint_type.ALPHA),
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
    } // end TWebForm_donation_ack_letter

  }
