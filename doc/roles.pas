unit roles;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration,
  kix,
  ki_web_ui;

type
  p_type =
    RECORD
    END;
  TWebForm_roles = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_roles_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
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
procedure TWebForm_roles.InitializeComponent;
begin
  Include(Self.PreRender, Self.TWebForm_roles_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_roles.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    Title.InnerText := server.HtmlEncode(configurationmanager.appsettings['application_name']) + ' - roles';
  end;
end;

procedure TWebForm_roles.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['roles.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['roles.p']);
  end else begin
    //
    //
  end;
  //
end;

procedure TWebForm_roles.TWebForm_roles_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('roles.p',p);
end;

end.

