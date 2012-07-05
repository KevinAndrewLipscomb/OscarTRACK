using Class_biz_agencies;

namespace UserControl_serial_indicator_avail_submission_compliance
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_agencies biz_agencies;
    } // end p_type

    public partial class TWebUserControl_serial_indicator_avail_submission_compliance: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_agencies.BindForControlCharts("avail_submission_compliance", DataGrid_control_charts);
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
                p.biz_agencies = new TClass_biz_agencies();
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_serial_indicator_avail_submission_compliance_PreRender;
        }

        private void TWebUserControl_serial_indicator_avail_submission_compliance_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_serial_indicator_avail_submission_compliance Fresh()
        {
            TWebUserControl_serial_indicator_avail_submission_compliance result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_serial_indicator_avail_submission_compliance

}
