using Class_biz_members;
using Class_biz_user;
using Class_biz_user_member_map;
using Class_biz_users;
using kix;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace UserControl_user_member_mapping
  {
  public partial class TWebUserControl_user_member_mapping: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int CI_MEMBER_ID = 0;
      public const int CI_MEMBER_NAME = 1;
      public const int CI_USER_ID = 2;
      public const int CI_USER_NAME = 3;
      public const int CI_IMITATE = 4;
      public const string INITIAL_SORT_ORDER = "member_name";
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_user biz_user;
      public TClass_biz_user_member_map biz_user_member_map;
      public TClass_biz_users biz_users;
      public k.int_sign_range filter; // -1,0,1 :: Past, All, Current
      public bool may_add_mappings;
      public k.int_nonnegative num_members;
      public string sort_order;
      }

    private struct v_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    //private v_type v; // Volatile instance Variable container


    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (!p.be_interactive)
          {
          GridView_control.AllowSorting = false;
          }
        GridView_control.Columns[Static.CI_IMITATE].Visible = (new ArrayList(p.biz_user.Roles()).Contains("Application Administrator"));
        Bind();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_users_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_user_member_mapping");
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        p.biz_user_member_map = new TClass_biz_user_member_map();
        p.biz_users = new TClass_biz_users();
        //
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.filter = new k.int_sign_range(val:1); // default to Current members only
        p.may_add_mappings = k.Has((string[])(Session["privilege_array"]), "config-users-and-matrices");
        p.num_members = new k.int_nonnegative();
        p.sort_order = Static.INITIAL_SORT_ORDER;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      GridView_control.Sorting += new GridViewSortEventHandler(GridView_control_Sorting);
      GridView_control.RowDataBound += new GridViewRowEventHandler(GridView_control_RowDataBound);
      PreRender += TWebUserControl_user_member_mapping_PreRender;
      }

    private void TWebUserControl_user_member_mapping_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_user_member_mapping Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void GridView_control_RowDataBound(object sender, GridViewRowEventArgs e)
      {
      if (e.Row.RowType == DataControlRowType.DataRow)
        {
        var image_button = (e.Row.Cells[Static.CI_IMITATE].FindControl("ImageButton_imitate") as ImageButton);
        //image_button.Text = k.ExpandTildePath(image_button.Text);
        image_button.ToolTip = "Imitate";
        RequireConfirmation(image_button,"The application will now allow you to imitate a subordinate user.  When you are done imitating the subordinate user, you must log out and log back in as yourself.");
        //
        // Remove all cell controls from viewstate except for the one at TCI_IMITATE.
        //
        foreach (TableCell cell in e.Row.Cells)
          {
          cell.EnableViewState = false;
          }
        e.Row.Cells[Static.CI_IMITATE].EnableViewState = true;
        //
        p.num_members.val++;
        }
      }

    private void GridView_control_Sorting(object sender, GridViewSortEventArgs e)
      {
      if (e.SortExpression == p.sort_order)
        {
        p.be_sort_order_ascending = !p.be_sort_order_ascending;
        }
      else
        {
        p.sort_order = e.SortExpression;
        p.be_sort_order_ascending = true;
        }
      GridView_control.EditIndex =  -1;
      Bind();
      }

    private void Bind()
      {
      p.biz_user_member_map.BindActuals
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:GridView_control,
        filter:p.filter
        );
      p.be_datagrid_empty = (p.num_members.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      GridView_control.Visible = !p.be_datagrid_empty;
      Literal_num_members.Text = p.num_members.val.ToString();
      p.num_members.val = 0;
      }

    protected void ImageButton_imitate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
      {
      var username = k.Safe((sender as ImageButton).CommandArgument,k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
      //
      Session.RemoveAll();
      //
      SessionSet("username",username);
      SessionSet("user_id",p.biz_users.IdOf(username));
      SessionSet("password_reset_email_address",p.biz_users.PasswordResetEmailAddressOfUsername(username));
      FormsAuthentication.SetAuthCookie(username,createPersistentCookie:false);
      Response.Redirect("~/protected/overview.aspx");
      }

    protected void DropDownList_filter_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.filter.val = int.Parse(k.Safe(DropDownList_filter.SelectedValue,k.safe_hint_type.HYPHENATED_NUM));
      Bind();
      }

    } // end TWebUserControl_user_member_mapping

  }
