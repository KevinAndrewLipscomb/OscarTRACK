using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_members;
using appcommon;
namespace UserControl_ranked_utilization
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public uint rank;
        public decimal total_cooked;
        public decimal total_raw;
    } // end p_type

    public partial class TWebUserControl_ranked_utilization: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_members.BindRankedUtilization(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
                Label_total.Text = (p.total_cooked / p.total_raw).ToString("P0");
                p.be_loaded = true;
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_ranked_utilization.p"] != null) && (Session["UserControl_ranked_utilization.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_ranked_utilization.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.rank = 0;
                p.total_cooked = 0;
                p.total_raw = 0;
            }

        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            decimal num_cooked_shifts;
            decimal num_raw_shifts;
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank = p.rank + 1;
                e.Item.Cells[0].Text = p.rank.ToString();
                num_cooked_shifts = decimal.Parse(e.Item.Cells[2].Text);
                num_raw_shifts = decimal.Parse(e.Item.Cells[3].Text);
                p.total_cooked = p.total_cooked + num_cooked_shifts;
                p.total_raw = p.total_raw + num_raw_shifts;
                if (num_raw_shifts != 0)
                {
                    e.Item.Cells[4].Text = (num_cooked_shifts / num_raw_shifts).ToString("P0");
                }
                else
                {
                    e.Item.Cells[4].Text = "NAN";
                }
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
            this.PreRender += this.TWebUserControl_ranked_utilization_PreRender;
        }

        private void TWebUserControl_ranked_utilization_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_ranked_utilization.p", p);
        }

        public TWebUserControl_ranked_utilization Fresh()
        {
            TWebUserControl_ranked_utilization result;
            Session.Remove("UserControl_ranked_utilization.p");
            result = this;
            return result;
        }

    } // end TWebUserControl_ranked_utilization

}
