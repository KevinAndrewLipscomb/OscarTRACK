using Class_biz_efficipay_dockets;
using kix;
using System;
using System.Configuration;

namespace efficipay_final_check_imprint
  {
  // Derived from KiAspdotnetFramework/protected/template~protected~nonlanding.pas~template
  public partial class TWebForm_efficipay_final_check_imprint: ki_web_ui.page_class
    {

    private struct p_type
      {
      public string docket_id;
      public TClass_biz_efficipay_dockets biz_efficipay_dockets;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void InitializeComponent()
      {
      PreRender += TWebForm_efficipay_final_check_imprint_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - efficipay_final_check_imprint";
      if (!IsPostBack)
        {
        var check_num = k.EMPTY;
        var first_signer = k.EMPTY;
        var second_signer = k.EMPTY;
        var first_hash = k.EMPTY;
        var second_hash = k.EMPTY;
        p.biz_efficipay_dockets.GetForFinalCheckImprint(p.docket_id,out check_num,out first_signer,out second_signer,out first_hash,out second_hash);
        Label_check_num_1.Text = check_num;
        Label_check_num_2.Text = check_num;
        Label_check_num_3.Text = check_num;
        Label_check_num_4.Text = check_num;
        Label_first_signer_1.Text = first_signer;
        Label_first_signer_2.Text = first_signer;
        Label_second_signer_1.Text = second_signer;
        Label_second_signer_2.Text = second_signer;
        Label_first_hash_1.Text = first_hash;
        Label_first_hash_2.Text = first_hash;
        Label_second_hash_1.Text = second_hash;
        Label_second_hash_2.Text = second_hash;
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit_unlimited = NatureOfVisitUnlimited(InstanceId() + ".p");
      if(
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_COLD_CALL)
        ||
          (nature_of_visit_unlimited == nature_of_visit_type.VISIT_INITIAL)
        )
        {
        p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
        //
        var hashtable_of_shielded_request = HashtableOfShieldedRequest();
        p.docket_id = hashtable_of_shielded_request["efficipay_docket_id"].ToString();
        }
      else if (nature_of_visit_unlimited == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_efficipay_final_check_imprint_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_efficipay_final_check_imprint

  }
