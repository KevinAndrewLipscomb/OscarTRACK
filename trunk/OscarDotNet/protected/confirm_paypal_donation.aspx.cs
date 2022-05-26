// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_donations;
using Class_biz_notifications;
using Class_msg_protected;
using kix;
using System;
using System.Configuration;

namespace confirm_paypal_donation
  {
  public partial class TWebForm_confirm_paypal_donation: ki_web_ui.page_class
    {
    private struct p_type
      {
      public TClass_biz_donations biz_donations;
      public TClass_biz_notifications biz_notifications;
      public TClass_msg_protected.confirm_paypal_donation incoming;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_confirm_paypal_donation_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - confirm_paypal_donation";
      if (!IsPostBack)
        {
        Literal_amount_donated.Text = p.incoming.from_process_paypal_donation.amount_donated;
        Literal_donor_name.Text = p.incoming.from_process_paypal_donation.donor_name;
        Literal_donation_date.Text = p.incoming.from_process_paypal_donation.donation_date.ToString("yyyy-MM-dd");
        Literal_donor_email_address.Text = p.incoming.from_process_paypal_donation.donor_email_address;
        //
        if (p.incoming.resident_id.Length == 0) // the donor's identity is unknown -- getting more info from them would be useful
          {
          Panel_unknown.Visible = true;
          }
        else if (p.incoming.resident_id == "0") // the donor is from out of the agency's fund drive area
          {
          Panel_out_of_area.Visible = true;
          }
        else if (p.incoming.resident_id.Length > 0) // the donor has been matched to a ROD record
          {
          CheckBox_do_force_donor_name_into_rod_record.Visible = true;
          CheckBox_do_force_donor_name_into_rod_record.Checked = (p.incoming.resident_name.Length == 0);
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
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_donations = new TClass_biz_donations();
        p.biz_notifications = new TClass_biz_notifications();
        p.incoming = Message<TClass_msg_protected.confirm_paypal_donation>("protected","confirm_paypal_donation");
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    protected void Button_yes_Click(object sender, System.EventArgs e)
      {
      p.biz_donations.Process
        (
        incoming:p.incoming,
        city:k.Safe(Literal_city.Text,k.safe_hint_type.POSTAL_CITY),
        do_force_donor_name_into_rod_record:CheckBox_do_force_donor_name_into_rod_record.Checked
        );
      BackTrack(2);
      }

    protected void Button_cancel_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    private void TWebForm_confirm_paypal_donation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_confirm_paypal_donation

  }
