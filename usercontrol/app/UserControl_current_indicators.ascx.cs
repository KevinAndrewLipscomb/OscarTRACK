using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using UserControl_ranked_commensuration;
using UserControl_ranked_core_ops_size;
using UserControl_ranked_crew_shifts_forecast;
using UserControl_ranked_length_of_service;
using UserControl_ranked_num_members_in_pipeline;
using UserControl_ranked_standard_enrollment;
using UserControl_ranked_utilization;
namespace UserControl_current_indicators
{
    public partial class TWebUserControl_current_indicators: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
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
            if (IsPostBack && (Session["UserControl_current_indicators.p"] != null) && (Session["UserControl_current_indicators.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_current_indicators.p"]);
            }
            else
            {
                p.be_loaded = false;
                PlaceHolder_ranked_core_ops_size.Controls.Add(((TWebUserControl_ranked_core_ops_size)(LoadControl("~/usercontrol/app/UserControl_ranked_core_ops_size.ascx"))).Fresh());
                PlaceHolder_ranked_crew_shifts_forecast.Controls.Add(((TWebUserControl_ranked_crew_shifts_forecast)(LoadControl("~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx"))).Fresh());
                PlaceHolder_ranked_standard_enrollment.Controls.Add(((TWebUserControl_ranked_standard_enrollment)(LoadControl("~/usercontrol/app/UserControl_ranked_standard_enrollment.ascx"))).Fresh());
                PlaceHolder_ranked_utilization.Controls.Add(((TWebUserControl_ranked_utilization)(LoadControl("~/usercontrol/app/UserControl_ranked_utilization.ascx"))).Fresh());
                PlaceHolder_ranked_length_of_service.Controls.Add(((TWebUserControl_ranked_length_of_service)(LoadControl("~/usercontrol/app/UserControl_ranked_length_of_service.ascx"))).Fresh());
                PlaceHolder_ranked_commensuration.Controls.Add(((TWebUserControl_ranked_commensuration)(LoadControl("~/usercontrol/app/UserControl_ranked_commensuration.ascx"))).Fresh());
                PlaceHolder_ranked_num_members_in_pipeline.Controls.Add(((TWebUserControl_ranked_num_members_in_pipeline)(LoadControl("~/usercontrol/app/UserControl_ranked_num_members_in_pipeline.ascx"))).Fresh());
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_current_indicators_PreRender;
        }

        private void TWebUserControl_current_indicators_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_current_indicators.p", p);
        }

        public TWebUserControl_current_indicators Fresh()
        {
            TWebUserControl_current_indicators result;
            Session.Remove("UserControl_current_indicators.p");
            result = this;
            return result;
        }

        private struct p_type
        {
            public bool be_loaded;
        } // end p_type

    } // end TWebUserControl_current_indicators

}
