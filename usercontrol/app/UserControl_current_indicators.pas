unit UserControl_current_indicators;

interface

uses
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_ranked_commensuration,
  UserControl_ranked_core_ops_size,
  UserControl_ranked_crew_shifts_forecast,
  UserControl_ranked_length_of_service,
  UserControl_ranked_num_members_in_pipeline,
  UserControl_ranked_standard_enrollment,
  UserControl_ranked_utilization;

type
  p_type =
    RECORD
    be_loaded: boolean;
    END;
  TWebUserControl_current_indicators = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_current_indicators_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    PlaceHolder_ranked_core_ops_size: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_utilization: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_length_of_service: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_crew_shifts_forecast: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_standard_enrollment: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_commensuration: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_num_members_in_pipeline: System.Web.UI.WebControls.PlaceHolder;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_current_indicators;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

procedure TWebUserControl_current_indicators.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_current_indicators.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_current_indicators.p'] <> nil)
    and (session['UserControl_current_indicators.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_current_indicators.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    PlaceHolder_ranked_core_ops_size.controls.Add(TWebUserControl_ranked_core_ops_size(LoadControl('~/usercontrol/app/UserControl_ranked_core_ops_size.ascx')).Fresh);
    PlaceHolder_ranked_crew_shifts_forecast.controls.Add(TWebUserControl_ranked_crew_shifts_forecast(LoadControl('~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx')).Fresh);
    PlaceHolder_ranked_standard_enrollment.controls.Add(TWebUserControl_ranked_standard_enrollment(LoadControl('~/usercontrol/app/UserControl_ranked_standard_enrollment.ascx')).Fresh);
    PlaceHolder_ranked_utilization.controls.Add(TWebUserControl_ranked_utilization(LoadControl('~/usercontrol/app/UserControl_ranked_utilization.ascx')).Fresh);
    PlaceHolder_ranked_length_of_service.controls.Add(TWebUserControl_ranked_length_of_service(LoadControl('~/usercontrol/app/UserControl_ranked_length_of_service.ascx')).Fresh);
    PlaceHolder_ranked_commensuration.controls.Add(TWebUserControl_ranked_commensuration(LoadControl('~/usercontrol/app/UserControl_ranked_commensuration.ascx')).Fresh);
    PlaceHolder_ranked_num_members_in_pipeline.controls.Add(TWebUserControl_ranked_num_members_in_pipeline(LoadControl('~/usercontrol/app/UserControl_ranked_num_members_in_pipeline.ascx')).Fresh);
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_current_indicators.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_current_indicators_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_current_indicators.TWebUserControl_current_indicators_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_current_indicators.p');
  session.Add('UserControl_current_indicators.p',p);
end;

function TWebUserControl_current_indicators.Fresh: TWebUserControl_current_indicators;
begin
  session.Remove('UserControl_current_indicators.p');
  Fresh := self;
end;

end.
