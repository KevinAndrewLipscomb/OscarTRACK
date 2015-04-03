// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using AjaxControlToolkit;
using Class_biz_oscalert_logs;
using Class_msg_protected;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

namespace UserControl_recent_oscalert_samples
  {
  public partial class TWebUserControl_recent_oscalert_samples: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_TIME = 0;
      public const int TCI_EVENT = 1;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_oscalert_logs biz_oscalert_logs;
      public uint num_oscalert_logs;
      public string sort_order;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
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
#warning Revise the binder-related instance_id to this control appropriately.
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_recent_oscalert_samples")
          {
#warning Revise the ClientID path to this control appropriately.
          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_recent_oscalert_samples");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_recent_oscalert_samples")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_recent_oscalert_samples");
//        }
        }
      else
        {
        p.biz_oscalert_logs = new TClass_biz_oscalert_logs();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.sort_order = "id desc";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_control_ItemDataBound);
      this.PreRender += this.TWebUserControl_recent_oscalert_samples_PreRender;
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
        e.Item.Cells[Static.TCI_EVENT].Text = e.Item.Cells[Static.TCI_EVENT].Text
        .Replace("OSCALERT: ",k.EMPTY)
        .Replace(" http://goo.gl/lvMvXs",k.EMPTY)
        .Replace(" case active.",k.EMPTY)
        .Replace(" Volunteers to your stations.",k.EMPTY)
        ;
        //
        // Remove all cell controls from viewstate except for the one at TCI_ID.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        e.Item.Cells[Static.TCI_EVENT].EnableViewState = true;
        //
        p.num_oscalert_logs++;
        }
      }

    private void Bind()
      {
      p.biz_oscalert_logs.BindBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control);
      p.be_datagrid_empty = (p.num_oscalert_logs == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_alerts.Text = p.num_oscalert_logs.ToString();
      p.num_oscalert_logs = 0;
      }

    } // end TWebUserControl_recent_oscalert_samples

  }