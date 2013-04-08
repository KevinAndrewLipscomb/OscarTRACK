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

    private p_type p;

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
        if (Regex.IsMatch(base_exception.Message, "Connection.*to MySQL server", RegexOptions.IgnoreCase) || (base_exception.Message == "Connection open failed. Too many connections"))
          {
          Table_db_down.Visible = true;
          Table_oops.Visible = false;
          }
        else if (!last_error.ToString().Contains("The client disconnected."))
          {
          if (base_exception.Message == "Deadlock found when trying to get lock; try restarting transaction")
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
            user_identity_name:User.Identity.Name,
            session:Session,
            engine_innodb_status:(base_exception.Source.Contains("MySql") ? p.db__information_schema.EngineInnodbStatus() : k.EMPTY)
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
      if (comment != k.EMPTY)
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
