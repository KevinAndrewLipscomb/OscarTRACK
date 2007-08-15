unit overview;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki,
  System.Data.Common, Borland.Data.Provider, System.Globalization,
  Borland.Data.Common, system.configuration, system.web.security,
  Class_biz_members,
  Class_biz_user,
  Class_biz_users,
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
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_overview_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    UserControl_print_div: TWebUserControl_print_div;
    Label_username: System.Web.UI.WebControls.Label;
    PlaceHolder_establish_membership: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_member_binder: System.Web.UI.WebControls.PlaceHolder;
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
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_overview_PreRender);
end;
{$ENDREGION}

procedure TWebForm_overview.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - overview';
    Label_username.text := session['username'].ToString;
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
    waypoint_stack.Push('overview.aspx');
    session.Add('waypoint_stack',waypoint_stack);
    //
    session.Remove('privilege_array');
    session.Add('privilege_array',p.biz_user.Privileges);
  end;
  //
  if p.biz_members.IdOfUserId(p.biz_user.IdNum) = system.string.EMPTY then begin
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
    session.Remove('member_id');
    session.Add('member_id',p.biz_members.IdOfUserId(session['user_id'].tostring));
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
  session.Remove('overview.p');
  session.Add('overview.p',p);
end;

procedure TWebForm_overview.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_overview.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_overview.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

end.

