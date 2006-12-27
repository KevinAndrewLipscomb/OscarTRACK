
unit new_password;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki,
  system.web.mail, system.configuration;

const ID = '$Id$';

type
  TWebForm_new_password = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_email_address: System.Web.UI.WebControls.Label;
    Label_user_name: System.Web.UI.WebControls.Label;
    Label_application_name: System.Web.UI.WebControls.Label;
    HyperLink_login: System.Web.UI.WebControls.HyperLink;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  end;

implementation

uses
  appcommon,
  Class_biz_accounts;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_new_password.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_new_password.Page_Load(sender: System.Object; e: System.EventArgs);
var
  biz_accounts: TClass_biz_accounts;
  email_address: string;
  temporary_password: string[8];
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if not IsPostback then begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - new_password';
    biz_accounts := TClass_biz_accounts.Create;
    Label_user_name.Text := session[session['target_user_table'].ToString + '_name'].ToString;
    if session['target_user_table'].tostring = 'agency' then begin
      Label_user_name.Text := Label_user_name.Text + ' Agency';
    end;
    Label_application_name.text := configurationsettings.appsettings['application_name'];
    //
    // Build a suitably-random password string.
    //
    temporary_password := System.Guid.NewGuid.ToString.Substring(0,8);
    //
    // Make the password string the member's new temporary password, and set the stale flag to force an immediate password change.
    //
    biz_accounts.SetTemporaryPassword
      (
      session['target_user_table'].ToString,
      session[session['target_user_table'].ToString + '_user_id'].ToString,
      ki.Digest(temporary_password)
      );
    //
    // Send the new password to the member's email address of record.
    //
    email_address := biz_accounts.EmailAddressByKindId
      (session['target_user_table'].ToString,session[session['target_user_table'].ToString + '_user_id'].ToString);
    ki.SmtpMailSend
      (
      ConfigurationSettings.AppSettings['sender_email_address'],
      email_address,
      ConfigurationSettings.AppSettings['application_name'] + ' temp password',
      'Someone at the host known as ' + Safe(request.UserHostName,HOSTNAME) + ' (possibly you) requested a new password for the "'
      + session[session['target_user_table'].ToString + '_name'].ToString + '" '
      + session['target_user_table'].ToString + ' account on the ' + ConfigurationSettings.AppSettings['application_name']
      + ' system.  Please log into ' + ConfigurationSettings.AppSettings['application_name'] + ' using the following credentials.  '
      + 'You will receive further instructions at that time.' + NEW_LINE
      + NEW_LINE
      + '   ' + session['target_user_table'].ToString + ':' + NEW_LINE
      + '      ' + session[session['target_user_table'].ToString + '_name'].ToString + NEW_LINE
      + '   password:' + NEW_LINE
      + '      ' + temporary_password + NEW_LINE
      + NEW_LINE
      + 'You can complete this process by visiting:' + NEW_LINE
      + NEW_LINE
      + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
      + server.UrlEncode(ConfigurationSettings.AppSettings['application_name']) + NEW_LINE
      + NEW_LINE
      + '-- ' + ConfigurationSettings.AppSettings['application_name']
      );
    //
    // Set Label_email_address.
    //
    Label_email_address.Text := email_address;
    //
  end;
end;

procedure TWebForm_new_password.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

