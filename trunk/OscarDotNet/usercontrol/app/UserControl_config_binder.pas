unit UserControl_config_binder;

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
  UserControl_agency,
  UserControl_user,
  UserControl_config_welcome;

type
  p_type =
    RECORD
    be_loaded: boolean;
    tab_index: cardinal;
    END;
  TWebUserControl_config_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_config_binder_PreRender(sender: System.Object;
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
    function Fresh: TWebUserControl_config_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
  TSSI_WELCOME = 0;
  TSSI_AGENCIES = 1;
  TSSI_USERS = 2;

procedure TWebUserControl_config_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    if Has(string_array(session['privilege_array']),'config-agencies') then begin
      TabStrip1.items[TSSI_AGENCIES].enabled := TRUE;
    end;
    if Has(string_array(session['privilege_array']),'config-users') then begin
      TabStrip1.items[TSSI_USERS].enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_config_binder.p'] <> nil)
    and (session['UserControl_config_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_config_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_WELCOME:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_config_welcome(LoadControl('~/usercontrol/ki/UserControl_config_welcome.ascx')),
        'UserControl_config_welcome',
        PlaceHolder_content
        );
    TSSI_AGENCIES:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_agency(LoadControl('~/usercontrol/app/UserControl_agency.ascx')),
        'UserControl_agency',
        PlaceHolder_content
        );
    TSSI_USERS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')),
        'UserControl_user',
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
      TWebUserControl_config_welcome(LoadControl('~/usercontrol/ki/UserControl_config_welcome.ascx')).Fresh,
      'UserControl_config_welcome',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip1.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_WELCOME:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_config_welcome(LoadControl('~/usercontrol/ki/UserControl_config_welcome.ascx')).Fresh,
      'UserControl_config_welcome',
      PlaceHolder_content
      );
  TSSI_AGENCIES:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_agency(LoadControl('~/usercontrol/app/UserControl_agency.ascx')).Fresh,
      'UserControl_agency',
      PlaceHolder_content
      );
  TSSI_USERS:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')).Fresh,
      'UserControl_user',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_config_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_config_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_config_binder.TWebUserControl_config_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_config_binder.p');
  session.Add('UserControl_config_binder.p',p);
end;

function TWebUserControl_config_binder.Fresh: TWebUserControl_config_binder;
begin
  session.Remove('UserControl_config_binder.p');
  Fresh := self;
end;

end.
