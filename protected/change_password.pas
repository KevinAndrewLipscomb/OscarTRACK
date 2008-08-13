unit change_password;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, kix, mysql.data.mysqlclient, system.configuration,
  system.web.security,
  Class_biz_users,
  Class_biz_user;

type
  p_type =
    RECORD
    biz_users: TClass_biz_users;
    biz_user: TClass_biz_user;
    END;
  TWebForm_change_password = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_change_password_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Button_submit: System.Web.UI.WebControls.Button;
    TextBox_nominal_password: System.Web.UI.WebControls.TextBox;
    TextBox_confirmation_password: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_nominal_password: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_confirmation_password: System.Web.UI.WebControls.RequiredFieldValidator;
    CompareValidator1: System.Web.UI.WebControls.CompareValidator;
    RegularExpressionValidator_password: System.Web.UI.WebControls.RegularExpressionValidator;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_password.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_password_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_password.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if IsPostback then begin
    if assigned(session['change_password.p']) then begin
      p := p_type(session['change_password.p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - change_password';
    //
    p.biz_users := TClass_biz_users.Create;
    p.biz_user := TClass_biz_user.Create;
    //
    Focus(TextBox_nominal_password);
    //
  end;
end;

procedure TWebForm_change_password.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_change_password.TWebForm_change_password_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('change_password.p',p);
end;

procedure TWebForm_change_password.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_users.SetPassword(p.biz_user.IdNum,kix.Digest(Safe(TextBox_nominal_password.Text.trim,ALPHANUM)));
  server.Transfer('overview.aspx');
end;

end.

