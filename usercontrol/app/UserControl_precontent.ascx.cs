using Class_biz_user;
using Class_db__information_schema;
using Class_msg_protected;
using kix;
using System;
using System.Configuration;
using System.Web;
using System.Web.Security;

namespace UserControl_precontent
  {

  public partial class TWebUserControl_precontent: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public TClass_biz_user biz_user;
      public TClass_msg_protected.overview msg_protected_overview;
      }

    private p_type p;

    private void Logout()
      {
      FormsAuthentication.SignOut();
      Session.Clear();
      Session.Abandon();
      Server.Transfer(k.ExpandTildePath("~/Default.aspx"));
      }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.AppendCacheExtension("must-revalidate");
            Response.Cache.SetMaxAge(TimeSpan.Zero);
            //
            if (!IsPostBack)
            {
                Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                if (!(Session["username"] != null))
                {
                    TableRow_account_control.Visible = false;
                }
                else
                {
                    Label_username.Text = Session["username"].ToString();
                    LinkButton_role_comms.Visible = (p.biz_user.Roles()[0] != "Member");
                }
            }
            var timeout_page = k.ExpandTildePath("~/timeout.aspx");
            if (Request.ServerVariables["URL"] != timeout_page)
              {
              EstablishUpdatePanelCompliantTimeoutHandler((Session.Timeout - 1)*60000,timeout_page); // session timeout minus 1 minute
              }
            //
            // Protect against "Validation of Viewstate MAC failed" errors.  (See http://www.c-sharpcorner.com/Forums/Thread/119522/validation-of-viewstate-mac-failed-timeout.aspx .)
            //
            Page.Form.ID = "Form_control";
            Page.Form.Disabled = true;
            EstablishFormReenablementScript();
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            //
            p.biz_user = new TClass_biz_user();
            p.msg_protected_overview = new TClass_msg_protected.overview();
        }

        protected void ScriptManager_control_AsyncPostBackError(object sender, System.Web.UI.AsyncPostBackErrorEventArgs e)
        {
            //
            // NOTE that this is one of TWO places in the application that k.EscalatedException gets called.  The other place is in ~/exception.aspx.cs Page_Load().  Consider keeping them relatively consistent.
            //
            var engine_innodb_status = k.EMPTY;
            var cause = k.alert_cause_type.LOGIC;
            var key = "xparposbac";
            var alert_message_value = "OOPS!" + k.NEW_LINE
            + k.NEW_LINE
            + "The application encountered an unexpected error." + k.NEW_LINE
            + k.NEW_LINE
            + "The Application Administrator has been notified by pager and email.";
            //
            if
              (
                e.Exception.ToString().Contains("Validation of viewstate MAC failed.")              
              ||
                e.Exception.ToString().Contains("Failed to load viewstate.  The control tree into which viewstate is being loaded must match")
              ||
                e.Exception.ToString().Contains("The state information is invalid for this page and might be corrupted.")
              )
              {
              cause = k.alert_cause_type.OTHER;
              key = "ppbvwsterr";
              alert_message_value = "To continue, please use your browser's Page Refresh/Reload feature after dismissing this message.";
              }
            else if (!e.Exception.ToString().Contains("The client disconnected."))
              {
              if (e.Exception.ToString().Contains("Deadlock found when trying to get lock; try restarting transaction"))
                {
                engine_innodb_status = new TClass_db__information_schema().EngineInnodbStatus();
                cause = k.alert_cause_type.DBMS;
                key = "deadlock";
                alert_message_value = "DEADLOCK!" + k.NEW_LINE
                + k.NEW_LINE
                + "The application's database subsystem had to abort your operation to relieve a deadlock." + k.NEW_LINE
                + k.NEW_LINE
                + "You and another user (or process) tried to access the same server data at the same time in an incompatible way." + k.NEW_LINE
                + k.NEW_LINE
                + "Please close and re-open your browser, log back in, and try again.";
                }
              k.EscalatedException
                (
                the_exception:e.Exception,
                user_identity_name:(HttpContext.Current.User.Identity.Name.Length > 0 ? HttpContext.Current.User.Identity.Name : "(EMPTY HttpContext.Current.User.Identity.Name)") + " from " + Request.UserHostAddress + k.SPACE + "(" + k.DomainNameOfIpAddress(Request.UserHostAddress) + ")",
                session:Session,
                engine_innodb_status:engine_innodb_status
                );
              }
            ScriptManager_control.AsyncPostBackErrorMessage = AlertMessage
              (
              cause:cause,
              state:k.alert_state_type.FAILURE,
              key:key,
              value:alert_message_value
              );
            Server.ClearError();
        }

    protected void LinkButton_profile_Click(object sender, System.EventArgs e)
      {
      if (HttpContext.Current.User.Identity.Name.Length > 0)
        {
        DropCrumbAndTransferTo(k.ExpandTildePath("~/protected/member_profile.aspx"));
        }
      else
        {
        Logout();
        }
      }

    protected void LinkButton_logout_Click(object sender, System.EventArgs e)
      {
      Logout();
      }

    protected void LinkButton_role_comms_Click(object sender, System.EventArgs e)
      {
      p.msg_protected_overview.target = "/config/role-and-mappings/roles/";
      MessageDropCrumbAndTransferTo
        (
        msg:p.msg_protected_overview,
        folder_name: "protected",
        aspx_name:"overview"
        );
      }
    } // end TWebUserControl_precontent

  }
