using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;


using Class_biz_agencies;
using appcommon;
namespace UserControl_serial_indicator_potential_crew_shifts
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_agencies biz_agencies;
    } // end p_type

    public partial class TWebUserControl_serial_indicator_potential_crew_shifts: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_agencies.BindForControlCharts("crew_shifts_forecast", DataGrid_control_charts);
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_serial_indicator_potential_crew_shifts.p"] != null) && (Session["UserControl_serial_indicator_potential_crew_shifts.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_serial_indicator_potential_crew_shifts.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_agencies = new TClass_biz_agencies();
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_serial_indicator_potential_crew_shifts_PreRender;
        }

        private void TWebUserControl_serial_indicator_potential_crew_shifts_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_serial_indicator_potential_crew_shifts.p", p);
        }

        public TWebUserControl_serial_indicator_potential_crew_shifts Fresh()
        {
            TWebUserControl_serial_indicator_potential_crew_shifts result;
            Session.Remove("UserControl_serial_indicator_potential_crew_shifts.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_serial_indicator_potential_crew_shifts

}
