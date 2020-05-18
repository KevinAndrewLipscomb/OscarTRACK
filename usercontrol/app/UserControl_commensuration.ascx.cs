using Class_biz_agencies;
using Class_db_agencies;
using kix;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_commensuration
  {
  public partial class TWebUserControl_commensuration: ki_web_ui.usercontrol_class
    {
    private struct p_type
    {
        public bool be_loaded;
        public TClass_biz_agencies biz_agencies;
    }

        private p_type p;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_month.Text = DateTime.Today.AddMonths(1).ToString("MMMM");
                p.biz_agencies.BindForCommensuration(DataGrid_commensuration);
                if (DateTime.Today.Day < 10)
                {
                    DataGrid_commensuration.Enabled = false;
                    Button_submit.Enabled = false;
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
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            DataGrid_commensuration.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_commensuration_ItemDataBound);
            PreRender += TWebUserControl_commensuration_PreRender;
        }

        private void TWebUserControl_commensuration_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_commensuration Fresh()
        {
            TWebUserControl_commensuration result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            commensuration_rec_type commensuration_rec;
            Queue commensuration_rec_q;
            DataGridItem data_grid_item;
            DataGridItemCollection data_grid_item_collection;
            uint i;
            ListItemType item_type;
            decimal num_actual;
            decimal num_forecast;
            decimal total_num_actual;
            decimal total_num_forecast;
            TableCellCollection table_cell_collection;
            commensuration_rec_q = new Queue();
            data_grid_item_collection = DataGrid_commensuration.Items;
            total_num_actual = 0;
            total_num_forecast = 0;
            // Enqueue individual agency records
            if (data_grid_item_collection.Count > 0)
            {
                for (i = 0; i <= (data_grid_item_collection.Count - 1); i ++ )
                {
                    data_grid_item = data_grid_item_collection[(int)i];
                    item_type = data_grid_item.ItemType;
                    if (new ArrayList {ListItemType.Item,ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(item_type))
                    {
                        table_cell_collection = data_grid_item.Cells;
                        num_forecast = decimal.Parse(k.Safe(table_cell_collection[Units.UserControl_commensuration.TCCI_FORECAST].Text, k.safe_hint_type.REAL_NUM));
                        num_actual = decimal.Parse(k.Safe(((table_cell_collection[Units.UserControl_commensuration.TCCI_ACTUAL].FindControl("TextBox_quantity")) as TextBox).Text, k.safe_hint_type.REAL_NUM));
                        total_num_forecast += num_forecast;
                        total_num_actual += num_actual;
                        commensuration_rec.agency_id = k.Safe(table_cell_collection[Units.UserControl_commensuration.TCCI_AGENCY_ID].Text,k.safe_hint_type.NUM);
                        commensuration_rec.commensuration_factor = (num_forecast == 0 ? 0 : num_actual / num_forecast);
                        commensuration_rec.be_agency_id_applicable = true;
                        commensuration_rec_q.Enqueue(commensuration_rec);
                    }
                }
            }
            // Enqueue citywide record
            commensuration_rec.agency_id = "0";
            commensuration_rec.commensuration_factor = total_num_actual / total_num_forecast;
            commensuration_rec.be_agency_id_applicable = false;
            commensuration_rec_q.Enqueue(commensuration_rec);
            // Log
            p.biz_agencies.SetCommensuration(commensuration_rec_q);
            Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "subaccept", "Submission accepted", true);

        }

        private void DataGrid_commensuration_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                e.Item.Cells[Units.UserControl_commensuration.TCCI_DESIGNATOR].Text = e.Item.Cells[Units.UserControl_commensuration.TCCI_DESIGNATOR].Text + ":";
                e.Item.Cells[Units.UserControl_commensuration.TCCI_FORECAST].Text = decimal.Parse(e.Item.Cells[Units.UserControl_commensuration.TCCI_FORECAST].Text).ToString("F1");
            }
        }

    } // end TWebUserControl_commensuration

}

namespace UserControl_commensuration.Units
  {
  public class UserControl_commensuration
    {
        public const int TCCI_AGENCY_ID = 0;
        public const int TCCI_DESIGNATOR = 1;
        public const int TCCI_FORECAST = 2;
        public const int TCCI_ACTUAL = 3;
    } // end UserControl_commensuration

}

