// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_donations;
using Class_msg_protected;
using Class_biz_notifications;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace confirm_paypal_donation
  {
  public struct p_type
    {
    public TClass_biz_donations biz_donations;
    public TClass_biz_notifications biz_notifications;
    public TClass_msg_protected.confirm_paypal_donation incoming;
    }

  public partial class TWebForm_confirm_paypal_donation: ki_web_ui.page_class
    {
    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebForm_confirm_paypal_donation_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - confirm_paypal_donation";
        Literal_amount_donated.Text = p.incoming.from_process_paypal_donation.amount_donated;
        Literal_donor_name.Text = p.incoming.from_process_paypal_donation.donor_name;
        Literal_donation_date.Text = p.incoming.from_process_paypal_donation.donation_date.ToString("yyyy-MM-dd");
        Literal_donor_email_address.Text = p.incoming.from_process_paypal_donation.donor_email_address;
        if (p.incoming.resident_id != k.EMPTY)
          {
          Panel_selected.Visible = true;
          Literal_resident_name.Text = p.incoming.resident_name;
          Literal_house_num_and_street.Text = p.incoming.resident_house_num_and_street;
          Literal_city.Text = (p.incoming.resident_city == "VB" ? "VIRGINIA BEACH" : p.incoming.resident_city);
          Literal_state.Text = p.incoming.resident_state;
          Literal_num_priors.Text = p.incoming.num_priors;
          Literal_avg_amount.Text = p.incoming.avg_amount;
          }
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("confirm_paypal_donation.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_donations = new TClass_biz_donations();
        p.biz_notifications = new TClass_biz_notifications();
        p.incoming = Message<TClass_msg_protected.confirm_paypal_donation>("protected","confirm_paypal_donation");
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["confirm_paypal_donation.p"]);
        }
      }

    protected void Button_yes_Click(object sender, System.EventArgs e)
      {
      p.biz_donations.Process(p.incoming,k.Safe(Literal_city.Text,k.safe_hint_type.POSTAL_CITY));
      BackTrack(2);
      }

    protected void Button_cancel_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    private void TWebForm_confirm_paypal_donation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("confirm_paypal_donation.p", p);
      }

    } // end TWebForm_confirm_paypal_donation

  }
