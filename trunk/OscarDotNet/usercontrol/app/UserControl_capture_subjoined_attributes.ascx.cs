// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_subjoined_attributes;
using Class_biz_user;
using Class_biz_users;
using kix;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_capture_subjoined_attributes
  {
  public partial class TWebUserControl_capture_subjoined_attributes: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_INVOLVEMENT = 0;
      public const int TCI_NAME = 1;
      public const int TCI_CAPTURE_CONTROL = 2;
      public const int TCI_CUSTOM_VALIDATOR = 3;
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_subjoined_attributes biz_subjoined_attributes;
      public TClass_biz_user biz_user;
      public TClass_biz_users biz_users;
      }

    private struct v_type
      {
      public bool be_submitting;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    private v_type v; // Volatile instance Variable container

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

    protected void Page_Load(object sender, EventArgs e)
      {
      Bind();  // reloads dynamic controls regardless
      //
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_capture_subjoined_attributes")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_capture_subjoined_attributes");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_capture_subjoined_attributes")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_capture_subjoined_attributes");
////        }
        }
      else
        {
        p.biz_subjoined_attributes = new TClass_biz_subjoined_attributes();
        p.biz_user = new TClass_biz_user();
        p.biz_users = new TClass_biz_users();
        //
        p.be_loaded = false;
        //
        v.be_submitting = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_capture_subjoined_attributes_PreRender;
      }

    private void TWebUserControl_capture_subjoined_attributes_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_capture_subjoined_attributes Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        var involvement = e.Item.Cells[Static.TCI_INVOLVEMENT].Text;
        var name = e.Item.Cells[Static.TCI_NAME].Text;
        //
        using var UserControl_subjoined_attribute_capture_class =
          LoadControl("~/usercontrol/app/UserControl_capture_subjoined_" + involvement + "_" + name + ".ascx") as ki_web_ui.usercontrol_subjoined_attribute_capture_class;
        //
        AddIdentifiedControlToPlaceHolder
          (
          c: UserControl_subjoined_attribute_capture_class,
          id: "capture_control",
          p: e.Item.Cells[Static.TCI_CAPTURE_CONTROL].FindControl("PlaceHolder_control") as PlaceHolder
          );
        //
        (e.Item.Cells[Static.TCI_CUSTOM_VALIDATOR].FindControl("CustomValidator_control") as CustomValidator).ErrorMessage = "Please correct the problem with the " + involvement + k.SPACE + name + " attribute.";
        (e.Item.Cells[Static.TCI_CUSTOM_VALIDATOR].FindControl("CustomValidator_control") as CustomValidator).ServerValidate += UserControl_subjoined_attribute_capture_class.ServerValidate;
        //
        if (v.be_submitting)
          {
          UserControl_subjoined_attribute_capture_class.Submit();
          }
        ////
        //// Remove all cell controls from viewstate except for the one at TCI_ID.
        ////
        //foreach (TableCell cell in e.Item.Cells)
        //  {
        //  cell.EnableViewState = false;
        //  }
        //e.Item.Cells[Static.TCI_CAPTURE_CONTROL].EnableViewState = true;
        }
      }

    private void Bind()
      {
      p.biz_subjoined_attributes.BindBaseDataList(DataGrid_control,p.biz_user.LastLoginTime());
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        v.be_submitting = true;
        Bind();
        v.be_submitting = false;
        p.biz_users.RecordSuccessfulLogin(p.biz_user.IdNum());
        Server.Transfer("~/Default.aspx");
        }
      }

    } // end TWebUserControl_capture_subjoined_attributes

  }