// Derived from UserControl~template~std.ascx.cs~template

using Class_biz_agencies;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UserControl_serial_indicators_per_agency
  {
  public struct p_type
    {
    public string agency_id;
    public bool be_loaded;
    public TClass_biz_agencies biz_agencies;
    public string expanded_img_commensuration_src;
    public string expanded_img_core_ops_size_src;
    public string expanded_img_crew_shifts_forecast_src;
    public string expanded_img_median_length_of_service_src;
    public string expanded_img_num_members_in_pipeline_src;
    public string expanded_img_standard_enrollment_src;
    public string expanded_img_utilization_src;
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
        DropDownList_agency.SelectedValue = p.agency_id;
        DropDownList_agency.Enabled = (Session["mode:report"] == null);
        Bind();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_serial_indicators_per_agency.p"] != null)
        {
        p = (p_type)(Session["UserControl_serial_indicators_per_agency.p"]);
        p.be_loaded = IsPostBack && ((Session["M_P_UserControl_dashboard_binder_UserControl_dashboard_serial_aspects_binder_PlaceHolder_content"] as string) == "UserControl_serial_indicators_per_agency");
        }
      else
        {
        p.agency_id = "0";
        p.be_loaded = false;
        p.biz_agencies = new TClass_biz_agencies();
        p.expanded_img_commensuration_src = k.ExpandAsperand(Img_commensuration.Attributes["src"]);
        p.expanded_img_core_ops_size_src = k.ExpandAsperand(Img_core_ops_size.Attributes["src"]);
        p.expanded_img_crew_shifts_forecast_src = k.ExpandAsperand(Img_crew_shifts_forecast.Attributes["src"]);
        p.expanded_img_median_length_of_service_src = k.ExpandAsperand(Img_median_length_of_service.Attributes["src"]);
        p.expanded_img_num_members_in_pipeline_src = k.ExpandAsperand(Img_num_members_in_pipeline.Attributes["src"]);
        p.expanded_img_standard_enrollment_src = k.ExpandAsperand(Img_standard_enrollment.Attributes["src"]);
        p.expanded_img_utilization_src = k.ExpandAsperand(Img_utilization.Attributes["src"]);
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
      SessionSet("UserControl_serial_indicators_per_agency.p", p);
      }

    public TWebUserControl_serial_indicators_per_agency Fresh()
      {
      Session.Remove("UserControl_serial_indicators_per_agency.p");
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
        }
      else
        {
        passthrough_parms = "&agency=" + p.agency_id + "&be_agency_applicable=1";
        }
      Img_core_ops_size.Attributes["src"] = p.expanded_img_core_ops_size_src + passthrough_parms;
      Img_num_members_in_pipeline.Attributes["src"] = p.expanded_img_num_members_in_pipeline_src + passthrough_parms;
      Img_crew_shifts_forecast.Attributes["src"] = p.expanded_img_crew_shifts_forecast_src + passthrough_parms;
      Img_utilization.Attributes["src"] = p.expanded_img_utilization_src + passthrough_parms;
      Img_standard_enrollment.Attributes["src"] = p.expanded_img_standard_enrollment_src + passthrough_parms;
      Img_median_length_of_service.Attributes["src"] = p.expanded_img_median_length_of_service_src + passthrough_parms;
      Img_commensuration.Attributes["src"] = p.expanded_img_commensuration_src + passthrough_parms;
      }

    } // end TWebUserControl_serial_indicators_per_agency

  }
