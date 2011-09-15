// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using appcommon;
using Class_biz_efficipay_dockets;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

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
      public TClass_biz_efficipay_dockets biz_efficipay_dockets;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public string id;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_num.Text = k.EMPTY;
      CheckBox_be_ready_for_review.Checked = false;
      Label_signer_1.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
      Label_signer_2.Text = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
      SetDependentFieldAblements(false,false);
      Button_submit.Enabled = false;
      Button_delete.Enabled = false;
      }

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
        RequireConfirmation(Button_delete, "Are you sure you want to delete this docket?");
        //SetDataEntryMode();
        if ((Session["mode:goto"] != null) && Session["mode:goto"].ToString().Contains("/efficipay_docket/"))
          {
          PresentRecord(Session["mode:goto"].ToString().Substring(Session["mode:goto"].ToString().LastIndexOf("/") + 1));
          Session.Remove("mode:goto");
          }
        TableRow_signer_1.Visible = p.biz_efficipay_dockets.BeOkToShowSigners(p.id);
        TableRow_signer_2.Visible = p.biz_efficipay_dockets.BeOkToShowSigners(p.id);
        p.be_loaded = true;
        }
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
        TextBox_num.Text = num;
        p.attachment_key = attachment_key;
        UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/efficipay_docket/" + p.attachment_key);
        CheckBox_be_ready_for_review.Checked = be_ready_for_review;
        Label_signer_1.Text = (signer_1_member_id.Length > 0 ? p.biz_members.EfficipaySignatureIdentifierOf(signer_1_member_id) : appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
        Label_signer_2.Text = (signer_2_member_id.Length > 0 ? p.biz_members.EfficipaySignatureIdentifierOf(signer_2_member_id) : appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
        SetDependentFieldAblements(p.be_ok_to_create_efficipay_dockets,p.be_signer);
        Button_submit.Enabled = p.be_ok_to_create_efficipay_dockets;
        Button_delete.Enabled = p.be_ok_to_create_efficipay_dockets;
        result = true;
        }
      return result;
      }

    private void SetDataEntryMode()
      {
      Clear();
      SetDependentFieldAblements(p.be_ok_to_create_efficipay_dockets,p.be_signer);
      Button_submit.Enabled = p.be_ok_to_create_efficipay_dockets;
      Button_delete.Enabled = false;
      Focus(TextBox_num, true);
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
        p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
        p.biz_members = new TClass_biz_members();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        p.agency_id = k.EMPTY;
        p.attachment_key = k.EMPTY;
        p.be_ok_to_create_efficipay_dockets = k.Has((string[])(Session["privilege_array"]), "create-efficipay-docket");
        p.be_signer = k.Has((string[])(Session["privilege_array"]), "sign-efficipay-docket");
        p.id = k.EMPTY;
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

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_efficipay_dockets.Set
          (
          p.id,
          p.agency_id,
          k.Safe(TextBox_num.Text,k.safe_hint_type.NUM).Trim(),
          p.attachment_key,
          CheckBox_be_ready_for_review.Checked,
          p.biz_efficipay_dockets.ExpirationDate()
          );
        Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (UserControl_attachment_explorer_control.be_empty)
        {
        if (p.biz_efficipay_dockets.Delete(p.id))
          {
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

    private void SetDependentFieldAblements
      (
      bool be_bookkeeper,
      bool be_signer
      )
      {
      TextBox_num.Enabled = be_bookkeeper;
      UserControl_attachment_explorer_control.be_ok_to_add = be_bookkeeper;
      UserControl_attachment_explorer_control.be_ok_to_delete = be_bookkeeper;
      CheckBox_be_ready_for_review.Enabled = be_bookkeeper;
      //
      var be_ok_to_sign = p.biz_efficipay_dockets.BeOkToSign(p.id);
      Button_apply_signature_1.Visible = be_ok_to_sign && be_signer;
      Button_apply_signature_2.Visible = be_ok_to_sign && be_signer;
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
        p.attachment_key = DateTime.Now.Ticks.ToString("D19");
        UserControl_attachment_explorer_control.path = HttpContext.Current.Server.MapPath("attachment/efficipay_docket/" + p.attachment_key);
        }
      else
        {
        p.id = p.biz_efficipay_dockets.IdOf(summary);
        PresentRecord(p.id);
        }
      }

    protected void CustomValidator_content_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = !UserControl_attachment_explorer_control.be_empty;
      }

    } // end TWebUserControl_efficipay_docket

  }
