using Class_biz_agencies;
using Class_biz_fund_drives;
using Class_biz_manifest;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_user;
using kix;
using UserControl_funddrive_teaser;
using UserControl_keyclick;
using UserControl_paypal_assistant;
using UserControl_scene_visits_to_love_letter_targets;

namespace UserControl_funddrive_binder
  {

  public static class UserControl_funddrive_binder_Static
    {
    public const int TSSI_TEASER = 0;
    public const int TSSI_KEYCLICK = 1;
    public const int TSSI_LOVE_LETTERS = 2;
    public const int TSSI_PAYPAL_ASSISTANT = 3;
    }

  public partial class TWebUserControl_funddrive_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private struct p_type
      {
      public bool be_loaded;
      public bool be_ok_to_use_keyclick;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_fund_drives biz_fund_drives;
      public TClass_biz_manifest biz_manifest;
      public TClass_biz_members biz_members;
      public TClass_biz_privileges biz_privileges;
      public TClass_biz_user biz_user;
      public string content_id;
      public uint tab_index;
      public string user_member_agency_id;
      public string user_member_agency_keyclick_enumerator;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target = k.EMPTY
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == UserControl_funddrive_binder_Static.TSSI_TEASER)
        {
        var c = ((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_funddrive_teaser",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == UserControl_funddrive_binder_Static.TSSI_KEYCLICK)
        {
        var c = ((TWebUserControl_keyclick)(LoadControl("~/usercontrol/app/UserControl_keyclick.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_keyclick",PlaceHolder_content,InstanceId());
        c.SetP(agency_id:p.user_member_agency_id);
        }
      else if (p.tab_index == UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS)
        {
        var c = ((TWebUserControl_scene_visits_to_love_letter_targets)(LoadControl("~/usercontrol/app/UserControl_scene_visits_to_love_letter_targets.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_scene_visits_to_love_letter_targets",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetTarget(agency:p.user_member_agency_keyclick_enumerator);
        }
      else if (p.tab_index == UserControl_funddrive_binder_Static.TSSI_PAYPAL_ASSISTANT)
        {
        var c = ((TWebUserControl_paypal_assistant)(LoadControl("~/usercontrol/app/UserControl_paypal_assistant.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_paypal_assistant",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.Set(agency:p.user_member_agency_keyclick_enumerator);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_funddrive_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        if (p.be_ok_to_use_keyclick)
          {
          if (Session["keyclick_boarding_pass_number"] == null)
            {
            SessionSet("keyclick_boarding_pass_number",p.biz_manifest.NewBoardingPass(agency_keyclick_enumerator:p.user_member_agency_keyclick_enumerator));
            }
          //
          // Note that all tabs to the left of a visible tab must be visible in order for tab changing to work.
          //
          TabPanel_keyclick.Visible = true;
          //
          TabPanel_love_letters.Visible = p.be_ok_to_use_keyclick;
          TabPanel_paypal_assistant.Visible = p.be_ok_to_use_keyclick;
          }
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_funddrive_binder_PreRender(object sender, System.EventArgs e)
      {
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    //--
    //
    // PROTECTED
    //
    //--

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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_funddrive_binder")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_funddrive_binder");
          }
        //
        if ((Session["UserControl_funddrive_binder_selected_tab"] != null))
          {
          p.tab_index = (uint)(Session["UserControl_funddrive_binder_selected_tab"].GetHashCode());
          Session.Remove("UserControl_funddrive_binder_selected_tab");
          }
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_fund_drives = new TClass_biz_fund_drives();
        p.biz_manifest = new TClass_biz_manifest();
        p.biz_members = new TClass_biz_members();
        p.biz_privileges = new TClass_biz_privileges();
        p.biz_user = new TClass_biz_user();
        //
        var privilege_of_interest = "perform-fund-drive-ops";
        //
        p.be_loaded = false;
        //
        var member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
        p.user_member_agency_id = p.biz_members.AgencyIdOfId(member_id);
        p.user_member_agency_id = (p.user_member_agency_id == "0" ? p.biz_fund_drives.LegacyAgencyIdOfMemberId(member_id:member_id) : p.user_member_agency_id);
        //
        p.user_member_agency_keyclick_enumerator = p.biz_agencies.KeyclickEnumeratorOf(p.user_member_agency_id);
        p.be_ok_to_use_keyclick =
          (
            (
              k.Has((string[])(Session["privilege_array"]),privilege_of_interest)
            ||
              p.biz_privileges.HasForSpecialAgency
                (
                member_id:member_id,
                privilege_name:privilege_of_interest,
                agency_id:p.user_member_agency_id,
                do_include_rescue_squads:true
                )
            )
          &&
            p.biz_agencies.BeKeyclickEnabled(p.user_member_agency_id)
          );
        //
        p.tab_index = (uint)(p.be_ok_to_use_keyclick ? UserControl_funddrive_binder_Static.TSSI_KEYCLICK : UserControl_funddrive_binder_Static.TSSI_TEASER);
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_funddrive_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/teaser/"))
          {
          p.tab_index = UserControl_funddrive_binder_Static.TSSI_TEASER;
          }
        else if (target.ToLower().Contains("/keyclick/"))
          {
          p.tab_index = UserControl_funddrive_binder_Static.TSSI_KEYCLICK;
          }
        else if (target.ToLower().Contains("/love-letters/"))
          {
          p.tab_index = UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS;
          }
        else if (target.ToLower().Contains("/paypal-assistant/"))
          {
          p.tab_index = UserControl_funddrive_binder_Static.TSSI_PAYPAL_ASSISTANT;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_funddrive_binder

  }
