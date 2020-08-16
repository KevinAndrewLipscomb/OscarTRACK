using Class_biz_agencies;
using kix;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_post
{
    public partial class TWebUserControl_post: ki_web_ui.usercontrol_class
    {
        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_agencies;
            public TClass_biz_agencies biz_agencies;
        }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        private void Clear()
        {
            TextBox_id.Text = k.EMPTY;
            DropDownList_id.Visible = false;
            TextBox_short_designator.Text = k.EMPTY;
            TextBox_medium_designator.Text = k.EMPTY;
            TextBox_long_designator.Text = k.EMPTY;
            TextBox_door_code.Text = k.EMPTY;
            TextBox_address.Text = k.EMPTY;
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
                // LinkButton_new_record.Visible := p.be_ok_to_config_agencies;
                LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                TextBox_id.Focus();
                p.be_loaded = true;
            }

        }

        private bool PresentRecord(string id)
        {
            Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
            bool result;
            string short_designator;
            string medium_designator;
            string long_designator;
            bool be_active;
            string keyclick_enumerator;
            string oscar_classic_enumerator;
            bool be_ems_post;
            string door_code;
            bool be_ok_to_nag;
            bool be_ok_to_send_duty_reminders;
            string address;
            bool be_keyclick_enabled;
            bool be_efficipay_enabled;
            result = false;
            if(
              p.biz_agencies.Get
                (
                id,
                out short_designator,
                out medium_designator,
                out long_designator,
                out be_active,
                out keyclick_enumerator,
                out oscar_classic_enumerator,
                out be_ems_post,
                out door_code,
                out be_ok_to_nag,
                out be_ok_to_send_duty_reminders,
                out address,
                out be_keyclick_enabled,
                out be_efficipay_enabled
                )
              )
              {
              TextBox_id.Text = id;
              TextBox_id.Enabled = false;
              TextBox_short_designator.Text = short_designator;
              TextBox_medium_designator.Text = medium_designator;
              TextBox_long_designator.Text = long_designator;
              TextBox_door_code.Text = door_code;
              TextBox_address.Text = address;
              Button_lookup.Enabled = false;
              Label_lookup_arrow.Enabled = false;
              Label_lookup_hint.Enabled = false;
              LinkButton_reset.Enabled = true;
              SetDependentFieldAblements(p.be_ok_to_config_agencies);
              Button_submit.Enabled = p.be_ok_to_config_agencies;
              Button_delete.Enabled = p.be_ok_to_config_agencies;
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
      SetDependentFieldAblements(p.be_ok_to_config_agencies);
      Button_submit.Enabled = p.be_ok_to_config_agencies;
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
            LinkButton_new_record.Enabled = p.be_ok_to_config_agencies;
            TextBox_id.Focus();
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_agencies = new TClass_biz_agencies();
                p.be_ok_to_config_agencies = k.Has((string[])(Session["privilege_array"]), "config-agencies");
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebUserControl_post_PreRender;
        }

        private void TWebUserControl_post_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_post Fresh()
        {
            TWebUserControl_post result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_agencies.Set
                  (
                  id:k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
                  short_designator:k.Safe(TextBox_short_designator.Text, k.safe_hint_type.ALPHANUM),
                  medium_designator:k.Safe(TextBox_medium_designator.Text, k.safe_hint_type.ORG_NAME),
                  long_designator:k.Safe(TextBox_long_designator.Text, k.safe_hint_type.ORG_NAME),
                  be_active:false,
                  keyclick_enumerator:k.EMPTY,
                  oscar_classic_enumerator:k.EMPTY,
                  be_ems_post:true,
                  door_code:k.Safe(TextBox_door_code.Text, k.safe_hint_type.FINANCIAL_TERMS),
                  be_ok_to_nag:true,
                  be_ok_to_send_duty_reminders:false,
                  address:k.Safe(TextBox_address.Text,k.safe_hint_type.POSTAL_STREET_ADDRESS),
                  be_keyclick_enabled:false,
                  be_efficipay_enabled:false
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
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = Math.Max(1, (DropDownList_id.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = Math.Min((DropDownList_id.SelectedIndex + 1), (DropDownList_id.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_id.SelectedIndex = DropDownList_id.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
          {
          if (p.biz_agencies.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
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
            TextBox_short_designator.Enabled = ablement;
            TextBox_medium_designator.Enabled = ablement;
            TextBox_long_designator.Enabled = ablement;
            TextBox_door_code.Enabled = ablement;
            TextBox_address.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            var saved_id = k.Safe(TextBox_id.Text,k.safe_hint_type.PUNCTUATED); // Leave the hint PUNCTUATED since the TextBox is being used as a partial spec lookup value that we don't want to modify.
            Clear();
            if (!PresentRecord(saved_id))
            {
                TextBox_id.Text = saved_id;
                p.biz_agencies.BindPostForConfigBusinessObjects(saved_id, DropDownList_id);
                num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.ALPHANUM));
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

    } // end TWebUserControl_post

}
