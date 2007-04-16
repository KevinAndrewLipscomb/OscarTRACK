unit UserControl_postcontent;

interface

uses
  System.Web.UI;

type
  TWebUserControl_postcontent = class(system.web.ui.usercontrol)
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
