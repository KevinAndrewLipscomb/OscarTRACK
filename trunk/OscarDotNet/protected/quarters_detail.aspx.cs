using Class_biz_user;
using Class_biz_vehicle_quarters_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace quarters_detail
{
    public partial class TWebForm_quarters_detail: ki_web_ui.page_class
    {
    public class quarters_detail_Static
      {
      public const int TCCI_ID = 0;
      public const int TCCI_NAME = 1;
      public const int TCCI_NOTE = 2;
      public const int TCCI_FROM = 3;
      public const int TCCI_TO = 4;
      public const int TCCI_DURATION_RAW = 5;
      public const int TCCI_DURATION_COOKED = 6;
      }
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_control.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid_control_SortCommand);
            this.DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_control_ItemDataBound);
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_quarters_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - quarters_detail";
                Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
                Bind();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session["quarters_detail.p"] != null))
                {
                    p = (p_type)(Session["quarters_detail.p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    p.biz_vehicle_quarters_history = new TClass_biz_vehicle_quarters_history();
                    p.biz_vehicles = new TClass_biz_vehicles();
                    p.biz_user = new TClass_biz_user();
                    p.be_sort_order_ascending = false;
                    p.num_datagrid_rows = 0;
                    p.sort_order = "start_datetime%";
                }
            }
        }

        protected void LinkButton_new_Click(object sender, System.EventArgs e)
          {
          DropCrumbAndTransferTo("change_vehicle_quarters.aspx");
          }

        private void TWebForm_quarters_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("quarters_detail.p", p);
        }

        private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                e.Item.Cells[quarters_detail_Static.TCCI_NOTE].Text = e.Item.Cells[quarters_detail_Static.TCCI_NOTE].Text.Replace(k.NEW_LINE,"<br>");
                //
                // Transform raw duration from MySQL d.hh:mm:ss format to friendly format (in which the ss component will be discarded).
                //
                var duration_component_array = new string[3];
                if (e.Item.Cells[quarters_detail_Static.TCCI_DURATION_RAW].Text.Contains(k.PERIOD))
                  {
                  duration_component_array = e.Item.Cells[quarters_detail_Static.TCCI_DURATION_RAW].Text.Split(new char[] {'.',':'});
                  e.Item.Cells[quarters_detail_Static.TCCI_DURATION_COOKED].Text = duration_component_array[0] + "d " + duration_component_array[1] + "h " + duration_component_array[2] + "m";
                  }
                else
                  {
                  duration_component_array = e.Item.Cells[quarters_detail_Static.TCCI_DURATION_RAW].Text.Split(new char[] {':'});
                  e.Item.Cells[quarters_detail_Static.TCCI_DURATION_COOKED].Text = duration_component_array[0] + "h " + duration_component_array[1] + "m";
                  }
                //
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
                //
                // Remove all cell controls from viewstate except for the one at TCI_ID.
                //
                foreach (TableCell cell in e.Item.Cells)
                  {
                  cell.EnableViewState = false;
                  }
                e.Item.Cells[quarters_detail_Static.TCCI_ID].EnableViewState = true;
                //
            }
        }

        private void DataGrid_control_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
        {
            if (e.SortExpression == p.sort_order)
            {
                p.be_sort_order_ascending = !p.be_sort_order_ascending;
            }
            else
            {
                p.sort_order = k.Safe(e.SortExpression, k.safe_hint_type.KI_SORT_EXPRESSION);
                p.be_sort_order_ascending = true;
            }
            DataGrid_control.EditItemIndex =  -1;
            Bind();
        }

        private void Bind()
        {
            p.biz_vehicle_quarters_history.BindVehicleRecords(p.biz_vehicles.IdOf(Session["vehicle_summary"]), p.sort_order, p.be_sort_order_ascending, DataGrid_control);
            // Manage control visibilities.
            p.be_datagrid_empty = (p.num_datagrid_rows == 0);
            TableRow_none.Visible = p.be_datagrid_empty;
            DataGrid_control.Visible = !p.be_datagrid_empty;
            // Clear aggregation vars for next bind, if any.
            p.num_datagrid_rows = 0;

        }

        private struct p_type
        {
            public bool be_datagrid_empty;
            public bool be_sort_order_ascending;
            public TClass_biz_user biz_user;
            public TClass_biz_vehicles biz_vehicles;
            public TClass_biz_vehicle_quarters_history biz_vehicle_quarters_history;
            public uint num_datagrid_rows;
            public string sort_order;
        } // end p_type

    } // end TWebForm_quarters_detail

}
