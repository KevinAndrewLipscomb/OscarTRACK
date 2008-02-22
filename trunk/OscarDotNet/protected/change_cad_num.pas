unit change_cad_num;

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
    END;
  TWebForm_change_cad_num = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_cad_num_PreRender(sender: System.Object;
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
    Label_member_name_1: System.Web.UI.WebControls.Label;
    TextBox_cad_num: System.Web.UI.WebControls.TextBox;
    Button_submit: System.Web.UI.WebControls.Button;
    RegularExpressionValidator_cad_num: System.Web.UI.WebControls.RegularExpressionValidator;
    TextBox_noop_ie_behavior_workaround: System.Web.UI.WebControls.TextBox;
    Button_cancel: System.Web.UI.WebControls.Button;
    RequiredFieldValidator_cad_num: System.Web.UI.WebControls.RequiredFieldValidator;
    Label_member_name_2: System.Web.UI.WebControls.Label;
    Label_old_cad_num: System.Web.UI.WebControls.Label;
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
procedure TWebForm_change_cad_num.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_cad_num_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_cad_num.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_cad_num';
    //
    Label_old_cad_num.text := p.biz_members.CadNumOf(session['e_item']);
    Label_member_name_1.text :=
      p.biz_members.FirstNameOf(session['e_item']) + SPACE + p.biz_members.LastNameOf(session['e_item']);
    Label_member_name_2.text := Label_member_name_1.text;
    //
    Focus(TextBox_cad_num);
    //
  end;
end;

procedure TWebForm_change_cad_num.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['change_cad_num.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['change_cad_num.p']);
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
    end;
  end;
  //
end;

procedure TWebForm_change_cad_num.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_change_cad_num.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_members.SetCadNum(Safe(Textbox_cad_num.text,NUM),session['e_item']) then begin
    server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
  end else begin
    Alert(kix.USER,kix.FAILURE,'cadnumtakn','NOT CHANGED:  The specified CAD # is already in the system.');
  end;
end;

procedure TWebForm_change_cad_num.TWebForm_change_cad_num_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('change_cad_num.p');
  session.Add('change_cad_num.p',p);
end;

end.

