
unit exception;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki, system.configuration,
  Class_biz_user,
  system.text.regularexpressions,
  system.web.mail;


const ID = '$Id$';

type
  p_type =
    RECORD
    biz_user: TClass_biz_user;
    exception: system.exception;
    notification_message: string;
    END;
  TWebForm_exception = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_exception_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Button_submit: System.Web.UI.WebControls.Button;
    TextArea_user_comment: System.Web.UI.HtmlControls.HtmlTextArea;
    Table_oops: System.Web.UI.HtmlControls.HtmlTable;
    Table_db_down: System.Web.UI.HtmlControls.HtmlTable;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_exception.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_exception_PreRender);
end;
{$ENDREGION}

procedure TWebForm_exception.Page_Load(sender: System.Object; e: System.EventArgs);
var
  lcv: cardinal;
  user_designator: string;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - exception';
    p.biz_user := TClass_biz_user.Create;
    //
    p.exception := server.GetLastError.GetBaseException;
    //
    if regex.IsMatch(p.exception.message,'Connection.*to MySQL server',regexoptions.IGNORECASE)
      or (p.exception.message = 'Connection open failed. Too many connections')
    then begin
      Table_oops.visible := FALSE;
    end else begin
      Table_db_down.visible := FALSE;
      //
      if user.identity.name = system.string.EMPTY then begin
        user_designator := 'unknown';
      end else begin
        user_designator := user.identity.name + ' (' + session[p.biz_user.Kind + '_name'].tostring + ')';
      end;
      //
      p.notification_message := '[USER]' + NEW_LINE
      + user_designator + NEW_LINE
      + NEW_LINE
      + '[MESSAGE]' + NEW_LINE
      + p.exception.message + NEW_LINE
      + NEW_LINE
      + '[STACKTRACE]' + NEW_LINE
      + p.exception.stacktrace + NEW_LINE
      + NEW_LINE
      + '[SESSION]' + NEW_LINE;
      for lcv := 0 to (session.count - 1) do begin
        p.notification_message := p.notification_message + session.keys[lcv].tostring + ' = ' + session.item[lcv].tostring + NEW_LINE;
      end;
      //
      ki.SmtpMailSend
        (
        configurationsettings.appsettings['sender_email_address'],
        configurationsettings.appsettings['sender_email_address'],
        'EXCEPTION REPORT',
        p.notification_message
        );
      ki.SmtpMailSend
        (
        configurationsettings.appsettings['sender_email_address'],
        configurationsettings.appsettings['sysadmin_sms_address'],
        'CRASH',
        user_designator
        );
    end;
    //
    server.ClearError;
    //
  end;
end;

procedure TWebForm_exception.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_exception.Button_submit_Click(sender: System.Object; e: System.EventArgs);
var
  comment: string;
begin
  comment := Safe(TextArea_user_comment.value,NARRATIVE);
  if comment <> system.string.EMPTY then begin
    ki.SmtpMailSend
      (
      configurationsettings.appsettings['sender_email_address'],
      configurationsettings.appsettings['sender_email_address'],
      'EXCEPTION REPORT with user comment',
      '[USER COMMENT]' + NEW_LINE
      + comment + NEW_LINE
      + NEW_LINE
      + p.notification_message
      );
  end;
  server.Transfer('login.aspx');
end;

procedure TWebForm_exception.TWebForm_exception_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

end.

