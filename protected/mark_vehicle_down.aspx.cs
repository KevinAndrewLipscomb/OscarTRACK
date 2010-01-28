// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_vehicle_down_natures;
using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace mark_vehicle_down
  {
  public struct p_type
    {
    public TClass_biz_vehicle_down_natures biz_vehicle_down_natures;
    public TClass_biz_vehicle_usability_history biz_vehicle_usability_history;
    public TClass_biz_vehicles biz_vehicles;
    public string vehicle_id;
    }

  public partial class TWebForm_mark_vehicle_down: ki_web_ui.page_class
    {
    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebForm_mark_vehicle_down_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - mark_vehicle_down";
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
        UserControl_drop_down_datetime_control.minute_intervals = 5;
        UserControl_drop_down_datetime_control.selectedvalue = DateTime.Now.ToUniversalTime().AddMinutes(-((Double)(Session["client_timezone_offset"])));
        p.biz_vehicle_down_natures.BindDirectToListControlForMarkDown(RadioButtonList_nature);
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("mark_vehicle_down.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_vehicle_down_natures = new TClass_biz_vehicle_down_natures();
        p.biz_vehicle_usability_history = new TClass_biz_vehicle_usability_history();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.vehicle_id = p.biz_vehicles.IdOf(Session["vehicle_summary"]);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["mark_vehicle_down.p"]);
        }
      }

    private void TWebForm_mark_vehicle_down_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("mark_vehicle_down.p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (IsValid)
        {
        p.biz_vehicles.MarkDown
          (
          p.vehicle_id,
          UserControl_drop_down_datetime_control.selectedvalue,
          k.Safe(RadioButtonList_nature.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(TextBox_mileage.Text,k.safe_hint_type.NUM),
          k.Safe(TextBox_note.Text,k.safe_hint_type.MEMO).Trim(),
          Session["vehicle_summary"]
          );
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    protected void CustomValidator_datetime_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicle_usability_history.BeLater(p.vehicle_id,UserControl_drop_down_datetime_control.selectedvalue);
      }

    protected void CustomValidator_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicles.BeNotLessMileage(p.vehicle_id,k.Safe(TextBox_mileage.Text,k.safe_hint_type.NUM));
      }

    protected void CustomValidator_submit_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = !p.biz_vehicles.BeDown(p.vehicle_id);
      }

    } // end TWebForm_mark_vehicle_down

  }
