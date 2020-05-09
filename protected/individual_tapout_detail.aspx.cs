using appcommon;
using Class_biz_members;
using Class_biz_tapouts;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace individual_tapout_detail
  {
  public partial class TWebForm_individual_tapout_detail: ki_web_ui.page_class
    {
    public class Static
      {
      public const int TCCI_ID = 0;
      public const int TCCI_EXPECTED_LOGON_TIME = 1;
      public const int TCCI_COMMENT = 2;
      public const int TCCI_HOURS_OF_WARNING = 3;
      public const int TCCI_DOCUMENTED_BY = 4;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_tapouts biz_tapouts;
      public string cad_num_string;
      public k.int_nonnegative num_datagrid_rows;
      public string sort_order;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebForm_individual_tapout_detail_PreRender;
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - individual_tapout_detail";
        Label_member_designator.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]) + " (CAD # " + p.cad_num_string + ")";
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
        if ((Session[InstanceId() + ".p"] != null))
          {
          p = (p_type)(Session[InstanceId() + ".p"]);
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
          p.biz_members = new TClass_biz_members();
          p.biz_tapouts = new TClass_biz_tapouts();
          //
          p.be_sort_order_ascending = false;
          p.cad_num_string = p.biz_members.CadNumOf(Session["member_summary"]);
          if (p.cad_num_string == k.EMPTY)
            {
            p.cad_num_string = appcommon_Static.NOT_APPLICABLE_INDICATION_HTML;
            }
          p.num_datagrid_rows = new k.int_nonnegative();
          p.sort_order = "expected_start desc";
          }
        }
      }

    private void TWebForm_individual_tapout_detail_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().Contains("Item"))
        {
        // We are dealing with a data row, not a header or footer row.
        p.num_datagrid_rows.val++;
        }
      }

    private void Bind()
      {
      p.biz_tapouts.BindBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        member_id:p.biz_members.IdOf(Session["member_summary"])
        );
      //
      // Manage control visibilities.
      //
      p.be_datagrid_empty = (p.num_datagrid_rows.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      //
      // Clear aggregation vars for next bind, if any.
      //
      p.num_datagrid_rows.val = 0;
      }

    protected void DataGrid_control_SortCommand(object source, DataGridSortCommandEventArgs e)
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
      DataGrid_control.EditItemIndex = -1;
      Bind();
      }

    } // end TWebForm_individual_tapout_detail

  }
