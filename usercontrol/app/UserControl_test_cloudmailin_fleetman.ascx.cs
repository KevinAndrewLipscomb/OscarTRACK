using Class_biz_fleetman;
using kix;
using System;

namespace UserControl_test_cloudmailin_fleetman
  {
  public partial class TWebUserControl_test_cloudmailin_fleetman : ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_fleetman biz_fleetman;
      }

    private p_type p;

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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_test_binder_test_cloudmailin_binder_test_cloudmailin_fleetman")
          {
          p.be_loaded &= ((Session["M_UserControl_test_binder_UserControl_test_cloudmailin_binder_PlaceHolder_content"] as string) == "UserControl_test_cloudmailin_fleetman");
          }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_fleetman = new TClass_biz_fleetman();
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_test_cloudmailin_fleetman_PreRender;
      }

    private void TWebUserControl_test_cloudmailin_fleetman_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_test_cloudmailin_fleetman Fresh()
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
      p.biz_fleetman.ProcessCloudmailinRequest
        (
        x_from_header:k.Safe(TextBox_x_from_header.Text,k.safe_hint_type.EMAIL_ADDRESS_CSV),
        x_to_header:k.Safe(TextBox_x_to_header.Text,k.safe_hint_type.EMAIL_ADDRESS_CSV),
        subject:k.Safe(TextBox_subject.Text,k.safe_hint_type.PUNCTUATED),
        plain:k.Safe(TextBox_plain.Text,k.safe_hint_type.MEMO)
        );
      //
      Alert
        (
        cause:k.alert_cause_type.USER,
        state:k.alert_state_type.NORMAL,
        key:"fleetmandone",
        value:"Done.",
        be_using_scriptmanager:true
        );
      }

    protected void Button_clear_Click(object sender, EventArgs e)
      {
      TextBox_x_to_header.Text = k.EMPTY;
      TextBox_subject.Text = k.EMPTY;
      TextBox_plain.Text = k.EMPTY;
      }

    protected void CheckBox_filter_extenders_be_enabled_CheckedChanged(object sender, EventArgs e)
      {
      TextBox_x_from_header_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      TextBox_x_to_header_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      TextBox_subject_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      TextBox_plain_FilteredTextBoxExtender.Enabled = CheckBox_filter_extenders_be_enabled.Checked; 
      }

    }
  }