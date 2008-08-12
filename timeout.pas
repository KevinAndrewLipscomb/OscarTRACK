unit timeout;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, kix, system.configuration,
  system.web.mail,
  ki_web_ui;

type
  TWebForm_timeout = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    property UICulture;
  end;

implementation

uses
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_timeout.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_timeout.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      //
      // Use response.Redirect instead of server.Transfer to, I hope, force IsPostback to FALSE in the target login form.  The
      // sequence of login -> timeout -> login may have been allowing IsPostback to stay TRUE through, which I had not anticipated.
      //
      response.Redirect('~/login.aspx');
      //
    end;
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - timeout';
  end;
end;

procedure TWebForm_timeout.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

