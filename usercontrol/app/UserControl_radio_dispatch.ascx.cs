// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_radio_dispatchs;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

namespace UserControl_radio_dispatch
  {
  public partial class TWebUserControl_radio_dispatch: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_radio_dispatchs biz_radio_dispatchs;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_radio_dispatchs;
      public string id;
      public presentation_mode_enum presentation_mode;
      public object summary;
      }

    private struct v_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    private v_type v; // Volatile instance Variable container

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      TextBox_capcode.Text = k.EMPTY;
      TextBox_transmission_datetime.Text = k.EMPTY;
      TextBox_address.Text = k.EMPTY;
      TextBox_nature.Text = k.EMPTY;
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
      SetDependentFieldAblements(false);
      Button_submit.Enabled = false;
      Button_delete.Enabled = false;
      }

    private void InjectPersistentClientSideScript()
      {
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
      // EstablishClientSideFunction
      //   (
      //   'RecalculateDependentValues()',
      //   k.EMPTY
      //   + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
      //   +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
      //   );
      // //
      // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
      // TextBox_gross_landed_weight_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_gross_landed_weight_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        LinkButton_new_record.Visible = p.be_ok_to_config_radio_dispatchs;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        if (p.presentation_mode == presentation_mode_enum.NEW)
          {
#warning Remove the following line if the radio_dispatch will primarily be a reference table as opposed to a log or journal table.
          SetDataEntryMode();
          }
        else
          {
          PresentRecord(p.id);
          }
        p.be_loaded = true;
        }
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_delete);
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string capcode;
      DateTime transmission_datetime;
      string address;
      string nature;
      result = false;
      if
        (
        p.biz_radio_dispatchs.Get
          (
          id,
          out capcode,
          out transmission_datetime,
          out address,
          out nature
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        TextBox_capcode.Text = capcode;
        TextBox_transmission_datetime.Text = transmission_datetime.ToString();
        TextBox_address.Text = address;
        TextBox_nature.Text = nature;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_radio_dispatchs);
        Button_submit.Enabled = p.be_ok_to_config_radio_dispatchs;
        Button_delete.Enabled = p.be_ok_to_config_radio_dispatchs;
        result = true;
        }
      return result;
      }

    private void SetDataEntryMode()
      {
      Clear();
#warning Only keep the following line if it exactly matches "TextBox_id.Text = "*";".
      TextBox_id.Text = "*";
      TextBox_id.Enabled = false;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_radio_dispatchs);
      Button_submit.Enabled = p.be_ok_to_config_radio_dispatchs;
      Button_delete.Enabled = false;
      TextBox_id.Focus();
      }

    private void SetLookupMode()
      {
      Clear();
      TextBox_id.Enabled = true;
      Button_lookup.Enabled = true;
      Label_lookup_arrow.Enabled = true;
      Label_lookup_hint.Enabled = true;
      LinkButton_reset.Enabled = false;
      LinkButton_new_record.Enabled = true;
      TextBox_id.Focus();
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
#warning Revise the binder-related instance_id to this control appropriately.
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_radio_dispatch")
          {
#warning Revise the ClientID path to this control appropriately.
          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_radio_dispatch");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_radio_dispatch")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_radio_dispatch");
//        }
        }
      else
        {
        p.biz_radio_dispatchs = new TClass_biz_radio_dispatchs();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        p.be_loaded = false;
        p.be_ok_to_config_radio_dispatchs = k.Has((string[])(Session["privilege_array"]), "config-radio_dispatchs");
        p.id = k.EMPTY;
        p.summary = null;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_radio_dispatch_PreRender;
      }

    private void TWebUserControl_radio_dispatch_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_radio_dispatch Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        if (TextBox_transmission_datetime.Text.Length > 0)
          {
          transmission_datetime = DateTime.Parse(k.Safe(TextBox_transmission_datetime.Text,k.safe_hint_type.DATE_TIME));
          }
        p.biz_radio_dispatchs.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
#warning Safe_hint values should be tightened.
          k.Safe(TextBox_capcode.Text,k.safe_hint_type.PUNCTUATED).Trim(),
          transmission_datetime,
          k.Safe(TextBox_address.Text,k.safe_hint_type.PUNCTUATED).Trim(),
          k.Safe(TextBox_nature.Text,k.safe_hint_type.PUNCTUATED).Trim()
          );
        Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        SetLookupMode();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void DropDownList_id_SelectedIndexChanged(object sender, System.EventArgs e)
      {
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = 1;
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Max(1, (DropDownList_id.SelectedIndex - 1));
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Min((DropDownList_id.SelectedIndex + 1), (DropDownList_id.Items.Count - 1));
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = DropDownList_id.Items.Count - 1;
#warning Review safe-hint and tighten if necessary
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.PUNCTUATED));
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (p.biz_radio_dispatchs.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.ALPHANUM)))
        {
        SetLookupMode();
        }
      else
        {
        Alert(k.alert_cause_type.APPDATA,k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
        }
      }

    protected void LinkButton_new_record_Click(object sender, System.EventArgs e)
      {
      SetDataEntryMode();
      }

    protected void LinkButton_reset_Click(object sender, System.EventArgs e)
      {
      SetLookupMode();
      }

    private void SetDependentFieldAblements(bool ablement)
      {
      TextBox_capcode.Enabled = ablement;
      TextBox_transmission_datetime.Enabled = ablement;
      TextBox_address.Enabled = ablement;
      TextBox_nature.Enabled = ablement;
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_id;
      saved_id = k.Safe(TextBox_id.Text,k.safe_hint_type.PUNCTUATED); // Leave the hint PUNCTUATED since the TextBox is being used as a partial spec lookup value that we don't want to modify.
      Clear();
      if (!PresentRecord(saved_id))
        {
        TextBox_id.Text = saved_id;
        p.biz_radio_dispatchs.Bind(saved_id, DropDownList_id);
        num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            Literal_match_index.Text = "0";
            Literal_num_matches.Text = num_matches.ToString();
            Panel_match_numbers.Visible = true;
            LinkButton_go_to_match_prior.Visible = true;
            LinkButton_go_to_match_next.Visible = true;
            LinkButton_go_to_match_last.Visible = true;
            LinkButton_go_to_match_first.Visible = true;
            DropDownList_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      }

    internal void SetP
      (
      string id,
      //string container_id
      )
      {
      //p.container_id = container_id;
      //p.container_name = p.biz_containers.NameOf(container_id);
      if (id.Length > 0)
        {
        p.id = id;
        p.summary = p.biz_radio_dispatchs.Summary(id);
        //p.be_ok_to_config_radio_dispatchs = p.biz_privileges.HasForContainer
        //  (
        //  member_id:p.biz_members.IdOfUserId(p.biz_user.IdNum()),
        //  privilege_name:"config-radio_dispatchs",
        //  container_id:p.biz_radio_dispatchs.ContainerIdOf(p.summary)
        //  );
        p.presentation_mode = (p.be_ok_to_config_radio_dispatchs ? presentation_mode_enum.FULL_FUNCTION : p.presentation_mode = presentation_mode_enum.REVIEW_ONLY);
        }
      else
        {
        p.id = k.EMPTY;
        p.summary = null;
        p.presentation_mode = presentation_mode_enum.NEW;
        }
      }

    } // end TWebUserControl_radio_dispatch

  }
