using AjaxControlToolkit;


using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_agency;
using UserControl_roles_and_matrices_binder;
using UserControl_users_and_mapping_binder;
namespace UserControl_config_binder
{
    public struct p_type
    {
        public bool be_loaded;
        public string content_id;
        public uint tab_index;
    } // end p_type

    public class TWebUserControl_config_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        protected TabContainer TabContainer_control = null;
        protected TabPanel TabPanel_users_and_mappings = null;
        protected TabPanel TabPanel_agencies = null;
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                if (k.Has((string[])(Session["privilege_array"]), "config-users"))
                {
                    TabPanel_users_and_mappings.Enabled = true;
                }
                if (k.Has((string[])(Session["privilege_array"]), "config-agencies"))
                {
                    TabPanel_agencies.Enabled = true;
                }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_config_binder.p"] != null) && (Session["UserControl_config_binder.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_config_binder.p"]);
                switch(p.tab_index)
                {
                    case Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_config_binder.TSSI_USERS_AND_MAPPING:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_users_and_mapping_binder)(LoadControl("~/usercontrol/app/UserControl_users_and_mapping_binder.ascx"))), "UserControl_users_and_mapping_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_config_binder.TSSI_AGENCIES:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))), "UserControl_agency", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))).Fresh(), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_config_binder_PreRender;
            this.Load += this.Page_Load;
        }

        private void TWebUserControl_config_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_config_binder.p", p);

        }

        public TWebUserControl_config_binder Fresh()
        {
            TWebUserControl_config_binder result;
            Session.Remove("UserControl_config_binder.p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_config_binder.TSSI_ROLES_AND_MATRICES:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx"))).Fresh(), "UserControl_roles_and_matrices_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_config_binder.TSSI_USERS_AND_MAPPING:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_users_and_mapping_binder)(LoadControl("~/usercontrol/app/UserControl_users_and_mapping_binder.ascx"))).Fresh(), "UserControl_users_and_mapping_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_config_binder.TSSI_AGENCIES:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))).Fresh(), "UserControl_agency", PlaceHolder_content);
                    break;
            }
        }

    } // end TWebUserControl_config_binder

}

namespace UserControl_config_binder.Units
{
    public class UserControl_config_binder
    {
        public const int TSSI_ROLES_AND_MATRICES = 0;
        public const int TSSI_USERS_AND_MAPPING = 1;
        public const int TSSI_AGENCIES = 2;
    } // end UserControl_config_binder

}

