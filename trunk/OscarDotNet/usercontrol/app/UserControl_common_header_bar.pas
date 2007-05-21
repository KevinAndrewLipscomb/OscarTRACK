unit UserControl_common_header_bar;

interface

uses
  ki_web_ui,
  System.Web.UI.WebControls;

type
    /// <summary>
    /// Summary description for WebUserControl1.
    /// </summary>
  TWebUserControl_common_header_bar = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  system.configuration;
 
procedure TWebUserControl_common_header_bar.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  Label_application_name.text := configurationsettings.appsettings['application_name'];
end;

procedure TWebUserControl_common_header_bar.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_common_header_bar.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}


end.
