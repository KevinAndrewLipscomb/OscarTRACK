// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_evals;
using Class_biz_members;
using Class_biz_sections;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_evaluator_overview
  {
  public partial class TWebUserControl_evaluator_overview: ki_web_ui.usercontrol_class
    {
    private class Static
      {
      public const int TCI_OPEN = 0;
      public const int TCI_ID = 1;
      public const int TCI_NOMINAL_DAY = 2;
      public const int TCI_SHIFT_NAME = 3;
      public const int TCI_POST_DESIGNATOR = 4;
      public const int TCI_POST_CARDINALITY = 5;
      public const int TCI_VEHICLE_NAME = 6;
      public const int TCI_THIRD = 7;
      public const int TCI_AIC = 8;
      public const int TCI_STATUS = 9;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_evals biz_evals;
      public TClass_biz_members biz_members;
      public TClass_biz_sections biz_sections;
      public TClass_biz_user biz_user;
      public k.int_positive evaluation_tier_active;
      public k.int_positive evaluation_tier_highest;
      public uint num_evals;
      public string range;
      public string sort_order;
      public string third_section_filter;
      public string user_member_id;
      }

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
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        DropDownList_range.SelectedValue = p.range;
        CheckBox_aic_me_only.Visible = (p.evaluation_tier_highest.val < int.MaxValue);
        p.biz_sections.BindListControl
          (
          target:DropDownList_third_section,
          selected_description:(p.third_section_filter.Length > 0 ? p.third_section_filter : "*")
          );
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add);
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_eval_overview_evaluator_overview")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_eval_overview"); // Special case: This UserControl is not the child of a binder.
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_evaluator_overview")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_evaluator_overview");
//        }
        }
      else
        {
        p.biz_evals = new TClass_biz_evals();
        p.biz_members = new TClass_biz_members();
        p.biz_sections = new TClass_biz_sections();
        p.biz_user = new TClass_biz_user();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = false;
        p.evaluation_tier_active = new k.int_positive(int.MaxValue);
        p.evaluation_tier_highest = new k.int_positive(int.MaxValue);
        p.range = "InProcess";
        p.sort_order = "eval.nominal_day desc,shift.start desc";
        p.third_section_filter = k.EMPTY;
        p.user_member_id = k.EMPTY;
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
      DataGrid_control.ItemCommand += new DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebUserControl_evaluator_overview_PreRender;
      }

    private void TWebUserControl_evaluator_overview_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_evaluator_overview Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var msg = new TClass_msg_protected.eval_detail();
        msg.user_member_id = p.user_member_id;
        msg.id = k.Safe(e.Item.Cells[Static.TCI_ID].Text,k.safe_hint_type.NUM);
        msg.be_user_evaluatee = false;
        MessageDropCrumbAndTransferTo(msg,"protected","eval_detail");
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
          {
          link_button = ((e.Item.Cells[Static.TCI_OPEN].Controls[0]) as LinkButton);
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
          p.num_evals++;
          }
        }
      else
        {
        e.Item.Cells[Static.TCI_OPEN].Visible = false;
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

    private void Bind()
      {
      DataGrid_control.Columns[Static.TCI_AIC].Visible = (p.evaluation_tier_active.val < int.MaxValue);
      DataGrid_control.Columns[Static.TCI_STATUS].Visible = (p.range != "Archived");
      p.biz_evals.BindBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        third_member_id_filter:k.EMPTY,
        aic_member_id_filter:p.user_member_id,
        inprocess_all_archived_condition:new k.int_sign_range(val:(p.range.Length == 0 ? 0 : (p.range == "Archived" ? 1 : -1))),
        evaluation_tier:p.evaluation_tier_active,
        third_section_filter:p.third_section_filter
        );
      p.be_datagrid_empty = (p.num_evals == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_evals.Text = p.num_evals.ToString();
      p.num_evals = 0;
      }

    internal void SetEvaluatorMemberId(string id)
      {
      p.user_member_id = id;
      var roles = p.biz_user.Roles();
      p.evaluation_tier_highest.val = (k.Has(p.biz_user.Privileges(),"see-department-scope-evals") ? 1 : (k.Has(p.biz_user.Privileges(),"see-squad-scope-evals") ? 2 : int.MaxValue));
      p.evaluation_tier_active.val = p.evaluation_tier_highest.val;
      p.third_section_filter = (p.evaluation_tier_active.val == 1 ? k.EMPTY : k.Safe(p.biz_members.AgencyIdOfId(id:id),k.safe_hint_type.NUM));
      }

    protected void LinkButton_add_Click(object sender, EventArgs e)
      {
      var msg = new TClass_msg_protected.eval_detail();
      msg.user_member_id = p.user_member_id;
      msg.be_user_evaluatee = false;
      MessageDropCrumbAndTransferTo
        (
        msg:msg,
        folder_name:"protected",
        aspx_name:"eval_detail"
        );
      }

    protected void DropDownList_range_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.range = k.Safe(DropDownList_range.SelectedValue,k.safe_hint_type.ALPHA);
      Bind();
      }

    protected void CheckBox_aic_me_only_CheckedChanged(object sender, EventArgs e)
      {
      p.evaluation_tier_active.val = (CheckBox_aic_me_only.Checked ? int.MaxValue : p.evaluation_tier_highest.val);
      Bind();
      }

    protected void DropDownList_third_section_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.third_section_filter = k.Safe(DropDownList_third_section.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    } // end TWebUserControl_evaluator_overview

  }