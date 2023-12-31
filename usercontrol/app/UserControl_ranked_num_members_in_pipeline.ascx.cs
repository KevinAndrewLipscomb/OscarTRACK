using Class_biz_members;
using System.Web.UI.WebControls;

namespace UserControl_ranked_num_members_in_pipeline
  {
  public partial class TWebUserControl_ranked_num_members_in_pipeline: ki_web_ui.usercontrol_class
    {

    private struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public uint rank;
        public uint total;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_members.BindRankedNumMembersInPipeline(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
                Label_total.Text = p.total.ToString();
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
                p.total = 0;
            }

        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank++;
                e.Item.Cells[0].Text = p.rank.ToString();
                p.total += uint.Parse(e.Item.Cells[2].Text);
            }
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_detail_ItemDataBound);
            PreRender += TWebUserControl_ranked_num_members_in_pipeline_PreRender;
        }

        private void TWebUserControl_ranked_num_members_in_pipeline_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_ranked_num_members_in_pipeline Fresh()
        {
            TWebUserControl_ranked_num_members_in_pipeline result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    } // end TWebUserControl_ranked_num_members_in_pipeline

}
