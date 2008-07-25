unit UserControl_update_progress_blocker;

interface

uses
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_update_progress_blocker = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
  strict protected
    UpdateProgress_control: System.Web.UI.UpdateProgress;
    Image_processing_indicator: System.Web.UI.WebControls.Image;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
  end;

implementation

procedure TWebUserControl_update_progress_blocker.OnInit(e: System.EventArgs);
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
procedure TWebUserControl_update_progress_blocker.InitializeComponent;
begin
end;
{$ENDREGION}

end.
