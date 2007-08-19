unit UserControl_serial_indicators_binder;

interface

uses
  ki_web_ui,
  Microsoft.Web.UI.WebControls,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_serial_indicator_length_of_service,
  UserControl_serial_indicator_num_core_ops_members,
  UserControl_serial_indicator_potential_crew_shifts,
  UserControl_serial_indicator_standard_enrollment,
  UserControl_serial_indicator_utilization;

type
  p_type =
    RECORD
    be_loaded: boolean;
    tab_index: cardinal;
    END;
  TWebUserControl_serial_indicators_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_serial_indicators_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabStrip1_SelectedIndexChange(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip1: Microsoft.Web.UI.WebControls.TabStrip;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_serial_indicators_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
  TSSI_NUM_CORE_OPS_MEMBERS = 0;
  TSSI_NUM_POTENTIAL_CREW_SHIFTS = 1;
  TSSI_ROSTER_UTILIZATION = 2;
  TSSI_CORE_OPS_COMMITMENT = 3;
  TSSI_MEDIAN_YEARS_OF_SERVICE = 4;

procedure TWebUserControl_serial_indicators_binder.Page_Load(sender: System.Object; e: System.EventArgs);
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

procedure TWebUserControl_serial_indicators_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_serial_indicators_binder.p'] <> nil)
    and (session['UserControl_serial_indicators_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_serial_indicators_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_NUM_CORE_OPS_MEMBERS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_num_core_ops_members(LoadControl('~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx')),
        'UserControl_serial_indicator_num_core_ops_members',
        PlaceHolder_content
        );
    TSSI_NUM_POTENTIAL_CREW_SHIFTS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_potential_crew_shifts(LoadControl('~/usercontrol/app/UserControl_serial_indicator_potential_crew_shifts.ascx')),
        'UserControl_serial_indicator_potential_crew_shifts',
        PlaceHolder_content
        );
    TSSI_ROSTER_UTILIZATION:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_utilization(LoadControl('~/usercontrol/app/UserControl_serial_indicator_utilization.ascx')),
        'UserControl_serial_indicator_utilization',
        PlaceHolder_content
        );
    TSSI_CORE_OPS_COMMITMENT:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_standard_enrollment(LoadControl('~/usercontrol/app/UserControl_serial_indicator_standard_enrollment.ascx')),
        'UserControl_serial_indicator_standard_enrollment',
        PlaceHolder_content
        );
    TSSI_MEDIAN_YEARS_OF_SERVICE:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_length_of_service(LoadControl('~/usercontrol/app/UserControl_serial_indicator_length_of_service.ascx')),
        'UserControl_serial_indicator_length_of_service',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := 0;
    //
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_serial_indicator_num_core_ops_members(LoadControl('~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx')).Fresh,
      'UserControl_serial_indicator_num_core_ops_members',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_serial_indicators_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip1.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
    TSSI_NUM_CORE_OPS_MEMBERS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_num_core_ops_members(LoadControl('~/usercontrol/app/UserControl_serial_indicator_num_core_ops_members.ascx')).Fresh,
        'UserControl_serial_indicator_num_core_ops_members',
        PlaceHolder_content
        );
    TSSI_NUM_POTENTIAL_CREW_SHIFTS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_potential_crew_shifts(LoadControl('~/usercontrol/app/UserControl_serial_indicator_potential_crew_shifts.ascx')).Fresh,
        'UserControl_serial_indicator_potential_crew_shifts',
        PlaceHolder_content
        );
    TSSI_ROSTER_UTILIZATION:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_utilization(LoadControl('~/usercontrol/app/UserControl_serial_indicator_utilization.ascx')).Fresh,
        'UserControl_serial_indicator_utilization',
        PlaceHolder_content
        );
    TSSI_CORE_OPS_COMMITMENT:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_standard_enrollment(LoadControl('~/usercontrol/app/UserControl_serial_indicator_standard_enrollment.ascx')).Fresh,
        'UserControl_serial_indicator_standard_enrollment',
        PlaceHolder_content
        );
    TSSI_MEDIAN_YEARS_OF_SERVICE:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicator_length_of_service(LoadControl('~/usercontrol/app/UserControl_serial_indicator_length_of_service.ascx')).Fresh,
        'UserControl_serial_indicator_length_of_service',
        PlaceHolder_content
        );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_serial_indicators_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_serial_indicators_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_serial_indicators_binder.TWebUserControl_serial_indicators_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_serial_indicators_binder.p');
  session.Add('UserControl_serial_indicators_binder.p',p);
end;

function TWebUserControl_serial_indicators_binder.Fresh: TWebUserControl_serial_indicators_binder;
begin
  session.Remove('UserControl_serial_indicators_binder.p');
  Fresh := self;
end;

end.
