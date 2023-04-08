using Class_biz_scenes_reached_distributor;
using kix;
using System;

namespace UserControl_test_cloudmailin_scenes_reached_distributor
  {
  public partial class TWebUserControl_test_cloudmailin_scenes_reached_distributor : ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_scenes_reached_distributor biz_scenes_reached_distributor;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected override void OnInit(EventArgs e)
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_test_binder_test_cloudmailin_binder_test_cloudmailin_scenes_reached_distributor")
          {
          p.be_loaded &= ((Session["M_UserControl_test_binder_UserControl_test_cloudmailin_binder_PlaceHolder_content"] as string) == "UserControl_test_cloudmailin_scenes_reached_distributor");
          }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_scenes_reached_distributor = new TClass_biz_scenes_reached_distributor();
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_test_cloudmailin_scenes_reached_distributor_PreRender;
      }

    private void TWebUserControl_test_cloudmailin_scenes_reached_distributor_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_test_cloudmailin_scenes_reached_distributor Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected void Button_process_Click(object sender, EventArgs e)
      {
      p.biz_scenes_reached_distributor.ProcessCloudmailinRequest
        (
        envelope_to:k.Safe(TextBox_envelope_to.Text,k.safe_hint_type.EMAIL_ADDRESS_CSV),
        headers_to:k.Safe(TextBox_headers_to.Text,k.safe_hint_type.EMAIL_ADDRESS_CSV),
        attachments:k.Safe(TextBox_attachments.Text,k.safe_hint_type.MEMO)
        );
      //
      Alert
        (
        cause:k.alert_cause_type.USER,
        state:k.alert_state_type.NORMAL,
        key:"srddone",
        value:"Done.",
        be_using_scriptmanager:true
        );
      }

    protected void Button_clear_Click(object sender, EventArgs e)
      {
      TextBox_envelope_to.Text = k.EMPTY;
      TextBox_headers_to.Text = k.EMPTY;
      TextBox_attachments.Text = k.EMPTY;
      }

    protected void CheckBox_filter_extenders_be_enabled_CheckedChanged(object sender, EventArgs e)
      {
      TextBox_envelope_to_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      TextBox_headers_to_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      TextBox_attachments_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      }

    }
  }