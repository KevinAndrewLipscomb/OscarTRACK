using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Globalization;


using Class_biz_members;
using Class_biz_user;
using Class_biz_users;
using UserControl_establish_membership;
using UserControl_member_binder;
namespace overview
{
    public struct p_type
    {
        public TClass_biz_user biz_user;
        public TClass_biz_users biz_users;
        public TClass_biz_members biz_members;
    } // end p_type

    public partial class TWebForm_overview: ki_web_ui.page_class
    {
        private p_type p;
        protected System.Web.UI.ScriptManager ScriptManager_control = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_overview_PreRender;
            this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title.Text = ConfigurationManager.AppSettings["application_name"] + " - overview";
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session["overview.p"] != null))
                {
                    p = (p_type)(Session["overview.p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if ((Session["user_id"] == null) || (Session["username"] == null))
                {
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                p.biz_user = new TClass_biz_user();
                p.biz_users = new TClass_biz_users();
                p.biz_members = new TClass_biz_members();
                BeginBreadCrumbTrail();
                if (p.biz_users.BeStalePassword(p.biz_user.IdNum()))
                {
                    DropCrumbAndTransferTo("change_password.aspx");
                }
                SessionSet("privilege_array", p.biz_user.Privileges());
            }
            if (p.biz_members.IdOfUserId(p.biz_user.IdNum()) == k.EMPTY)
            {
                // Display controls appropriate ONLY to nonmembers.
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_establish_membership)(LoadControl("~/usercontrol/app/UserControl_establish_membership.ascx"))), "UserControl_establish_membership", PlaceHolder_establish_membership);
            }
            else
            {
                SessionSet("member_id", p.biz_members.IdOfUserId(Session["user_id"].ToString()));
                AddIdentifiedControlToPlaceHolder(((TWebUserControl_member_binder)(LoadControl("~/usercontrol/app/UserControl_member_binder.ascx"))), "UserControl_member_binder", PlaceHolder_member_binder);
            }

        }

        private void TWebForm_overview_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("overview.p", p);
        }

    } // end TWebForm_overview

}
