using kix;
using UserControl_serial_indicator_avail_submission_compliance;
using UserControl_serial_indicator_commensuration;
using UserControl_serial_indicator_length_of_service;
using UserControl_serial_indicator_num_core_ops_members;
using UserControl_serial_indicator_num_members_in_pipeline;
using UserControl_serial_indicator_potential_crew_shifts;
using UserControl_serial_indicator_scheduled_duty_compliance;
using UserControl_serial_indicator_standard_enrollment;
using UserControl_serial_indicator_third_slot_saturation;
using UserControl_serial_indicator_utilization;

namespace UserControl_serial_personnel_indicators_binder
{
    public partial class TWebUserControl_serial_personnel_indicators_binder: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TSSI_NUM_CORE_OPS_MEMBERS = 0;
      public const int TSSI_NUM_MEMBERS_IN_PIPELINE = 1;
      public const int TSSI_NUM_POTENTIAL_CREW_SHIFTS = 2;
      public const int TSSI_MEDIAN_YEARS_OF_SERVICE = 3;
      public const int TSSI_CORE_OPS_COMMITMENT = 4;
      public const int TSSI_ROSTER_UTILIZATION = 5;
      public const int TSSI_AVAIL_SUBMISSION_COMPLIANCE = 6;
      public const int TSSI_COMMENSURATION = 7;
      public const int TSSI_THIRD_SLOT_SATURATION = 8;
      public const int TSSI_SCHEDULED_DUTY_COMPLIANCE = 9;
      }

    private struct p_type
    {
        public bool be_loaded;
        public string content_id;
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
                p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_serial_personnel_indicators_binder");
                //
                // Dynamic controls must be re-added on each postback.
                //
                FillPlaceHolder(false);
            }
            else
            {
                p.be_loaded = false;
                p.tab_index = Static.TSSI_NUM_CORE_OPS_MEMBERS;
                FillPlaceHolder(true);
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
            PreRender += TWebUserControl_serial_personnel_indicators_binder_PreRender;
        }

        private void TWebUserControl_serial_personnel_indicators_binder_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_serial_personnel_indicators_binder Fresh()
        {
            Session.Remove(InstanceId() + ".p");
            return this;
        }

        private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
        {
            p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
            PlaceHolder_content.Controls.Clear();
            FillPlaceHolder(true);
        }

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target = k.EMPTY
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == Static.TSSI_NUM_CORE_OPS_MEMBERS)
        {
        var c = ((TWebUserControl_serial_indicator_num_core_ops_members)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_num_core_ops_members",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_NUM_MEMBERS_IN_PIPELINE)
        {
        var c = ((TWebUserControl_serial_indicator_num_members_in_pipeline)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_num_members_in_pipeline.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_num_members_in_pipeline",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_NUM_POTENTIAL_CREW_SHIFTS)
        {
        var c = ((TWebUserControl_serial_indicator_potential_crew_shifts)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_potential_crew_shifts.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_potential_crew_shifts",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_MEDIAN_YEARS_OF_SERVICE)
        {
        var c = ((TWebUserControl_serial_indicator_length_of_service)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_length_of_service.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_length_of_service",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_CORE_OPS_COMMITMENT)
        {
        var c = ((TWebUserControl_serial_indicator_standard_enrollment)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_standard_enrollment.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_standard_enrollment",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_ROSTER_UTILIZATION)
        {
        var c = ((TWebUserControl_serial_indicator_utilization)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_utilization.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_utilization",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_AVAIL_SUBMISSION_COMPLIANCE)
        {
        var c = ((TWebUserControl_serial_indicator_avail_submission_compliance)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_avail_submission_compliance.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_avail_submission_compliance",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_COMMENSURATION)
        {
        var c = ((TWebUserControl_serial_indicator_commensuration)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_commensuration.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_commensuration",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_THIRD_SLOT_SATURATION)
        {
        var c = ((TWebUserControl_serial_indicator_third_slot_saturation)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_third_slot_saturation.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_third_slot_saturation",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_SCHEDULED_DUTY_COMPLIANCE)
        {
        var c = ((TWebUserControl_serial_indicator_scheduled_duty_compliance)(LoadControl("~/usercontrol/app/UserControl_serial_indicator_scheduled_duty_compliance.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_serial_indicator_scheduled_duty_compliance",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/num_core_ops_members/"))
          {
          p.tab_index = Static.TSSI_NUM_CORE_OPS_MEMBERS;
          }
        else if (target.ToLower().Contains("/num_members_in_pipeline/"))
          {
          p.tab_index = Static.TSSI_NUM_MEMBERS_IN_PIPELINE;
          }
        else if (target.ToLower().Contains("/num_potential_crew_shifts/"))
          {
          p.tab_index = Static.TSSI_NUM_POTENTIAL_CREW_SHIFTS;
          }
        else if (target.ToLower().Contains("/median_years_of_service/"))
          {
          p.tab_index = Static.TSSI_MEDIAN_YEARS_OF_SERVICE;
          }
        else if (target.ToLower().Contains("/core_ops_commitment/"))
          {
          p.tab_index = Static.TSSI_CORE_OPS_COMMITMENT;
          }
        else if (target.ToLower().Contains("/utilization/"))
          {
          p.tab_index = Static.TSSI_ROSTER_UTILIZATION;
          }
        else if (target.ToLower().Contains("/avail_submission_compliance/"))
          {
          p.tab_index = Static.TSSI_AVAIL_SUBMISSION_COMPLIANCE;
          }
        else if (target.ToLower().Contains("/commensuration/"))
          {
          p.tab_index = Static.TSSI_COMMENSURATION;
          }
        else if (target.ToLower().Contains("/third_slot_saturation/"))
          {
          p.tab_index = Static.TSSI_THIRD_SLOT_SATURATION;
          }
        else if (target.ToLower().Contains("/scheduled_duty_compliance/"))
          {
          p.tab_index = Static.TSSI_SCHEDULED_DUTY_COMPLIANCE;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_serial_personnel_indicators_binder

}
