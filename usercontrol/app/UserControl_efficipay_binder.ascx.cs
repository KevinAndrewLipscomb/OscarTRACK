// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using Class_biz_agencies;
using Class_biz_efficipay_dockets;
using Class_biz_members;
using Class_biz_user;
using kix;
using UserControl_efficipay;
using UserControl_efficipay_teaser;

namespace UserControl_efficipay_binder
  {
  public class UserControl_efficipay_binder_Static
    {
    public const int TSSI_TEASER = 0;
    public const int TSSI_CURRENT = 1;
    }

  public struct p_type
    {
    public bool be_loaded;
    public bool be_ok_to_perform_efficipay_ops;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_efficipay_dockets biz_efficipay_dockets;
    public TClass_biz_members biz_members;
    public TClass_biz_user biz_user;
    public string content_id;
    public string user_member_agency_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_efficipay_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabPanel_current.Visible = p.be_ok_to_perform_efficipay_ops;
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
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
        p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_efficipay_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        //
        p.be_loaded = false;
        //
        var member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
        p.user_member_agency_id = p.biz_members.AgencyIdOfId(member_id);
        p.user_member_agency_id = (p.user_member_agency_id == "0" ? p.biz_efficipay_dockets.LegacyAgencyIdOfMemberId(member_id:member_id) : p.user_member_agency_id);
        //
        p.be_ok_to_perform_efficipay_ops =
            (
              p.biz_agencies.BeEfficipayEnabled(id:p.user_member_agency_id)
            &&
              (k.Has(Session["privilege_array"] as string[],"create-efficipay-docket") || k.Has(Session["privilege_array"] as string[],"sign-efficipay-docket"))
            )
          ||
            (
              p.biz_agencies.BeEfficipayEnabled("0")
            &&
              (k.Has(Session["privilege_array"] as string[],"create-efficipay-docket-for-rc") || k.Has(Session["privilege_array"] as string[],"sign-efficipay-docket-for-rc"))
            );
        if (p.be_ok_to_perform_efficipay_ops)
          {
          p.tab_index = UserControl_efficipay_binder_Static.TSSI_CURRENT;
          }
        else
          {
          p.tab_index = UserControl_efficipay_binder_Static.TSSI_TEASER;
          }
        FillPlaceHolder(true);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_efficipay_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_efficipay_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_efficipay_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
      )
      {
      if (p.tab_index == UserControl_efficipay_binder_Static.TSSI_TEASER)
        {
        var c = ((TWebUserControl_efficipay_teaser)(LoadControl("~/usercontrol/app/UserControl_efficipay_teaser.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_efficipay_teaser",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_efficipay_binder_Static.TSSI_CURRENT)
        {
        var c = ((TWebUserControl_efficipay)(LoadControl("~/usercontrol/app/UserControl_efficipay.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_efficipay",PlaceHolder_content); // As a special case, we are disregarding be_fresh_control_required here.
        c.SetP(p.user_member_agency_id);
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/teaser/"))
          {
          p.tab_index = UserControl_efficipay_binder_Static.TSSI_TEASER;
          }
        else if (target.ToLower().Contains("/efficipay/"))
          {
          p.tab_index = UserControl_efficipay_binder_Static.TSSI_CURRENT;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_efficipay_binder

  }

