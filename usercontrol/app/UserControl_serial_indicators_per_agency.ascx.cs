// Derived from UserControl~template~std.ascx.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_user;
using kix;

namespace UserControl_serial_indicators_per_agency
  {
  public struct p_type
    {
    public string agency_id;
    public bool be_loaded;
    public bool be_interactive_mode;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_user biz_user;
    public string initial_img_avail_submission_compliance_src;
    public string initial_img_commensuration_src;
    public string initial_img_core_ops_size_src;
    public string initial_img_crew_shifts_forecast_src;
    public string initial_img_fleet_tracking_participation_src;
    public string initial_img_median_length_of_service_src;
    public string initial_img_num_members_in_pipeline_src;
    public string initial_img_standard_enrollment_src;
    public string initial_img_third_slot_saturation_src;
    public string initial_img_utilization_src;
    public string initial_img_vehicles_up_and_current_src;
    }

  public partial class TWebUserControl_serial_indicators_per_agency: ki_web_ui.usercontrol_class
    {
    private p_type p;

    public string agency_id
      {
      get
        {
        return p.agency_id;
        }
      set
        {
        p.agency_id = k.Safe(value,k.safe_hint_type.NUM);
        }
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlShortDashLong(DropDownList_agency,"0");
        p.be_interactive_mode = (Session["mode:report"] == null);
        if (p.be_interactive_mode && !p.biz_agencies.BeOkToDefaultAgencyFilterToAll(k.Has((string[])(Session["privilege_array"]), "see-all-squads"),p.biz_user.Roles()))
          {
          p.agency_id = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
          }
        DropDownList_agency.SelectedValue = p.agency_id;
        DropDownList_agency.Enabled = p.be_interactive_mode;
        Bind();
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
        p.be_loaded = IsPostBack && ((Session["M_UserControl_dashboard_binder_UserControl_dashboard_serial_aspects_binder_PlaceHolder_content"] as string) == "UserControl_serial_indicators_per_agency");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_id = "0";
        p.initial_img_avail_submission_compliance_src = Img_avail_submission_compliance.Attributes["src"];
        p.initial_img_commensuration_src = Img_commensuration.Attributes["src"];
        p.initial_img_core_ops_size_src = Img_core_ops_size.Attributes["src"];
        p.initial_img_crew_shifts_forecast_src = Img_crew_shifts_forecast.Attributes["src"];
        p.initial_img_fleet_tracking_participation_src = Img_fleet_tracking_participation.Attributes["src"];
        p.initial_img_median_length_of_service_src = Img_median_length_of_service.Attributes["src"];
        p.initial_img_num_members_in_pipeline_src = Img_num_members_in_pipeline.Attributes["src"];
        p.initial_img_standard_enrollment_src = Img_standard_enrollment.Attributes["src"];
        p.initial_img_third_slot_saturation_src = Img_third_slot_saturation.Attributes["src"];
        p.initial_img_utilization_src = Img_utilization.Attributes["src"];
        p.initial_img_vehicles_up_and_current_src = Img_vehicles_up_and_current.Attributes["src"];
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.PreRender += this.TWebUserControl_serial_indicators_per_agency_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_serial_indicators_per_agency_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_serial_indicators_per_agency Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void DropDownList_agency_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.agency_id = k.Safe(DropDownList_agency.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    private void Bind()
      {
      var passthrough_parms = k.EMPTY;
      if (p.agency_id == "0")
        {
        passthrough_parms = "&agency=" + p.agency_id + "&be_agency_applicable=0";
        Panel_third_slot_saturation_image.Visible = true;
        Img_third_slot_saturation.Attributes["src"] = p.initial_img_third_slot_saturation_src + passthrough_parms;
        Panel_third_slot_saturation_not_meaningful_here.Visible = false;
        }
      else
        {
        passthrough_parms = "&agency=" + p.agency_id + "&be_agency_applicable=1";
        Panel_third_slot_saturation_image.Visible = false;
        Panel_third_slot_saturation_not_meaningful_here.Visible = true;
        }
      Img_avail_submission_compliance.Attributes["src"] = p.initial_img_avail_submission_compliance_src + passthrough_parms;
      Img_core_ops_size.Attributes["src"] = p.initial_img_core_ops_size_src + passthrough_parms;
      Img_num_members_in_pipeline.Attributes["src"] = p.initial_img_num_members_in_pipeline_src + passthrough_parms;
      Img_crew_shifts_forecast.Attributes["src"] = p.initial_img_crew_shifts_forecast_src + passthrough_parms;
      Img_utilization.Attributes["src"] = p.initial_img_utilization_src + passthrough_parms;
      Img_standard_enrollment.Attributes["src"] = p.initial_img_standard_enrollment_src + passthrough_parms;
      Img_median_length_of_service.Attributes["src"] = p.initial_img_median_length_of_service_src + passthrough_parms;
      Img_commensuration.Attributes["src"] = p.initial_img_commensuration_src + passthrough_parms;
      Img_fleet_tracking_participation.Attributes["src"] = p.initial_img_fleet_tracking_participation_src + passthrough_parms;
      Img_vehicles_up_and_current.Attributes["src"] = p.initial_img_vehicles_up_and_current_src + passthrough_parms;
      }

    } // end TWebUserControl_serial_indicators_per_agency

  }
