using UserControl_ranked_avail_submission_compliance;
using UserControl_ranked_commensuration;
using UserControl_ranked_core_ops_size;
using UserControl_ranked_crew_shifts_forecast;
using UserControl_ranked_fleet_tracking_participation;
using UserControl_ranked_length_of_service;
using UserControl_ranked_num_members_in_pipeline;
using UserControl_ranked_standard_enrollment;
using UserControl_ranked_scheduled_duty_compliance;
using UserControl_ranked_third_slot_saturation;
using UserControl_ranked_utilization;
using UserControl_ranked_vehicles_up_and_current;

namespace UserControl_current_indicators
{
    public partial class TWebUserControl_current_indicators: ki_web_ui.usercontrol_class
    {

        private struct p_type
        {
            public bool be_loaded;
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
            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
            }
            else
            {
                p.be_loaded = false;
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_avail_submission_compliance)(LoadControl("~/usercontrol/app/UserControl_ranked_avail_submission_compliance.ascx"))),"UserControl_ranked_avail_submission_compliance",PlaceHolder_ranked_avail_submission_compliance,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_core_ops_size)(LoadControl("~/usercontrol/app/UserControl_ranked_core_ops_size.ascx"))),"UserControl_ranked_core_ops_size",PlaceHolder_ranked_core_ops_size,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_crew_shifts_forecast)(LoadControl("~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx"))),"UserControl_ranked_crew_shifts_forecast",PlaceHolder_ranked_crew_shifts_forecast,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_standard_enrollment)(LoadControl("~/usercontrol/app/UserControl_ranked_standard_enrollment.ascx"))),"UserControl_ranked_standard_enrollment",PlaceHolder_ranked_standard_enrollment,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_utilization)(LoadControl("~/usercontrol/app/UserControl_ranked_utilization.ascx"))),"UserControl_ranked_utilization",PlaceHolder_ranked_utilization,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_length_of_service)(LoadControl("~/usercontrol/app/UserControl_ranked_length_of_service.ascx"))),"UserControl_ranked_length_of_service",PlaceHolder_ranked_length_of_service,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_commensuration)(LoadControl("~/usercontrol/app/UserControl_ranked_commensuration.ascx"))),"UserControl_ranked_commensuration",PlaceHolder_ranked_commensuration,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_num_members_in_pipeline)(LoadControl("~/usercontrol/app/UserControl_ranked_num_members_in_pipeline.ascx"))),"UserControl_ranked_num_members_in_pipeline",PlaceHolder_ranked_num_members_in_pipeline,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_third_slot_saturation)(LoadControl("~/usercontrol/app/UserControl_ranked_third_slot_saturation.ascx"))),"UserControl_ranked_third_slot_saturation",PlaceHolder_ranked_third_slot_saturation,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_scheduled_duty_compliance)(LoadControl("~/usercontrol/app/UserControl_ranked_scheduled_duty_compliance.ascx"))),"UserControl_ranked_scheduled_duty_compliance",PlaceHolder_ranked_scheduled_duty_compliance,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_fleet_tracking_participation)(LoadControl("~/usercontrol/app/UserControl_ranked_fleet_tracking_participation.ascx"))),"UserControl_ranked_fleet_tracking_participation",PlaceHolder_ranked_fleet_tracking_participation,InstanceId());
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_ranked_vehicles_up_and_current)(LoadControl("~/usercontrol/app/UserControl_ranked_vehicles_up_and_current.ascx"))),"UserControl_ranked_vehicles_up_and_current",PlaceHolder_ranked_vehicles_up_and_current,InstanceId());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebUserControl_current_indicators_PreRender;
        }

        private void TWebUserControl_current_indicators_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_current_indicators Fresh()
        {
            Session.Remove(InstanceId() + ".p");
            return this;
        }

    } // end TWebUserControl_current_indicators

}
