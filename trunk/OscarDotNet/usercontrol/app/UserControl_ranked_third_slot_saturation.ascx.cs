using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_members;
namespace UserControl_ranked_third_slot_saturation
  {
  public struct p_type
    {
    public bool be_loaded;
    public TClass_biz_members biz_members;
    public uint rank;
    public decimal total_crew_shifts;
    public decimal total_third_shifts;
    }

  public partial class TWebUserControl_ranked_third_slot_saturation: ki_web_ui.usercontrol_class
    {
    private p_type p;
    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_members.BindRankedThirdSlotSaturation(DataGrid_detail, (Session["mode:report/monthly-core-ops-dashboard"] != null));
        Label_total.Text = (p.total_third_shifts/p.total_crew_shifts).ToString("P0");
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack && (Session["UserControl_ranked_third_slot_saturation.p"] != null) && (Session["UserControl_ranked_third_slot_saturation.p"].GetType().Namespace == p.GetType().Namespace))
        {
        p = (p_type)(Session["UserControl_ranked_third_slot_saturation.p"]);
        }
      else
        {
        p.be_loaded = false;
        p.biz_members = new TClass_biz_members();
        p.rank = 0;
        p.total_crew_shifts = 0;
        p.total_third_shifts = 0;
        }
      }

    private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if ((e.Item.ItemType == ListItemType.AlternatingItem) || (e.Item.ItemType == ListItemType.EditItem) || (e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.SelectedItem))
        {
        // We are dealing with a data row, not a header or footer row.
        p.rank = p.rank + 1;
        e.Item.Cells[0].Text = p.rank.ToString();
        var num_third_shifts = decimal.Parse(e.Item.Cells[2].Text);
        var num_crew_shifts = decimal.Parse(e.Item.Cells[3].Text);
        p.total_third_shifts += num_third_shifts;
        p.total_crew_shifts += num_crew_shifts;
        if (num_crew_shifts != 0)
          {
          e.Item.Cells[4].Text = (num_third_shifts / num_crew_shifts).ToString("P0");
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
      this.PreRender += this.TWebUserControl_ranked_third_slot_saturation_PreRender;
      }

    private void TWebUserControl_ranked_third_slot_saturation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_ranked_third_slot_saturation.p", p);
      }

    public TWebUserControl_ranked_third_slot_saturation Fresh()
      {
      Session.Remove("UserControl_ranked_third_slot_saturation.p");
      return this;
      }

    } // end TWebUserControl_ranked_third_slot_saturation

  }
