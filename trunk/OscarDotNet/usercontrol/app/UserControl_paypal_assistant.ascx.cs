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
    public string amount_donated;
    public bool be_loaded;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_streets biz_streets;
    public TClass_biz_user biz_user;
    public DateTime donation_date;
    public string donor_email_address;
    public string donor_house_num;
    public string donor_name;
    public string donor_street_name;
    public string memo;
    public TClass_msg_protected.process_paypal_donation msg_protected_process_paypal_donation;
    }

  public partial class TWebUserControl_paypal_assistant: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        UserControl_drop_down_date_donation_date.selectedvalue = (p.donation_date > DateTime.MinValue ? p.donation_date : DateTime.Today);
        p.biz_streets.BindDirectToListControl
          (
          target:DropDownList_donor_street,
          agency_keyclick_enumerator:p.biz_agencies.KeyclickEnumeratorOf(p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()))),
          unselected_literal:"-- street --"
          );
        //
        TextBox_amount_donated.Text = p.amount_donated;
        TextBox_donor_email_address.Text = p.donor_email_address;
        TextBox_donor_name.Text = p.donor_name;
        TextBox_memo.Text = (p.memo.Length > 0 ? p.memo : "(disregard)");
        TextBox_donor_house_num.Text = p.donor_house_num;
        //
        if (p.donor_street_name.Length > 0)
          {
          var list_item = DropDownList_donor_street.Items.FindByText(p.donor_street_name);
          if (list_item != null)
            {
            list_item.Selected = true;
            }
          }
        //
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
        p.amount_donated = k.EMPTY;
        p.donation_date = DateTime.MinValue;
        p.donor_email_address = k.EMPTY;
        p.donor_house_num = k.EMPTY;
        p.donor_name = k.EMPTY;
        p.donor_street_name = k.EMPTY;
        p.memo = k.EMPTY;
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

    internal void Set
      (
      string agency,
      string amount_donated,
      DateTime donation_date,
      string donor_email_address,
      string donor_house_num,
      string donor_name,
      string donor_street_name,
      string memo
      )
      {
      p.agency = agency;
      if (amount_donated.Length > 0)
        {
        p.amount_donated = amount_donated;
        }
      if (donation_date > DateTime.MinValue)
        {
        p.donation_date = donation_date;
        }
      if (donor_email_address.Length > 0)
        {
        p.donor_email_address = donor_email_address;
        }
      if (donor_house_num.Length > 0)
        {
        p.donor_house_num = donor_house_num;
        }
      if (donor_name.Length > 0)
        {
        p.donor_name = donor_name;
        }
      if (donor_street_name.Length > 0)
        {
        p.donor_street_name = donor_street_name + ", VIRGINIA BEACH, VA";
        }
      if (memo.Length > 0)
        {
        p.memo = memo;
        }
      }
    internal void Set(string agency)
      {
      Set
        (
        agency:agency,
        amount_donated:k.EMPTY,
        donation_date:DateTime.MinValue,
        donor_email_address:k.EMPTY,
        donor_house_num:k.EMPTY,
        donor_name:k.EMPTY,
        donor_street_name:k.EMPTY,
        memo:k.EMPTY
        );
      }

    }

  }
