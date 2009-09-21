using AjaxControlToolkit;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_about;
using UserControl_config_binder;
using UserControl_funddrive_binder;
using UserControl_personnel_binder;

namespace UserControl_member_binder
{
    public struct p_type
    {
        public bool be_loaded;
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

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_member_binder.p"] != null) && (Session["UserControl_member_binder.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_member_binder.p"]);
                switch(p.tab_index)
                {
                    case Units.UserControl_member_binder.TSSI_PERSONNEL:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))), "UserControl_personnel_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_FUNDDRIVE:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_binder)(LoadControl("~/usercontrol/app/UserControl_funddrive_binder.ascx"))), "UserControl_funddrive_binder", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_CONFIG:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))), "UserControl_config", PlaceHolder_content);
                        break;
                    case Units.UserControl_member_binder.TSSI_ABOUT:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))), "UserControl_about", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_member_binder.TSSI_PERSONNEL;
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))).Fresh(), "UserControl_personnel_binder", PlaceHolder_content);
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
                case Units.UserControl_member_binder.TSSI_PERSONNEL:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_personnel_binder)(LoadControl("~/usercontrol/app/UserControl_personnel_binder.ascx"))).Fresh(), "UserControl_personnel_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_member_binder.TSSI_FUNDDRIVE:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_binder)(LoadControl("~/usercontrol/app/UserControl_funddrive_binder.ascx"))).Fresh(), "UserControl_funddrive_binder", PlaceHolder_content);
                    break;
                case Units.UserControl_member_binder.TSSI_CONFIG:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_config_binder)(LoadControl("~/usercontrol/app/UserControl_config_binder.ascx"))).Fresh(), "UserControl_config", PlaceHolder_content);
                    break;
                case Units.UserControl_member_binder.TSSI_ABOUT:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_about)(LoadControl("~/usercontrol/app/UserControl_about.ascx"))).Fresh(), "UserControl_about", PlaceHolder_content);
                    break;
            }

        }

    } // end TWebUserControl_member_binder

}

namespace UserControl_member_binder.Units
{
    public class UserControl_member_binder
    {
        public const int TSSI_PERSONNEL = 0;
        public const int TSSI_FUNDDRIVE = 1;
        public const int TSSI_CONFIG = 2;
        public const int TSSI_ABOUT = 3;
    } // end UserControl_member_binder

}

