// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_vehicle_quarters;
using Class_biz_vehicle_quarters_history;
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

namespace change_vehicle_quarters
  {
  public struct p_type
    {
    public TClass_biz_vehicle_quarters biz_vehicle_quarters;
    public TClass_biz_vehicle_quarters_history biz_vehicle_quarters_history;
    public TClass_biz_vehicles biz_vehicles;
    public string vehicle_id;
    public object vehicle_summary;
    }

  public partial class TWebForm_change_vehicle_quarters: ki_web_ui.page_class
    {
    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebForm_change_vehicle_quarters_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_vehicle_quarters";
        p.vehicle_summary = Session["vehicle_summary"];
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        Literal_vehicle_name_2.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        Literal_vehicle_name_3.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        p.biz_vehicle_quarters.BindDirectToListControlMediumDashLong(DropDownList_quarters);
        UserControl_drop_down_datetime_control.selectedvalue = DateTime.Now;
        UserControl_drop_down_datetime_control.minute_intervals = 5;
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("change_vehicle_quarters.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_vehicle_quarters = new TClass_biz_vehicle_quarters();
        p.biz_vehicle_quarters_history = new TClass_biz_vehicle_quarters_history();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.vehicle_id = p.biz_vehicles.IdOf(Session["vehicle_summary"]);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["change_vehicle_quarters.p"]);
        }
      }

    private void TWebForm_change_vehicle_quarters_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("change_vehicle_quarters.p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (IsValid)
        {
        p.biz_vehicle_quarters_history.Change
          (
          p.vehicle_id,
          k.Safe(DropDownList_quarters.SelectedValue,k.safe_hint_type.NUM),
          UserControl_drop_down_datetime_control.selectedvalue,
          k.Safe(TextBox_mileage.Text,k.safe_hint_type.NUM),
          k.Safe(TextBox_note.Text,k.safe_hint_type.MEMO)
          );
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void CustomValidator_quarters_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = k.Safe(DropDownList_quarters.SelectedValue,k.safe_hint_type.NUM) != p.biz_vehicle_quarters_history.IdOfCurrent(p.vehicle_id);
      }

    protected void CustomValidator_datetime_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicle_quarters_history.BeLater(p.vehicle_id,UserControl_drop_down_datetime_control.selectedvalue);
      }

    protected void CustomValidator_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicles.BeNotLessMileage(p.vehicle_id,k.Safe(TextBox_mileage.Text,k.safe_hint_type.NUM));
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    } // end TWebForm_change_vehicle_quarters

  }
