using Class_biz_agencies;
using Class_biz_manifest;
using Class_biz_members;
using Class_biz_user;
using kix;
using UserControl_funddrive_teaser;
using UserControl_keyclick;
using UserControl_log_new_donation;
using UserControl_paypal_assistant;
using UserControl_scene_visits_to_love_letter_targets;

namespace UserControl_funddrive_binder
{
  public class UserControl_funddrive_binder_Static
    {
    public const int TSSI_TEASER = 0;
    public const int TSSI_KEYCLICK = 1;
    public const int TSSI_LOVE_LETTERS = 2;
    public const int TSSI_PAYPAL_ASSISTANT = 3;
    public const int TSSI_NEW_DONATION = 4;
    public const int TSSI_OLD_DONATION = 5;
    }

    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~funddrive~binder.pas
    public partial class TWebUserControl_funddrive_binder: ki_web_ui.usercontrol_class
    {
        private struct p_type
          {
          public bool be_loaded;
          public bool be_ok_to_use_keyclick;
          public TClass_biz_agencies biz_agencies;
          public TClass_biz_manifest biz_manifest;
          public TClass_biz_members biz_members;
          public TClass_biz_user biz_user;
          public string content_id;
          public uint tab_index;
          public string user_member_agency_id;
          }

        private p_type p;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                if (p.be_ok_to_use_keyclick)
                  {
                  if (Session["keyclick_boarding_pass_number"] == null)
                    {
                    SessionSet("keyclick_boarding_pass_number",p.biz_manifest.NewBoardingPass());
                    }
                  //
                  // Note that all tabs to the left of a visible tab must be visible in order for tab changing to work.
                  //
                  TabPanel_keyclick.Visible = true;
                  //
                  var be_user_with_kvrs = (p.biz_agencies.KeyclickEnumeratorOf(p.user_member_agency_id) == "KVRS");
                  TabPanel_love_letters.Visible = be_user_with_kvrs;  //true;
                  TabPanel_paypal_assistant.Visible = be_user_with_kvrs;  //true;
                  //TabPanel_new_donation.Visible = true;
                  //TabPanel_old_donation.Visible = true;
                  }
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
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_funddrive_binder");
                if ((Session["UserControl_funddrive_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_funddrive_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_funddrive_binder_selected_tab");
                }
                // Dynamic controls must be re-added on each postback.
                switch(p.tab_index)
                {
                    case UserControl_funddrive_binder_Static.TSSI_TEASER:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))), "UserControl_funddrive_teaser", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_KEYCLICK:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_keyclick)(LoadControl("~/usercontrol/app/UserControl_keyclick.ascx"))), "UserControl_keyclick", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_scene_visits_to_love_letter_targets)(LoadControl("~/usercontrol/app/UserControl_scene_visits_to_love_letter_targets.ascx"))), "UserControl_scene_visits_to_love_letter_targets", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_PAYPAL_ASSISTANT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_paypal_assistant)(LoadControl("~/usercontrol/app/UserControl_paypal_assistant.ascx"))), "UserControl_paypal_assistant", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_NEW_DONATION:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))), "UserControl_log_new_donation", PlaceHolder_content);
                        break;
                // TSSI_1:
                // p.content_id := AddIdentifiedControlToPlaceHolder
                // (
                // TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')),
                // 'UserControl2',
                // PlaceHolder_content
                // );
                // TSSI_2:
                // p.content_id := AddIdentifiedControlToPlaceHolder
                // (
                // TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')),
                // 'UserControl3',
                // PlaceHolder_content
                // );
                }
            }
            else
            {
                p.biz_agencies = new TClass_biz_agencies();
                p.biz_manifest = new TClass_biz_manifest();
                p.biz_members = new TClass_biz_members();
                p.biz_user = new TClass_biz_user();
                //
                p.be_loaded = false;
                //
                p.user_member_agency_id = p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
                //
                p.be_ok_to_use_keyclick = (k.Has((string[])(Session["privilege_array"]), "perform-fund-drive-ops") && p.biz_agencies.BeKeyclickEnabled(p.user_member_agency_id));
                //
                if (p.be_ok_to_use_keyclick)
                {
                    p.tab_index = UserControl_funddrive_binder_Static.TSSI_KEYCLICK;
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_keyclick)(LoadControl("~/usercontrol/app/UserControl_keyclick.ascx"))),"UserControl_keyclick",PlaceHolder_content,InstanceId());
                }
                else
                {
                    p.tab_index = UserControl_funddrive_binder_Static.TSSI_TEASER;
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))),"UserControl_funddrive_teaser",PlaceHolder_content,InstanceId());
                }
            }

        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case UserControl_funddrive_binder_Static.TSSI_TEASER:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))),"UserControl_funddrive_teaser",PlaceHolder_content,InstanceId());
                    break;
                case UserControl_funddrive_binder_Static.TSSI_KEYCLICK:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_keyclick)(LoadControl("~/usercontrol/app/UserControl_keyclick.ascx"))),"UserControl_keyclick",PlaceHolder_content,InstanceId());
                    break;
                case UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_scene_visits_to_love_letter_targets)(LoadControl("~/usercontrol/app/UserControl_scene_visits_to_love_letter_targets.ascx"))),"UserControl_scene_visits_to_love_letter_targets",PlaceHolder_content,InstanceId());
                    break;
                case UserControl_funddrive_binder_Static.TSSI_PAYPAL_ASSISTANT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_paypal_assistant)(LoadControl("~/usercontrol/app/UserControl_paypal_assistant.ascx"))),"UserControl_paypal_assistant",PlaceHolder_content,InstanceId());
                    break;
                case UserControl_funddrive_binder_Static.TSSI_NEW_DONATION:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))),"UserControl_log_new_donation",PlaceHolder_content,InstanceId());
                    break;
            // TSSI_1:
            // p.content_id := AddIdentifiedControlToPlaceHolder
            // (
            // TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')).Fresh,
            // 'UserControl2',
            // PlaceHolder_content
            // );
            // TSSI_2:
            // p.content_id := AddIdentifiedControlToPlaceHolder
            // (
            // TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')).Fresh,
            // 'UserControl3',
            // PlaceHolder_content
            // );
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_funddrive_binder_PreRender;
        }

        private void TWebUserControl_funddrive_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_funddrive_binder Fresh()
        {
            TWebUserControl_funddrive_binder result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_funddrive_binder

}

