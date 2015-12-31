using Class_biz_user;
using Class_db__information_schema;
using Class_msg_protected;
using kix;
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


        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
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

        protected override void OnInit(System.EventArgs e)
        {
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
            if (e.Exception.ToString().Contains("Validation of viewstate MAC failed."))
              {
              cause = k.alert_cause_type.OTHER;
              key = "invvwstmac";
              alert_message_value = "To continue, please use your browser's Page Refresh/Reload feature after dismissing this message.";
              }
            else
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
                user_identity_name:HttpContext.Current.User.Identity.Name,
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
      DropCrumbAndTransferTo(k.ExpandTildePath("~/protected/member_profile.aspx"));
      }

        protected void LinkButton_logout_Click(object sender, System.EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Server.Transfer(k.ExpandTildePath("~/Default.aspx"));
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
