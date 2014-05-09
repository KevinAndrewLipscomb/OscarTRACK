// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_sms_gateways;
using Class_biz_user;
using Class_biz_users;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

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
      public bool be_ok_to_config_member_profiles;
      public object summary;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_member_id.Text = k.EMPTY;
      DropDownList_member_id.Visible = false;
//<KiCrudHelper:ClearStatements/>
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
      SetDependentFieldAblements(false);
      Button_submit.Enabled = false;
      Button_delete.Enabled = false;
      }

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
        LinkButton_new_record.Visible = p.be_ok_to_config_member_profiles;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
#warning Remove the following line if the member_profile will primarily be a reference table as opposed to a log or journal table.
        SetDataEntryMode();
        //
        var email_address = p.biz_users.SelfEmailAddress();
        TextBox_nominal_email_address.Text = email_address;
        TextBox_confirmation_email_address.Text = email_address;
        //
        TextBox_phone_num.Text = k.FormatAsNanpPhoneNum(Session["member_phone_num"].ToString());
        //
        p.biz_sms_gateways.BindDirectToListControl
          (
          target:DropDownList_phone_service,
          unselected_literal:"-- Select --",
          selected_value:p.biz_members.PhoneServiceOf(p.summary)
          );
        //
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string member_id)
      {
      Literal_match_index.Text = DropDownList_member_id.SelectedIndex.ToString();
      bool result;
//<KiCrudHelper:VarBlock/>
      result = false;
      if
        (
        p.biz_member_profiles.Get
          (
          member_id,
//<KiCrudHelper:BizGetCalls/>
          )
        )
        {
        TextBox_member_id.Text = member_id;
        TextBox_member_id.Enabled = false;
//<KiCrudHelper:PresentRecordAssignments/>
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_member_profiles);
        Button_submit.Enabled = p.be_ok_to_config_member_profiles;
        Button_delete.Enabled = p.be_ok_to_config_member_profiles;
        result = true;
        }
      return result;
      }

    private void SetDataEntryMode()
      {
      Clear();
#warning Only keep the following line if it exactly matches "TextBox_id.Text = "*";".
      TextBox_member_id.Text = "*";
      TextBox_member_id.Enabled = false;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_member_profiles);
      Button_submit.Enabled = p.be_ok_to_config_member_profiles;
      Button_delete.Enabled = false;
      TextBox_member_id.Focus();
      }

    private void SetLookupMode()
      {
      Clear();
      TextBox_member_id.Enabled = true;
      Button_lookup.Enabled = true;
      Label_lookup_arrow.Enabled = true;
      Label_lookup_hint.Enabled = true;
      LinkButton_reset.Enabled = false;
      LinkButton_new_record.Enabled = true;
      TextBox_member_id.Focus();
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
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
#warning Revise the binder-related instance_id to this control appropriately.
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_member_profile")
          {
#warning Revise the ClientID path to this control appropriately.
          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_member_profile");
          }
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
        p.be_ok_to_config_member_profiles = k.Has((string[])(Session["privilege_array"]), "config-member_profiles");
        p.summary = p.biz_members.Summary(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_member_profile_PreRender;
      }

    private void TWebUserControl_member_profile_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_member_profile Fresh()
      {
      Session.Remove(InstanceId() + ".p");
//<KiCrudHelper:IncludedStaticUserControlFreshStatements/>
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
//<KiCrudHelper:SubmitVarBlock/>
      if (Page.IsValid)
        {
//<KiCrudHelper:SubmitSetPrep/>
        p.biz_member_profiles.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
#warning Safe_hint values should be tightened.
//<KiCrudHelper:SubmitSet/>
          );
        Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        SetLookupMode();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void DropDownList_member_id_SelectedIndexChanged(object sender, System.EventArgs e)
      {
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
      {
      DropDownList_member_id.SelectedIndex = 1;
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
      {
      DropDownList_member_id.SelectedIndex = Math.Max(1, (DropDownList_member_id.SelectedIndex - 1));
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
      {
      DropDownList_member_id.SelectedIndex = Math.Min((DropDownList_member_id.SelectedIndex + 1), (DropDownList_member_id.Items.Count - 1));
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
      {
      DropDownList_member_id.SelectedIndex = DropDownList_member_id.Items.Count - 1;
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (p.biz_member_profiles.Delete(k.Safe(TextBox_member_id.Text, k.safe_hint_type.ALPHANUM)))
        {
        SetLookupMode();
        }
      else
        {
        Alert(k.alert_cause_type.APPDATA,k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
        }
      }

    protected void LinkButton_new_record_Click(object sender, System.EventArgs e)
      {
      SetDataEntryMode();
      }

    protected void LinkButton_reset_Click(object sender, System.EventArgs e)
      {
      SetLookupMode();
      }

    private void SetDependentFieldAblements(bool ablement)
      {
//<KiCrudHelper:DependentFieldAblements/>
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_member_id;
      saved_member_id = k.Safe(TextBox_member_id.Text,k.safe_hint_type.PUNCTUATED);
      Clear();
      if (!PresentRecord(saved_member_id))
        {
        TextBox_member_id.Text = saved_member_id;
        p.biz_member_profiles.Bind(saved_member_id, DropDownList_member_id);
        num_matches = (uint)(DropDownList_member_id.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_member_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_member_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            Literal_match_index.Text = "0";
            Literal_num_matches.Text = num_matches.ToString();
            Panel_match_numbers.Visible = true;
            LinkButton_go_to_match_prior.Visible = true;
            LinkButton_go_to_match_next.Visible = true;
            LinkButton_go_to_match_last.Visible = true;
            LinkButton_go_to_match_first.Visible = true;
            DropDownList_member_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      }

    protected void CustomValidator_confirmation_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
      {
      args.IsValid = (TextBox_nominal_email_address.Text.Trim() == TextBox_confirmation_email_address.Text.Trim());
      }

    protected void CustomValidator_confirmation_password_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
      {
      args.IsValid = (TextBox_nominal_password.Text.Trim() == TextBox_confirmation_password.Text.Trim());
      }

    protected void CustomValidator_email_address_novelty_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
      {
      args.IsValid = !p.biz_users.BeEmailAddressMappedToMember(k.Safe(args.Value, k.safe_hint_type.EMAIL_ADDRESS));
      }

    protected void CustomValidator_nominal_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
      {
      args.IsValid = kix.k.BeValidDomainPartOfEmailAddress(args.Value);
      }

    protected void CustomValidator_phone_num_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
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
          value:"Password saved."
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
          value:"Email address saved."
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
        p.biz_members.SetPhoneNum(k.Safe(TextBox_phone_num.Text, k.safe_hint_type.NUM),p.summary);
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"phnumsaved",
          value:"Phone number saved."
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
        p.biz_members.SetPhoneService(k.Safe(DropDownList_phone_service.SelectedValue,k.safe_hint_type.NUM),p.summary);
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.SUCCESS,
          key:"phsvcsaved",
          value:"Phone service saved."
          );
        }
      else
        {
        ValidationAlert(true);
        }
      }

    } // end TWebUserControl_member_profile

  }
