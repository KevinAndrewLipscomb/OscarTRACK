// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_vehicle_quarters_history;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

namespace UserControl_vehicle_quarters_history
  {
  public partial class TWebUserControl_vehicle_quarters_history: ki_web_ui.usercontrol_class
    {
    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      TextBox_vehicle_id.Text = k.EMPTY;
      TextBox_quarters_id.Text = k.EMPTY;
      TextBox_start_datetime.Text = k.EMPTY;
      TextBox_end_datetime.Text = k.EMPTY;
      TextBox_note.Text = k.EMPTY;
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
        LinkButton_new_record.Visible = p.be_ok_to_config_vehicle_quarters_history;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
#warning Remove the following line if the vehicle_quarters_history will primarily be a reference table as opposed to a log or journal table.
        SetDataEntryMode();
        if ((Session["mode:goto"] != null) && Session["mode:goto"].ToString().Contains("/vehicle_quarters_history/"))
          {
          PresentRecord(Session["mode:goto"].ToString().Substring(Session["mode:goto"].ToString().LastIndexOf("/") + 1));
          Session.Remove("mode:goto");
          }
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      bool result;
      string vehicle_id;
      string quarters_id;
      DateTime start_datetime;
      DateTime end_datetime;
      string note;
      result = false;
      if
        (
        p.biz_vehicle_quarters_history.Get
          (
          id,
          out vehicle_id,
          out quarters_id,
          out start_datetime,
          out end_datetime,
          out note
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        TextBox_vehicle_id.Text = vehicle_id;
        TextBox_quarters_id.Text = quarters_id;
        TextBox_start_datetime.Text = start_datetime.ToString();
        TextBox_end_datetime.Text = end_datetime.ToString();
        TextBox_note.Text = note;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_vehicle_quarters_history);
        Button_submit.Enabled = p.be_ok_to_config_vehicle_quarters_history;
        Button_delete.Enabled = p.be_ok_to_config_vehicle_quarters_history;
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
      SetDependentFieldAblements(p.be_ok_to_config_vehicle_quarters_history);
      Button_submit.Enabled = p.be_ok_to_config_vehicle_quarters_history;
      Button_delete.Enabled = false;
      Focus(TextBox_id, true);
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
      Focus(TextBox_id, true);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_vehicle_quarters_history.p"] != null)
        {
        p = (p_type)(Session["UserControl_vehicle_quarters_history.p"]);
#warning Revise the following line if the usercontrol will not be a direct child of the member binder.
        p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_vehicle_quarters_history");
        }
      else
        {
        p.be_loaded = false;
        p.biz_vehicle_quarters_history = new TClass_biz_vehicle_quarters_history();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.be_ok_to_config_vehicle_quarters_history = k.Has((string[])(Session["privilege_array"]), "config-vehicle_quarters_history");
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_vehicle_quarters_history_PreRender;
      }

    private void TWebUserControl_vehicle_quarters_history_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_vehicle_quarters_history.p", p);
      }

    public TWebUserControl_vehicle_quarters_history Fresh()
      {
      Session.Remove("UserControl_vehicle_quarters_history.p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        if (TextBox_start_datetime.Text != k.EMPTY)
          {
          start_datetime = DateTime.Parse(k.Safe(TextBox_start_datetime.Text,k.safe_hint_type.DATE_TIME));
          }
        if (TextBox_end_datetime.Text != k.EMPTY)
          {
          end_datetime = DateTime.Parse(k.Safe(TextBox_end_datetime.Text,k.safe_hint_type.DATE_TIME));
          }
        p.biz_vehicle_quarters_history.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
#warning Safe_hint values should be tightened.
          k.Safe(TextBox_vehicle_id.Text,k.safe_hint_type.PUNCTUATED).Trim(),
          k.Safe(TextBox_quarters_id.Text,k.safe_hint_type.PUNCTUATED).Trim(),
          start_datetime,
          end_datetime,
          k.Safe(TextBox_note.Text,k.safe_hint_type.PUNCTUATED).Trim()
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
      if (p.biz_vehicle_quarters_history.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.ALPHANUM)))
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
      TextBox_vehicle_id.Enabled = ablement;
      TextBox_quarters_id.Enabled = ablement;
      TextBox_start_datetime.Enabled = ablement;
      TextBox_end_datetime.Enabled = ablement;
      TextBox_note.Enabled = ablement;
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_id;
      saved_id = TextBox_id.Text;
      Clear();
      if (!PresentRecord(saved_id))
        {
        TextBox_id.Text = saved_id;
        p.biz_vehicle_quarters_history.Bind(saved_id, DropDownList_id);
        num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          LinkButton_go_to_match_prior.Visible = true;
          LinkButton_go_to_match_next.Visible = true;
          LinkButton_go_to_match_last.Visible = true;
          LinkButton_go_to_match_first.Visible = true;
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            DropDownList_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_vehicle_quarters_history biz_vehicle_quarters_history;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_vehicle_quarters_history;
      } // end p_type

    } // end TWebUserControl_vehicle_quarters_history

  }
