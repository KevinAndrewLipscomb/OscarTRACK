using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_ranked_fleet_tracking_participation
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public TClass_biz_role_member_map biz_role_member_map;
        public uint rank;
    }

    public partial class TWebUserControl_ranked_fleet_tracking_participation: ki_web_ui.usercontrol_class
    {
        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
        protected System.Web.UI.WebControls.Label Label_auditor_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                p.biz_members.BindRankedFleetTrackingParticipation(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
                Label_overall.Text = p.biz_members.OverallFleetTrackingParticipation() + " %";
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
            PreRender += TWebUserControl_ranked_fleet_tracking_participation_PreRender;
        }

        private void TWebUserControl_ranked_fleet_tracking_participation_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_ranked_fleet_tracking_participation Fresh()
        {
            TWebUserControl_ranked_fleet_tracking_participation result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (new ArrayList {ListItemType.Item,ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
            {
                // We are dealing with a data row, not a header or footer row.
                p.rank = p.rank + 1;
                e.Item.Cells[0].Text = p.rank.ToString();
            }
        }

    } // end TWebUserControl_ranked_fleet_tracking_participation

}
