unit UserControl_serial_indicator_potential_crew_shifts;

interface

uses
  Class_biz_agencies,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    be_loaded: boolean;
    biz_agencies: TClass_biz_agencies;
    END;
  TWebUserControl_serial_indicator_potential_crew_shifts = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_serial_indicator_potential_crew_shifts_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    DataGrid_control_charts: System.Web.UI.WebControls.DataGrid;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_serial_indicator_potential_crew_shifts;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration,
  system.io;

procedure TWebUserControl_serial_indicator_potential_crew_shifts.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_agencies.BindForControlCharts('crew_shifts_forecast',DataGrid_control_charts);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_serial_indicator_potential_crew_shifts.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_serial_indicator_potential_crew_shifts.p'] <> nil)
    and (session['UserControl_serial_indicator_potential_crew_shifts.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_serial_indicator_potential_crew_shifts.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_serial_indicator_potential_crew_shifts.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_serial_indicator_potential_crew_shifts_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_serial_indicator_potential_crew_shifts.TWebUserControl_serial_indicator_potential_crew_shifts_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_serial_indicator_potential_crew_shifts.p');
  session.Add('UserControl_serial_indicator_potential_crew_shifts.p',p);
end;

function TWebUserControl_serial_indicator_potential_crew_shifts.Fresh: TWebUserControl_serial_indicator_potential_crew_shifts;
begin
  session.Remove('UserControl_serial_indicator_potential_crew_shifts.p');
  Fresh := self;
end;

end.
