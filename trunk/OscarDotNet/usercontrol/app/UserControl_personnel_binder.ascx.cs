using AjaxControlToolkit;


using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_roster;
using UserControl_commensuration;
using UserControl_dashboard_binder;
namespace UserControl_personnel_binder
{
    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~personnel~binder.pas
    public partial class TWebUserControl_personnel_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                if (k.Has((string[])(Session["privilege_array"]), "enter-actual-crew-shifts"))
                {
                    TabPanel_results.Enabled = true;
                }
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_personnel_binder.p"] != null)
            {
                p = (p_type)(Session["UserControl_personnel_binder.p"]);
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "P");
                if ((Session["UserControl_personnel_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_personnel_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_personnel_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case Units.UserControl_personnel_binder.TSSI_ROSTER:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))), "R", PlaceHolder_content);
                        break;
                    case Units.UserControl_personnel_binder.TSSI_RESULTS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_commensuration)(LoadControl("~/usercontrol/app/UserControl_commensuration.ascx"))), "UserControl_commensuration", PlaceHolder_content);
                        break;
                    case Units.UserControl_personnel_binder.TSSI_DASHBOARD:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_binder.ascx"))), "UserControl_dashboard_binder", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Units.UserControl_personnel_binder.TSSI_ROSTER;
                // NO .Fresh call -- special treatment
                p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))), "R", PlaceHolder_content);
            }

        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case Units.UserControl_personnel_binder.TSSI_ROSTER:
                    // NO .Fresh call -- special treatment
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))), "R", PlaceHolder_content);
                    break;
                case Units.UserControl_personnel_binder.TSSI_RESULTS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_commensuration)(LoadControl("~/usercontrol/app/UserControl_commensuration.ascx"))).Fresh(), "UserControl_commensuration", PlaceHolder_content);
                    break;
                case Units.UserControl_personnel_binder.TSSI_DASHBOARD:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_binder.ascx"))).Fresh(), "UserControl_dashboard_binder", PlaceHolder_content);
                    break;
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
            this.PreRender += this.TWebUserControl_personnel_binder_PreRender;
        }

        private void TWebUserControl_personnel_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet("UserControl_personnel_binder.p", p);

        }

        public TWebUserControl_personnel_binder Fresh()
        {
            TWebUserControl_personnel_binder result;
            Session.Remove("UserControl_personnel_binder.p");
            result = this;
            return result;
        }

        private struct p_type
        {
            public bool be_loaded;
            public string content_id;
            public uint tab_index;
        } // end p_type

    } // end TWebUserControl_personnel_binder

}

namespace UserControl_personnel_binder.Units
{
    public class UserControl_personnel_binder
    {
        public const int TSSI_ROSTER = 0;
        public const int TSSI_RESULTS = 1;
        public const int TSSI_DASHBOARD = 2;
    } // end UserControl_personnel_binder

}

