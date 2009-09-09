using AjaxControlToolkit;


using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_funddrive_teaser;
using UserControl_log_new_donation;
namespace UserControl_funddrive_binder
{
    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~funddrive~binder.pas
    public class TWebUserControl_funddrive_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected TabContainer TabContainer_control = null;
        protected System.Web.UI.WebControls.PlaceHolder PlaceHolder_content = null;
        protected TabPanel TabPanel_about = null;
        protected TabPanel TabPanel_new_donation = null;
        protected TabPanel TabPanel_old_donation = null;
        // TSSI_OLD_DONATION = 2;
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                if (k.Has((string[])(Session["privilege_array"]), "log-donations"))
                {
                    TabPanel_about.Enabled = false;
                    TabPanel_new_donation.Enabled = true;
                    TabPanel_old_donation.Enabled = true;
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
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_funddrive_binder");
                if ((Session["UserControl_funddrive_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_funddrive_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_funddrive_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case Units.UserControl_funddrive_binder.TSSI_TEASER:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))), "UserControl_funddrive_teaser", PlaceHolder_content);
                        break;
                    case Units.UserControl_funddrive_binder.TSSI_NEW_DONATION:
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
                p.be_loaded = false;
                if (k.Has((string[])(Session["privilege_array"]), "log-donations"))
                {
                    p.tab_index = Units.UserControl_funddrive_binder.TSSI_NEW_DONATION;
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))).Fresh(), "UserControl_log_new_donation", PlaceHolder_content);
                }
                else
                {
                    p.tab_index = Units.UserControl_funddrive_binder.TSSI_TEASER;
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
                case Units.UserControl_funddrive_binder.TSSI_TEASER:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_funddrive_teaser)(LoadControl("~/usercontrol/app/UserControl_funddrive_teaser.ascx"))).Fresh(), "UserControl_funddrive_teaser", PlaceHolder_content);
                    break;
                case Units.UserControl_funddrive_binder.TSSI_NEW_DONATION:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_log_new_donation)(LoadControl("~/usercontrol/app/UserControl_log_new_donation.ascx"))).Fresh(), "UserControl_log_new_donation", PlaceHolder_content);
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
            this.Load += this.Page_Load;
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

        private struct p_type
        {
            public bool be_loaded;
            public string content_id;
            public uint tab_index;
        } // end p_type

    } // end TWebUserControl_funddrive_binder

}

namespace UserControl_funddrive_binder.Units
{
    public class UserControl_funddrive_binder
    {
        // ,UserControl_log_old_donation
        public const int TSSI_TEASER = 0;
        public const int TSSI_NEW_DONATION = 1;
    } // end UserControl_funddrive_binder

}

