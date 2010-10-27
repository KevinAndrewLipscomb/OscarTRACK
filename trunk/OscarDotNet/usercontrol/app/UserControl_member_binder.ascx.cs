using Class_biz_user;
using System.Collections;
using UserControl_about;
using UserControl_availabilities;
using UserControl_config_binder;
using UserControl_dashboard_binder;
using UserControl_fleet;
using UserControl_funddrive_binder;
using UserControl_personnel_binder;

namespace UserControl_member_binder
{
    public class UserControl_member_binder_Static
    {
        public const int TSSI_FLEET = 0;
        public const int TSSI_AVAILABILITIES = 1;
        public const int TSSI_PERSONNEL = 2;
        public const int TSSI_FUNDDRIVE = 3;
        public const int TSSI_DASHBOARD = 4;
        public const int TSSI_CONFIG = 5;
        public const int TSSI_ABOUT = 6;
    } // end UserControl_member_binder

    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_user biz_user;
        public string content_id;
        public uint tab_index;
    } // end p_type

    public partial class TWebUserControl_member_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
          {
          if (!p.be_loaded)
            {
            p.be_loaded = true;
            }
          TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
          }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if ((Session["UserControl_member_binder.p"] != null) && (Session["UserControl_member_binder.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_member_binder.p"]);
                // Dynamic controls must be re-added on each postback.
                switch(p.tab_index)
                {
                    case UserControl_member_binder_Static.TSSI_AVAILABILITIES:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx"))), "UserControl_availabilities", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_PERSONNEL:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))), "P", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_FLEET:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx"))), "UserControl_fleet", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_FUNDDRIVE:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_binder)(LoadControl("~/usercontrol/app/UserControl_funddrive_binder.ascx"))), "UserControl_funddrive_binder", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_DASHBOARD:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_binder.ascx"))), "UserControl_dashboard_binder", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_CONFIG:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))), "UserControl_config", PlaceHolder_content);
                        break;
                    case UserControl_member_binder_Static.TSSI_ABOUT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))), "UserControl_about", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.biz_user = new TClass_biz_user();
                if ((new ArrayList{"Department Fleet Coordinator","Department Street Supervisor","Squad Fleet Coordinator","Member"}).Contains(p.biz_user.Roles()[0]))
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_FLEET;
                  p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx"))).Fresh(), "UserControl_fleet", PlaceHolder_content);
                  }
                else
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_PERSONNEL;
                  p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))).Fresh(), "P", PlaceHolder_content);
                  }
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_member_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_member_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_member_binder.p", p);

        }

        public TWebUserControl_member_binder Fresh()
        {
            TWebUserControl_member_binder result;
            Session.Remove("UserControl_member_binder.p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case UserControl_member_binder_Static.TSSI_AVAILABILITIES:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx"))).Fresh(), "UserControl_availabilities", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_PERSONNEL:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))).Fresh(), "P", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_FLEET:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx"))).Fresh(), "UserControl_fleet", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_FUNDDRIVE:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_binder)(LoadControl("~/usercontrol/app/UserControl_funddrive_binder.ascx"))).Fresh(), "UserControl_funddrive_binder", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_DASHBOARD:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_binder.ascx"))).Fresh(), "UserControl_dashboard_binder", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_CONFIG:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))).Fresh(), "UserControl_config", PlaceHolder_content);
                    break;
                case UserControl_member_binder_Static.TSSI_ABOUT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))).Fresh(), "UserControl_about", PlaceHolder_content);
                    break;
            }

        }

    } // end TWebUserControl_member_binder

}