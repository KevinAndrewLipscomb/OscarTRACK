// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_trespasses;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_trespassing
{
  public partial class TWebUserControl_trespassing: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_HOUSE_NUM = 1;
      public const int TCI_STREET_NAME = 2;
      public const int TCI_AGENCIES = 3;
      public const int TCI_STREET_ID = 4;
      }

    private struct p_type
      {
      public string keyclick_enumerator_filter;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_trespasses biz_trespasses;
      public TClass_msg_protected.trespass_detail msg_protected_trespass_detail;
      public k.int_nonnegative num_trespasses;
      public string sort_order;
      }

    private struct v_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    //private v_type v; // Volatile instance Variable container

    private void InjectPersistentClientSideScript()
      {
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlKeyclickEnumerator(target:DropDownList_filter);
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        }
      else
        {
        p.biz_agencies = new();
        p.biz_trespasses = new();
        p.msg_protected_trespass_detail = new();
        //
        p.keyclick_enumerator_filter = k.EMPTY;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.num_trespasses = new k.int_nonnegative();
        p.sort_order = "street.name%,x.house_num,x.agency";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      DataGrid_control.SortCommand += new DataGridSortCommandEventHandler(DataGrid_control_SortCommand);
      DataGrid_control.ItemCommand += new DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebUserControl_trespassing_PreRender;
      }

    private void TWebUserControl_trespassing_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_trespassing Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        p.msg_protected_trespass_detail.house_num = (k.Safe(e.Item.Cells[Static.TCI_HOUSE_NUM].Text,k.safe_hint_type.HYPHENATED_ALPHANUM));
        p.msg_protected_trespass_detail.street_id = new(val:int.Parse((k.Safe(e.Item.Cells[Static.TCI_STREET_ID].Text,k.safe_hint_type.NUM))));
        MessageDropCrumbAndTransferTo(p.msg_protected_trespass_detail,"protected","trespassing_detail");
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
          {
          link_button = ((e.Item.Cells[Static.TCI_SELECT].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_HOUSE_NUM].EnableViewState = true;
          e.Item.Cells[Static.TCI_STREET_ID].EnableViewState = true;
          //
          p.num_trespasses.val++;
          }
        }
      else
        {
        e.Item.Cells[Static.TCI_SELECT].Visible = false;
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
      p.biz_trespasses.BindBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.keyclick_enumerator_filter);
      p.be_datagrid_empty = (p.num_trespasses.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_trespasses.Text = p.num_trespasses.val.ToString();
      p.num_trespasses.val = 0;
      }

    protected void DropDownList_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.keyclick_enumerator_filter = k.Safe(DropDownList_filter.SelectedValue,k.safe_hint_type.ALPHA);
      Bind();
      }

  } // end TWebUserControl_trespassing

  }