unit UserControl_roles_and_matrices_binder;

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
  UserControl_role,
  UserControl_role_member_mapping,
  UserControl_role_notification_mapping,
  UserControl_role_privilege_mapping;

type
  p_type =
    RECORD
    be_loaded: boolean;
    content_id: string;
    tab_index: cardinal;
    END;
  TWebUserControl_roles_and_matrices_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_roles_and_matrices_binder_PreRender(sender: System.Object;
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
    function Fresh: TWebUserControl_roles_and_matrices_binder;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

const
  TSSI_ROLES = 0;
  TSSI_ROLE_MEMBER_MAPPING = 1;
  TSSI_ROLE_PRIVILEGE_MAPPING = 2;
  TSSI_ROLE_NOTIFICATION_MAPPING = 3;

procedure TWebUserControl_roles_and_matrices_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabStrip_control.selectedindex := p.tab_index;
    //
    if Has(string_array(session['privilege_array']),'config-roles-and-matrices') then begin
      TabStrip_control.items[TSSI_ROLES].enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_roles_and_matrices_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_roles_and_matrices_binder.p'] <> nil then begin
    p := p_type(session['UserControl_roles_and_matrices_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_PlaceHolder_content']) = 'UserControl_roles_and_matrices_binder');
    //
    if assigned(session['UserControl_roles_and_matrices_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_roles_and_matrices_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_roles_and_matrices_binder_selected_tab');
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_ROLES:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_role(LoadControl('~/usercontrol/app/UserControl_role.ascx')),
        'UserControl_role',
        PlaceHolder_content
        );
    TSSI_ROLE_MEMBER_MAPPING:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_role_member_mapping(LoadControl('~/usercontrol/app/UserControl_role_member_mapping.ascx')),
        'UserControl_role_member_mapping',
        PlaceHolder_content
        );
    TSSI_ROLE_PRIVILEGE_MAPPING:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_role_privilege_mapping(LoadControl('~/usercontrol/app/UserControl_role_privilege_mapping.ascx')),
        'UserControl_role_privilege_mapping',
        PlaceHolder_content
        );
    TSSI_ROLE_NOTIFICATION_MAPPING:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_role_notification_mapping(LoadControl('~/usercontrol/app/UserControl_role_notification_mapping.ascx')),
        'UserControl_role_notification_mapping',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_ROLES;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_role(LoadControl('~/usercontrol/app/UserControl_role.ascx')).Fresh,
      'UserControl_role',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_roles_and_matrices_binder.TabStrip_control_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip_control.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_ROLES:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_role(LoadControl('~/usercontrol/app/UserControl_role.ascx')).Fresh,
      'UserControl_role',
      PlaceHolder_content
      );
  TSSI_ROLE_MEMBER_MAPPING:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_role_member_mapping(LoadControl('~/usercontrol/app/UserControl_role_member_mapping.ascx')).Fresh,
      'UserControl_role_member_mapping',
      PlaceHolder_content
      );
  TSSI_ROLE_PRIVILEGE_MAPPING:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_role_privilege_mapping(LoadControl('~/usercontrol/app/UserControl_role_privilege_mapping.ascx')).Fresh,
      'UserControl_role_privilege_mapping',
      PlaceHolder_content
      );
  TSSI_ROLE_NOTIFICATION_MAPPING:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_role_notification_mapping(LoadControl('~/usercontrol/app/UserControl_role_notification_mapping.ascx')).Fresh,
      'UserControl_role_notification_mapping',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_roles_and_matrices_binder.InitializeComponent;
begin
  Include(Self.TabStrip_control.SelectedIndexChange, Self.TabStrip_control_SelectedIndexChange);
  Include(Self.PreRender, Self.TWebUserControl_roles_and_matrices_binder_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_roles_and_matrices_binder.TWebUserControl_roles_and_matrices_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_roles_and_matrices_binder.p',p);
  //
end;

function TWebUserControl_roles_and_matrices_binder.Fresh: TWebUserControl_roles_and_matrices_binder;
begin
  session.Remove('UserControl_roles_and_matrices_binder.p');
  Fresh := self;
end;

end.
