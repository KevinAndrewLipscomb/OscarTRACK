using System.Web.UI.WebControls;

namespace UserControl_config_welcome
  {
  public partial class TWebUserControl_config_welcome: ki_web_ui.usercontrol_class
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
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {

            PreRender += TWebUserControl_config_welcome_PreRender;
        }

        private void TWebUserControl_config_welcome_PreRender(object sender, System.EventArgs e)
        {

            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_config_welcome Fresh()
        {
            TWebUserControl_config_welcome result;


            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_config_welcome

}
