using System.Configuration;

using kix;

using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Class_biz_notifications;
using Class_biz_role_notification_map;
using Class_biz_roles;
using Class_biz_tiers;
using Class_db_roles;
using Class_db_role_notification_map;
namespace UserControl_role_notification_mapping
{
    public struct p_type
    {
        public string TIER_ID_DEPARTMENT;
        public string TIER_ID_SQUAD;
        public bool be_interactive;
        public bool be_loaded;
        public bool be_sort_order_ascending;
        public TClass_biz_notifications biz_notifications;
        public TClass_biz_role_notification_map biz_role_notification_map;
        public TClass_biz_roles biz_roles;
        public TClass_biz_tiers biz_tiers;
        public bool may_add_mappings;
        public bool may_see_all_squads;
        public string own_tier;
        public string sort_order;
        public string tier_filter;
    } // end p_type

    public partial class TWebUserControl_role_notification_mapping: ki_web_ui.usercontrol_class
    {
        private p_type p;
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
                p.biz_tiers.BindListControl(DropDownList_tier_filter, k.EMPTY, true, "All");
                DropDownList_tier_filter.SelectedValue = p.tier_filter;
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
            if (Session["UserControl_role_notification_mapping.p"] != null)
            {
                p = (p_type)(Session["UserControl_role_notification_mapping.p"]);
                p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_role_notification_mapping");
            }
            else
            {
                p.biz_notifications = new TClass_biz_notifications();
                p.biz_role_notification_map = new TClass_biz_role_notification_map();
                p.biz_roles = new TClass_biz_roles();
                p.biz_tiers = new TClass_biz_tiers();
                p.TIER_ID_DEPARTMENT = p.biz_tiers.IdOfName("Department");
                p.TIER_ID_SQUAD = p.biz_tiers.IdOfName("Squad");
                p.may_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
                if (p.may_see_all_squads)
                {
                    p.own_tier = p.TIER_ID_DEPARTMENT;
                }
                else
                {
                    p.own_tier = p.TIER_ID_SQUAD;
                }
                p.be_interactive = !(Session["mode:report"] != null);
                p.be_loaded = false;
                p.be_sort_order_ascending = true;
                p.may_add_mappings = k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices");
                p.sort_order = Units.UserControl_role_notification_mapping.INITIAL_SORT_ORDER;
                p.tier_filter = p.own_tier;
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
            this.GridView_control.RowDeleting += new System.Web.UI.WebControls.GridViewDeleteEventHandler(this.GridView_control_RowDeleting);
            this.PreRender += this.TWebUserControl_role_notification_mapping_PreRender;
            this.Load += this.Page_Load;
        }

        private void TWebUserControl_role_notification_mapping_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_role_notification_mapping.p", p);
        }

        public TWebUserControl_role_notification_mapping Fresh()
        {
            TWebUserControl_role_notification_mapping result;
            Session.Remove("UserControl_role_notification_mapping.p");
            result = this;
            return result;
        }

        private void GridView_control_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            p.biz_role_notification_map.Save(k.Safe(GridView_control.Rows[e.RowIndex].Cells[Units.UserControl_role_notification_mapping.CI_NOTIFICATION_ID].Text, k.safe_hint_type.NUM), k.Safe(GridView_control.Rows[e.RowIndex].Cells[Units.UserControl_role_notification_mapping.CI_ROLE_ID].Text, k.safe_hint_type.NUM), false);
            Bind();
        }

        private void GridView_control_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            bool be_ok_to_delete;
            if (e.Row.RowType != DataControlRowType.EmptyDataRow)
            {
                be_ok_to_delete = p.be_interactive && k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices");
                if (be_ok_to_delete)
                {
                // Appears to clobber a necessary ASP.NET onclick event.  Should probably use AJAX instead.
                // RequireConfirmation
                // (
                // ImageButton(e.row.Cells[CI_UNMAP].Controls[0]),
                // 'Are you sure you want to unmap the ' + e.row.Cells[CI_ROLE_NAME].Text + ' role from notification '
                // + e.row.Cells[CI_NOTIFICATION_NAME].Text + '?' + k.NEW_LINE
                // + k.NEW_LINE
                // + 'Clicking Ok may prevent the notification from using certain ' + ConfigurationManager.AppSettings['application_name']
                // + ' features and receiving certain notifications and reports.'
                // );
                }
                else
                {
                    e.Row.Cells[Units.UserControl_role_notification_mapping.CI_UNMAP].Enabled = false;
                    e.Row.Cells[Units.UserControl_role_notification_mapping.CI_UNMAP].Text = k.EMPTY;
                }
                e.Row.Cells[Units.UserControl_role_notification_mapping.CI_ROLE_ID].Visible = false;
                e.Row.Cells[Units.UserControl_role_notification_mapping.CI_ROLE_TIER_ID].Visible = false;
                e.Row.Cells[Units.UserControl_role_notification_mapping.CI_ROLE_PECKING_ORDER].Visible = false;
                e.Row.Cells[Units.UserControl_role_notification_mapping.CI_NOTIFICATION_ID].Visible = false;
            }
        }

        protected void Button_add_Click(object sender, System.EventArgs e)
        {
            p.biz_role_notification_map.Save(k.Safe(DropDownList_notification.SelectedValue, k.safe_hint_type.NUM), k.Safe(DropDownList_role.SelectedValue, k.safe_hint_type.NUM), true);
            Bind();
        }

        protected void DropDownList_tier_filter_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            p.tier_filter = k.Safe(DropDownList_tier_filter.SelectedValue, k.safe_hint_type.NUM);
            p.sort_order = Units.UserControl_role_notification_mapping.INITIAL_SORT_ORDER;
            p.be_sort_order_ascending = true;
            Bind();
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
            string tier_limiter;
            p.biz_role_notification_map.BindActuals(p.tier_filter, p.sort_order, p.be_sort_order_ascending, GridView_control);
            TableCell_add_mapping.Visible = p.may_add_mappings;
            if (TableCell_add_mapping.Visible)
            {
                // Keep in mind that TIER_ID_SECTION (3) is GREATER than TIER_ID_SQUAD (2).
                if ((p.own_tier == p.TIER_ID_DEPARTMENT) || (p.tier_filter.CompareTo(p.TIER_ID_SQUAD) > 0))
                {
                    tier_limiter = p.tier_filter;
                }
                else
                {
                    tier_limiter = p.TIER_ID_SQUAD;
                }
                p.biz_roles.BindDirectToListControl(DropDownList_role, k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices"), tier_limiter);
                p.biz_notifications.BindDirectToListControl(DropDownList_notification);
            }

        }

    } // end TWebUserControl_role_notification_mapping

}

namespace UserControl_role_notification_mapping.Units
{
    public class UserControl_role_notification_mapping
    {
        public const int CI_UNMAP = 0;
        public const int CI_ROLE_ID = 1;
        public const int CI_ROLE_TIER_ID = 2;
        public const int CI_ROLE_PECKING_ORDER = 3;
        public const int CI_ROLE_NAME = 4;
        public const int CI_NOTIFICATION_NAME = 5;
        public const int CI_NOTIFICATION_ID = 6;
        public const string INITIAL_SORT_ORDER = "role_pecking_order%,notification_name";
    } // end UserControl_role_notification_mapping

}

