using Class_biz_agencies;
using Class_biz_role_member_map;
using kix;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_ranked_commensuration
  {
  public partial class TWebUserControl_ranked_commensuration: ki_web_ui.usercontrol_class
    {

    private struct p_type
    {
        public bool be_loaded;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_role_member_map biz_role_member_map;
        public uint rank;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_overall.Text = p.biz_agencies.OverallCommensuration();
                if (Label_overall.Text.Length > 0)
                {
                    Label_overall.Text += " %";
                    p.biz_agencies.BindRankedCommensuration(DataGrid_detail);
                    DataGrid_detail.Visible = true;
                    Label_no_data.Visible = false;
                }
                else
                {
                    Label_overall.Text = "?";
                    Label_no_data.Text = Label_no_data.Text + k.SPACE + p.biz_role_member_map.HolderOf("Department Schedule Auditor").ToUpper();
                    Label_no_data.Visible = true;
                    DataGrid_detail.Visible = false;
                }
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
                p.biz_role_member_map = new TClass_biz_role_member_map();
                p.rank = 0;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_detail_ItemDataBound);
            PreRender += TWebUserControl_ranked_commensuration_PreRender;
        }

        private void TWebUserControl_ranked_commensuration_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_ranked_commensuration Fresh()
        {
            TWebUserControl_ranked_commensuration result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (new ArrayList {ListItemType.Item,ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank++;
                e.Item.Cells[0].Text = p.rank.ToString();
            }
        }

    } // end TWebUserControl_ranked_commensuration

}
