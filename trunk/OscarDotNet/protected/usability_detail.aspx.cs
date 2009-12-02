using Class_biz_user;
using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;
using System.Drawing;
using System.Web.UI.WebControls;

namespace usability_detail
{
    public partial class TWebForm_usability_detail: ki_web_ui.page_class
    {
    public class usability_detail_Static
      {
      public const int TCCI_ID = 0;
      public const int TCCI_NATURE_ID = 1;
      public const int TCCI_NATURE_NAME = 2;
      public const int TCCI_TIME_WENT_DOWN = 3;
      public const int TCCI_MILEAGE = 4;
      public const int TCCI_DOWN_COMMENT = 5;
      public const int TCCI_TIME_CAME_UP = 6;
      public const int TCCI_UP_COMMENT = 7;
      public const int TCCI_DURATION = 8;
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
            this.PreRender += this.TWebForm_usability_detail_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - usability_detail";
                Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
                if (p.biz_vehicles.StatusOf(Session["vehicle_summary"]) == "UP")
                  {
                  Table_current.BgColor = "LightGreen";
                  Table_current.BorderColor = "LightGreen";
                  LinkButton_new.Text = "&nbsp;UP&nbsp;";
                  }
                else
                  {
                  Table_current.BgColor = "LightGray";
                  Table_current.BorderColor = "LightGray";
                  LinkButton_new.Text = "DOWN";
                  }
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
                if ((Session["usability_detail.p"] != null))
                {
                    p = (p_type)(Session["usability_detail.p"]);
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
                    p.biz_vehicle_usability_history = new TClass_biz_vehicle_usability_history();
                    p.biz_vehicles = new TClass_biz_vehicles();
                    p.biz_user = new TClass_biz_user();
                    p.be_sort_order_ascending = false;
                    p.num_datagrid_rows = 0;
                    p.sort_order = "time_went_down%";
                }
            }
        }

        protected void LinkButton_new_Click(object sender, System.EventArgs e)
          {
          if (p.biz_vehicles.StatusOf(Session["vehicle_summary"]) == "UP")
            {
            DropCrumbAndTransferTo("mark_vehicle_down.aspx");
            }
          else
            {
            DropCrumbAndTransferTo("mark_vehicle_up.aspx");
            }
          }

        private void TWebForm_usability_detail_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("usability_detail.p", p);
        }

        private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
            {
                // We are dealing with a data row, not a header or footer row.
                var nature_id = k.Safe(e.Item.Cells[usability_detail_Static.TCCI_NATURE_ID].Text,k.safe_hint_type.NUM);
                var indicator_color = Color.Gainsboro;
                if (nature_id == "6")
                  {
                  indicator_color = Color.LightGreen;
                  }
                else if (nature_id == "5")
                  {
                  indicator_color = Color.Lime;
                  }
                else if (nature_id == "4")
                  {
                  indicator_color = Color.Yellow;
                  }
                else if (nature_id == "3")
                  {
                  indicator_color = Color.Orange;
                  }
                else if (nature_id == "2")
                  {
                  indicator_color = Color.Tomato;
                  }
                else if (nature_id == "1")
                  {
                  indicator_color = Color.Red;
                  }
                e.Item.Cells[usability_detail_Static.TCCI_NATURE_NAME].BorderColor = indicator_color;
                e.Item.Cells[usability_detail_Static.TCCI_NATURE_NAME].BackColor = indicator_color;
                if (indicator_color == Color.Red)
                  {
                  e.Item.Cells[usability_detail_Static.TCCI_NATURE_NAME].ForeColor = Color.White;
                  }
                p.num_datagrid_rows = p.num_datagrid_rows + 1;
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
            p.biz_vehicle_usability_history.BindVehicleRecords(p.biz_vehicles.IdOf(Session["vehicle_summary"]), p.sort_order, p.be_sort_order_ascending, DataGrid_control);
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
            public TClass_biz_vehicle_usability_history biz_vehicle_usability_history;
            public uint num_datagrid_rows;
            public string sort_order;
        } // end p_type

    } // end TWebForm_usability_detail

}
