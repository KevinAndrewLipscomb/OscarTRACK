using Class_biz_manifest;
using kix;
using UserControl_funddrive_teaser;
using UserControl_keyclick;
using UserControl_log_new_donation;
using UserControl_scene_visits_to_love_letter_targets;

namespace UserControl_funddrive_binder
{
  public class UserControl_funddrive_binder_Static
    {
    public const int TSSI_TEASER = 0;
    public const int TSSI_KEYCLICK = 1;
    public const int TSSI_LOVE_LETTERS = 2;
    public const int TSSI_NEW_DONATION = 3;
    public const int TSSI_OLD_DONATION = 4;
    }

    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~funddrive~binder.pas
    public partial class TWebUserControl_funddrive_binder: ki_web_ui.usercontrol_class
    {
        private struct p_type
          {
          public bool be_loaded;
          public TClass_biz_manifest biz_manifest;
          public string content_id;
          public uint tab_index;
          }

        private p_type p;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                if (k.Has((string[])(Session["privilege_array"]), "perform-fund-drive-ops"))
                  {
                  if (Session["keyclick_boarding_pass_number"] == null)
                    {
                    SessionSet("keyclick_boarding_pass_number",p.biz_manifest.NewBoardingPass());
                    }
                  //
                  TabPanel_about.Visible = false;
                  TabPanel_keyclick.Visible = true;
                  TabPanel_love_letters.Visible = true;
                  TabPanel_new_donation.Visible = true;
                  TabPanel_old_donation.Visible = true;
                  }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_funddrive_binder.p"] != null)
            {
                p = (p_type)(Session["UserControl_funddrive_binder.p"]);
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_funddrive_binder");
                if ((Session["UserControl_funddrive_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_funddrive_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_funddrive_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case UserControl_funddrive_binder_Static.TSSI_TEASER:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))), "UserControl_funddrive_teaser", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_NEW_DONATION:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))), "UserControl_log_new_donation", PlaceHolder_content);
                        break;
                    case UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_scene_visits_to_love_letter_targets)(LoadControl("~/usercontrol/app/UserControl_scene_visits_to_love_letter_targets.ascx"))), "UserControl_scene_visits_to_love_letter_targets", PlaceHolder_content);
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
                p.biz_manifest = new TClass_biz_manifest();
                p.be_loaded = false;
                if (k.Has((string[])(Session["privilege_array"]), "perform-fund-drive-ops"))
                {
                    p.tab_index = UserControl_funddrive_binder_Static.TSSI_KEYCLICK;
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_keyclick)(LoadControl("~/usercontrol/app/UserControl_keyclick.ascx"))).Fresh(), "UserControl_keyclick", PlaceHolder_content);
                }
                else
                {
                    p.tab_index = UserControl_funddrive_binder_Static.TSSI_TEASER;
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))).Fresh(), "UserControl_funddrive_teaser", PlaceHolder_content);
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
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))).Fresh(), "UserControl_funddrive_teaser", PlaceHolder_content);
                    break;
                case UserControl_funddrive_binder_Static.TSSI_NEW_DONATION:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))).Fresh(), "UserControl_log_new_donation", PlaceHolder_content);
                    break;
                case UserControl_funddrive_binder_Static.TSSI_LOVE_LETTERS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_scene_visits_to_love_letter_targets)(LoadControl("~/usercontrol/app/UserControl_scene_visits_to_love_letter_targets.ascx"))).Fresh(), "UserControl_scene_visits_to_love_letter_targets", PlaceHolder_content);
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
            SessionSet("UserControl_funddrive_binder.p", p);

        }

        public TWebUserControl_funddrive_binder Fresh()
        {
            TWebUserControl_funddrive_binder result;
            Session.Remove("UserControl_funddrive_binder.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_funddrive_binder

}

