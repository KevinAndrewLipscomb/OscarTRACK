using Class_biz_members;
using System.Web.UI.WebControls;

namespace UserControl_ranked_standard_enrollment
  {
  public partial class TWebUserControl_ranked_standard_enrollment: ki_web_ui.usercontrol_class
    {

    private struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public uint rank;
        public decimal total_cooked;
        public decimal total_raw;
    }

        private p_type p;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_members.BindRankedStandardEnrollment(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
                Label_total.Text = (p.total_cooked / p.total_raw).ToString("P0");
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
                p.rank++;
                e.Item.Cells[0].Text = p.rank.ToString();
                num_cooked_shifts = decimal.Parse(e.Item.Cells[2].Text);
                num_raw_shifts = decimal.Parse(e.Item.Cells[3].Text);
                p.total_cooked += num_cooked_shifts;
                p.total_raw += num_raw_shifts;
                //e.Item.Cells[4].Text = (num_cooked_shifts / num_raw_shifts).ToString("P0");
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_detail_ItemDataBound);
            PreRender += TWebUserControl_ranked_standard_enrollment_PreRender;
        }

        private void TWebUserControl_ranked_standard_enrollment_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_ranked_standard_enrollment Fresh()
        {
            TWebUserControl_ranked_standard_enrollment result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_ranked_standard_enrollment

}
