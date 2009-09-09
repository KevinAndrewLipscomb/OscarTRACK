using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Class_biz_members;
using Class_biz_user_member_map;
using Class_biz_users;
using Class_db_users;
using Class_db_user_member_map;
namespace UserControl_user_member_mapping
{
    public struct p_type
    {
        public bool be_interactive;
        public bool be_loaded;
        public bool be_sort_order_ascending;
        public TClass_biz_members biz_members;
        public TClass_biz_user_member_map biz_user_member_map;
        public TClass_biz_users biz_users;
        public bool may_add_mappings;
        public string sort_order;
    } // end p_type

    public partial class TWebUserControl_user_member_mapping: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Button Button_add = null;
        protected System.Web.UI.WebControls.DropDownList DropDownList_user = null;
        protected System.Web.UI.WebControls.DropDownList DropDownList_member = null;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator_user = null;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator_member = null;
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
                Bind();
                p.be_loaded = true;
            }
            else
            {
            }
            InjectPersistentClientSideScript();

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_user_member_mapping.p"] != null)
            {
                p = (p_type)(Session["UserControl_user_member_mapping.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_UserControl_users_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_user_member_mapping");
            }
            else
            {
                p.biz_members = new TClass_biz_members();
                p.biz_user_member_map = new TClass_biz_user_member_map();
                p.biz_users = new TClass_biz_users();
                p.be_interactive = !(Session["mode:report"] != null);
                p.be_loaded = false;
                p.be_sort_order_ascending = true;
                p.may_add_mappings = k.Has((string[])(Session["privilege_array"]), "config-users-and-matrices");
                p.sort_order = Units.UserControl_user_member_mapping.INITIAL_SORT_ORDER;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.GridView_control.Sorting += new System.Web.UI.WebControls.GridViewSortEventHandler(this.GridView_control_Sorting);
            this.GridView_control.RowDataBound += new System.Web.UI.WebControls.GridViewRowEventHandler(this.GridView_control_RowDataBound);
            this.PreRender += this.TWebUserControl_user_member_mapping_PreRender;
            this.Load += this.Page_Load;
        }

        private void TWebUserControl_user_member_mapping_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_user_member_mapping.p", p);
        }

        public TWebUserControl_user_member_mapping Fresh()
        {
            TWebUserControl_user_member_mapping result;
            Session.Remove("UserControl_user_member_mapping.p");
            result = this;
            return result;
        }

        private void GridView_control_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.EmptyDataRow)
            {
                e.Row.Cells[Units.UserControl_user_member_mapping.CI_USER_ID].Visible = false;
                e.Row.Cells[Units.UserControl_user_member_mapping.CI_MEMBER_ID].Visible = false;
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

    } // end TWebUserControl_user_member_mapping

}

namespace UserControl_user_member_mapping.Units
{
    public class UserControl_user_member_mapping
    {
        public const int CI_USER_ID = 0;
        public const int CI_USER_NAME = 1;
        public const int CI_MEMBER_NAME = 2;
        public const int CI_MEMBER_ID = 3;
        public const string INITIAL_SORT_ORDER = "user_name";
    } // end UserControl_user_member_mapping

}

