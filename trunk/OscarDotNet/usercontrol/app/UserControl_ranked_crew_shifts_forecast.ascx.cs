using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_members;
namespace UserControl_ranked_crew_shifts_forecast
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public uint rank;
        public decimal total;
    } // end p_type

    public partial class TWebUserControl_ranked_crew_shifts_forecast: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_members.BindRankedCrewShiftsForecast(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
                Label_total.Text = p.total.ToString();
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_ranked_crew_shifts_forecast.p"] != null) && (Session["UserControl_ranked_crew_shifts_forecast.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_ranked_crew_shifts_forecast.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.rank = 0;
                p.total = 0;
            }

        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank = p.rank + 1;
                e.Item.Cells[0].Text = p.rank.ToString();
                p.total = p.total + decimal.Parse(e.Item.Cells[2].Text);
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_detail_ItemDataBound);
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_ranked_crew_shifts_forecast_PreRender;
        }

        private void TWebUserControl_ranked_crew_shifts_forecast_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_ranked_crew_shifts_forecast.p", p);
        }

        public TWebUserControl_ranked_crew_shifts_forecast Fresh()
        {
            TWebUserControl_ranked_crew_shifts_forecast result;
            Session.Remove("UserControl_ranked_crew_shifts_forecast.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_ranked_crew_shifts_forecast

}
