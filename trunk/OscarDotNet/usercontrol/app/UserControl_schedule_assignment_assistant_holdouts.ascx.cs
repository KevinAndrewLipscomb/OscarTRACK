using Class_biz_members;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_holdouts
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_sort_order_ascending;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public bool be_loaded;
    public TClass_biz_members biz_members;
    public uint num_datagrid_rows;
    public k.subtype<int> relative_month;
    public string release_filter;
    public string sort_order;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_holdouts: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_holdouts_Static
      {
      public const int TCI_NAME = 0;
      public const int TCI_BE_RELEASED = 1;
      public const int TCI_EMAIL_ADDRESS = 2;
      public const int TCI_PHONE_NUM = 3;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Bind();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_assignment_assistant_holdouts.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_holdouts.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_holdouts");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        //
        p.agency_filter = k.EMPTY;
        p.be_sort_order_ascending = true;
        p.be_interactive = !(Session["mode:report"] != null);
        p.num_datagrid_rows = 0;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.sort_order = "member.last_name,member.first_name";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_assignment_assistant_holdouts_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_holdouts_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_assignment_assistant_holdouts.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_holdouts Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_holdouts.p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.relative_month = relative_month;
      Bind();
      }

    protected void Button_refresh_Click(object sender, System.EventArgs e)
      {
      Bind();
      }

    private void Bind()
      {
      p.biz_members.BindHoldoutsBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.agency_filter,p.release_filter,p.relative_month);
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      p.num_datagrid_rows = 0;
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        p.num_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          //
          // Remove all cell controls from viewstate.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          }
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

    }

  }
