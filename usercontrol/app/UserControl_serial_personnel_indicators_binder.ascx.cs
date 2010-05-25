using UserControl_serial_indicator_commensuration;
using UserControl_serial_indicator_length_of_service;
using UserControl_serial_indicator_num_core_ops_members;
using UserControl_serial_indicator_num_members_in_pipeline;
using UserControl_serial_indicator_potential_crew_shifts;
using UserControl_serial_indicator_standard_enrollment;
using UserControl_serial_indicator_third_slot_saturation;
using UserControl_serial_indicator_utilization;

namespace UserControl_serial_personnel_indicators_binder
{
  public static class UserControl_serial_personnel_indicators_binder_Static
    {
    public const int TSSI_COMMENSURATION = 0;
    public const int TSSI_NUM_CORE_OPS_MEMBERS = 1;
    public const int TSSI_NUM_MEMBERS_IN_PIPELINE = 2;
    public const int TSSI_NUM_POTENTIAL_CREW_SHIFTS = 3;
    public const int TSSI_THIRD_SLOT_SATURATION = 4;
    public const int TSSI_ROSTER_UTILIZATION = 5;
    public const int TSSI_CORE_OPS_COMMITMENT = 6;
    public const int TSSI_MEDIAN_YEARS_OF_SERVICE = 7;
    }

    public struct p_type
    {
        public bool be_loaded;
        public uint tab_index;
    } // end p_type

    public partial class TWebUserControl_serial_personnel_indicators_binder: ki_web_ui.usercontrol_class
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
            if (IsPostBack && (Session["UserControl_serial_personnel_indicators_binder.p"] != null) && (Session["UserControl_serial_personnel_indicators_binder.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_serial_personnel_indicators_binder.p"]);
                switch(p.tab_index)
                {
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_COMMENSURATION:
                        // Dynamic controls must be re-added on each postback.
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_commensuration)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_commensuration.ascx"))), "UserControl_serial_indicator_commensuration", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_CORE_OPS_MEMBERS:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_num_core_ops_members)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx"))), "UserControl_serial_indicator_num_core_ops_members", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_MEMBERS_IN_PIPELINE:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_num_members_in_pipeline)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_members_in_pipeline.ascx"))), "UserControl_serial_indicator_num_members_in_pipeline", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_POTENTIAL_CREW_SHIFTS:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_potential_crew_shifts)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_potential_crew_shifts.ascx"))), "UserControl_serial_indicator_potential_crew_shifts", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_THIRD_SLOT_SATURATION:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_third_slot_saturation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_third_slot_saturation.ascx"))), "UserControl_serial_indicator_third_slot_saturation", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_ROSTER_UTILIZATION:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_utilization)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_utilization.ascx"))), "UserControl_serial_indicator_utilization", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_CORE_OPS_COMMITMENT:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_standard_enrollment)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_standard_enrollment.ascx"))), "UserControl_serial_indicator_standard_enrollment", PlaceHolder_content);
                        break;
                    case UserControl_serial_personnel_indicators_binder_Static.TSSI_MEDIAN_YEARS_OF_SERVICE:
                        AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_length_of_service)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_length_of_service.ascx"))), "UserControl_serial_indicator_length_of_service", PlaceHolder_content);
                        break;
                }
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = UserControl_serial_personnel_indicators_binder_Static.TSSI_COMMENSURATION;
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_commensuration)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_commensuration.ascx"))).Fresh(), "UserControl_serial_indicator_commensuration", PlaceHolder_content);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
            this.PreRender += this.TWebUserControl_serial_personnel_indicators_binder_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_serial_personnel_indicators_binder_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_serial_personnel_indicators_binder.p", p);
        }

        public TWebUserControl_serial_personnel_indicators_binder Fresh()
        {
            TWebUserControl_serial_personnel_indicators_binder result;
            Session.Remove("UserControl_serial_personnel_indicators_binder.p");
            result = this;
            return result;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            switch(p.tab_index)
            {
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_COMMENSURATION:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_commensuration)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_commensuration.ascx"))).Fresh(), "UserControl_serial_indicator_commensuration", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_CORE_OPS_MEMBERS:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_num_core_ops_members)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx"))).Fresh(), "UserControl_serial_indicator_num_core_ops_members", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_MEMBERS_IN_PIPELINE:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_num_members_in_pipeline)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_members_in_pipeline.ascx"))).Fresh(), "UserControl_serial_indicator_num_members_in_pipeline", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_NUM_POTENTIAL_CREW_SHIFTS:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_potential_crew_shifts)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_potential_crew_shifts.ascx"))).Fresh(), "UserControl_serial_indicator_potential_crew_shifts", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_THIRD_SLOT_SATURATION:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_third_slot_saturation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_third_slot_saturation.ascx"))).Fresh(), "UserControl_serial_indicator_third_slot_saturation", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_ROSTER_UTILIZATION:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_utilization)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_utilization.ascx"))).Fresh(), "UserControl_serial_indicator_utilization", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_CORE_OPS_COMMITMENT:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_standard_enrollment)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_standard_enrollment.ascx"))).Fresh(), "UserControl_serial_indicator_standard_enrollment", PlaceHolder_content);
                    break;
                case UserControl_serial_personnel_indicators_binder_Static.TSSI_MEDIAN_YEARS_OF_SERVICE:
                    AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_indicator_length_of_service)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_length_of_service.ascx"))).Fresh(), "UserControl_serial_indicator_length_of_service", PlaceHolder_content);
                    break;
            }
        }

    } // end TWebUserControl_serial_personnel_indicators_binder

}

