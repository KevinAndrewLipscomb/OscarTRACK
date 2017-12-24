using kix;
using UserControl_schedule_assignments_audit;
using UserControl_roster;
using UserControl_uniform_mart;

namespace UserControl_personnel_binder
{
  public class UserControl_personnel_binder_Static
    {
    public const int TSSI_ROSTER = 0;
    public const int TSSI_RESULTS = 1;
    public const int TSSI_PROVISIONING = 2;
    }

    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~personnel~binder.pas
    public partial class TWebUserControl_personnel_binder: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
                if (k.Has((string[])(Session["privilege_array"]), "audit-schedule-assignments"))
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
            if (Session[InstanceId() + ".p"] != null)
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "P");
                if ((Session["UserControl_personnel_binder_selected_tab"] != null))
                {
                    p.tab_index = (uint)(Session["UserControl_personnel_binder_selected_tab"].GetHashCode());
                    Session.Remove("UserControl_personnel_binder_selected_tab");
                }
                switch(p.tab_index)
                {
                    case UserControl_personnel_binder_Static.TSSI_ROSTER:
                        // Dynamic controls must be re-added on each postback.
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))), "R", PlaceHolder_content);
                        break;
                    case UserControl_personnel_binder_Static.TSSI_RESULTS:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignments_audit)(LoadControl("~/usercontrol/app/UserControl_schedule_assignments_audit.ascx"))), "UserControl_schedule_assignments_audit", PlaceHolder_content);
                        break;
                    case UserControl_personnel_binder_Static.TSSI_PROVISIONING:
                        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_uniform_mart)(LoadControl("~/usercontrol/app/UserControl_uniform_mart.ascx"))), "UserControl_uniform_mart", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = UserControl_personnel_binder_Static.TSSI_ROSTER;
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
                case UserControl_personnel_binder_Static.TSSI_ROSTER:
                    // NO .Fresh call -- special treatment
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))), "R", PlaceHolder_content);
                    break;
                case UserControl_personnel_binder_Static.TSSI_RESULTS:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignments_audit)(LoadControl("~/usercontrol/app/UserControl_schedule_assignments_audit.ascx"))),"UserControl_schedule_assignments_audit",PlaceHolder_content,InstanceId());
                    break;
                case UserControl_personnel_binder_Static.TSSI_PROVISIONING:
                    p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_uniform_mart)(LoadControl("~/usercontrol/app/UserControl_uniform_mart.ascx"))),"UserControl_uniform_mart",PlaceHolder_content,InstanceId());
                    break;
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_personnel_binder_PreRender;
        }

        private void TWebUserControl_personnel_binder_PreRender(object sender, System.EventArgs e)
        {
            // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
            // not it is already loaded in the user's browser.
            SessionSet(PlaceHolder_content.ClientID, p.content_id);
            SessionSet(InstanceId() + ".p", p);

        }

        public TWebUserControl_personnel_binder Fresh()
        {
            TWebUserControl_personnel_binder result;
            Session.Remove(InstanceId() + ".p");
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

