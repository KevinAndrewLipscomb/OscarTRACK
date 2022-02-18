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
            public bool be_interactive;
            public bool be_loaded;
            public bool be_sort_order_ascending;
            public TClass_biz_members biz_members;
            public TClass_biz_user biz_user;
            public TClass_biz_user_member_map biz_user_member_map;
            public TClass_biz_users biz_users;
            public bool may_add_mappings;
            public string sort_order;
        }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        private void InjectPersistentClientSideScript()
        {
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
            // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
            // EstablishClientSideFunction
            // (
            // 'RecalculateDependentValues()',
            // k.EMPTY
            // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
            // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
            // + k.NEW_LINE
            // + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
            // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
            // );
            // //
            // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
            // TextBox_gross_landed_weight_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_gross_landed_weight_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_pounds.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );
            // TextBox_net_landed_in_kgs.attributes.Add
            // (
            // 'onkeyup',
            // 'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
            // + ' RecalculateDependentValues();'
            // );

        }

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
      InjectPersistentClientSideScript();
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
                p.may_add_mappings = k.Has((string[])(Session["privilege_array"]), "config-users-and-matrices");
                p.sort_order = Static.INITIAL_SORT_ORDER;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            GridView_control.Sorting += new System.Web.UI.WebControls.GridViewSortEventHandler(GridView_control_Sorting);
            GridView_control.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(GridView_control_RowDataBound);
            PreRender += TWebUserControl_user_member_mapping_PreRender;
        }

        private void TWebUserControl_user_member_mapping_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_user_member_mapping Fresh()
        {
            TWebUserControl_user_member_mapping result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    private void GridView_control_RowDataBound(object sender, GridViewRowEventArgs e)
      {
      if (e.Row.RowType != DataControlRowType.EmptyDataRow)
        {
        e.Row.Cells[Static.CI_USER_ID].Visible = false;
        e.Row.Cells[Static.CI_MEMBER_ID].Visible = false;
        }
      if (e.Row.RowType == DataControlRowType.DataRow)
        {
        var image_button = (e.Row.Cells[Static.CI_IMITATE].FindControl("ImageButton_imitate") as ImageButton);
        //image_button.Text = k.ExpandTildePath(image_button.Text);
        image_button.ToolTip = "Imitate";
        RequireConfirmation(image_button,"The application will now allow you to imitate a subordinate user.  When you are done imitating the subordinate user, you must log out and log back in as yourself.");
        }
      }

        private void GridView_control_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
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
      p.biz_user_member_map.BindActuals(p.sort_order, p.be_sort_order_ascending, GridView_control);
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

    } // end TWebUserControl_user_member_mapping

  }
