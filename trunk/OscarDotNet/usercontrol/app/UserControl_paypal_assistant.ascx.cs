using Class_biz_agencies;
using Class_biz_members;
using Class_biz_streets;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Configuration;
using System.Web.UI;

namespace UserControl_paypal_assistant
  {

  public struct p_type
    {
    public string agency;
    public bool be_loaded;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_streets biz_streets;
    public TClass_biz_user biz_user;
    public TClass_msg_protected.process_paypal_donation msg_protected_process_paypal_donation;
    }

  public partial class TWebUserControl_paypal_assistant: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        UserControl_drop_down_date_donation_date.selectedvalue = DateTime.Today;
        p.biz_streets.BindDirectToListControl
          (
          target:DropDownList_donor_street,
          agency_keyclick_enumerator:p.biz_agencies.KeyclickEnumeratorOf(p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()))),
          unselected_literal:"-- street --"
          );
        TextBox_amount_donated.Focus();
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_funddrive_binder_PlaceHolder_content"] as string) == "UserControl_paypal_assistant");
        }
      else
        {
        p.be_loaded = false;
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_streets = new TClass_biz_streets();
        p.biz_user = new TClass_biz_user();
        p.msg_protected_process_paypal_donation = new TClass_msg_protected.process_paypal_donation();
        //
        p.agency = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_paypal_assistant_PreRender;
      }

    private void TWebUserControl_paypal_assistant_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_paypal_assistant Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void CustomValidator_donor_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
      {
      args.IsValid = k.BeValidDomainPartOfEmailAddress(args.Value);
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        p.msg_protected_process_paypal_donation.agency = p.agency;
        p.msg_protected_process_paypal_donation.amount_donated = k.Safe(TextBox_amount_donated.Text,k.safe_hint_type.CURRENCY_USA);
        p.msg_protected_process_paypal_donation.donor_email_address = k.Safe(TextBox_donor_email_address.Text,k.safe_hint_type.EMAIL_ADDRESS).ToLower();
        p.msg_protected_process_paypal_donation.donor_name = k.Safe(TextBox_donor_name.Text,k.safe_hint_type.ORG_NAME).ToUpper();
        p.msg_protected_process_paypal_donation.donation_date = UserControl_drop_down_date_donation_date.selectedvalue;
        p.msg_protected_process_paypal_donation.donor_house_num = k.Safe(TextBox_donor_house_num.Text,k.safe_hint_type.HYPHENATED_ALPHANUM).ToUpper();
        p.msg_protected_process_paypal_donation.donor_street_id = k.Safe(DropDownList_donor_street.SelectedValue,k.safe_hint_type.NUM);
        if (p.msg_protected_process_paypal_donation.donor_street_id != k.EMPTY)
          {
          p.msg_protected_process_paypal_donation.donor_street_name = k.Safe(DropDownList_donor_street.SelectedItem.Text,k.safe_hint_type.POSTAL_CITY_CSV);
          }
        MessageDropCrumbAndTransferTo(p.msg_protected_process_paypal_donation,"protected","process_paypal_donation");
        }
      }

    internal void SetTarget(string agency)
      {
      p.agency = agency;
      }

    }

  }
