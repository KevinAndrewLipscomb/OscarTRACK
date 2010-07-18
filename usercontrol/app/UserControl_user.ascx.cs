using Class_biz_users;
using kix;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_user
{
    public partial class TWebUserControl_user: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        private void Clear()
        {
            TextBox_username.Text = k.EMPTY;
            Literal_match_index.Text = k.EMPTY;
            Literal_num_matches.Text = k.EMPTY;
            Panel_match_numbers.Visible = false;
            LinkButton_go_to_match_prior.Visible = false;
            LinkButton_go_to_match_next.Visible = false;
            LinkButton_go_to_match_last.Visible = false;
            LinkButton_go_to_match_first.Visible = false;
            DropDownList_username.Visible = false;
            TextBox_encoded_password.Text = k.EMPTY;
            CheckBox_be_stale_password.Checked = false;
            TextBox_password_reset_email_address.Text = k.EMPTY;
            CheckBox_be_active.Checked = false;
            TextBox_num_unsuccessful_login_attempts.Text = k.EMPTY;
            TextBox_last_login.Text = k.EMPTY;
            SetDependentFieldAblements(false);
            Button_submit.Enabled = false;
            Button_delete.Enabled = false;

        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
                LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
                LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
                LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
                RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
                Focus(TextBox_username, true);
                p.be_loaded = true;
            }

        }

        private bool PresentRecord(string username)
        {
            Literal_match_index.Text = DropDownList_username.SelectedIndex.ToString();
            bool result;
            string encoded_password;
            bool be_stale_password;
            string password_reset_email_address;
            bool be_active;
            uint num_unsuccessful_login_attempts;
            string last_login;
            result = false;
            if (p.biz_users.Get(username, out encoded_password, out be_stale_password, out password_reset_email_address, out be_active, out num_unsuccessful_login_attempts, out last_login))
            {
                TextBox_username.Text = username;
                TextBox_encoded_password.Text = encoded_password;
                CheckBox_be_stale_password.Checked = be_stale_password;
                TextBox_password_reset_email_address.Text = password_reset_email_address;
                CheckBox_be_active.Checked = be_active;
                TextBox_num_unsuccessful_login_attempts.Text = num_unsuccessful_login_attempts.ToString();
                TextBox_last_login.Text = last_login;
                TextBox_username.Enabled = false;
                Button_lookup.Enabled = false;
                Label_lookup_arrow.Enabled = false;
                Label_lookup_hint.Enabled = false;
                LinkButton_reset.Enabled = true;
                SetDependentFieldAblements(p.be_ok_to_config_users);
                Button_submit.Enabled = p.be_ok_to_config_users;
                Button_delete.Enabled = p.be_ok_to_config_users;
                result = true;
            }
            return result;
        }

        private void SetLookupMode()
        {
            Clear();
            TextBox_username.Enabled = true;
            Button_lookup.Enabled = true;
            Label_lookup_arrow.Enabled = true;
            Label_lookup_hint.Enabled = true;
            LinkButton_reset.Enabled = false;
            Focus(TextBox_username, true);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_user.p"] != null) && (Session["UserControl_user.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_user.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_users = new TClass_biz_users();
                p.be_ok_to_config_users = k.Has((string[])(Session["privilege_array"]), "config-users");
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebUserControl_user_PreRender;
            //this.Load += this.Page_Load;
        }

        private void TWebUserControl_user_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_user.p", p);
        }

        public TWebUserControl_user Fresh()
        {
            TWebUserControl_user result;
            Session.Remove("UserControl_user.p");
            result = this;
            return result;
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_username.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_username.SelectedIndex = Math.Max(1, (DropDownList_username.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_username.SelectedIndex = Math.Min((DropDownList_username.SelectedIndex + 1), (DropDownList_username.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_username.SelectedIndex = DropDownList_username.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_users.Set(k.Safe(TextBox_username.Text, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM), CheckBox_be_stale_password.Checked, k.Safe(TextBox_password_reset_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS), CheckBox_be_active.Checked);
                Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void DropDownList_username_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            p.biz_users.Delete(k.Safe(TextBox_username.Text, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
            SetLookupMode();
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            CheckBox_be_stale_password.Enabled = ablement;
            TextBox_password_reset_email_address.Enabled = ablement;
            CheckBox_be_active.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            string saved_username;
            saved_username = TextBox_username.Text;
            Clear();
            if (!PresentRecord(saved_username))
            {
                TextBox_username.Text = saved_username;
                p.biz_users.Bind(saved_username, DropDownList_username);
                num_matches = (uint)(DropDownList_username.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_username.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_username.SelectedValue, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
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
            DropDownList_username.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_users;
            public TClass_biz_users biz_users;
        } // end p_type

    } // end TWebUserControl_user

}
