// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using kix;
using System;
using System.Configuration;
using System.Drawing;
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
      public const int TCI_COMBINED_DUTY_HOURS = 5;
      public const int TCI_COMBINED_BASE_OBLIGATION = 6;
      public const int TCI_COMBINED_PCT_OF_BASE = 7;
      public const int TCI_COMBINED_EFFECTIVE_OBLIGATION = 8;
      public const int TCI_COMBINED_PCT_OF_EFFECTIVE = 9;
      public const int TCI_RECOMMENDED_PPT_RELIEF = 10;
      public const int TCI_MONTH_10_AGO_DUTY_HOURS = 11;
      public const int TCI_MONTH_10_AGO_ENROLLMENT = 12;
      public const int TCI_MONTH_10_AGO_BASE_OBLIGATION = 13;
      public const int TCI_MONTH_10_AGO_PCT_OF_BASE = 14;
      public const int TCI_MONTH_10_AGO_LEAVE = 15;
      public const int TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION = 16;
      public const int TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE = 17;
      public const int TCI_MONTH_9_AGO_DUTY_HOURS = 18;
      public const int TCI_MONTH_9_AGO_ENROLLMENT = 19;
      public const int TCI_MONTH_9_AGO_BASE_OBLIGATION = 20;
      public const int TCI_MONTH_9_AGO_PCT_OF_BASE = 21;
      public const int TCI_MONTH_9_AGO_LEAVE = 22;
      public const int TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION = 23;
      public const int TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE = 24;
      public const int TCI_MONTH_8_AGO_DUTY_HOURS = 25;
      public const int TCI_MONTH_8_AGO_ENROLLMENT = 26;
      public const int TCI_MONTH_8_AGO_BASE_OBLIGATION = 27;
      public const int TCI_MONTH_8_AGO_PCT_OF_BASE = 28;
      public const int TCI_MONTH_8_AGO_LEAVE = 29;
      public const int TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION = 30;
      public const int TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE = 31;
      public const int TCI_MONTH_7_AGO_DUTY_HOURS = 32;
      public const int TCI_MONTH_7_AGO_ENROLLMENT = 33;
      public const int TCI_MONTH_7_AGO_BASE_OBLIGATION = 34;
      public const int TCI_MONTH_7_AGO_PCT_OF_BASE = 35;
      public const int TCI_MONTH_7_AGO_LEAVE = 36;
      public const int TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION = 37;
      public const int TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE = 38;
      public const int TCI_MONTH_6_AGO_DUTY_HOURS = 39;
      public const int TCI_MONTH_6_AGO_ENROLLMENT = 40;
      public const int TCI_MONTH_6_AGO_BASE_OBLIGATION = 41;
      public const int TCI_MONTH_6_AGO_PCT_OF_BASE = 42;
      public const int TCI_MONTH_6_AGO_LEAVE = 43;
      public const int TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION = 44;
      public const int TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE = 45;
      public const int TCI_MONTH_5_AGO_DUTY_HOURS = 46;
      public const int TCI_MONTH_5_AGO_ENROLLMENT = 47;
      public const int TCI_MONTH_5_AGO_BASE_OBLIGATION = 48;
      public const int TCI_MONTH_5_AGO_PCT_OF_BASE = 49;
      public const int TCI_MONTH_5_AGO_LEAVE = 50;
      public const int TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION = 51;
      public const int TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE = 52;
      public const int TCI_MONTH_4_AGO_DUTY_HOURS = 53;
      public const int TCI_MONTH_4_AGO_ENROLLMENT = 54;
      public const int TCI_MONTH_4_AGO_BASE_OBLIGATION = 55;
      public const int TCI_MONTH_4_AGO_PCT_OF_BASE = 56;
      public const int TCI_MONTH_4_AGO_LEAVE = 57;
      public const int TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION = 58;
      public const int TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE = 59;
      public const int TCI_MONTH_3_AGO_DUTY_HOURS = 60;
      public const int TCI_MONTH_3_AGO_ENROLLMENT = 61;
      public const int TCI_MONTH_3_AGO_BASE_OBLIGATION = 62;
      public const int TCI_MONTH_3_AGO_PCT_OF_BASE = 63;
      public const int TCI_MONTH_3_AGO_LEAVE = 64;
      public const int TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION = 65;
      public const int TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE = 66;
      public const int TCI_MONTH_2_AGO_DUTY_HOURS = 67;
      public const int TCI_MONTH_2_AGO_ENROLLMENT = 68;
      public const int TCI_MONTH_2_AGO_BASE_OBLIGATION = 69;
      public const int TCI_MONTH_2_AGO_PCT_OF_BASE = 70;
      public const int TCI_MONTH_2_AGO_LEAVE = 71;
      public const int TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION = 72;
      public const int TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE = 73;
      public const int TCI_MONTH_1_AGO_DUTY_HOURS = 74;
      public const int TCI_MONTH_1_AGO_ENROLLMENT = 75;
      public const int TCI_MONTH_1_AGO_BASE_OBLIGATION = 76;
      public const int TCI_MONTH_1_AGO_PCT_OF_BASE = 77;
      public const int TCI_MONTH_1_AGO_LEAVE = 78;
      public const int TCI_MONTH_1_AGO_EFFECTIVE_OBLIGATION = 79;
      public const int TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE = 80;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public k.subtype<int> extent;
      public string sort_order;
      }

    private struct v_type
      {
      public k.int_nonnegative num_members;
      public k.int_nonnegative num_full;
      public k.int_nonnegative num_prorated;
      public k.int_nonnegative num_none;
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
        RequireConfirmation
          (
          c:Button_export,
          prompt:"We will send you HTML-formatted data masquerading as an XLS file so that it will open up in your spreadsheet program.  The discrepancy is intentional.  The file is not corrupt or untrustworthy." + k.NEW_LINE
          + k.NEW_LINE
          + "If your spreadsheet program mentions these things and asks if you want to open the file, click 'Yes'."
          );
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_export);
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
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.extent = new k.subtype<int>(1,10);
        p.sort_order = "last_name%,first_name,cad_num";
        //
        p.extent.val = p.extent.LAST;
        }
      v.num_members = new k.int_nonnegative();
      v.num_full = new k.int_nonnegative();
      v.num_prorated = new k.int_nonnegative();
      v.num_none = new k.int_nonnegative();
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
        SessionSet("member_summary",p.biz_members.Summary(k.Safe(e.Item.Cells[Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM)));
        DropCrumbAndTransferTo("member_detail.aspx");
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
          var combined_pct_of_effective = new k.int_nonnegative(int.Parse(e.Item.Cells[Static.TCI_COMBINED_PCT_OF_EFFECTIVE].Text));
          if (combined_pct_of_effective.val >= int.Parse(ConfigurationManager.AppSettings["full_personal_property_tax_qualifying_percent"]))
            {
            e.Item.Cells[Static.TCI_RECOMMENDED_PPT_RELIEF].Text = "FULL";
            e.Item.Cells[Static.TCI_CAD_NUM].BackColor = Color.PaleGreen;
            e.Item.Cells[Static.TCI_LAST_NAME].BackColor = Color.PaleGreen;
            e.Item.Cells[Static.TCI_FIRST_NAME].BackColor = Color.PaleGreen;
            e.Item.Cells[Static.TCI_COMBINED_PCT_OF_EFFECTIVE].BackColor = Color.PaleGreen;
            e.Item.Cells[Static.TCI_RECOMMENDED_PPT_RELIEF].BackColor = Color.PaleGreen;
            v.num_full.val++;
            }
          else if (combined_pct_of_effective.val > 0)
            {
            e.Item.Cells[Static.TCI_RECOMMENDED_PPT_RELIEF].Text = "PRORATED";
            e.Item.Cells[Static.TCI_CAD_NUM].BackColor = Color.Yellow;
            e.Item.Cells[Static.TCI_LAST_NAME].BackColor = Color.Yellow;
            e.Item.Cells[Static.TCI_FIRST_NAME].BackColor = Color.Yellow;
            e.Item.Cells[Static.TCI_COMBINED_PCT_OF_EFFECTIVE].BackColor = Color.Yellow;
            e.Item.Cells[Static.TCI_RECOMMENDED_PPT_RELIEF].BackColor = Color.Yellow;
            v.num_prorated.val++;
            }
          else
            {
            e.Item.Cells[Static.TCI_RECOMMENDED_PPT_RELIEF].Text = "none";
            v.num_none.val++;
            }
          //
          e.Item.Cells[Static.TCI_COMBINED_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_COMBINED_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_BASE].Text += "%";
          e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE].Text += "%";
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_MEMBER_ID].EnableViewState = true;
          //
          v.num_members.val++;
          }
        else if (e.Item.ItemType == ListItemType.Header)
          {
          var month_10_ago_abbrev = DateTime.Now.AddMonths(-10).ToString("MMM").ToUpper();
          var month_9_ago_abbrev = DateTime.Now.AddMonths(-9).ToString("MMM").ToUpper();
          var month_8_ago_abbrev = DateTime.Now.AddMonths(-8).ToString("MMM").ToUpper();
          var month_7_ago_abbrev = DateTime.Now.AddMonths(-7).ToString("MMM").ToUpper();
          var month_6_ago_abbrev = DateTime.Now.AddMonths(-6).ToString("MMM").ToUpper();
          var month_5_ago_abbrev = DateTime.Now.AddMonths(-5).ToString("MMM").ToUpper();
          var month_4_ago_abbrev = DateTime.Now.AddMonths(-4).ToString("MMM").ToUpper();
          var month_3_ago_abbrev = DateTime.Now.AddMonths(-3).ToString("MMM").ToUpper();
          var month_2_ago_abbrev = DateTime.Now.AddMonths(-2).ToString("MMM").ToUpper();
          var month_1_ago_abbrev = DateTime.Now.AddMonths(-1).ToString("MMM").ToUpper();
          //
          e.Item.Cells[Static.TCI_MONTH_10_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_ENROLLMENT].Text.Replace("MMM",month_10_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_9_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_ENROLLMENT].Text.Replace("MMM",month_9_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_8_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_ENROLLMENT].Text.Replace("MMM",month_8_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_7_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_ENROLLMENT].Text.Replace("MMM",month_7_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_6_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_ENROLLMENT].Text.Replace("MMM",month_6_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_5_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_ENROLLMENT].Text.Replace("MMM",month_5_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_4_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_ENROLLMENT].Text.Replace("MMM",month_4_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_3_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_ENROLLMENT].Text.Replace("MMM",month_3_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_2_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_ENROLLMENT].Text.Replace("MMM",month_2_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_1_AGO_ENROLLMENT].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_ENROLLMENT].Text.Replace("MMM",month_1_ago_abbrev);
          //
          e.Item.Cells[Static.TCI_MONTH_10_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_LEAVE].Text.Replace("MMM",month_10_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_9_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_LEAVE].Text.Replace("MMM",month_9_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_8_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_LEAVE].Text.Replace("MMM",month_8_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_7_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_LEAVE].Text.Replace("MMM",month_7_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_6_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_LEAVE].Text.Replace("MMM",month_6_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_5_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_LEAVE].Text.Replace("MMM",month_5_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_4_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_LEAVE].Text.Replace("MMM",month_4_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_3_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_LEAVE].Text.Replace("MMM",month_3_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_2_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_LEAVE].Text.Replace("MMM",month_2_ago_abbrev);
          e.Item.Cells[Static.TCI_MONTH_1_AGO_LEAVE].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_LEAVE].Text.Replace("MMM",month_1_ago_abbrev);
          //
          if (DataGrid_control.AllowSorting)
            {
            (e.Item.Cells[Static.TCI_MONTH_10_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_10_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_10_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_10_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_10_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_10_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_10_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_10_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_10_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_9_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_9_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_9_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_9_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_9_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_9_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_9_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_9_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_9_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_8_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_8_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_8_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_8_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_8_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_8_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_8_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_8_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_8_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_7_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_7_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_7_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_7_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_7_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_7_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_7_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_7_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_7_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_6_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_6_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_6_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_6_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_6_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_6_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_6_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_6_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_6_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_5_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_5_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_5_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_5_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_5_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_5_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_5_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_5_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_5_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_4_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_4_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_4_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_4_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_4_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_4_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_4_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_4_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_4_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_3_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_3_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_3_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_3_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_3_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_3_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_3_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_3_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_3_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_2_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_2_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_2_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_2_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_2_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_2_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_2_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_2_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_2_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_1_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_1_AGO_DUTY_HOURS].Controls[0] as LinkButton).Text.Replace("MMM",month_1_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_1_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_1_AGO_BASE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_1_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_BASE].Controls[0] as LinkButton).Text.Replace("MMM",month_1_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_1_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_1_AGO_EFFECTIVE_OBLIGATION].Controls[0] as LinkButton).Text.Replace("MMM",month_1_ago_abbrev);
            (e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text = (e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE].Controls[0] as LinkButton).Text.Replace("MMM",month_1_ago_abbrev);
            }
          else
            {
            e.Item.Cells[Static.TCI_MONTH_10_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_DUTY_HOURS].Text.Replace("MMM",month_10_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_10_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_10_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Text.Replace("MMM",month_10_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_10_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_10_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_9_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_DUTY_HOURS].Text.Replace("MMM",month_9_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_9_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_9_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Text.Replace("MMM",month_9_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_9_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_9_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_8_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_DUTY_HOURS].Text.Replace("MMM",month_8_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_8_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_8_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Text.Replace("MMM",month_8_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_8_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_8_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_7_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_DUTY_HOURS].Text.Replace("MMM",month_7_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_7_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_7_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Text.Replace("MMM",month_7_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_7_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_7_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_6_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_DUTY_HOURS].Text.Replace("MMM",month_6_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_6_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_6_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Text.Replace("MMM",month_6_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_6_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_6_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_5_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_DUTY_HOURS].Text.Replace("MMM",month_5_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_5_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_5_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Text.Replace("MMM",month_5_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_5_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_5_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_4_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_DUTY_HOURS].Text.Replace("MMM",month_4_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_4_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_4_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Text.Replace("MMM",month_4_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_4_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_4_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_3_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_DUTY_HOURS].Text.Replace("MMM",month_3_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_3_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_3_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Text.Replace("MMM",month_3_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_3_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_3_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_2_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_DUTY_HOURS].Text.Replace("MMM",month_2_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_2_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_2_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Text.Replace("MMM",month_2_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_2_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_2_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_1_AGO_DUTY_HOURS].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_DUTY_HOURS].Text.Replace("MMM",month_1_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_1_AGO_BASE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_BASE_OBLIGATION].Text.Replace("MMM",month_1_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_BASE].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_BASE].Text.Replace("MMM",month_1_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_1_AGO_EFFECTIVE_OBLIGATION].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_EFFECTIVE_OBLIGATION].Text.Replace("MMM",month_1_ago_abbrev);
            e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE].Text = e.Item.Cells[Static.TCI_MONTH_1_AGO_PCT_OF_EFFECTIVE].Text.Replace("MMM",month_1_ago_abbrev);
            }
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
      DataGrid_control.EditItemIndex = -1;
      Bind();
      }

    private void Bind()
      {
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_DUTY_HOURS].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_ENROLLMENT].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_LEAVE].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_10_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 10);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_DUTY_HOURS].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_ENROLLMENT].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_LEAVE].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_9_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 9);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_DUTY_HOURS].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_ENROLLMENT].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_LEAVE].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_8_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 8);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_DUTY_HOURS].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_ENROLLMENT].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_LEAVE].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_7_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 7);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_DUTY_HOURS].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_ENROLLMENT].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_LEAVE].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_6_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 6);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_DUTY_HOURS].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_ENROLLMENT].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_LEAVE].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_5_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 5);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_DUTY_HOURS].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_ENROLLMENT].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_LEAVE].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_4_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 4);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_DUTY_HOURS].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_ENROLLMENT].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_LEAVE].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_3_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 3);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_DUTY_HOURS].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_ENROLLMENT].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_BASE_OBLIGATION].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_PCT_OF_BASE].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_LEAVE].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_EFFECTIVE_OBLIGATION].Visible = (p.extent.val >= 2);
      DataGrid_control.Columns[Static.TCI_MONTH_2_AGO_PCT_OF_EFFECTIVE].Visible = (p.extent.val >= 2);
      p.biz_members.BindActivityLookbackBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.extent);
      p.be_datagrid_empty = (v.num_members.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_members.Text = v.num_members.val.ToString();
      Literal_num_full.Text = v.num_full.val.ToString();
      Literal_num_prorated.Text = v.num_prorated.val.ToString();
      Literal_num_none.Text = v.num_none.val.ToString();
      v.num_members.val = 0;
      v.num_full.val = 0;
      v.num_prorated.val = 0;
      v.num_none.val = 0;
      }

    protected void Button_export_Click(object sender, System.EventArgs e)
      {
      DataGrid_control.AllowSorting = false;
      DataGrid_control.Columns[Static.TCI_SELECT].Visible = false;
      Bind();
      ExportToExcel
        (
        filename_sans_extension:ConfigurationManager.AppSettings["application_name"] + "-activity-lookback-" + DateTime.Now.ToString("yyyyMMddHHmmssf"),
        excel_string:StringOfControl(DataGrid_control)
        );
      DataGrid_control.AllowSorting = true;
      DataGrid_control.Columns[Static.TCI_SELECT].Visible = true;
      }

    protected void DropDownList_extent_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.extent.val = int.Parse(k.Safe(DropDownList_extent.SelectedValue,k.safe_hint_type.NUM));
      Bind();
      }

    } // end TWebUserControl_activity_lookback

  }