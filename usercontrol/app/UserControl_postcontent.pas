unit UserControl_postcontent;
//
// UserControl_postcontent must not attempt to access session state because UserControl_postcontent is invoked on the timeout page
// and session state is by definition nonexistent in a timeout situation.
//

interface

uses
  ki_web_ui;

type
  TWebUserControl_postcontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
  {$ENDREGION}
  strict private
  strict protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

procedure TWebUserControl_postcontent.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  inherited OnInit(e);
  //
end;

end.
