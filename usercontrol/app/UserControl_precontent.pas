unit UserControl_precontent;

interface

uses
  ki_web_ui,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_precontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Label_username: System.Web.UI.WebControls.Label;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    TableRow_account_control: System.Web.UI.HtmlControls.HtmlTableRow;
    ValidationSummary_control: System.Web.UI.WebControls.ValidationSummary;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix,
  system.configuration,
  system.io,
  system.web,
  system.web.security;

procedure TWebUserControl_precontent.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    Label_application_name.text := configurationmanager.appsettings['application_name'];
    if not assigned(session['username']) then begin
      TableRow_account_control.visible := FALSE;
    end else begin
      Label_username.text := session['username'].tostring;
    end;
    //
  end;
  //
end;

procedure TWebUserControl_precontent.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
end;

procedure TWebUserControl_precontent.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo(ExpandTildePath('~/protected/change_email_address.aspx'));
end;

procedure TWebUserControl_precontent.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo(ExpandTildePath('~/protected/change_password.aspx'));
end;

procedure TWebUserControl_precontent.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer(ExpandTildePath('~/Default.aspx'));
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_precontent.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

end.
