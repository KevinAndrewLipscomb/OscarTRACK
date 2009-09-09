using kix;
using System;

using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using System.Collections;
using Class_biz_agencies;
using Class_biz_role_member_map;
namespace UserControl_ranked_commensuration
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_role_member_map biz_role_member_map;
        public uint rank;
    } // end p_type

    public partial class TWebUserControl_ranked_commensuration: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_auditor_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_overall.Text = p.biz_agencies.OverallCommensuration();
                if (Label_overall.Text != k.EMPTY)
                {
                    Label_overall.Text = Label_overall.Text + " %";
                    p.biz_agencies.BindRankedCommensuration(DataGrid_detail);
                    DataGrid_detail.Visible = true;
                    Label_no_data.Visible = false;
                }
                else
                {
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
            if (IsPostBack && (Session["UserControl_ranked_commensuration.p"] != null) && (Session["UserControl_ranked_commensuration.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_ranked_commensuration.p"]);
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
            this.DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_detail_ItemDataBound);
            this.PreRender += this.TWebUserControl_ranked_commensuration_PreRender;
            this.Load += this.Page_Load;
        }

        private void TWebUserControl_ranked_commensuration_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_ranked_commensuration.p", p);
        }

        public TWebUserControl_ranked_commensuration Fresh()
        {
            TWebUserControl_ranked_commensuration result;
            Session.Remove("UserControl_ranked_commensuration.p");
            result = this;
            return result;
        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (new ArrayList(new object[] {ListItemType.Item, ListItemType.AlternatingItem, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank = p.rank + 1;
                e.Item.Cells[0].Text = p.rank.ToString();
            }
        }

    } // end TWebUserControl_ranked_commensuration

}
