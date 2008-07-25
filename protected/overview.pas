unit overview;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, kix,
  System.Data.Common, mysql.data.mysqlclient, System.Globalization,
  system.configuration, system.web.security,
  Class_biz_members,
  Class_biz_user,
  Class_biz_users,
  sstchur.web.SmartNav,
  UserControl_establish_membership,
  UserControl_print_div,
  UserControl_member_binder;

type
  p_type =
    RECORD
    biz_user: TClass_biz_user;
    biz_users: TClass_biz_users;
    biz_members: TClass_biz_members;
    END;
  TWebForm_overview = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_overview_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    ScriptManager_control: System.Web.UI.ScriptManager;
    PlaceHolder_establish_membership: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_member_binder: System.Web.UI.WebControls.PlaceHolder;
    SmartScroller_control: sstchur.web.SmartNav.SmartScroller;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
  end;

implementation

uses
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_overview.InitializeComponent;
begin
  Include(Self.PreRender, Self.TWebForm_overview_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_overview.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - overview';
    //
  end;
end;

procedure TWebForm_overview.OnInit(e: EventArgs);
var
  waypoint_stack: stack;
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['overview.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['overview.p']);
  end else begin
    if (session['user_id'] = nil) or (session['username'] = nil) then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    //
    p.biz_user := TClass_biz_user.Create;
    p.biz_users := TClass_biz_users.Create;
    p.biz_members := TClass_biz_members.Create;
    //
    if p.biz_users.BeStalePassword(p.biz_user.IdNum) then begin
      server.Transfer('change_password.aspx');
    end;
    //
    session.Remove('waypoint_stack');
    waypoint_stack := system.collections.stack.Create;
    session.Add('waypoint_stack',waypoint_stack);
    //
    SessionSet('privilege_array',p.biz_user.Privileges);
  end;
  //
  if p.biz_members.IdOfUserId(p.biz_user.IdNum) = EMPTY then begin
    //
    // Display controls appropriate ONLY to nonmembers.
    //
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_establish_membership(LoadControl('~/usercontrol/app/UserControl_establish_membership.ascx')),
      'UserControl_establish_membership',
      PlaceHolder_establish_membership
      );
    //
  end else begin
    //
    SessionSet('member_id',p.biz_members.IdOfUserId(session['user_id'].tostring));
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_member_binder(LoadControl('~/usercontrol/app/UserControl_member_binder.ascx')),
      'UserControl_member_binder',
      PlaceHolder_member_binder
      );
    //
  end;
  //
end;

procedure TWebForm_overview.TWebForm_overview_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('overview.p',p);
end;

end.

