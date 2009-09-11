using System.Configuration;

using kix;

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_notifications;
namespace UserControl_behind_the_scenes_activity
{
    // Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.pas
    public partial class TWebUserControl_behind_the_scenes_activity: ki_web_ui.usercontrol_class
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
                Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                Label_application_name_2.Text = Label_application_name.Text;
                Bind();
                p.biz_notifications.CycleTallies();
                p.be_loaded = true;
            }
            InjectPersistentClientSideScript();

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (Session["UserControl_behind_the_scenes_activity.p"] != null)
            {
                p = (p_type)(Session["UserControl_behind_the_scenes_activity.p"]);
                p.be_loaded = IsPostBack && ((Session["Parent_PlaceHolder_content"] as string) == "UserControl_behind_the_scenes_activity");
            }
            else
            {
                p.biz_notifications = new TClass_biz_notifications();
                p.be_interactive = !(Session["mode:report"] != null);
                p.be_loaded = false;
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.DataGrid_for_cycle.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_for_cycle_ItemDataBound);
            this.DataGrid_for_lifetime.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_for_lifetime_ItemDataBound);
            this.PreRender += this.TWebUserControl_behind_the_scenes_activity_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_behind_the_scenes_activity_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_behind_the_scenes_activity.p", p);
        }

        public TWebUserControl_behind_the_scenes_activity Fresh()
        {
            TWebUserControl_behind_the_scenes_activity result;
            Session.Remove("UserControl_behind_the_scenes_activity.p");
            result = this;
            return result;
        }

        private void DataGrid_for_cycle_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            switch(e.Item.ItemType)
            {
                case ListItemType.Item:
                case ListItemType.AlternatingItem:
                    p.total_events_for_cycle = p.total_events_for_cycle + uint.Parse(e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_EVENTS].Text);
                    p.total_messages_for_cycle = p.total_messages_for_cycle + uint.Parse(e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_MESSAGES].Text);
                    break;
                case ListItemType.Footer:
                    e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_EVENTS].Text = p.total_events_for_cycle.ToString();
                    e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_MESSAGES].Text = p.total_messages_for_cycle.ToString();
                    break;
            }
        }

        private void DataGrid_for_lifetime_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            switch(e.Item.ItemType)
            {
                case ListItemType.Item:
                case ListItemType.AlternatingItem:
                    p.total_events_for_lifetime = p.total_events_for_lifetime + uint.Parse(e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_EVENTS].Text);
                    p.total_messages_for_lifetime = p.total_messages_for_lifetime + uint.Parse(e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_MESSAGES].Text);
                    break;
                case ListItemType.Footer:
                    e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_EVENTS].Text = p.total_events_for_lifetime.ToString();
                    e.Item.Cells[Units.UserControl_behind_the_scenes_activity.TCCI_TALLY_OF_MESSAGES].Text = p.total_messages_for_lifetime.ToString();
                    break;
            }
        }

        private void Bind()
        {
            p.biz_notifications.BindTallies(DataGrid_for_cycle, DataGrid_for_lifetime);
            p.total_events_for_cycle = 0;
            p.total_messages_for_cycle = 0;
            p.total_events_for_lifetime = 0;
            p.total_messages_for_lifetime = 0;
        }

        private struct p_type
        {
            public bool be_interactive;
            public bool be_loaded;
            public TClass_biz_notifications biz_notifications;
            public uint total_events_for_cycle;
            public uint total_messages_for_cycle;
            public uint total_events_for_lifetime;
            public uint total_messages_for_lifetime;
        } // end p_type

    } // end TWebUserControl_behind_the_scenes_activity

}

namespace UserControl_behind_the_scenes_activity.Units
{
    public class UserControl_behind_the_scenes_activity
    {
        public const int TCCI_NAME = 0;
        public const int TCCI_TALLY_OF_EVENTS = 1;
        public const int TCCI_ACTIVITY_DESCRIPTION = 2;
        public const int TCCI_SPACER = 3;
        public const int TCCI_TALLY_OF_MESSAGES = 4;
    } // end UserControl_behind_the_scenes_activity

}

