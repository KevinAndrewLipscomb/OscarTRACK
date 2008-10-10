unit UserControl_user;

interface

uses
  Class_biz_users,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  TWebUserControl_user = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_user_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_lookup_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_new_record_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_username_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        be_ok_to_config_users: boolean;
        biz_users: TClass_biz_users;
        END;
  strict private
    p: p_type;
    procedure Clear;
    procedure ManageDependentFieldEnablements;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(username: string): boolean;
    procedure SetLookupMode;
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    Button_lookup: System.Web.UI.WebControls.Button;
    LinkButton_new_record: System.Web.UI.WebControls.LinkButton;
    Label_lookup_arrow: &label;
    Label_lookup_hint: &label;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_username: System.Web.UI.WebControls.TextBox;
    DropDownList_username: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_username: System.Web.UI.WebControls.RequiredFieldValidator;
    TextBox_encoded_password: System.Web.UI.WebControls.TextBox;
    CheckBox_be_stale_password: System.Web.UI.WebControls.CheckBox;
    TextBox_password_reset_email_address: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_password_reset_email_address: System.Web.UI.WebControls.RequiredFieldValidator;
    CheckBox_be_active: System.Web.UI.WebControls.CheckBox;
    TextBox_num_unsuccessful_login_attempts: System.Web.UI.WebControls.TextBox;
    TextBox_last_login: System.Web.UI.WebControls.TextBox;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_user;
  end;

implementation

uses
  appcommon,
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_user.Clear;
begin
  //
  TextBox_username.text := EMPTY;
  DropDownList_username.visible := FALSE;
  TextBox_encoded_password.text := EMPTY;
  CheckBox_be_stale_password.checked := FALSE;
  TextBox_password_reset_email_address.text := EMPTY;
  CheckBox_be_active.checked := FALSE;
  TextBox_num_unsuccessful_login_attempts.text := EMPTY;
  TextBox_last_login.text := EMPTY;
  //
  // Disable dependent fields.
  //
  CheckBox_be_stale_password.enabled := FALSE;
  TextBox_password_reset_email_address.enabled := FALSE;
  CheckBox_be_active.enabled := FALSE;
  //
  Button_submit.enabled := FALSE;
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_user.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    LinkButton_new_record.visible := p.be_ok_to_config_users;
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_username,TRUE);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

function TWebUserControl_user.PresentRecord(username: string): boolean;
var
  encoded_password: string;
  be_stale_password: boolean;
  password_reset_email_address: string;
  be_active: boolean;
  num_unsuccessful_login_attempts: uint32;
  last_login: string;
begin
  PresentRecord := FALSE;
  if p.biz_users.Get
    (
    username,
    encoded_password,
    be_stale_password,
    password_reset_email_address,
    be_active,
    num_unsuccessful_login_attempts,
    last_login
    )
  then begin
    //
    TextBox_username.text := username;
    TextBox_encoded_password.text := encoded_password;
    CheckBox_be_stale_password.checked := be_stale_password;
    TextBox_password_reset_email_address.text := password_reset_email_address;
    CheckBox_be_active.checked := be_active;
    TextBox_num_unsuccessful_login_attempts.text := num_unsuccessful_login_attempts.tostring;
    TextBox_last_login.text := last_login;
    //
    TextBox_username.enabled := FALSE;
    Button_lookup.enabled := FALSE;
    Label_lookup_arrow.enabled := FALSE;
    Label_lookup_hint.enabled := FALSE;
    LinkButton_reset.enabled := TRUE;
    ManageDependentFieldEnablements;
    Button_submit.enabled := p.be_ok_to_config_users;
    Button_delete.enabled := p.be_ok_to_config_users;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_user.SetLookupMode;
begin
  Clear;
  TextBox_username.enabled := TRUE;
  Button_lookup.enabled := TRUE;
  Label_lookup_arrow.enabled := TRUE;
  Label_lookup_hint.enabled := TRUE;
  LinkButton_reset.enabled := FALSE;
  LinkButton_new_record.enabled := p.be_ok_to_config_users;
  Focus(TextBox_username,TRUE);
end;

procedure TWebUserControl_user.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_user.p'] <> nil)
    and (session['UserControl_user.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_user.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_users := TClass_biz_users.Create;
    //
    p.be_ok_to_config_users := Has(string_array(session['privilege_array']),'config-users');
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_user.InitializeComponent;
begin
  Include(Self.Button_lookup.Click, Self.Button_lookup_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.LinkButton_new_record.Click, Self.LinkButton_new_record_Click);
  Include(Self.DropDownList_username.SelectedIndexChanged, Self.DropDownList_username_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.PreRender, Self.TWebUserControl_user_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_user.TWebUserControl_user_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_user.p',p);
end;

function TWebUserControl_user.Fresh: TWebUserControl_user;
begin
  session.Remove('UserControl_user.p');
  Fresh := self;
end;

procedure TWebUserControl_user.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    p.biz_users.&Set
      (
      Safe(TextBox_username.text,PUNCTUATED),
      CheckBox_be_stale_password.checked,
      Safe(TextBox_password_reset_email_address.text,PUNCTUATED),
      CheckBox_be_active.checked
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
    SetLookupMode;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebUserControl_user.DropDownList_username_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(DropDownList_username.selectedvalue);
end;

procedure TWebUserControl_user.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_users.Delete(Safe(TextBox_username.text,ALPHANUM));
  SetLookupMode;
end;

procedure TWebUserControl_user.LinkButton_new_record_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_username.enabled := p.be_ok_to_config_users;
  Button_lookup.enabled := FALSE;
  Label_lookup_arrow.enabled := FALSE;
  Label_lookup_hint.enabled := FALSE;
  LinkButton_reset.enabled := TRUE;
  LinkButton_new_record.enabled := FALSE;
  ManageDependentFieldEnablements;
  Button_submit.enabled := p.be_ok_to_config_users;
  Button_delete.enabled := FALSE;
  Focus(TextBox_username,TRUE);
end;

procedure TWebUserControl_user.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SetLookupMode;
end;

procedure TWebUserControl_user.ManageDependentFieldEnablements;
begin
  CheckBox_be_stale_password.enabled := p.be_ok_to_config_users;
  TextBox_password_reset_email_address.enabled := p.be_ok_to_config_users;
  CheckBox_be_active.enabled := p.be_ok_to_config_users;
end;

procedure TWebUserControl_user.Button_lookup_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_username: string;
begin
  saved_username := TextBox_username.text;
  Clear;
  if not PresentRecord(saved_username) then begin
    TextBox_username.text := saved_username;
    p.biz_users.Bind(saved_username,DropDownList_username);
    num_matches := DropDownList_username.items.count;
    if num_matches > 0 then begin
      DropDownList_username.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_username.selectedvalue);
      end else begin
        DropDownList_username.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

end.
