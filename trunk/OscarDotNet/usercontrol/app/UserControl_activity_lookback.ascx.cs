// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using Class_msg_protected;
using kix;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_activity_lookback
  {
  public partial class TWebUserControl_activity_lookback: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_MEMBER_ID = 1;
      public const int TCI_CAD_NUM = 2;
      public const int TCI_LAST_NAME = 3;
      public const int TCI_FIRST_NAME = 4;
      public const int TCI_YEAR_DUTY_HOURS = 5;
      public const int TCI_YEAR_BASE_OBLIGATION = 6;
      public const int TCI_YEAR_PCT_OF_BASE = 7;
      public const int TCI_YEAR_EFFECTIVE_OBLIGATION = 8;
      public const int TCI_YEAR_PCT_OF_EFFECTIVE = 9;
      public const int TCI_JAN_DUTY_HOURS = 10;
      public const int TCI_JAN_ENROLLMENT = 11;
      public const int TCI_JAN_BASE_OBLIGATION = 12;
      public const int TCI_JAN_PCT_OF_BASE = 13;
      public const int TCI_JAN_LEAVE = 14;
      public const int TCI_JAN_EFFECTIVE_OBLIGATION = 15;
      public const int TCI_JAN_PCT_OF_EFFECTIVE = 16;
      public const int TCI_FEB_DUTY_HOURS = 17;
      public const int TCI_FEB_ENROLLMENT = 18;
      public const int TCI_FEB_BASE_OBLIGATION = 19;
      public const int TCI_FEB_PCT_OF_BASE = 20;
      public const int TCI_FEB_LEAVE = 21;
      public const int TCI_FEB_EFFECTIVE_OBLIGATION = 22;
      public const int TCI_FEB_PCT_OF_EFFECTIVE = 23;
      public const int TCI_MAR_DUTY_HOURS = 24;
      public const int TCI_MAR_ENROLLMENT = 25;
      public const int TCI_MAR_BASE_OBLIGATION = 26;
      public const int TCI_MAR_PCT_OF_BASE = 27;
      public const int TCI_MAR_LEAVE = 28;
      public const int TCI_MAR_EFFECTIVE_OBLIGATION = 29;
      public const int TCI_MAR_PCT_OF_EFFECTIVE = 30;
      public const int TCI_APR_DUTY_HOURS = 31;
      public const int TCI_APR_ENROLLMENT = 32;
      public const int TCI_APR_BASE_OBLIGATION = 33;
      public const int TCI_APR_PCT_OF_BASE = 34;
      public const int TCI_APR_LEAVE = 35;
      public const int TCI_APR_EFFECTIVE_OBLIGATION = 36;
      public const int TCI_APR_PCT_OF_EFFECTIVE = 37;
      public const int TCI_MAY_DUTY_HOURS = 38;
      public const int TCI_MAY_ENROLLMENT = 39;
      public const int TCI_MAY_BASE_OBLIGATION = 40;
      public const int TCI_MAY_PCT_OF_BASE = 41;
      public const int TCI_MAY_LEAVE = 42;
      public const int TCI_MAY_EFFECTIVE_OBLIGATION = 43;
      public const int TCI_MAY_PCT_OF_EFFECTIVE = 44;
      public const int TCI_JUN_DUTY_HOURS = 45;
      public const int TCI_JUN_ENROLLMENT = 46;
      public const int TCI_JUN_BASE_OBLIGATION = 47;
      public const int TCI_JUN_PCT_OF_BASE = 48;
      public const int TCI_JUN_LEAVE = 49;
      public const int TCI_JUN_EFFECTIVE_OBLIGATION = 50;
      public const int TCI_JUN_PCT_OF_EFFECTIVE = 51;
      public const int TCI_JUL_DUTY_HOURS = 52;
      public const int TCI_JUL_ENROLLMENT = 53;
      public const int TCI_JUL_BASE_OBLIGATION = 54;
      public const int TCI_JUL_PCT_OF_BASE = 55;
      public const int TCI_JUL_LEAVE = 56;
      public const int TCI_JUL_EFFECTIVE_OBLIGATION = 57;
      public const int TCI_JUL_PCT_OF_EFFECTIVE = 58;
      public const int TCI_AUG_DUTY_HOURS = 59;
      public const int TCI_AUG_ENROLLMENT = 60;
      public const int TCI_AUG_BASE_OBLIGATION = 61;
      public const int TCI_AUG_PCT_OF_BASE = 62;
      public const int TCI_AUG_LEAVE = 63;
      public const int TCI_AUG_EFFECTIVE_OBLIGATION = 64;
      public const int TCI_AUG_PCT_OF_EFFECTIVE = 65;
      public const int TCI_SEP_DUTY_HOURS = 66;
      public const int TCI_SEP_ENROLLMENT = 67;
      public const int TCI_SEP_BASE_OBLIGATION = 68;
      public const int TCI_SEP_PCT_OF_BASE = 69;
      public const int TCI_SEP_LEAVE = 70;
      public const int TCI_SEP_EFFECTIVE_OBLIGATION = 71;
      public const int TCI_SEP_PCT_OF_EFFECTIVE = 72;
      public const int TCI_OCT_DUTY_HOURS = 73;
      public const int TCI_OCT_ENROLLMENT = 74;
      public const int TCI_OCT_BASE_OBLIGATION = 75;
      public const int TCI_OCT_PCT_OF_BASE = 76;
      public const int TCI_OCT_LEAVE = 77;
      public const int TCI_OCT_EFFECTIVE_OBLIGATION = 78;
      public const int TCI_OCT_PCT_OF_EFFECTIVE = 79;
      public const int TCI_NOV_DUTY_HOURS = 80;
      public const int TCI_NOV_ENROLLMENT = 81;
      public const int TCI_NOV_BASE_OBLIGATION = 82;
      public const int TCI_NOV_PCT_OF_BASE = 83;
      public const int TCI_NOV_LEAVE = 84;
      public const int TCI_NOV_EFFECTIVE_OBLIGATION = 85;
      public const int TCI_NOV_PCT_OF_EFFECTIVE = 86;
      public const int TCI_DEC_DUTY_HOURS = 87;
      public const int TCI_DEC_ENROLLMENT = 88;
      public const int TCI_DEC_BASE_OBLIGATION = 89;
      public const int TCI_DEC_PCT_OF_BASE = 90;
      public const int TCI_DEC_LEAVE = 91;
      public const int TCI_DEC_EFFECTIVE_OBLIGATION = 92;
      public const int TCI_DEC_PCT_OF_EFFECTIVE = 93;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_msg_protected.member_detail msg_protected_member_detail;
      public k.int_nonnegative num_members;
      public string sort_order;
      }

    private struct v_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    #pragma warning disable CA1823 // Avoid unused private fields
    #pragma warning disable CS0169 // Avoid unused private fields
    private v_type v; // Volatile instance Variable container
    #pragma warning restore CS0169 // Avoid unused private fields
    #pragma warning restore CA1823 // Avoid unused private fields

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
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.M_activity_lookback")
          {
          p.be_loaded &= ((Session["M_P_PlaceHolder_content"] as string) == "UserControl_activity_lookback");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_activity_lookback")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_activity_lookback");
//        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.msg_protected_member_detail = new TClass_msg_protected.member_detail();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.num_members = new k.int_nonnegative();
        p.sort_order = "last_name%,first_name,cad_num";
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
      PreRender += TWebUserControl_activity_lookback_PreRender;
      }

    private void TWebUserControl_activity_lookback_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_activity_lookback Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        p.msg_protected_member_detail.summary = p.biz_members.Summary(k.Safe(e.Item.Cells[Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM));
        MessageDropCrumbAndTransferTo(p.msg_protected_member_detail,"protected","member_detail");
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (e.Item.ItemType.ToString().EndsWith("Item"))
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
          e.Item.Cells[Static.TCI_MEMBER_ID].EnableViewState = true;
          //
          p.num_members.val++;
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
      p.biz_members.BindActivityLookbackBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control);
      p.be_datagrid_empty = (p.num_members.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_members.Text = p.num_members.val.ToString();
      p.num_members.val = 0;
      }

    } // end TWebUserControl_activity_lookback

  }