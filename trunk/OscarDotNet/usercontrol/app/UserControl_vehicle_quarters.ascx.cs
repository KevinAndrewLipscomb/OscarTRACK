// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_role_member_map;
using Class_biz_vehicle_quarters;
using kix;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_vehicle_quarters
  {
  public partial class TWebUserControl_vehicle_quarters: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_vehicle_quarters biz_vehicle_quarters;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_vehicle_quarters;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      TextBox_medium_designator.Text = k.EMPTY;
      TextBox_long_designator.Text = k.EMPTY;
      TextBox_pecking_order.Text = k.EMPTY;
      CheckBox_be_active.Checked = false;
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

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        LinkButton_new_record.Visible = p.be_ok_to_config_vehicle_quarters;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        if ((Session["mode:goto"] != null) && Session["mode:goto"].ToString().Contains("/vehicle_quarters/"))
          {
          PresentRecord(Session["mode:goto"].ToString().Substring(Session["mode:goto"].ToString().LastIndexOf("/") + 1));
          Session.Remove("mode:goto");
          }
        p.be_loaded = true;
        }
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string medium_designator;
      string long_designator;
      string pecking_order;
      bool be_active;
      result = false;
      if
        (
        p.biz_vehicle_quarters.Get
          (
          id,
          out medium_designator,
          out long_designator,
          out pecking_order,
          out be_active
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        TextBox_medium_designator.Text = medium_designator;
        TextBox_long_designator.Text = long_designator;
        TextBox_pecking_order.Text = pecking_order;
        CheckBox_be_active.Checked = be_active;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_vehicle_quarters);
        Button_submit.Enabled = p.be_ok_to_config_vehicle_quarters;
        Button_delete.Enabled = p.be_ok_to_config_vehicle_quarters;
        result = true;
        }
      return result;
      }

    private void SetDataEntryMode()
      {
      Clear();
      TextBox_id.Text = "*";
      TextBox_id.Enabled = false;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_vehicle_quarters);
      Button_submit.Enabled = p.be_ok_to_config_vehicle_quarters;
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
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_business_objects_binder_UserControl_fleet_object_binder_PlaceHolder_content"] as string) == "UserControl_vehicle_quarters");
        }
      else
        {
        p.be_loaded = false;
        p.biz_vehicle_quarters = new TClass_biz_vehicle_quarters();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.be_ok_to_config_vehicle_quarters = k.Has((string[])(Session["privilege_array"]), "config-vehicle-quarters");
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_vehicle_quarters_PreRender;
      }

    private void TWebUserControl_vehicle_quarters_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_vehicle_quarters Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_vehicle_quarters.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
          k.Safe(TextBox_medium_designator.Text,k.safe_hint_type.ORG_NAME).Trim(),
          k.Safe(TextBox_long_designator.Text,k.safe_hint_type.POSTAL_STREET_ADDRESS).Trim(),
          k.Safe(TextBox_pecking_order.Text,k.safe_hint_type.NUM),
          CheckBox_be_active.Checked
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
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = 1;
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Max(1, (DropDownList_id.SelectedIndex - 1));
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Min((DropDownList_id.SelectedIndex + 1), (DropDownList_id.Items.Count - 1));
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = DropDownList_id.Items.Count - 1;
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (p.biz_vehicle_quarters.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.ALPHANUM)))
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
      TextBox_medium_designator.Enabled = ablement;
      TextBox_long_designator.Enabled = ablement;
      TextBox_pecking_order.Enabled = ablement;
      CheckBox_be_active.Enabled = ablement;
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
        p.biz_vehicle_quarters.Bind(saved_id, DropDownList_id);
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

    protected void CustomValidator_medium_designator_ServerValidate(object source, ServerValidateEventArgs args)
      {
      var id_with_competing_medium_designator = p.biz_vehicle_quarters.IdWithCompetingMediumDesignator(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),k.Safe(TextBox_medium_designator.Text,k.safe_hint_type.ORG_NAME).Trim());
      CustomValidator_medium_designator.ErrorMessage += id_with_competing_medium_designator;
      args.IsValid = (id_with_competing_medium_designator.Length == 0);
      }

    protected void CustomValidator_long_designator_ServerValidate(object source, ServerValidateEventArgs args)
      {
      var id_with_competing_long_designator = p.biz_vehicle_quarters.IdWithCompetingLongDesignator(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),k.Safe(TextBox_long_designator.Text,k.safe_hint_type.POSTAL_STREET_ADDRESS).Trim());
      CustomValidator_long_designator.ErrorMessage += id_with_competing_long_designator;
      args.IsValid = (id_with_competing_long_designator.Length == 0);
      }

    } // end TWebUserControl_vehicle_quarters

  }
