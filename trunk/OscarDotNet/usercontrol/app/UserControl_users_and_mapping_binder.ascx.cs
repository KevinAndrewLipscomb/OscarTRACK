using AjaxControlToolkit;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_user;
using UserControl_user_member_mapping;
namespace UserControl_users_and_mapping_binder
{
    public struct p_type
    {
        public bool be_loaded;
        public string content_id;
        public uint tab_index;
    } // end p_type

    public partial class TWebUserControl_users_and_mapping_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
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
            if (Session["UserControl_users_and_mapping_binder.p"] != null)
            {
                p = (p_type)(Session["UserControl_users_and_mapping_binder.p"]);
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
                p.tab_index = Units.UserControl_users_and_mapping_binder.TSSI_USERS;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user)(LoadControl("~/usercontrol/app/UserControl_user.ascx"))).Fresh(), "UserControl_user", PlaceHolder_content);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_users_and_mapping_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_users_and_mapping_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_users_and_mapping_binder.p", p);

        }

        public TWebUserControl_users_and_mapping_binder Fresh()
        {
            TWebUserControl_users_and_mapping_binder result;
            Session.Remove("UserControl_users_and_mapping_binder.p");
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
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user)(LoadControl("~/usercontrol/app/UserControl_user.ascx"))).Fresh(), "UserControl_user", PlaceHolder_content);
                    break;
                case Units.UserControl_users_and_mapping_binder.TSSI_USER_MEMBER_MAPPINGS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_user_member_mapping)(LoadControl("~/usercontrol/app/UserControl_user_member_mapping.ascx"))).Fresh(), "UserControl_user_member_mapping", PlaceHolder_content);
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

