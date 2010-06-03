using Class_biz_members;
using Class_biz_user;
using Class_biz_users;
using kix;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_establish_membership
{
    public struct p_type
    {
        public bool be_loaded;
        public TClass_biz_members biz_members;
        public TClass_biz_user biz_user;
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebUserControl_establish_membership: ki_web_ui.usercontrol_class
    {
        private p_type p;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
                Label_sponsor_1.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_2.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_3.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_shared_secret_description.Text = ConfigurationManager.AppSettings["shared_secret_description"];
                Focus(TextBox_shared_secret, true);
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session["UserControl_establish_membership.p"] != null) && (Session["UserControl_establish_membership.p"].GetType().Namespace == p.GetType().Namespace))
            {
                p = (p_type)(Session["UserControl_establish_membership.p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_members = new TClass_biz_members();
                p.biz_user = new TClass_biz_user();
                p.biz_users = new TClass_biz_users();
            }

        }

        protected void LinkButton_proceed_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("~/Default.aspx");
        }

        protected void LinkButton_trouble_handler_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo("establish_membership_trouble.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
          {
          if (Page.IsValid)
            {
            if (p.biz_users.AcceptAsMember(k.Safe(TextBox_shared_secret.Text, k.safe_hint_type.NUM), p.biz_user.IdNum(), Session["username"].ToString()))
              {
              SessionSet("privilege_array", p.biz_user.Privileges());
              // User was an unprivileged user until now, so reset privs.
              Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "memaccept", "Link to membership record established.  Membership privileges granted.", true);
              Table_proceed.Visible = true;
              }
            else
              {
              Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "nosuchmem", "No such membership record could be located.  Please check your submission for accuracy.", true);
              }
            }
          }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebUserControl_establish_membership_PreRender;
        }

        private void TWebUserControl_establish_membership_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("UserControl_establish_membership.p", p);
        }

        public TWebUserControl_establish_membership Fresh()
        {
            TWebUserControl_establish_membership result;
            Session.Remove("UserControl_establish_membership.p");
            result = this;
            return result;
        }

        protected void CustomValidator_shared_secret_ServerValidate(object source, ServerValidateEventArgs args)
          {
          args.IsValid = !p.biz_members.BeRoleHolderByCadNum(k.Safe(TextBox_shared_secret.Text, k.safe_hint_type.NUM));
          }

    } // end TWebUserControl_establish_membership

}
