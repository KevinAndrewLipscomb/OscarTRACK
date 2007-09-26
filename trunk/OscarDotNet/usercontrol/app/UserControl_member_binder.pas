unit UserControl_member_binder;

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
  UserControl_about,
  UserControl_commensuration,
  UserControl_config_binder,
  UserControl_dashboard_binder,
  UserControl_roster;

type
  p_type =
    RECORD
    be_loaded: boolean;
    content_id: string;
    tab_index: cardinal;
    END;
  TWebUserControl_member_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_member_binder_PreRender(sender: System.Object;
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
    function Fresh: TWebUserControl_member_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
  TSSI_RESOURCES = 0;
  TSSI_RESULTS = 1;
  TSSI_DASHBOARD = 2;
  TSSI_CONFIG = 3;
  TSSI_ABOUT = 4;

procedure TWebUserControl_member_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    if Has(string_array(session['privilege_array']),'enter-actual-crew-shifts') then begin
      TabStrip1.items[TSSI_RESULTS].enabled := TRUE;
    end;
    if Has(string_array(session['privilege_array']),'config-users')
      or Has(string_array(session['privilege_array']),'config-agencies')
    then begin
      TabStrip1.items[TSSI_CONFIG].enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_member_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_member_binder.p'] <> nil)
    and (session['UserControl_member_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_member_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_RESOURCES:
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
    TSSI_CONFIG:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_config_binder(LoadControl('~/usercontrol/app/UserControl_config_binder.ascx')),
        'UserControl_config',
        PlaceHolder_content
        );
    TSSI_ABOUT:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_about(LoadControl('~/usercontrol/app/UserControl_about.ascx')),
        'UserControl_about',
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
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')),
      'UserControl_roster',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_member_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip1.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_RESOURCES:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')),
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
  TSSI_CONFIG:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_config_binder(LoadControl('~/usercontrol/app/UserControl_config_binder.ascx')).Fresh,
      'UserControl_config',
      PlaceHolder_content
      );
  TSSI_ABOUT:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_about(LoadControl('~/usercontrol/app/UserControl_about.ascx')).Fresh,
      'UserControl_about',
      PlaceHolder_content
      );
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_member_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_member_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_member_binder.TWebUserControl_member_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  session.Remove(PlaceHolder_content.clientid);
  session.Add(PlaceHolder_content.clientid,p.content_id);
  //
  session.Remove('UserControl_member_binder.p');
  session.Add('UserControl_member_binder.p',p);
  //
end;

function TWebUserControl_member_binder.Fresh: TWebUserControl_member_binder;
begin
  session.Remove('UserControl_member_binder.p');
  Fresh := self;
end;

end.
