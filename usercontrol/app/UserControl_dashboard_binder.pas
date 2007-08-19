unit UserControl_dashboard_binder;

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
  UserControl_current_indicators,
  UserControl_serial_indicators_binder;

type
  p_type =
    RECORD
    be_loaded: boolean;
    tab_index: cardinal;
    END;
  TWebUserControl_dashboard_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_dashboard_binder_PreRender(sender: System.Object;
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
  published
    function Fresh: TWebUserControl_dashboard_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
  TSSI_CURRENT = 0;
  TSSI_SERIAL = 1;

procedure TWebUserControl_dashboard_binder.Page_Load(sender: System.Object; e: System.EventArgs);
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

procedure TWebUserControl_dashboard_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_dashboard_binder.p'] <> nil)
    and (session['UserControl_dashboard_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_dashboard_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_CURRENT:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_current_indicators(LoadControl('~/usercontrol/app/UserControl_current_indicators.ascx')),
        'UserControl_current_indicators',
        PlaceHolder_content
        );
    TSSI_SERIAL:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_serial_indicators_binder(LoadControl('~/usercontrol/app/UserControl_serial_indicators_binder.ascx')),
        'UserControl_serial_indicators_binder',
        PlaceHolder_content
        );
    end;
    //
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := 0;
    //
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_current_indicators(LoadControl('~/usercontrol/app/UserControl_current_indicators.ascx')).Fresh,
      'UserControl_current_indicators',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_dashboard_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  p.tab_index := TabStrip1.selectedindex;
  PlaceHolder_content.controls.Clear;
  case p.tab_index of
  TSSI_CURRENT:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_current_indicators(LoadControl('~/usercontrol/app/UserControl_current_indicators.ascx')).Fresh,
      'UserControl_current_indicators',
      PlaceHolder_content
      );
  TSSI_SERIAL:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_serial_indicators_binder(LoadControl('~/usercontrol/app/UserControl_serial_indicators_binder.ascx')).Fresh,
      'UserControl_serial_indicators_binder',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_dashboard_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_dashboard_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_dashboard_binder.TWebUserControl_dashboard_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_dashboard_binder.p');
  session.Add('UserControl_dashboard_binder.p',p);
end;

function TWebUserControl_dashboard_binder.Fresh: TWebUserControl_dashboard_binder;
begin
  session.Remove('UserControl_dashboard_binder.p');
  Fresh := self;
end;

end.
