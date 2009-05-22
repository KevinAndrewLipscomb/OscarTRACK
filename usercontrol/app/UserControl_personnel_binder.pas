unit UserControl_personnel_binder;
  // Derived from KiAspdotnetFramework/UserControl/app/UserControl~personnel~binder.pas

interface

uses
  AjaxControlToolkit,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_personnel_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_personnel_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabContainer_control_ActiveTabChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        content_id: string;
        tab_index: cardinal;
        END;
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabContainer_control: AjaxControlToolkit.TabContainer;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    TabPanel_roster: tabpanel;
    TabPanel_results: tabpanel;
    TabPanel_dashboard: tabpanel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_personnel_binder;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration,
  UserControl_roster,
  UserControl_commensuration,
  UserControl_dashboard_binder;

const
  TSSI_ROSTER = 0;
  TSSI_RESULTS = 1;
  TSSI_DASHBOARD = 2;

procedure TWebUserControl_personnel_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabContainer_control.activetabindex := p.tab_index;
    //
    if Has(string_array(session['privilege_array']),'enter-actual-crew-shifts') then begin
      TabPanel_results.enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_personnel_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_personnel_binder.p'] <> nil then begin
    p := p_type(session['UserControl_personnel_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_PlaceHolder_content']) = 'UserControl_personnel_binder');
    //
    if assigned(session['UserControl_personnel_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_personnel_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_personnel_binder_selected_tab');
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_ROSTER:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')),
        'UserControl_roster',
        PlaceHolder_content
        );
    TSSI_RESULTS:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_commensuration(LoadControl('~/usercontrol/app/UserControl_commensuration.ascx')),
        'UserControl_commensuration',
        PlaceHolder_content
        );
    TSSI_DASHBOARD:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_dashboard_binder(LoadControl('~/usercontrol/app/UserControl_dashboard_binder.ascx')),
        'UserControl_dashboard_binder',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_ROSTER;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')), // NO .Fresh call -- special treatment
      'UserControl_roster',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_personnel_binder.TabContainer_control_ActiveTabChanged(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabContainer_control.activetabindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_ROSTER:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')), // NO .Fresh call -- special treatment
      'UserControl_roster',
      PlaceHolder_content
      );
  TSSI_RESULTS:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_commensuration(LoadControl('~/usercontrol/app/UserControl_commensuration.ascx')).Fresh,
      'UserControl_commensuration',
      PlaceHolder_content
      );
  TSSI_DASHBOARD:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_dashboard_binder(LoadControl('~/usercontrol/app/UserControl_dashboard_binder.ascx')).Fresh,
      'UserControl_dashboard_binder',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_personnel_binder.InitializeComponent;
begin
  Include(Self.TabContainer_control.ActiveTabChanged, Self.TabContainer_control_ActiveTabChanged);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_personnel_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_personnel_binder.TWebUserControl_personnel_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_personnel_binder.p',p);
  //
end;

function TWebUserControl_personnel_binder.Fresh: TWebUserControl_personnel_binder;
begin
  session.Remove('UserControl_personnel_binder.p');
  Fresh := self;
end;

end.
