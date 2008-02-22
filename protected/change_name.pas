unit change_name;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  Class_biz_members,
  Class_biz_users,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_members: TClass_biz_members;
    biz_users: TClass_biz_users;
    saved_first_name: string;
    saved_last_name: string;
    END;
  TWebForm_change_name = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_name_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
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
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    RequiredFieldValidator_name: System.Web.UI.WebControls.RequiredFieldValidator;
    TextBox_last_name: System.Web.UI.WebControls.TextBox;
    TextBox_first_name: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_last_name: System.Web.UI.WebControls.RequiredFieldValidator;
    Label_member_name: System.Web.UI.WebControls.Label;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_name.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_name_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_name.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_name';
    //
    Label_member_name.text := p.saved_first_name + SPACE + p.saved_last_name;
    //
    TextBox_first_name.text := p.saved_first_name;
    TextBox_last_name.text := p.saved_last_name;
    //
    Focus(TextBox_first_name);
    //
  end;
end;

procedure TWebForm_change_name.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['change_name.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['change_name.p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      p.biz_members := TClass_biz_members.Create;
      p.biz_users := TClass_biz_users.Create;
      //
      p.saved_first_name := p.biz_members.FirstNameOf(session['e_item']);
      p.saved_last_name := p.biz_members.LastNameOf(session['e_item']);
      //
    end;
  end;
  //
end;

procedure TWebForm_change_name.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_change_name.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_members.SetName
    (
    p.saved_first_name,
    p.saved_last_name,
    Safe(Textbox_first_name.text,HUMAN_NAME).toupper,
    Safe(TextBox_last_name.text,HUMAN_NAME).toupper,
    session['e_item']
    );
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_change_name.TWebForm_change_name_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('change_name.p');
  session.Add('change_name.p',p);
end;

end.

