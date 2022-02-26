using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;

namespace add_vehicle
{
    public partial class TWebForm_add_vehicle: ki_web_ui.page_class
    {
        private struct p_type
          {
          public TClass_biz_vehicles biz_vehicles;
          }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
          {
          PreRender += TWebForm_add_vehicle_PreRender;
          }

        protected void Page_Load(object sender, System.EventArgs e)
          {
          Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - add_vehicle";
          if (!IsPostBack)
            {
            UserControl_vehicle_control.be_mode_add = true;
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
            //
            // Initialize p.~ objects here.
            //
            p.biz_vehicles = new TClass_biz_vehicles();
            }
          else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
            {
            p = (p_type)(Session[InstanceId() + ".p"]);
            }
          }

        private void TWebForm_add_vehicle_PreRender(object sender, System.EventArgs e)
          {
          SessionSet(InstanceId() + ".p", p);
          }

    } // end TWebForm_add_vehicle

}
