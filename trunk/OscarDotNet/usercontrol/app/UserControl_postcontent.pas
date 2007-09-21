unit UserControl_postcontent;
//
// UserControl_postcontent must not attempt to access session state because UserControl_postcontent is invoked on the timeout page
// and session state is by definition nonexistent in a timeout situation.
//

interface

uses
  ki_web_ui, System.Web.UI.HtmlControls, System.Web.UI.WebControls;

type
  TWebUserControl_postcontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

procedure TWebUserControl_postcontent.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    //
  end;
  //
end;

procedure TWebUserControl_postcontent.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_postcontent.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

end.
