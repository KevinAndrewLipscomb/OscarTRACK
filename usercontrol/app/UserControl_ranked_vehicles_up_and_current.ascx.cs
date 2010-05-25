using Class_biz_indicator_monthly_vehicles_up_and_current;
using Class_biz_indicator_shiftwise_vehicles_up_and_current;
using Class_biz_vehicles;
using kix;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_ranked_vehicles_up_and_current
  {
  public struct p_type
    {
    public bool be_loaded;
    public TClass_biz_vehicles biz_vehicles;
    public TClass_biz_indicator_monthly_vehicles_up_and_current biz_indicator_monthly_vehicles_up_and_current;
    public TClass_biz_indicator_shiftwise_vehicles_up_and_current biz_indicator_shiftwise_vehicles_up_and_current;
    public ArrayList citywide_shiftwise_factor_array_list;
    public ArrayList mrt_shiftwise_factor_array_list;
    public ArrayList r01_shiftwise_factor_array_list;
    public ArrayList r02_shiftwise_factor_array_list;
    public ArrayList r04_shiftwise_factor_array_list;
    public ArrayList r05_shiftwise_factor_array_list;
    public ArrayList r06_shiftwise_factor_array_list;
    public ArrayList r09_shiftwise_factor_array_list;
    public ArrayList r13_shiftwise_factor_array_list;
    public ArrayList r14_shiftwise_factor_array_list;
    public ArrayList r16_shiftwise_factor_array_list;
    public ArrayList r17_shiftwise_factor_array_list;
    public ArrayList sar_shiftwise_factor_array_list;
    public uint rank;
    public decimal total_num_vehicles;
    public decimal total_num_vehicles_up_and_current;
    }

  public partial class TWebUserControl_ranked_vehicles_up_and_current: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_vehicles.BindRankedUpAndCurrent(DataGrid_detail);
        Label_overall.Text = (p.total_num_vehicles_up_and_current/p.total_num_vehicles).ToString("P0");
        if (Session["mode:report/monthly-core-ops-dashboard"] != null)
          {
          p.biz_indicator_shiftwise_vehicles_up_and_current.BindSpecialForMonthlyMedians(DataGrid_special);
          p.citywide_shiftwise_factor_array_list.Sort();
          Label_overall.Text = k.Median(p.citywide_shiftwise_factor_array_list).ToString("F2");
          p.biz_indicator_monthly_vehicles_up_and_current.Log
            (
            p.citywide_shiftwise_factor_array_list,
            p.mrt_shiftwise_factor_array_list,
            p.r01_shiftwise_factor_array_list,
            p.r02_shiftwise_factor_array_list,
            p.r04_shiftwise_factor_array_list,
            p.r05_shiftwise_factor_array_list,
            p.r06_shiftwise_factor_array_list,
            p.r09_shiftwise_factor_array_list,
            p.r13_shiftwise_factor_array_list,
            p.r14_shiftwise_factor_array_list,
            p.r16_shiftwise_factor_array_list,
            p.r17_shiftwise_factor_array_list,
            p.sar_shiftwise_factor_array_list
            );
          }
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack && (Session["UserControl_ranked_vehicles_up_and_current.p"] != null) && (Session["UserControl_ranked_vehicles_up_and_current.p"].GetType().Namespace == p.GetType().Namespace))
        {
        p = (p_type)(Session["UserControl_ranked_vehicles_up_and_current.p"]);
        }
      else
        {
        p.be_loaded = false;
        p.biz_vehicles = new TClass_biz_vehicles();
        p.biz_indicator_monthly_vehicles_up_and_current = new TClass_biz_indicator_monthly_vehicles_up_and_current();
        p.biz_indicator_shiftwise_vehicles_up_and_current = new TClass_biz_indicator_shiftwise_vehicles_up_and_current();
        p.citywide_shiftwise_factor_array_list = new ArrayList();
        p.mrt_shiftwise_factor_array_list = new ArrayList();
        p.r01_shiftwise_factor_array_list = new ArrayList();
        p.r02_shiftwise_factor_array_list = new ArrayList();
        p.r04_shiftwise_factor_array_list = new ArrayList();
        p.r05_shiftwise_factor_array_list = new ArrayList();
        p.r06_shiftwise_factor_array_list = new ArrayList();
        p.r09_shiftwise_factor_array_list = new ArrayList();
        p.r13_shiftwise_factor_array_list = new ArrayList();
        p.r14_shiftwise_factor_array_list = new ArrayList();
        p.r16_shiftwise_factor_array_list = new ArrayList();
        p.r17_shiftwise_factor_array_list = new ArrayList();
        p.sar_shiftwise_factor_array_list = new ArrayList();
        p.rank = 0;
        p.total_num_vehicles = 0;
        p.total_num_vehicles_up_and_current = 0;
        }
      }

    private void DataGrid_special_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      decimal shiftwise_factor;
      if ((new ArrayList {ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.Item,ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        // We are dealing with a data row, not a header or footer row.
        if (e.Item.Cells[1].Text != "&nbsp;")
          {
          shiftwise_factor = decimal.Parse(e.Item.Cells[1].Text);
          if (e.Item.Cells[0].Text == "EMS")
            {
            p.citywide_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "MRT")
            {
            p.mrt_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R01")
            {
            p.r01_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R02")
            {
            p.r02_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R04")
            {
            p.r04_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R05")
            {
            p.r05_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R06")
            {
            p.r06_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R09")
            {
            p.r09_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R13")
            {
            p.r13_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R14")
            {
            p.r14_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R16")
            {
            p.r16_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "R17")
            {
            p.r17_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          else if (e.Item.Cells[0].Text == "SAR")
            {
            p.sar_shiftwise_factor_array_list.Add(shiftwise_factor);
            }
          }
        }
      }

    private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if ((new ArrayList {ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.Item,ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        // We are dealing with a data row, not a header or footer row.
        p.rank = p.rank + 1;
        e.Item.Cells[0].Text = p.rank.ToString();
        var num_vehicles_up_and_current = decimal.Parse(e.Item.Cells[2].Text);
        var num_vehicles = decimal.Parse(e.Item.Cells[3].Text);
        p.total_num_vehicles_up_and_current += num_vehicles_up_and_current;
        p.total_num_vehicles += num_vehicles;
        if (num_vehicles != 0)
          {
          e.Item.Cells[4].Text = (num_vehicles_up_and_current / num_vehicles).ToString("P0");
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
      this.DataGrid_special.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_special_ItemDataBound);
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_ranked_vehicles_up_and_current_PreRender;
      }

    private void TWebUserControl_ranked_vehicles_up_and_current_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_ranked_vehicles_up_and_current.p", p);
      }

    public TWebUserControl_ranked_vehicles_up_and_current Fresh()
      {
      Session.Remove("UserControl_ranked_vehicles_up_and_current.p");
      return this;
      }

    } // end TWebUserControl_ranked_vehicles_up_and_current

  }
