// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_field_situations;
using kix;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_field_situation
  {
  public partial class TWebUserControl_field_situation: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_TIME_INITIATED = 0;
      public const int TCI_ADDRESS = 1;
      public const int TCI_ASSIGNMENT = 2;
      public const int TCI_IMPRESSION = 3;
      }

    private struct p_type
      {
      public bool be_ambulance_callsigns_body_visible;
      public bool be_assignment_designator_prefixes_body_visible;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_notes_body_visible;
      public bool be_sort_order_ascending;
      public bool be_station_numbers_body_visible;
      public TClass_biz_field_situations biz_field_situations;
      public uint num_field_situations;
      public string sort_order;
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
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_field_situation")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_field_situation");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_field_situation")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_field_situation");
////        }
        }
      else
        {
        p.biz_field_situations = new TClass_biz_field_situations();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.sort_order = "case_num desc, field_situation.id desc";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_field_situation_PreRender;
      }

    private void TWebUserControl_field_situation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_field_situation Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var hyperlink_address = (e.Item.Cells[Static.TCI_ADDRESS].Controls[0] as HyperLink);
        hyperlink_address.Text = p.biz_field_situations.DeidentifiedRenditionOf(hyperlink_address.Text);
        hyperlink_address.NavigateUrl = "http://google.com/maps/place/" + hyperlink_address.Text.Replace(k.SPACE,"+").Replace("/"," & ") + ",+Virginia+Beach,+VA";
        //
        // Remove all cell controls from viewstate.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        //
        p.num_field_situations++;
        }
      }

    private void Bind()
      {
      p.biz_field_situations.BindBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control);
      p.be_datagrid_empty = (p.num_field_situations == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_cases.Text = p.num_field_situations.ToString();
      p.num_field_situations = 0;
      }

    protected void Timer_control_Tick(object sender, EventArgs e)
      {
      Bind();
      }

    protected void LinkButton_toggle_notes_Click(object sender, EventArgs e)
      {
      p.be_notes_body_visible = !p.be_notes_body_visible;
      LinkButton_toggle_notes.Text = "[" + (p.be_notes_body_visible ? "Hide" : "Show") + "]";
      TableRow_notes_body.Visible = p.be_notes_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_assignment_designator_prefixes_Click(object sender, EventArgs e)
      {
      p.be_assignment_designator_prefixes_body_visible = !p.be_assignment_designator_prefixes_body_visible;
      LinkButton_toggle_assignment_designator_prefixes.Text = "[" + (p.be_assignment_designator_prefixes_body_visible ? "Hide" : "Show") + "]";
      TableRow_assignment_designator_prefixes_body.Visible = p.be_assignment_designator_prefixes_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_station_numbers_Click(object sender, EventArgs e)
      {
      p.be_station_numbers_body_visible = !p.be_station_numbers_body_visible;
      LinkButton_toggle_station_numbers.Text = "[" + (p.be_station_numbers_body_visible ? "Hide" : "Show") + "]";
      TableRow_station_numbers_body.Visible = p.be_station_numbers_body_visible;
      Bind();
      }

    protected void LinkButton_toggle_ambulance_callsigns_Click(object sender, EventArgs e)
      {
      p.be_ambulance_callsigns_body_visible = !p.be_ambulance_callsigns_body_visible;
      LinkButton_toggle_ambulance_callsigns.Text = "[" + (p.be_ambulance_callsigns_body_visible ? "Hide" : "Show") + "]";
      TableRow_ambulance_callsigns_body.Visible = p.be_ambulance_callsigns_body_visible;
      Bind();
      }

    } // end TWebUserControl_field_situation

  }