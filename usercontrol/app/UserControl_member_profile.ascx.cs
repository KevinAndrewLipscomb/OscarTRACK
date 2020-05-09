// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_sms_gateways;
using Class_biz_user;
using Class_biz_users;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_member_profile
  {
  public partial class TWebUserControl_member_profile: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_sms_gateways biz_sms_gateways;
      public TClass_biz_users biz_users;
      public TClass_biz_user biz_user;
      public string oscalert_threshold_general;
      public string oscalert_threshold_als;
      public object summary;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      EstablishClientSideFunction
        (
        "SecurePassword()",
        k.EMPTY
        + " if (El('" + TextBox_nominal_password.ClientID + "').value != '') El('" + TextBox_nominal_password.ClientID + "').value = new jsSHA(El('" + TextBox_nominal_password.ClientID + "').value,'ASCII').getHash('HEX');"
        + " if (El('" + TextBox_confirmation_password.ClientID + "').value != '') El('" + TextBox_confirmation_password.ClientID + "').value = new jsSHA(El('" + TextBox_confirmation_password.ClientID + "').value,'ASCII').getHash('HEX');"
        );
      //
      Button_save_password.Attributes.Add("onclick","SecurePassword()");
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var email_address = p.biz_users.SelfEmailAddress();
        TextBox_nominal_email_address.Text = email_address;
        TextBox_confirmation_email_address.Text = email_address;
        //
        if (p.summary != null)
          {
          TableRow_no_link_1.Visible = false;
          TableRow_no_link_2.Visible = TableRow_no_link_1.Visible;
          TableRow_no_link_3.Visible = TableRow_no_link_1.Visible;
          TextBox_phone_num.Enabled = true;
          RequiredFieldValidator_phone_num.Enabled = true;
          CustomValidator_phone_num.Enabled = true;
          Button_save_phone_num.Enabled = true;
          var phone_num = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOfSummary(p.summary));
          TextBox_phone_num.Text = phone_num;
          Panel_oscalert_settings.Enabled = (phone_num.Length > 0);
          p.biz_sms_gateways.BindDirectToListControl
            (
            target:DropDownList_phone_service,
            unselected_literal:"-- Select --",
            selected_value:p.biz_members.PhoneServiceIdOf(p.summary)
            );
          Button_test.Enabled = ((phone_num.Length > 0) && (DropDownList_phone_service.SelectedValue.Length > 0));
          var oscalert_threshold_general = k.EMPTY;
          var oscalert_threshold_als = k.EMPTY;
          var do_oscalert_for_trap = false;
          var do_oscalert_for_airport_alert = false;
          var do_oscalert_for_mrt = false;
          var do_oscalert_for_sart = false;
          p.biz_members.GetOscalertThresholdsAndSubscriptions
            (
            summary:p.summary,
            oscalert_threshold_general:out oscalert_threshold_general,
            oscalert_threshold_als:out oscalert_threshold_als,
            do_oscalert_for_trap:out do_oscalert_for_trap,
            do_oscalert_for_airport_alert:out do_oscalert_for_airport_alert,
            do_oscalert_for_mrt:out do_oscalert_for_mrt,
            do_oscalert_for_sart:out do_oscalert_for_sart
            );
          p.oscalert_threshold_general = oscalert_threshold_general;
          p.oscalert_threshold_als = oscalert_threshold_als;
          (FindControl(id:"RadioButton_" + (p.oscalert_threshold_general.Length > 0 ? p.oscalert_threshold_general : "no_general")) as RadioButton).Checked = true;
          (FindControl(id:"RadioButton_" + (p.oscalert_threshold_als.Length > 0 ? p.oscalert_threshold_als : "no_als")) as RadioButton).Checked = true;
          CheckBox_trap.Checked = do_oscalert_for_trap;
          CheckBox_airport_alert.Checked = do_oscalert_for_airport_alert;
          CheckBox_mrt_call.Checked = do_oscalert_for_mrt;
          CheckBox_sar_call.Checked = do_oscalert_for_sart;
          }
        //
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_member_profile")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_member_profile");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_member_profile")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_member_profile");
//        }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_sms_gateways = new TClass_biz_sms_gateways();
        p.biz_users = new TClass_biz_users();
        p.biz_user = new TClass_biz_user();
        //
        p.oscalert_threshold_als = k.EMPTY;
        p.oscalert_threshold_general = k.EMPTY;
        }
      p.summary = p.biz_members.Summary(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
        // Must do this every time because user may have linked to a membership record since last time.
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_member_profile_PreRender;
      }

    private void TWebUserControl_member_profile_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void CustomValidator_confirmation_email_address_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (TextBox_nominal_email_address.Text.Trim() == TextBox_confirmation_email_address.Text.Trim());
      }

    protected void CustomValidator_confirmation_password_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (TextBox_nominal_password.Text.Trim() == TextBox_confirmation_password.Text.Trim());
      }

    protected void CustomValidator_email_address_novelty_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = !p.biz_users.BeEmailAddressMappedToMember(k.Safe(args.Value, k.safe_hint_type.EMAIL_ADDRESS));
      }

    protected void CustomValidator_nominal_email_address_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = k.BeValidDomainPartOfEmailAddress(args.Value);
      }

    protected void CustomValidator_phone_num_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = k.BeValidNanpNumber(k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM));
      }

    protected void Button_save_password_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_users.SetPassword(p.biz_user.IdNum(), k.Safe(TextBox_nominal_password.Text.Trim(), k.safe_hint_type.HEX));
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"pwdsaved",
          value:"Password saved.",
          be_using_scriptmanager:true
          );
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_save_email_address_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_users.SetEmailAddress(p.biz_user.IdNum(), k.Safe(TextBox_nominal_email_address.Text.Trim(), k.safe_hint_type.EMAIL_ADDRESS));
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"emladrsaved",
          value:"Email address saved.",
          be_using_scriptmanager:true
          );
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_save_phone_num_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        var phone_num = k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM);
        p.biz_members.SetPhoneNumAndClearCellularProvider(phone_num,p.summary);
        DropDownList_phone_service.SelectedValue = k.EMPTY;
        Panel_oscalert_settings.Enabled = (phone_num.Length > 0);
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"phnumsaved",
          value:k.EMPTY
          + "Phone number saved." + k.NEW_LINE
          + k.NEW_LINE
          + "*NOTE* that this action also *cleared* your Cellular Provider setting, thus preventing you from receiving any OSCALERTs via cellphone.  To re-enable your OSCALERTs, set and save your Cellular Provider below.",
          be_using_scriptmanager:true
          );
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_save_oscalert_settings_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_members.SetOscalertSettings
          (
          phone_service_id:k.Safe(DropDownList_phone_service.SelectedValue,k.safe_hint_type.NUM),
          oscalert_threshold_general:p.oscalert_threshold_general,
          oscalert_threshold_als:p.oscalert_threshold_als,
          do_oscalert_for_trap:CheckBox_trap.Checked,
          do_oscalert_for_airport_alert:CheckBox_airport_alert.Checked,
          do_oscalert_for_mrt:CheckBox_mrt_call.Checked,
          do_oscalert_for_sart:CheckBox_sar_call.Checked,
          summary:p.summary
          );
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"oscalertstngssaved",
          value:"OSCALERT settings saved.",
          be_using_scriptmanager:true
          );
        Button_test.Enabled = true;
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void RadioButton_oscalert_threshold_general_CheckedChanged(object sender, EventArgs e)
      {
      var choice = k.Safe((sender as RadioButton).ID.Replace("RadioButton_",k.EMPTY),k.safe_hint_type.ECMASCRIPT_WORD);
      p.oscalert_threshold_general = (choice == "no_general" ? k.EMPTY : choice);
      }

    protected void RadioButton_oscalert_threshold_als_CheckedChanged(object sender, EventArgs e)
      {
      var choice = k.Safe((sender as RadioButton).ID.Replace("RadioButton_",k.EMPTY),k.safe_hint_type.ECMASCRIPT_WORD);
      p.oscalert_threshold_als = (choice == "no_als" ? k.EMPTY : choice);
      }

    protected void Button_test_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        var sms_target = k.EMPTY;
        var phone_num_digits = k.EMPTY;
        var carrier_name = k.EMPTY;
        p.biz_members.GetSmsInfoOfId
          (
          id:p.biz_members.IdOf(p.summary),
          email_address:out sms_target,
          phone_num_digits:out phone_num_digits,
          carrier_name:out carrier_name
          );
        if (sms_target.Length > 0)
          {
          k.SmtpMailSend
            (
            from:ConfigurationManager.AppSettings["sender_email_address_oscalert"],
            to:sms_target,
            subject:k.EMPTY,
            message_string:"Congratulations! You are now registered to receive OSCALERTs.",
            be_html:false,
            cc:k.EMPTY,
            bcc:k.EMPTY,
            reply_to:ConfigurationManager.AppSettings["bouncer_email_address"]
            );
          Alert
            (
            cause:k.alert_cause_type.USER,
            state:k.alert_state_type.SUCCESS,
            key:"oscalerttstsnt",
            value:"A test message has been sent to " + k.FormatAsNanpPhoneNum(phone_num_digits) + " via " + carrier_name + ".",
            be_using_scriptmanager:true
            );
          }
        else
          {
          Alert
            (
            cause:k.alert_cause_type.APPDATA,
            state:k.alert_state_type.FAILURE,
            key:"oscalerttstfail",
            value:"Sorry, the application could not retrieve your SMS address from its database. The test message could NOT be sent. Have you SAVED your OSCALERT settings?",
            be_using_scriptmanager:true
            );
          }
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void DropDownList_phone_service_SelectedIndexChanged(object sender, EventArgs e)
      {
      Button_test.Enabled = false;
      }

    } // end TWebUserControl_member_profile

  }
