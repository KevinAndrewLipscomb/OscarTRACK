unit salogin;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  System.Globalization,
  System.Data.SqlClient, System.Data.Common, system.configuration,
  system.text.regularexpressions, system.web.security, system.io,
  Class_biz_users,
  ki,
  ki_web_ui,
  system.Web.ui;

type
  p_type =
    RECORD
    biz_users: TClass_biz_users;
    END;
  TWebForm_salogin = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_salogin_PreRender(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_new_user_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_forgot_username_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_forgot_password_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_account_exists_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure Button_log_in_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    LinkButton_forgot_password: System.Web.UI.WebControls.LinkButton;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    CustomValidator_account_exists: System.Web.UI.WebControls.CustomValidator;
    TextBox_username: System.Web.UI.WebControls.TextBox;
    LinkButton_new_user: System.Web.UI.WebControls.LinkButton;
    LinkButton_forgot_username: System.Web.UI.WebControls.LinkButton;
    RegularExpressionValidator_username: System.Web.UI.WebControls.RegularExpressionValidator;
    TextBox_password: System.Web.UI.WebControls.TextBox;
    RegularExpressionValidator_password: System.Web.UI.WebControls.RegularExpressionValidator;
    CheckBox_keep_me_logged_in: System.Web.UI.WebControls.CheckBox;
    Button_log_in: System.Web.UI.WebControls.Button;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    RequiredFieldValidator_username: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_password: System.Web.UI.WebControls.RequiredFieldValidator;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  end;

implementation

uses
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_salogin.InitializeComponent;
begin
  Include(Self.CustomValidator_account_exists.ServerValidate, Self.CustomValidator_account_exists_ServerValidate);
  Include(Self.LinkButton_new_user.Click, Self.LinkButton_new_user_Click);
  Include(Self.LinkButton_forgot_username.Click, Self.LinkButton_forgot_username_Click);
  Include(Self.LinkButton_forgot_password.Click, Self.LinkButton_forgot_password_Click);
  Include(Self.Button_log_in.Click, Self.Button_log_in_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_salogin_PreRender);
end;
{$ENDREGION}

procedure TWebForm_salogin.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['salogin.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['salogin.p']);
  end else begin
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - salogin';
    p.biz_users := TClass_biz_users.Create;
  end;
end;

procedure TWebForm_salogin.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_salogin.LinkButton_new_user_Click(sender: System.Object; e: System.EventArgs);
begin
  server.Transfer('new_user_registration.aspx');
end;

procedure TWebForm_salogin.LinkButton_forgot_username_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('remind_username.aspx');
end;

procedure TWebForm_salogin.LinkButton_forgot_password_Click(sender: System.Object;
  e: System.EventArgs);
var
  username: string;
begin
  if TextBox_username.text = system.string.EMPTY then begin
    Alert(ki.USER,ki.FAILURE,'misusrnam','Please enter your username.');
  end else begin
    username := Safe(TextBox_username.Text.trim,HYPHENATED_UNDERSCORED_ALPHANUM);
    if p.biz_users.BeRegisteredUsername(username) then begin
      p.biz_users.IssueTemporaryPassword(username,Safe(request.userhostname,HOSTNAME));
      Alert
        (
        ki.LOGIC,
        ki.NORMAL,
        'tmpassent',
        'A temporary password has been sent to the email address that ' + configurationsettings.appsettings['application_name']
        + ' has on file for ' + username + '.  Please log in after you receive it.  You will receive further instructions at that'
        + ' time.'
        );
    end else begin
      Alert(ki.USER,ki.FAILURE,'nosuchusr','No such user registered');
    end;
  end;
end;

procedure TWebForm_salogin.TWebForm_salogin_PreRender(sender: System.Object; e: System.EventArgs);
begin
  session.Remove('salogin.p');
  session.Add('salogin.p',p);
end;

procedure TWebForm_salogin.CustomValidator_account_exists_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := p.biz_users.BeAuthorizedSysadmin
    (
    Digest(Safe(TextBox_password.Text.trim,HYPHENATED_UNDERSCORED_ALPHANUM))
    );
end;

procedure TWebForm_salogin.Button_log_in_Click(sender: System.Object; e: System.EventArgs);
var
  username: string;
begin
  username := Safe(TextBox_username.Text.trim,HYPHENATED_UNDERSCORED_ALPHANUM);
  if page.isvalid then begin
    session.Remove('user_id');
    session.Add('user_id',p.biz_users.IdOf(username));
    session.Remove('username');
    session.Add('username',username);
    formsauthentication.RedirectFromLoginPage(username,CheckBox_keep_me_logged_in.checked);
  end;
end;

end.
