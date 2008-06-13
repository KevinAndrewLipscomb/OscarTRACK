unit remind_username;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration,
  Class_biz_users,
  kix,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_users: TClass_biz_users;
    END;
  TWebForm_remind_username = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_remind_username_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_register_new_user_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_return_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_application_name_2: System.Web.UI.WebControls.Label;
    Label_application_name_3: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    TextBox_email_address: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_email_address: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_email_address: System.Web.UI.WebControls.RegularExpressionValidator;
    LinkButton_register_new_user: System.Web.UI.WebControls.LinkButton;
    TextBox_noop_ie_behavior_workaround: System.Web.UI.WebControls.TextBox;
    LinkButton_return: System.Web.UI.WebControls.LinkButton;
    Table_return: System.Web.UI.HtmlControls.HtmlTable;
    Label_application_name_1: System.Web.UI.WebControls.Label;
    Button_cancel: System.Web.UI.WebControls.Button;
  protected
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
procedure TWebForm_remind_username.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.LinkButton_register_new_user.Click, Self.LinkButton_register_new_user_Click);
  Include(Self.LinkButton_return.Click, Self.LinkButton_return_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_remind_username_PreRender);
end;
{$ENDREGION}

procedure TWebForm_remind_username.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if IsPostback and (session['remind_username.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['remind_username.p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - remind_username';
      //
      p.biz_users := TClass_biz_users.Create;
      //
      Label_application_name_1.text := configurationmanager.appsettings['application_name'];
      Label_application_name_2.text := configurationmanager.appsettings['application_name'];
      Label_application_name_3.text := configurationmanager.appsettings['application_name'];
      //
      Focus(TextBox_email_address);
      //
    end;
  end;
end;

procedure TWebForm_remind_username.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_remind_username.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('login.aspx');
end;

procedure TWebForm_remind_username.LinkButton_return_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('login.aspx');
end;

procedure TWebForm_remind_username.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  email_address: string;
begin
  email_address := Safe(TextBox_email_address.Text.trim,kix.EMAIL_ADDRESS);
  if p.biz_users.BeRegisteredEmailAddress(email_address) then begin
    p.biz_users.IssueUsernameReminder(email_address,Safe(request.userhostname,HOSTNAME));
    Alert
      (
      kix.LOGIC,
      kix.NORMAL,
      'usrnamsnt',
      'The associated ' + configurationmanager.appsettings['application_name'] + ' username has been sent to '
      + email_address + PERIOD
      );
    Table_return.visible := TRUE;
  end else begin
    Alert(kix.USER,kix.FAILURE,'nosucheml','No such email address registered');
  end;
end;

procedure TWebForm_remind_username.LinkButton_register_new_user_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('new_user_registration.aspx');
end;

procedure TWebForm_remind_username.TWebForm_remind_username_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('remind_username.p',p);
end;

end.

