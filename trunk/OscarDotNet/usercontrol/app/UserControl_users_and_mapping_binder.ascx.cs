using UserControl_user;
using UserControl_user_member_mapping;

namespace UserControl_users_and_mapping_binder
{
    public partial class TWebUserControl_users_and_mapping_binder: ki_web_ui.usercontrol_class
    {

    private struct p_type
    {
        public bool be_loaded;
        public string content_id;
        public uint tab_index;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
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
                p.be_loaded = IsPostBack && ((Session["M_UserControl_config_PlaceHolder_content"] as string) == "UserControl_users_and_mapping_binder");
                if ((Session["UserControl_users_and_mapping_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_users_and_mapping_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_users_and_mapping_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case Units.UserControl_users_and_mapping_binder.TSSI_USERS:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user)(LoadControl("~/usercontrol/app/UserControl_user.ascx"))), "UserControl_user", PlaceHolder_content);
                        break;
                    case Units.UserControl_users_and_mapping_binder.TSSI_USER_MEMBER_MAPPINGS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user_member_mapping)(LoadControl("~/usercontrol/app/UserControl_user_member_mapping.ascx"))), "UserControl_user_member_mapping", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_users_and_mapping_binder.TSSI_USER_MEMBER_MAPPINGS;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user_member_mapping)(LoadControl("~/usercontrol/app/UserControl_user_member_mapping.ascx"))),"UserControl_user_member_mapping",PlaceHolder_content,InstanceId());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_users_and_mapping_binder_PreRender;
        }

        private void TWebUserControl_users_and_mapping_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_users_and_mapping_binder Fresh()
        {
            TWebUserControl_users_and_mapping_binder result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_users_and_mapping_binder.TSSI_USERS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user)(LoadControl("~/usercontrol/app/UserControl_user.ascx"))),"UserControl_user",PlaceHolder_content,InstanceId());
                    break;
                case Units.UserControl_users_and_mapping_binder.TSSI_USER_MEMBER_MAPPINGS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user_member_mapping)(LoadControl("~/usercontrol/app/UserControl_user_member_mapping.ascx"))),"UserControl_user_member_mapping",PlaceHolder_content,InstanceId());
                    break;
            }
        }

    } // end TWebUserControl_users_and_mapping_binder

}

namespace UserControl_users_and_mapping_binder.Units
{
    public class UserControl_users_and_mapping_binder
    {
        public const int TSSI_USERS = 0;
        public const int TSSI_USER_MEMBER_MAPPINGS = 1;
    } // end UserControl_users_and_mapping_binder

}

