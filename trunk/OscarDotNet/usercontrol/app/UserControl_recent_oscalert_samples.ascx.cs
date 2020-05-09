// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using AjaxControlToolkit;
using Class_biz_oscalert_logs;
using Class_biz_publicity;
using Class_msg_protected;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text.RegularExpressions;

namespace UserControl_recent_oscalert_samples
  {
  public partial class TWebUserControl_recent_oscalert_samples: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_TIME = 0;
      public const int TCI_CONTENT = 1;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_oscalert_logs biz_oscalert_logs;
      public TClass_biz_publicity biz_publicity;
      public string impression_filter;
      public uint num_oscalert_logs;
      public string recency_filter;
      public string sort_order;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        DropDownList_impression.SelectedValue = p.impression_filter;
        DropDownList_recency.SelectedValue = p.recency_filter;
        Bind();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_field_situation_recent_oscalert_samples_control")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_field_situation");
          }
        }
      else
        {
        p.biz_oscalert_logs = new TClass_biz_oscalert_logs();
        p.biz_publicity = new TClass_biz_publicity();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.impression_filter = k.EMPTY;
        p.recency_filter = k.EMPTY;
        p.sort_order = "id desc";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_recent_oscalert_samples_PreRender;
      }

    private void TWebUserControl_recent_oscalert_samples_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_recent_oscalert_samples Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        e.Item.Cells[Static.TCI_CONTENT].Text = p.biz_publicity.RenditionOfOscalertLogContent(e.Item.Cells[Static.TCI_CONTENT].Text);
        //
        // Remove all cell controls from viewstate.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        //
        p.num_oscalert_logs++;
        }
      }

    internal void Bind()
      {
      p.biz_oscalert_logs.BindBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        impression_filter:p.impression_filter,
        recency_filter:p.recency_filter
        );
      p.be_datagrid_empty = (p.num_oscalert_logs == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_alerts.Text = p.num_oscalert_logs.ToString();
      p.num_oscalert_logs = 0;
      }

    protected void DropDownList_impression_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.impression_filter = k.Safe(DropDownList_impression.SelectedValue,k.safe_hint_type.ALPHA);
      Bind();
      }

    protected void DropDownList_recency_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.recency_filter = k.Safe(DropDownList_recency.SelectedValue,k.safe_hint_type.ALPHA);
      Bind();
      }

    } // end TWebUserControl_recent_oscalert_samples

  }