unit new_user_registration;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration,
  Class_biz_users,
  ki,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_users: TClass_biz_users;
    END;
  TWebForm_new_user_registration = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_new_user_registration_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure CustomValidator_username_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure CustomValidator_email_address_domain_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure CustomValidator_email_address_novelty_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_application_name: System.Web.UI.WebControls.Label;
    TextBox_email_address: System.Web.UI.WebControls.TextBox;
    Button_submit: System.Web.UI.WebControls.Button;
    RequiredFieldValidator_username: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_nominal_password: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_confirmation_password: System.Web.UI.WebControls.RequiredFieldValidator;
    TextBox_username: System.Web.UI.WebControls.TextBox;
    TextBox_nominal_password: System.Web.UI.WebControls.TextBox;
    TextBox_confirmation_password: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_email_address: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_username: System.Web.UI.WebControls.RegularExpressionValidator;
    RegularExpressionValidator_nominal_password: System.Web.UI.WebControls.RegularExpressionValidator;
    RegularExpressionValidator_email_address: System.Web.UI.WebControls.RegularExpressionValidator;
    CustomValidator_username: System.Web.UI.WebControls.CustomValidator;
    CustomValidator_email_address_novelty: System.Web.UI.WebControls.CustomValidator;
    CustomValidator_email_address_domain: System.Web.UI.WebControls.CustomValidator;
    CompareValidator_confirmation_password: System.Web.UI.WebControls.CompareValidator;
    Button_cancel: System.Web.UI.WebControls.Button;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  system.web.security;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_new_user_registration.InitializeComponent;
begin
  Include(Self.CustomValidator_username.ServerValidate, Self.CustomValidator_username_ServerValidate);
  Include(Self.CustomValidator_email_address_domain.ServerValidate, Self.CustomValidator_email_address_domain_ServerValidate);
  Include(Self.CustomValidator_email_address_novelty.ServerValidate, Self.CustomValidator_email_address_novelty_ServerValidate);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_new_user_registration_PreRender);
end;
{$ENDREGION}

procedure TWebForm_new_user_registration.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['new_user_registration.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['new_user_registration.p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - new_user_registration';
      //
      p.biz_users := TClass_biz_users.Create;
      //
      Label_application_name.text := configurationsettings.appsettings['application_name'];
      //
    end;
  end;
end;

procedure TWebForm_new_user_registration.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_new_user_registration.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('login.aspx');
end;

procedure TWebForm_new_user_registration.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  username: string;
begin
  if page.isvalid then begin
    username := Safe(TextBox_username.text,HYPHENATED_UNDERSCORED_ALPHANUM);
    p.biz_users.RegisterNew
      (
      username,
      Digest(Safe(TextBox_nominal_password.text,HYPHENATED_UNDERSCORED_ALPHANUM)),
      Safe(TextBox_email_address.text,EMAIL_ADDRESS)
      );
    session.Remove('username');
    session.Add('username',username);
    session.Remove('user_id');
    session.Add('user_id',p.biz_users.IdOf(username));
    formsauthentication.RedirectFromLoginPage(username,FALSE);
  end else begin
    ValidationAlert;
  end;
end;

procedure TWebForm_new_user_registration.CustomValidator_email_address_novelty_ServerValidate(source: System.Object; 
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := not p.biz_users.BeRegisteredEmailAddress(Safe(args.value,EMAIL_ADDRESS));
end;

procedure TWebForm_new_user_registration.CustomValidator_email_address_domain_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := ki.BeValidDomainPartOfEmailAddress(args.value);
end;

procedure TWebForm_new_user_registration.CustomValidator_username_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := not p.biz_users.BeRegisteredUsername(Safe(args.value,HYPHENATED_UNDERSCORED_ALPHANUM));
end;

procedure TWebForm_new_user_registration.TWebForm_new_user_registration_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('new_user_registration.p');
  session.Add('new_user_registration.p',p);
end;

end.

