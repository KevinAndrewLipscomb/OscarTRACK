using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

using Class_biz_agencies;
namespace UserControl_agency
{
    public partial class TWebUserControl_agency: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        private void Clear()
        {
            TextBox_short_designator.Text = k.EMPTY;
            DropDownList_short_designator.Visible = false;
            TextBox_medium_designator.Text = k.EMPTY;
            TextBox_long_designator.Text = k.EMPTY;
            CheckBox_be_active.Checked = false;
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
                Focus(TextBox_short_designator, true);
                p.be_loaded = true;
            }

        }

        private bool PresentRecord(string short_designator)
        {
            bool result;
            string medium_designator;
            string long_designator;
            bool be_active;
            result = false;
            if (p.biz_agencies.Get(short_designator, out medium_designator, out long_designator, out be_active))
            {
                TextBox_short_designator.Text = short_designator;
                TextBox_medium_designator.Text = medium_designator;
                TextBox_long_designator.Text = long_designator;
                CheckBox_be_active.Checked = be_active;
                TextBox_short_designator.Enabled = false;
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

        private void SetLookupMode()
        {
            Clear();
            TextBox_short_designator.Enabled = true;
            Button_lookup.Enabled = true;
            Label_lookup_arrow.Enabled = true;
            Label_lookup_hint.Enabled = true;
            LinkButton_reset.Enabled = false;
            LinkButton_new_record.Enabled = p.be_ok_to_config_agencies;
            Focus(TextBox_short_designator, true);
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_agency.p"] != null) && (Session["UserControl_agency.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_agency.p"]);
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
            this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_agency_PreRender;
        }

        private void TWebUserControl_agency_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_agency.p", p);
        }

        public TWebUserControl_agency Fresh()
        {
            TWebUserControl_agency result;
            Session.Remove("UserControl_agency.p");
            result = this;
            return result;
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_agencies.Set(k.Safe(TextBox_short_designator.Text, k.safe_hint_type.ALPHANUM), k.Safe(TextBox_medium_designator.Text, k.safe_hint_type.ORG_NAME), k.Safe(TextBox_long_designator.Text, k.safe_hint_type.ORG_NAME), CheckBox_be_active.Checked);
                Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
                SetLookupMode();
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void DropDownList_short_designator_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
        {
            DropDownList_short_designator.SelectedIndex = 1;
            PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
        {
            DropDownList_short_designator.SelectedIndex = Math.Max(1, (DropDownList_short_designator.SelectedIndex - 1));
            PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
        {
            DropDownList_short_designator.SelectedIndex = Math.Min((DropDownList_short_designator.SelectedIndex + 1), (DropDownList_short_designator.Items.Count - 1));
            PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
        {
            DropDownList_short_designator.SelectedIndex = DropDownList_short_designator.Items.Count - 1;
            PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
        }

        protected void Button_delete_Click(object sender, System.EventArgs e)
        {
            p.biz_agencies.Delete(k.Safe(TextBox_short_designator.Text, k.safe_hint_type.ALPHANUM));
            SetLookupMode();
        }

        protected void LinkButton_new_record_Click(object sender, System.EventArgs e)
        {
            Clear();
            TextBox_short_designator.Enabled = k.Has((string[])(Session["privilege_array"]), "config-agencies");
            Button_lookup.Enabled = false;
            Label_lookup_arrow.Enabled = false;
            Label_lookup_hint.Enabled = false;
            LinkButton_reset.Enabled = true;
            LinkButton_new_record.Enabled = false;
            SetDependentFieldAblements(p.be_ok_to_config_agencies);
            Button_submit.Enabled = p.be_ok_to_config_agencies;
            Button_delete.Enabled = false;
            Focus(TextBox_short_designator, true);
        }

        protected void LinkButton_reset_Click(object sender, System.EventArgs e)
        {
            SetLookupMode();
        }

        private void SetDependentFieldAblements(bool ablement)
        {
            TextBox_medium_designator.Enabled = ablement;
            TextBox_long_designator.Enabled = ablement;
            CheckBox_be_active.Enabled = ablement;
        }

        protected void Button_lookup_Click(object sender, System.EventArgs e)
        {
            uint num_matches;
            string saved_short_designator;
            saved_short_designator = TextBox_short_designator.Text;
            Clear();
            if (!PresentRecord(saved_short_designator))
            {
                TextBox_short_designator.Text = saved_short_designator;
                p.biz_agencies.Bind(saved_short_designator, DropDownList_short_designator);
                num_matches = (uint)(DropDownList_short_designator.Items.Count);
                if (num_matches > 0)
                {
                    LinkButton_go_to_match_prior.Visible = true;
                    LinkButton_go_to_match_next.Visible = true;
                    LinkButton_go_to_match_last.Visible = true;
                    LinkButton_go_to_match_first.Visible = true;
                    DropDownList_short_designator.Visible = true;
                    if (num_matches == 1)
                    {
                        PresentRecord(k.Safe(DropDownList_short_designator.SelectedValue, k.safe_hint_type.ALPHANUM));
                    }
                    else
                    {
                        DropDownList_short_designator.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
                    }
                }
            }
        }

        private struct p_type
        {
            public bool be_loaded;
            public bool be_ok_to_config_agencies;
            public TClass_biz_agencies biz_agencies;
        } // end p_type

    } // end TWebUserControl_agency

}
