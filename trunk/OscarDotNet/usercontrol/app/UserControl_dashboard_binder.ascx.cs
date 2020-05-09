using UserControl_current_indicators;
using UserControl_dashboard_serial_aspects_binder;

namespace UserControl_dashboard_binder
{
    public struct p_type
    {
        public bool be_loaded;
        public uint tab_index;
    } // end p_type

    public partial class TWebUserControl_dashboard_binder: ki_web_ui.usercontrol_class
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
            if (Session[InstanceId() + ".p"] != null)
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_dashboard_binder");
                switch(p.tab_index)
                {
                    case Units.UserControl_dashboard_binder.TSSI_CURRENT:
                        // Dynamic controls must be re-added on each postback.
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_current_indicators)(LoadControl("~/usercontrol/app/UserControl_current_indicators.ascx"))), "UserControl_current_indicators", PlaceHolder_content);
                        break;
                    case Units.UserControl_dashboard_binder.TSSI_SERIAL:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_serial_aspects_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_serial_aspects_binder.ascx"))), "UserControl_dashboard_serial_aspects_binder", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = 0;
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_current_indicators)(LoadControl("~/usercontrol/app/UserControl_current_indicators.ascx"))),"UserControl_current_indicators",PlaceHolder_content,InstanceId());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_dashboard_binder_PreRender;
        }

        private void TWebUserControl_dashboard_binder_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_dashboard_binder Fresh()
        {
            TWebUserControl_dashboard_binder result;
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
                case Units.UserControl_dashboard_binder.TSSI_CURRENT:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_current_indicators)(LoadControl("~/usercontrol/app/UserControl_current_indicators.ascx"))),"UserControl_current_indicators",PlaceHolder_content,InstanceId());
                    break;
                case Units.UserControl_dashboard_binder.TSSI_SERIAL:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_dashboard_serial_aspects_binder)(LoadControl("~/usercontrol/app/UserControl_dashboard_serial_aspects_binder.ascx"))),"UserControl_dashboard_serial_aspects_binder",PlaceHolder_content,InstanceId());
                    break;
            }
        }

    } // end TWebUserControl_dashboard_binder

}

namespace UserControl_dashboard_binder.Units
{
    public class UserControl_dashboard_binder
    {
        public const int TSSI_CURRENT = 0;
        public const int TSSI_SERIAL = 1;
    } // end UserControl_dashboard_binder

}

