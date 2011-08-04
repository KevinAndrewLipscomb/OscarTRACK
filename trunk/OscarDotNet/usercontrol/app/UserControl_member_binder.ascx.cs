using Class_biz_user;
using kix;
using System.Collections;
using UserControl_about;
using UserControl_config_binder;
using UserControl_dashboard_binder;
using UserControl_fleet;
using UserControl_funddrive_binder;
using UserControl_personnel_binder;
using UserControl_schedule_binder;

namespace UserControl_member_binder
{
    public class UserControl_member_binder_Static
    {
        public const int TSSI_SCHEDULE = 0;
        public const int TSSI_PERSONNEL = 1;
        public const int TSSI_FLEET = 2;
        public const int TSSI_FUNDDRIVE = 3;
        public const int TSSI_EFFICIPAY = 4;
        public const int TSSI_DASHBOARD = 5;
        public const int TSSI_CONFIG = 6;
        public const int TSSI_ABOUT = 7;
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
            if ((Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                // Dynamic controls must be re-added on each postback.
                FillPlaceHolder(false);
            }
            else
            {
                p.be_loaded = false;
                p.biz_user = new TClass_biz_user();
                if ((new ArrayList{"Department Fleet Coordinator","Squad Fleet Coordinator"}).Contains(p.biz_user.Roles()[0]))
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_FLEET;
                  }
                else if ((new ArrayList{"Department Human Resources Officer","Department BLS ID Coordinator","Department ALS ID Coordinator","Department New Membership Clerk","Squad Membership Coordinator"}).Contains(p.biz_user.Roles()[0]))
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_PERSONNEL;
                  }
                else if ((new ArrayList{"Squad Fund Drive Clerk"}).Contains(p.biz_user.Roles()[0]))
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_FUNDDRIVE;
                  }
                else if ((new ArrayList{"Department Authority","Squad Commander"}).Contains(p.biz_user.Roles()[0]))
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_CONFIG;
                  }
                else
                  {
                  p.tab_index = UserControl_member_binder_Static.TSSI_SCHEDULE;
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
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_member_binder_PreRender;
        }

        private void TWebUserControl_member_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_member_binder Fresh()
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
          if (p.tab_index == UserControl_member_binder_Static.TSSI_SCHEDULE)
            {
            var c = ((TWebUserControl_schedule_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_binder.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c, "S", PlaceHolder_content, (be_fresh_control_required ? InstanceId() : k.EMPTY));
            c.SetTarget(target);
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_PERSONNEL)
            {
            var c = ((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"P",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_FLEET)
            {
            var c = ((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_fleet",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_FUNDDRIVE)
            {
            var c = ((TWebUserControl_funddrive_binder)(LoadControl("~/usercontrol/app/UserControl_funddrive_binder.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_funddrive_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_DASHBOARD)
            {
            var c = ((TWebUserControl_dashboard_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_binder.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_dashboard_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_CONFIG)
            {
            var c = ((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_config",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
            }
          else if (p.tab_index == UserControl_member_binder_Static.TSSI_ABOUT)
            {
            var c = ((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx")));
            p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_about",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
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
            if (target.ToLower().Contains("/schedule/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_SCHEDULE;
              }
            else if (target.ToLower().Contains("/personnel/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_PERSONNEL;
              }
            else if (target.ToLower().Contains("/fleet/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_FLEET;
              }
            else if (target.ToLower().Contains("/funddrive/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_FUNDDRIVE;
              }
            else if (target.ToLower().Contains("/dashboard/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_DASHBOARD;
              }
            else if (target.ToLower().Contains("/config/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_CONFIG;
              }
            else if (target.ToLower().Contains("/about/"))
              {
              p.tab_index = UserControl_member_binder_Static.TSSI_ABOUT;
              }
            //
            PlaceHolder_content.Controls.Clear();
            FillPlaceHolder(false,target);
            //
            }
          }

    } // end TWebUserControl_member_binder

}