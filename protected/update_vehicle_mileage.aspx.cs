// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace update_vehicle_mileage
  {
  public partial class TWebForm_update_vehicle_mileage: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_vehicles biz_vehicles;
      public string vehicle_id;
      public object vehicle_summary;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_update_vehicle_mileage_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - update_vehicle_mileage";
      if (!IsPostBack)
        {
        p.vehicle_summary = Session["vehicle_summary"];
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        Literal_vehicle_name_2.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        Literal_vehicle_name_3.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        var recent_mileage = p.biz_vehicles.RecentMileageOf(p.vehicle_summary);
        if (recent_mileage.Length > 0)
          {
          Literal_recent_mileage.Text = recent_mileage;
          }
        else
          {
          Literal_recent_mileage.Text = "(not specified)";
          }
        var recent_mileage_update_time = p.biz_vehicles.RecentMileageUpdateTimeOf(p.vehicle_summary);
        if (recent_mileage_update_time.Length > 0)
          {
          Literal_recent_mileage_update_time.Text = recent_mileage_update_time;
          }
        else
          {
          Literal_recent_mileage_update_time.Text = "yet";
          }
        TextBox_nominal_mileage.Focus();
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_vehicles = new TClass_biz_vehicles();
        p.vehicle_id = p.biz_vehicles.IdOf(Session["vehicle_summary"]);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_update_vehicle_mileage_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (IsValid)
        {
        p.biz_vehicles.SetMileage(p.vehicle_id,k.Safe(TextBox_nominal_mileage.Text,k.safe_hint_type.NUM));
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void CustomValidator_nominal_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      var be_valid = p.biz_vehicles.BeNotLessMileage(p.vehicle_id,k.Safe(TextBox_nominal_mileage.Text,k.safe_hint_type.NUM)) || CheckBox_mileage.Checked;
      CheckBox_mileage.Visible = !be_valid;
      args.IsValid = be_valid;
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    protected void CustomValidator_confirmation_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (k.Safe(TextBox_confirmation_mileage.Text,k.safe_hint_type.NUM) == k.Safe(TextBox_nominal_mileage.Text,k.safe_hint_type.NUM));
      }

    } // end TWebForm_update_vehicle_mileage

  }
