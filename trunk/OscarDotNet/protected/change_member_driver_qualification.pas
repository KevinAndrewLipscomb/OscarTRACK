
unit change_member_driver_qualification;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  Class_biz_members,
  ki_web_ui;



type
  p_type =
    RECORD
    be_driver_initially_qualified: boolean;
    biz_members: TClass_biz_members;
    END;
  TWebForm_change_member_driver_qualification = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_member_driver_qualification_PreRender(sender: System.Object;
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
    Label_member_name_2: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    RadioButtonList_driver_qualified_yes_no: System.Web.UI.WebControls.RadioButtonList;
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
procedure TWebForm_change_member_driver_qualification.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_member_driver_qualification_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_member_driver_qualification.Page_Load(sender: System.Object; e: System.EventArgs);
begin
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
      Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_member_driver_qualification';
      //
      p.biz_members := TClass_biz_members.Create;
      //
      Label_member_name_1.text :=
        p.biz_members.FirstNameOf(session['e_item']) + SPACE + p.biz_members.LastNameOf(session['e_item']);
      Label_member_name_2.text := Label_member_name_1.text;
      p.be_driver_initially_qualified := p.biz_members.BeDriverQualifiedOf(session['e_item']);
      RadioButtonList_driver_qualified_yes_no.selectedvalue := YesNoOf(p.be_driver_initially_qualified);
      //
    end;
  end;
end;

procedure TWebForm_change_member_driver_qualification.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_change_member_driver_qualification.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_change_member_driver_qualification.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  be_driver_qualified: boolean;
begin
  be_driver_qualified := BooleanOfYesNo(RadioButtonList_driver_qualified_yes_no.SelectedValue);
  if be_driver_qualified <> p.be_driver_initially_qualified then begin
    p.biz_members.SetDriverQualification(be_driver_qualified,session['e_item']);
  end;
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_change_member_driver_qualification.TWebForm_change_member_driver_qualification_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

end.

