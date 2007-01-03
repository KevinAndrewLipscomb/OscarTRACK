
unit member_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  ki_web_ui;

const ID = '$Id$';

type
  p_type =
    RECORD
    END;
  TWebForm_member_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_member_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_back_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_drill_down_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  //
  // Expected session objects:
  //
  //   waypoint_stack: system.collections.stack;
  //
  //
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    Label_account_descriptor: System.Web.UI.WebControls.Label;
    LinkButton_back: System.Web.UI.WebControls.LinkButton;
    LinkButton_drill_down: System.Web.UI.WebControls.LinkButton;
    Label_member_designator: System.Web.UI.WebControls.Label;
    LinkButton_change_medical_release_level: System.Web.UI.WebControls.LinkButton;
    Label_medical_release_level: System.Web.UI.WebControls.Label;
    Label_be_driver_qualified: System.Web.UI.WebControls.Label;
    LinkButton_change_driver_qual: System.Web.UI.WebControls.LinkButton;
    Label_enrollment: System.Web.UI.WebControls.Label;
    LinkButton_enrollment_detail: System.Web.UI.WebControls.LinkButton;
    Label_leave: System.Web.UI.WebControls.Label;
    LinkButton_leave_detail: System.Web.UI.WebControls.LinkButton;
    Label_officership: System.Web.UI.WebControls.Label;
    LinkButton_officership_detail: System.Web.UI.WebControls.LinkButton;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_member_detail.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_back.Click, Self.LinkButton_back_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.LinkButton_drill_down.Click, Self.LinkButton_drill_down_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_member_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_member_detail.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - member_detail';
      Label_account_descriptor.text := session.item['squad_commander_name'].tostring;
      //
//      Label_member_designator.Text := // first_name last_name (CAD # cad_num)
//      Label_leave.Text :=
//      Label_officership.Text :=
//      Label_medical_release_level.Text :=
//      Label_enrollment,Text :=
//      Label_be_driver_qualified.Text :=
      //
    end;
  end;
end;

procedure TWebForm_member_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

{$REGION 'Waypoint management code for drill-down server.Transfer calls.'}
procedure TWebForm_member_detail.LinkButton_drill_down_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('detail.aspx');
end;
{$ENDREGION}

procedure TWebForm_member_detail.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_member_detail.LinkButton_back_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_member_detail.TWebForm_member_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_member_detail.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

end.

