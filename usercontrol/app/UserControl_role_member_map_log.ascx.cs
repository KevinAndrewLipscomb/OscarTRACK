// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_role_member_map_logs;
using Class_msg_protected;
using kix;
using System.Configuration;
using System.Web.UI.WebControls;

namespace UserControl_role_member_map_log
  {
  public partial class TWebUserControl_role_member_map_log: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_ACTION = 0;
      public const int TCI_ROLE = 1;
      public const int TCI_ACTOR = 2;
      public const int TCI_AT = 3;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_role_member_map_logs biz_role_member_map_logs;
      public TClass_msg_protected.overview msg_protected_overview;
      public uint num_role_member_map_logs;
      public string sort_order;
      public string subject_member_id;
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
        //if (instance_id == "ASP.protected_overview_aspx.UserControl_M_S_G_C_role_member_map_log_control")
        //  {
        //  p.be_loaded &= ((Session["M_S_G_PlaceHolder_content"] as string) == "C");
        //  }
        }
      else
        {
        p.biz_role_member_map_logs = new TClass_biz_role_member_map_logs();
        p.msg_protected_overview = new TClass_msg_protected.overview();
        //
        p.be_loaded = false;
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_sort_order_ascending = false;
        p.sort_order = "at%,role.pecking_order";
        p.subject_member_id = k.EMPTY;
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
      PreRender += TWebUserControl_role_member_map_log_PreRender;
      }

    private void TWebUserControl_role_member_map_log_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_role_member_map_log Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        e.Item.Cells[Static.TCI_ACTION].Text = (e.Item.Cells[Static.TCI_ACTION].Text == "1" ? "Granted" : "Removed");
        //
        if (e.Item.Cells[Static.TCI_ACTOR].Text == "&nbsp;")
          {
          e.Item.Cells[Static.TCI_ACTOR].Text = ConfigurationManager.AppSettings["application_name"];
          }
        //
        // Remove all cell controls from viewstate except for the one at TCI_ID.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        //
        p.num_role_member_map_logs++;
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
      p.biz_role_member_map_logs.BindBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        subject_member_id:p.subject_member_id
        );
      p.be_datagrid_empty = (p.num_role_member_map_logs == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      p.num_role_member_map_logs = 0;
      }

    internal void SetP(string subject_member_id)
      {
      p.subject_member_id = subject_member_id;
      }

    protected void LinkButton_manage_roles_Click(object sender, System.EventArgs e)
      {
      p.msg_protected_overview.target = "/config/roles-and-mappings/role-member-mappings/";
      MessageDropCrumbAndTransferTo
        (
        msg:p.msg_protected_overview,
        folder_name:"protected",
        aspx_name:"overview"
        );
      }

    } // end TWebUserControl_role_member_map_log

  }