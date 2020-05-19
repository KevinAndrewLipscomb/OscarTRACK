using UserControl_serial_indicator_fleet_tracking_participation;
using UserControl_serial_indicator_vehicles_up_and_current;

namespace UserControl_serial_fleet_indicators_binder
{
    public partial class TWebUserControl_serial_fleet_indicators_binder: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TSSI_FLEET_TRACKING_PARTICIPATION = 0;
      public const int TSSI_VEHICLES_UP_AND_CURRENT = 1;
      }

    private struct p_type
    {
        public bool be_loaded;
        public uint tab_index;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_serial_fleet_indicators_binder");
                switch(p.tab_index)
                {
                    case Static.TSSI_FLEET_TRACKING_PARTICIPATION:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))), "UserControl_serial_indicator_fleet_tracking_participation", PlaceHolder_content);
                        break;
                    case Static.TSSI_VEHICLES_UP_AND_CURRENT:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_vehicles_up_and_current)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_vehicles_up_and_current.ascx"))), "UserControl_serial_indicator_vehicles_up_and_current", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Static.TSSI_FLEET_TRACKING_PARTICIPATION;
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))),"UserControl_serial_indicator_fleet_tracking_participation",PlaceHolder_content,InstanceId());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_serial_fleet_indicators_binder_PreRender;
        }

        private void TWebUserControl_serial_fleet_indicators_binder_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_serial_fleet_indicators_binder Fresh()
        {
            TWebUserControl_serial_fleet_indicators_binder result;
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
                case Static.TSSI_FLEET_TRACKING_PARTICIPATION:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_fleet_tracking_participation.ascx"))),"UserControl_serial_indicator_fleet_tracking_participation",PlaceHolder_content,InstanceId());
                    break;
                case Static.TSSI_VEHICLES_UP_AND_CURRENT:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_vehicles_up_and_current)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_vehicles_up_and_current.ascx"))),"UserControl_serial_indicator_vehicles_up_and_current",PlaceHolder_content,InstanceId());
                    break;
            }
        }

    } // end TWebUserControl_serial_fleet_indicators_binder

}

