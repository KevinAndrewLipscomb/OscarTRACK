// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_residents;
using Class_biz_trespasses;
using kix;
using System.Web.UI.WebControls;

namespace UserControl_trespass
{
  public partial class TWebUserControl_trespass: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_NAME = 0;
      public const int TCI_AGENCY = 1;
      public const int TCI_DELETE = 2;
      }

    private struct p_type
      {
      public string address;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_residents biz_residents;
      public TClass_biz_trespasses biz_trespasses;
      public string house_num;
      public k.int_nonnegative num_claims;
      public string sort_order;
      public string street_id;
      }

    private struct v_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    private v_type v; // Volatile instance Variable container

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        Literal_address.Text = p.address;
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_trespass")
          {
#warning Revise the ClientID path to this control appropriately.
          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_trespass");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_trespass")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_trespass");
//        }
        }
      else
        {
        p.biz_residents = new TClass_biz_residents();
        p.biz_trespasses = new TClass_biz_trespasses();
        //
        p.address = k.EMPTY;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.house_num = k.EMPTY;
        p.num_claims = new k.int_nonnegative();
        p.street_id = k.EMPTY;
        p.sort_order = "agency_id%";
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
      PreRender += TWebUserControl_trespass_PreRender;
      }

    private void TWebUserControl_trespass_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_trespass Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (p.be_interactive)
        {
        if (e.Item.ItemType.ToString().EndsWith("Item"))
          {
          RequireConfirmation
            (
            c:e.Item.Cells[Static.TCI_DELETE].Controls[0] as LinkButton,
            prompt:$"Are you sure you want to delete {e.Item.Cells[Static.TCI_NAME].Text}, {p.address}, VIRGINIA BEACH VA from {e.Item.Cells[Static.TCI_AGENCY].Text}'s Resident/Occupant Database?"
            );
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_AGENCY].EnableViewState = true;
          //
          p.num_claims.val++;
          }
        }
      else
        {
        e.Item.Cells[Static.TCI_DELETE].Visible = false;
        }
      }

    private void DataGrid_control_SortCommand(object source, DataGridSortCommandEventArgs e)
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
      p.biz_trespasses.BindClaimDetailsBaseDataList(p.house_num,p.street_id,p.sort_order,p.be_sort_order_ascending,DataGrid_control);
      p.be_datagrid_empty = (p.num_claims.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_claims.Text = p.num_claims.val.ToString();
      p.num_claims.val = 0;
      }

    protected void DataGrid_control_DeleteCommand(object source, DataGridCommandEventArgs e)
      {
      
      }

    internal void SetP
      (
      string house_num,
      string street_id
      )
      {
      p.house_num = house_num;
      p.street_id = street_id;
      p.address = p.biz_residents.NormalizedAddressOfHouseNumAndStreetId(house_num,street_id);
      }

    } // end TWebUserControl_trespass
  }