// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_efficipay_dockets;
using Class_biz_members;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_efficipay
  {
  public partial class TWebUserControl_efficipay: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_ID = 1;
      public const int TCI_DOCKET_NUM = 2;
      public const int TCI_STATUS = 3;
      }

    private struct p_type
      {
      public string agency_id;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public string ready_for_review_filter;
      public bool be_sort_order_ascending;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_efficipay_dockets biz_efficipay_dockets;
      public TClass_biz_members biz_members;
      public TClass_biz_user biz_user;
      public TClass_msg_protected.efficipay_docket_detail msg_protected_efficipay_docket_detail;
      public uint num_efficipay_dockets;
      public string saved_agency_id;
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
          DataGrid_control.AllowSorting = false;
          }
        //
        var be_ok_to_perform_efficipay_ops_for_squad = p.biz_agencies.BeEfficipayEnabled(p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum())))
          && (k.Has(Session["privilege_array"] as string[],"create-efficipay-docket") || k.Has(Session["privilege_array"] as string[],"sign-efficipay-docket"));
        var be_ok_to_perform_efficipay_ops_for_rc = p.biz_agencies.BeEfficipayEnabled("0")
          && (k.Has(Session["privilege_array"] as string[],"create-efficipay-docket-for-rc") || k.Has(Session["privilege_array"] as string[],"sign-efficipay-docket-for-rc"));
        ListItem list_item;
        if (be_ok_to_perform_efficipay_ops_for_squad)
          {
          list_item = RadioButtonList_tier.Items.FindByValue("Squad");
          list_item.Enabled = true;
          list_item.Selected = true;
          }
        if (be_ok_to_perform_efficipay_ops_for_rc)
          {
          list_item = RadioButtonList_tier.Items.FindByValue("RC");
          list_item.Enabled = true;
          if (!be_ok_to_perform_efficipay_ops_for_squad)
            {
            list_item.Selected = true;
            p.agency_id = "0";
            p.msg_protected_efficipay_docket_detail.agency_id = p.agency_id;
            }
          }
        RadioButtonList_tier.Visible = be_ok_to_perform_efficipay_ops_for_squad || be_ok_to_perform_efficipay_ops_for_rc;
        //
        LinkButton_add_docket.Visible = k.Has(Session["privilege_array"] as string[],"create-efficipay-docket") || k.Has(Session["privilege_array"] as string[],"create-efficipay-docket-for-rc");
        Bind();
        p.be_loaded = true;
        }
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_docket);
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_efficipay_binder_PlaceHolder_content"] as string) == "UserControl_efficipay");
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_efficipay_dockets = new TClass_biz_efficipay_dockets();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        p.msg_protected_efficipay_docket_detail = new TClass_msg_protected.efficipay_docket_detail();
        //
        p.agency_id = p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.msg_protected_efficipay_docket_detail.agency_id = p.agency_id;
        p.ready_for_review_filter = (k.Has(Session["privilege_array"] as string[],"create-efficipay-docket") ? k.EMPTY : "1");
        p.saved_agency_id = p.agency_id;
        p.sort_order = "num%";
        }
      }

    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      DataGrid_control.SortCommand += new DataGridSortCommandEventHandler(DataGrid_control_SortCommand);
      DataGrid_control.ItemCommand += new DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebUserControl_efficipay_PreRender;
      }

    private void TWebUserControl_efficipay_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_efficipay Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        p.msg_protected_efficipay_docket_detail.agency_id = p.agency_id;
        p.msg_protected_efficipay_docket_detail.summary = p.biz_efficipay_dockets.Summary(k.Safe(e.Item.Cells[Static.TCI_ID].Text,k.safe_hint_type.NUM));
        MessageDropCrumbAndTransferTo(p.msg_protected_efficipay_docket_detail,"protected","efficipay_docket_detail");
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
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
          e.Item.Cells[Static.TCI_ID].EnableViewState = true;
          //
          p.num_efficipay_dockets++;
          }
        }
      else
        {
        e.Item.Cells[Static.TCI_SELECT].Visible = false;
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
      p.biz_efficipay_dockets.BindBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.agency_id,p.ready_for_review_filter);
      p.be_datagrid_empty = (p.num_efficipay_dockets == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_efficipay_dockets.Text = p.num_efficipay_dockets.ToString();
      p.num_efficipay_dockets = 0;
      }

    protected void DropDownList_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.ready_for_review_filter = k.Safe(DropDownList_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void LinkButton_add_docket_Click(object sender, EventArgs e)
      {
      p.msg_protected_efficipay_docket_detail.agency_id = p.agency_id;
      p.msg_protected_efficipay_docket_detail.summary = null;
      MessageDropCrumbAndTransferTo(p.msg_protected_efficipay_docket_detail,"protected","efficipay_docket_detail");
      }

    protected void RadioButtonList_tier_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.agency_id = ((sender as RadioButtonList).SelectedValue == "Squad" ? p.saved_agency_id : "0");
      p.msg_protected_efficipay_docket_detail.agency_id = p.agency_id;
      Bind();
      }

    internal void SetP(string agency_id)
      {
      p.agency_id = agency_id;
      p.saved_agency_id = p.agency_id;
      }

    } // end TWebUserControl_efficipay

  }