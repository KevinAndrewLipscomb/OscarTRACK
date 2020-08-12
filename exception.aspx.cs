using Class_db__information_schema;
using kix;
using System;
using System.Configuration;
using System.Text.RegularExpressions;

namespace exception
  {

  public partial class TWebForm_exception: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_db__information_schema db__information_schema;
      public string notification_message;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_exception_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - exception";
        var last_error = Server.GetLastError();
        var base_exception = last_error.GetBaseException();
        if(
            Regex.IsMatch(base_exception.Message, "Connection.*to MySQL server", RegexOptions.IgnoreCase)
          ||
            base_exception.Message.Contains("Connection open failed. Too many connections")
          ||
            last_error.ToString().Contains("Unable to connect to any of the specified MySQL hosts.")
          ||
            last_error.ToString().Contains("No connection could be made because the target machine actively refused it 127.0.0.1:3306")
          )
          {
          Table_db_down.Visible = true;
          Table_oops.Visible = false;
          }
        else if (Regex.IsMatch(last_error.ToString(),"A potentially dangerous Request.* value was detected from the client", RegexOptions.IgnoreCase))
          {
          Table_dangerous_input.Visible = true;
          Table_oops.Visible = false;
          }
        else if
          (
            last_error.ToString().Contains("Validation of viewstate MAC failed.")
          ||
            last_error.ToString().Contains("Failed to load viewstate.  The control tree into which viewstate is being loaded must match")
          ||
            last_error.ToString().Contains("The state information is invalid for this page and might be corrupted.")
          )
          {
          Server.ClearError();
          Server.Transfer("~/Default.aspx");
          }
        else if (!last_error.ToString().Contains("The client disconnected."))
          {
          //
          // NOTE that this is one of TWO places in the application that k.EscalatedException gets called.  The other place is in UserControl_precontent.ascx.cs ScriptManager_control_AsyncPostBackError().  Consider keeping them
          // relatively consistent.
          //
          var be_deadlock = last_error.ToString().Contains("Deadlock found when trying to get lock; try restarting transaction");
          if (be_deadlock)
            {
            Table_deadlock.Visible = true;
            Table_oops.Visible = false;
            }
          else
            {
            TextArea_user_comment.Focus();
            }
          p.notification_message = k.EscalatedException
            (
            the_exception:last_error,
            user_identity_name:(User.Identity.Name.Length > 0 ? User.Identity.Name : "(EMPTY User.Identity.Name)") + " from " + Request.UserHostAddress + k.SPACE + "(" + k.DomainNameOfIpAddress(Request.UserHostAddress) + ")",
            session:Session,
            engine_innodb_status:(be_deadlock ? p.db__information_schema.EngineInnodbStatus() : k.EMPTY)
            );
          }
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      Server.ClearError();
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      p.db__information_schema = new TClass_db__information_schema();
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      var comment = k.Safe(TextArea_user_comment.Value, k.safe_hint_type.PUNCTUATED);
      if (comment.Length > 0)
        {
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:ConfigurationManager.AppSettings["sender_email_address"],
          subject:"EXCEPTION REPORT with user comment",
          message_string:"[USER COMMENT]" + k.NEW_LINE + comment + k.NEW_LINE + k.NEW_LINE + p.notification_message
          );
        }
      Server.Transfer("login.aspx");
      }

    private void TWebForm_exception_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_exception

  }
