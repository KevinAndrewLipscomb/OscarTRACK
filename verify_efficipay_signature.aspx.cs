using Class_biz_efficipay_dockets;
using Class_biz_efficipay_tokens;
using kix;
using System;
using System.Configuration;
using System.Web.UI;

namespace verify_efficipay_signature
  {

  public partial class TWebForm_verify_efficipay_signature: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_efficipay_dockets biz_efficipay_dockets;
      public TClass_biz_efficipay_tokens biz_efficipay_tokens;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_verify_efficipay_signature_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - verify_efficipay_signature";
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_efficipay_tokens.BindTimePeriodsToListControl(DropDownList_time_period);
        TextBox_check_num.Focus();
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
      p.biz_efficipay_tokens = new TClass_biz_efficipay_tokens();
      }

    protected void Button_cancel_Click(object sender, System.EventArgs e)
      {
      Server.Transfer("login.aspx");
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        var check_num = k.Safe(TextBox_check_num.Text,k.safe_hint_type.NUM);
        if(
          p.biz_efficipay_dockets.BeVeritable
            (
            check_num:check_num,
            signer_member_id:k.Safe(TextBox_signer_member_id.Text,k.safe_hint_type.NUM),
            signer_first_name:k.Safe(TextBox_signer_first_name.Text,k.safe_hint_type.HUMAN_NAME),
            signer_last_name:k.Safe(TextBox_signer_last_name.Text,k.safe_hint_type.HUMAN_NAME),
            hex_code:k.Safe(TextBox_hex_code.Text,k.safe_hint_type.HEX),
            token_id:k.Safe(DropDownList_time_period.SelectedValue,k.safe_hint_type.NUM)
            )
          )
        //
          {
          Alert(kix.k.alert_cause_type.APPDATA,kix.k.alert_state_type.SUCCESS,"epsigvalid","The specified EfficiPay signature is VALID for check # " + check_num + ".",true);
          }
        else
          {
          Alert(kix.k.alert_cause_type.APPDATA,kix.k.alert_state_type.WARNING,"epsiginvalid","The specified EfficiPay signature is INVALID.",true);
          }
        }
      else
        {
        ValidationAlert(true);
        }
      }

    private void TWebForm_verify_efficipay_signature_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void Button_reset_Click(object sender, EventArgs e)
      {
      TextBox_check_num.Text = k.EMPTY;
      TextBox_signer_member_id.Text = k.EMPTY;
      TextBox_signer_first_name.Text = k.EMPTY;
      TextBox_signer_last_name.Text = k.EMPTY;
      TextBox_hex_code.Text = k.EMPTY;
      TextBox_check_num.Focus();
      }

    protected void LinkButton_go_back_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    }

  }
