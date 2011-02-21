using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_publish
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_publish: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_publish_Static
      {
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        HyperLink_preview_print_scalable.Text = k.ExpandTildePath(HyperLink_preview_print_scalable.Text);
        HyperLink_preview_print_month_at_a_glance.Text = k.ExpandTildePath(HyperLink_preview_print_month_at_a_glance.Text);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_assignment_assistant_publish.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_publish.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_publish");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_user_privileged_to_see_all_squads = k.Has((Session["privilege_array"] as string[]), "see-all-squads");
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_assignment_assistant_publish_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_publish_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_assignment_assistant_publish.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_publish Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_publish.p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.relative_month = relative_month;
      }

    protected void CustomValidator_full_schedule_format_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (!CheckBox_full.Checked || (RadioButton_scalable.Checked || RadioButton_month_at_a_glance.Checked));
      }

    protected void Button_publish_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {

        }
      }

    }

  }
