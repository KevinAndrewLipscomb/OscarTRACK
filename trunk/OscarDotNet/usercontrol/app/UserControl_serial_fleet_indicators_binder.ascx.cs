using UserControl_serial_indicator_fleet_tracking_participation;
using UserControl_serial_indicator_vehicles_up_and_current;

namespace UserControl_serial_fleet_indicators_binder
{
  public static class UserControl_serial_fleet_indicators_binder_Static
    {
    public const int TSSI_FLEET_TRACKING_PARTICIPATION = 0;
    public const int TSSI_VEHICLES_UP_AND_CURRENT = 1;
    }

    public struct p_type
    {
        public bool be_loaded;
        public uint tab_index;
    } // end p_type

    public partial class TWebUserControl_serial_fleet_indicators_binder: ki_web_ui.usercontrol_class
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
            if (IsPostBack && (Session["UserControl_serial_fleet_indicators_binder.p"] != null) && (Session["UserControl_serial_fleet_indicators_binder.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_serial_fleet_indicators_binder.p"]);
                switch(p.tab_index)
                {
                    case UserControl_serial_fleet_indicators_binder_Static.TSSI_FLEET_TRACKING_PARTICIPATION:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))), "UserControl_serial_indicator_fleet_tracking_participation", PlaceHolder_content);
                        break;
                    case UserControl_serial_fleet_indicators_binder_Static.TSSI_VEHICLES_UP_AND_CURRENT:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_vehicles_up_and_current)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_vehicles_up_and_current.ascx"))), "UserControl_serial_indicator_vehicles_up_and_current", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = UserControl_serial_fleet_indicators_binder_Static.TSSI_FLEET_TRACKING_PARTICIPATION;
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))).Fresh(), "UserControl_serial_indicator_fleet_tracking_participation", PlaceHolder_content);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_serial_fleet_indicators_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_serial_fleet_indicators_binder_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_serial_fleet_indicators_binder.p", p);
        }

        public TWebUserControl_serial_fleet_indicators_binder Fresh()
        {
            TWebUserControl_serial_fleet_indicators_binder result;
            Session.Remove("UserControl_serial_fleet_indicators_binder.p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case UserControl_serial_fleet_indicators_binder_Static.TSSI_FLEET_TRACKING_PARTICIPATION:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))).Fresh(), "UserControl_serial_indicator_fleet_tracking_participation", PlaceHolder_content);
                    break;
                case UserControl_serial_fleet_indicators_binder_Static.TSSI_VEHICLES_UP_AND_CURRENT:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_vehicles_up_and_current)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_vehicles_up_and_current.ascx"))).Fresh(), "UserControl_serial_indicator_vehicles_up_and_current", PlaceHolder_content);
                    break;
            }
        }

    } // end TWebUserControl_serial_fleet_indicators_binder

}

