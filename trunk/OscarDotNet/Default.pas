unit Default;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  kix,
  system.configuration,
  system.security.principal;

type
  TWebForm_Default = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_application_name: System.Web.UI.WebControls.Label;
    HyperLink_login: System.Web.UI.WebControls.HyperLink;
  protected
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
procedure TWebForm_Default.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_Default.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - Default';
    Label_application_name.text := configurationmanager.AppSettings['application_name'];
    //
    response.Redirect('~/protected/overview.aspx');
    //
  end;
end;

procedure TWebForm_Default.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

