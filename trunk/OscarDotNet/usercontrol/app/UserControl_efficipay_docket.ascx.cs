// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using appcommon;
using Class_biz_agencies;
using Class_biz_efficipay_dockets;
using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_user;
using kix;
using OscarDotNet.component.os;
using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_efficipay_docket
  {
  public partial class TWebUserControl_efficipay_docket: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public string agency_id;
      public string attachment_key;
      public bool be_loaded;
      public bool be_ok_to_create_efficipay_dockets;
      public bool be_signer;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_efficipay_dockets biz_efficipay_dockets;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_user biz_user;
      public string check_num;
      public Class_fs fs;
      public string id;
      public string signer_1_member_id;
      public string signer_2_member_id;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
      // EstablishClientSideFunction
      //   (
      //   'RecalculateDependentValues()',
      //   k.EMPTY
      //   + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
      //   +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
      //   );
      // //
      // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
      // TextBox_gross_landed_weight_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_gross_landed_weight_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        RequireConfirmation(Button_delete, "Are you sure you want to delete this docket?");
        //SetDataEntryMode();
        if ((Session["mode:goto"] != null) && Session["mode:goto"].ToString().Contains("/efficipay_docket/"))
          {
          PresentRecord(Session["mode:goto"].ToString().Substring(Session["mode:goto"].ToString().LastIndexOf("/") + 1));
          Session.Remove("mode:goto");
          }
        p.be_loaded = true;
        }
      UserControl_attachment_explorer_control.OnSave = UserControl_attachment_explorer_control_OnSave;
      ManageControlAblementsAndVisibilities();
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      bool result;
      string agency_id;
      string num;
      string attachment_key;
      bool be_ready_for_review;
      string signer_1_member_id;
      string signer_2_member_id;
      DateTime expiration_date;
      result = false;
      if
        (
        p.biz_efficipay_dockets.Get
          (
          id,
          out agency_id,
          out num,
          out attachment_key,
          out be_ready_for_review,
          out signer_1_member_id,
          out signer_2_member_id,
          out expiration_date
          )
        )
        {
        p.id = id;
        p.check_num = num;
        TextBox_num.Text = num;
        p.attachment_key = attachment_key;
        UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/efficipay_docket/" + p.attachment_key);
        CheckBox_be_ready_for_review.Checked = be_ready_for_review;
        p.signer_1_member_id = signer_1_member_id;
        p.signer_2_member_id = signer_2_member_id;
        Label_signer_1.Text = (p.signer_1_member_id.Length > 0 ? p.biz_members.EfficipaySignatureIdentifierOf(p.signer_1_member_id) : appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
        Label_signer_2.Text = (p.signer_2_member_id.Length > 0 ? p.biz_members.EfficipaySignatureIdentifierOf(p.signer_2_member_id) : appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
        result = true;
        }
      return result;
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack;
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
        p.biz_members = new TClass_biz_members();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_user = new TClass_biz_user();
        p.fs = new Class_fs();
        //
        p.agency_id = k.EMPTY;
        p.attachment_key = k.EMPTY;
        p.be_ok_to_create_efficipay_dockets = k.Has((string[])(Session["privilege_array"]), "create-efficipay-docket");
        p.be_signer = k.Has((string[])(Session["privilege_array"]), "sign-efficipay-docket");
        p.check_num = k.EMPTY;
        p.id = k.EMPTY;
        p.signer_1_member_id = k.EMPTY;
        p.signer_2_member_id = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_efficipay_docket_PreRender;
      }

    private void TWebUserControl_efficipay_docket_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_efficipay_docket Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (UserControl_attachment_explorer_control.be_empty || (p.biz_efficipay_dockets.StatusOf(p.id,p.check_num,CheckBox_be_ready_for_review.Checked,p.signer_1_member_id,p.signer_2_member_id) >= Class_biz_efficipay_dockets_Static.NEEDS_SIGNATURE_2))
        {
        if (p.biz_efficipay_dockets.Delete(p.id))
          {
          p.fs.CondemnFolder(UserControl_attachment_explorer_control.path);
          BackTrack();
          }
        else
          {
          Alert(k.alert_cause_type.APPDATA,k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
          }
        }
      else
        {
        Alert(k.alert_cause_type.FILESYSTEM,k.alert_state_type.FAILURE, "contnotempt", " Cannot delete this docket because its contents are not empty.", true);
        }
      }

    internal void SetFilter
      (
      string agency_id,
      object summary
      )
      {
      p.agency_id = agency_id;
      if (summary == null)
        {
        p.check_num = k.EMPTY;
        p.id = k.EMPTY;
        p.attachment_key = DateTime.Now.Ticks.ToString("D19");
        UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/efficipay_docket/" + p.attachment_key);
        }
      else
        {
        p.id = p.biz_efficipay_dockets.IdOf(summary);
        PresentRecord(p.id);
        }
      ManageControlAblementsAndVisibilities();
      }

    protected void CustomValidator_content_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = !UserControl_attachment_explorer_control.be_empty;
      }

    protected void CheckBox_be_ready_for_review_CheckedChanged(object sender, EventArgs e)
      {
      if (CheckBox_be_ready_for_review.Checked)
        {
        if (Page.IsValid)
          {
          p.biz_efficipay_dockets.PromoteToReadyForReview
            (
            p.id,
            p.agency_id,
            k.Safe(TextBox_num.Text,k.safe_hint_type.NUM).Trim(),
            p.attachment_key,
            CheckBox_be_ready_for_review.Checked,
            p.biz_efficipay_dockets.ExpirationDate()
            );
          BackTrack();
          }
        else
          {
          ValidationAlert(true);
          }
        }
      }

    protected void UserControl_attachment_explorer_control_OnSave(string basename)
      {
      p.id = p.biz_efficipay_dockets.Set
        (
        p.id,
        p.agency_id,
        p.check_num,
        p.attachment_key,
        CheckBox_be_ready_for_review.Checked,
        p.biz_efficipay_dockets.ExpirationDate()
        );
      ManageControlAblementsAndVisibilities();
      }

    private void ManageControlAblementsAndVisibilities()
      {
      var status = p.biz_efficipay_dockets.StatusOf(p.id,p.check_num,CheckBox_be_ready_for_review.Checked,p.signer_1_member_id,p.signer_2_member_id);
      if ((HyperLink_printable_overlay.NavigateUrl.Length == 0) && (status > Class_biz_efficipay_dockets_Static.NEEDS_AN_ATTACHMENT))
        {
        var final_check_imprint_hashtable = new Hashtable();
        final_check_imprint_hashtable["efficipay_docket_id"] = p.id;
        HyperLink_printable_overlay.NavigateUrl = "~/protected/efficipay_final_check_imprint.aspx?" + ShieldedQueryStringOfHashtable(final_check_imprint_hashtable);
        }
      if (status == Class_biz_efficipay_dockets_Static.NEEDS_CHECK_NUM)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = p.be_ok_to_create_efficipay_dockets; TextBox_num.Focus();
        Button_continue.Visible = p.be_ok_to_create_efficipay_dockets; Button_continue.Enabled = p.be_ok_to_create_efficipay_dockets;
        TableRow_attachment.Visible = false;
        TableRow_be_ready_for_review.Visible = false;
        TableRow_signers.Visible = false;
        TableRow_signature_action.Visible = false;
        TableRow_final_imprint_action.Visible = false;
        TableRow_removal_action.Visible = false;
        }
      else if (status == Class_biz_efficipay_dockets_Static.NEEDS_AN_ATTACHMENT)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = p.be_ok_to_create_efficipay_dockets;
        Button_continue.Visible = false;
        TableRow_attachment.Visible = true; UserControl_attachment_explorer_control.enabled = true; UserControl_attachment_explorer_control.be_ok_to_add = p.be_ok_to_create_efficipay_dockets; UserControl_attachment_explorer_control.be_ok_to_delete = false;
        TableRow_be_ready_for_review.Visible = false;
        TableRow_signers.Visible = false;
        TableRow_signature_action.Visible = false;
        TableRow_final_imprint_action.Visible = false;
        TableRow_removal_action.Visible = false;
        }
      else if (status == Class_biz_efficipay_dockets_Static.NEEDS_READY_FOR_REVIEW)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = p.be_ok_to_create_efficipay_dockets;
        Button_continue.Visible = false;
        TableRow_attachment.Visible = true; UserControl_attachment_explorer_control.enabled = true; UserControl_attachment_explorer_control.be_ok_to_add = p.be_ok_to_create_efficipay_dockets; UserControl_attachment_explorer_control.be_ok_to_delete = p.be_ok_to_create_efficipay_dockets;
        TableRow_be_ready_for_review.Visible = p.be_ok_to_create_efficipay_dockets; CheckBox_be_ready_for_review.Visible = p.be_ok_to_create_efficipay_dockets; CheckBox_be_ready_for_review.Enabled = p.be_ok_to_create_efficipay_dockets;
        TableRow_signers.Visible = false;
        TableRow_signature_action.Visible = false;
        TableRow_final_imprint_action.Visible = false;
        TableRow_removal_action.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Enabled = p.be_ok_to_create_efficipay_dockets;
        }
      else if (status == Class_biz_efficipay_dockets_Static.NEEDS_SIGNATURE_1)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = false;
        Button_continue.Visible = false;
        TableRow_attachment.Visible = true; UserControl_attachment_explorer_control.enabled = true; UserControl_attachment_explorer_control.be_ok_to_add = false; UserControl_attachment_explorer_control.be_ok_to_delete = false;
        TableRow_be_ready_for_review.Visible = p.be_ok_to_create_efficipay_dockets; CheckBox_be_ready_for_review.Visible = p.be_ok_to_create_efficipay_dockets; CheckBox_be_ready_for_review.Enabled = p.be_ok_to_create_efficipay_dockets;
        TableRow_signers.Visible = true;
        TableRow_signature_action.Visible = p.be_signer; Button_apply_signature.Visible = p.be_signer; Button_apply_signature.Enabled = p.be_signer; Button_apply_signature.Focus();
        TableRow_final_imprint_action.Visible = false;
        TableRow_removal_action.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Enabled = p.be_ok_to_create_efficipay_dockets;
        }
      else if (status == Class_biz_efficipay_dockets_Static.NEEDS_SIGNATURE_2)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = false;
        Button_continue.Visible = false;
        TableRow_attachment.Visible = true; UserControl_attachment_explorer_control.enabled = true; UserControl_attachment_explorer_control.be_ok_to_add = false; UserControl_attachment_explorer_control.be_ok_to_delete = false;
        TableRow_be_ready_for_review.Visible = false;
        TableRow_signers.Visible = true;
        TableRow_signature_action.Visible = p.be_signer; Button_apply_signature.Visible = p.be_signer; Button_apply_signature.Enabled = p.be_signer; Button_apply_signature.Focus();
        TableRow_final_imprint_action.Visible = false;
        TableRow_removal_action.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Enabled = p.be_ok_to_create_efficipay_dockets;
        }
      else if (status == Class_biz_efficipay_dockets_Static.NEEDS_FINAL_IMPRINT)
        {
        TextBox_num.Visible = true; TextBox_num.Enabled = false;
        Button_continue.Visible = false;
        TableRow_attachment.Visible = true; UserControl_attachment_explorer_control.enabled = true; UserControl_attachment_explorer_control.be_ok_to_add = false; UserControl_attachment_explorer_control.be_ok_to_delete = false;
        TableRow_be_ready_for_review.Visible = false;
        TableRow_signers.Visible = true;
        TableRow_signature_action.Visible = false;
        TableRow_final_imprint_action.Visible = p.be_ok_to_create_efficipay_dockets; HyperLink_printable_overlay.Visible = p.be_ok_to_create_efficipay_dockets; HyperLink_printable_overlay.Enabled = p.be_ok_to_create_efficipay_dockets;
        TableRow_removal_action.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Visible = p.be_ok_to_create_efficipay_dockets; Button_delete.Enabled = p.be_ok_to_create_efficipay_dockets;
        }
      }

    protected void Button_continue_Click(object sender, EventArgs e)
      {
      p.check_num = k.Safe(TextBox_num.Text,k.safe_hint_type.NUM);
      ManageControlAblementsAndVisibilities();
      }

    protected void Button_apply_signature_Click(object sender, EventArgs e)
      {
      p.biz_efficipay_dockets.ApplySignature
        (
        id: p.id,
        agency_id: p.agency_id,
        check_num: p.check_num,
        member_id: p.biz_members.IdOfUserId(p.biz_user.IdNum())
        );
      BackTrack();
      }

    } // end TWebUserControl_efficipay_docket

  }
