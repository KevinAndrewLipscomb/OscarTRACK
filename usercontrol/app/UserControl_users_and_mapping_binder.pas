unit UserControl_users_and_mapping_binder;

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
  UserControl_user,
  UserControl_user_member_mapping;

type
  p_type =
    RECORD
    be_loaded: boolean;
    content_id: string;
    tab_index: cardinal;
    END;
  TWebUserControl_users_and_mapping_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_users_and_mapping_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabStrip_control_SelectedIndexChange(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip_control: Microsoft.Web.UI.WebControls.TabStrip;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    UpdatePanel_control: System.Web.UI.UpdatePanel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_users_and_mapping_binder;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

const
  TSSI_USERS = 0;
  TSSI_USER_MEMBER_MAPPINGS = 1;

procedure TWebUserControl_users_and_mapping_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabStrip_control.selectedindex := p.tab_index;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_users_and_mapping_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_users_and_mapping_binder.p'] <> nil then begin
    p := p_type(session['UserControl_users_and_mapping_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_PlaceHolder_content']) = 'UserControl_users_and_mapping_binder');
    //
    if assigned(session['UserControl_users_and_mapping_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_users_and_mapping_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_users_and_mapping_binder_selected_tab');
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_USERS:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')),
        'UserControl_user',
        PlaceHolder_content
        );
    TSSI_USER_MEMBER_MAPPINGS:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_user_member_mapping(LoadControl('~/usercontrol/app/UserControl_user_member_mapping.ascx')),
        'UserControl_user_member_mapping',
        PlaceHolder_content
        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := TSSI_USERS;
    //
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')).Fresh,
      'UserControl_user',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_users_and_mapping_binder.TabStrip_control_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip_control.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_USERS:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')).Fresh,
      'UserControl_user',
      PlaceHolder_content
      );
  TSSI_USER_MEMBER_MAPPINGS:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user_member_mapping(LoadControl('~/usercontrol/app/UserControl_user_member_mapping.ascx')).Fresh,
      'UserControl_user_member_mapping',
      PlaceHolder_content
      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_users_and_mapping_binder.InitializeComponent;
begin
  Include(Self.TabStrip_control.SelectedIndexChange, Self.TabStrip_control_SelectedIndexChange);
  Include(Self.PreRender, Self.TWebUserControl_users_and_mapping_binder_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_users_and_mapping_binder.TWebUserControl_users_and_mapping_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_users_and_mapping_binder.p',p);
  //
end;

function TWebUserControl_users_and_mapping_binder.Fresh: TWebUserControl_users_and_mapping_binder;
begin
  session.Remove('UserControl_users_and_mapping_binder.p');
  Fresh := self;
end;

end.
