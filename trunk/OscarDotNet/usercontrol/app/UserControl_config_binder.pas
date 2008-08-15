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
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    be_loaded: boolean;
    content_id: string;
    tab_index: cardinal;
    END;
  TWebUserControl_config_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_config_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabStrip_control_SelectedIndexChange(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip_control: Microsoft.Web.UI.WebControls.TabStrip;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
  protected
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
  kix,
  System.Collections,
  system.configuration,
  UserControl_agency,
  UserControl_roles_and_matrices_binder,
  UserControl_users_and_mapping_binder;

const
  TSSI_ROLES_AND_MATRICES = 0;
  TSSI_USERS_AND_MAPPING = 1;
  TSSI_AGENCIES = 2;

procedure TWebUserControl_config_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    if Has(string_array(session['privilege_array']),'config-users') then begin
      TabStrip_control.items[TSSI_USERS_AND_MAPPING].enabled := TRUE;
    end;
    if Has(string_array(session['privilege_array']),'config-agencies') then begin
      TabStrip_control.items[TSSI_AGENCIES].enabled := TRUE;
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
    TSSI_ROLES_AND_MATRICES:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')),
        'UserControl_roles_and_matrices_binder',
        PlaceHolder_content
        );
    TSSI_USERS_AND_MAPPING:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_users_and_mapping_binder(LoadControl('~/usercontrol/app/UserControl_users_and_mapping_binder.ascx')),
        'UserControl_users_and_mapping_binder',
        PlaceHolder_content
        );
    TSSI_AGENCIES:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_agency(LoadControl('~/usercontrol/app/UserControl_agency.ascx')),
        'UserControl_agency',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_ROLES_AND_MATRICES;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')).Fresh,
      'UserControl_roles_and_matrices_binder',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.TabStrip_control_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip_control.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_ROLES_AND_MATRICES:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_roles_and_matrices_binder(LoadControl('~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx')).Fresh,
      'UserControl_roles_and_matrices_binder',
      PlaceHolder_content
      );
  TSSI_USERS_AND_MAPPING:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_users_and_mapping_binder(LoadControl('~/usercontrol/app/UserControl_users_and_mapping_binder.ascx')).Fresh,
      'UserControl_users_and_mapping_binder',
      PlaceHolder_content
      );
  TSSI_AGENCIES:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_agency(LoadControl('~/usercontrol/app/UserControl_agency.ascx')).Fresh,
      'UserControl_agency',
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
  Include(Self.TabStrip_control.SelectedIndexChange, Self.TabStrip_control_SelectedIndexChange);
  Include(Self.PreRender, Self.TWebUserControl_config_binder_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_config_binder.TWebUserControl_config_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_config_binder.p',p);
  //
end;

function TWebUserControl_config_binder.Fresh: TWebUserControl_config_binder;
begin
  session.Remove('UserControl_config_binder.p');
  Fresh := self;
end;

end.
