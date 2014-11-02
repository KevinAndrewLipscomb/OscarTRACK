using Class_biz_paypal_ipn_listener;
using kix;
using System;
using System.Text;

namespace paypal_ipn_listener
  {

  public partial class TWebForm_paypal_ipn_listener: System.Web.UI.Page
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
      new TClass_biz_paypal_ipn_listener().ProcessNotification
        (
        message:Encoding.ASCII.GetString(Request.BinaryRead(Request.ContentLength)),
        payment_status:Request["payment_status"],
        receiver_email:Request["receiver_email"],
        amount_donated:Request["mc_gross"],
        donor_email_address:Request["payer_email"],
        donor_first_name:Request["first_name"],
        donor_last_name:Request["last_name"],
        date_of_donation:Request["payment_date"],
        memo:Request["memo"]
        );
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    } // end TWebForm_paypal_ipn_listener

  }
