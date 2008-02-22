unit add_new_enrollment_status;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_enrollment,
  Class_biz_members,
  Class_biz_user,
  ki_web_ui,
  UserControl_drop_down_date;

type
  p_type =
    RECORD
    biz_enrollment: TClass_biz_enrollment;
    biz_members: TClass_biz_members;
    biz_user: TClass_biz_user;
    END;
  TWebForm_add_new_enrollment_status = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_add_new_enrollment_status_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
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
    Label_member_designator: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    RequiredFieldValidator_new_status: System.Web.UI.WebControls.RequiredFieldValidator;
    RadioButtonList_disposition: System.Web.UI.WebControls.RadioButtonList;
    Label_member_first_name: System.Web.UI.WebControls.Label;
    LinkButton_grant_leave: System.Web.UI.WebControls.LinkButton;
    UserControl_effective_date: TWebUserControl_drop_down_date;
    TextBox_note: System.Web.UI.WebControls.TextBox;
    Label_no_transitions_available: System.Web.UI.WebControls.Label;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_add_new_enrollment_status.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_add_new_enrollment_status_PreRender);
end;
{$ENDREGION}

procedure TWebForm_add_new_enrollment_status.Page_Load(sender: System.Object; e: System.EventArgs);
var
  cad_num_string: string;
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
      Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - add_new_enrollment_status';
      //
      p.biz_enrollment := TClass_biz_enrollment.Create;
      p.biz_members := TClass_biz_members.Create;
      p.biz_user := TClass_biz_user.Create;
      //
      cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if cad_num_string = system.string.EMPTY then begin
        cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      Label_member_first_name.text := p.biz_members.FirstNameOf(session['e_item']);
      Label_member_designator.Text := Label_member_first_name.text
        + SPACE
        + p.biz_members.LastNameOf(session['e_item'])
        + ' (CAD # '
        + cad_num_string
        + ')';
      //
      p.biz_enrollment.BindTransitionRadioButtonList
        (
        p.biz_members.IdOf(session['e_item']),
        p.biz_members.HighestTierOf(p.biz_members.IdOfUserId(p.biz_user.IdNum)),
        RadioButtonList_disposition
        );
      UserControl_effective_date.selectedvalue := datetime.Today;
      //
      Label_no_transitions_available.visible := (RadioButtonList_disposition.items.count = 0);
//      UserControl_effective_date. := (RadioButtonList_disposition.items.count > 0);
      TextBox_note.enabled := (RadioButtonList_disposition.items.count > 0);
      Button_submit.enabled := (RadioButtonList_disposition.items.count > 0);
      //
    end;
  end;
end;

procedure TWebForm_add_new_enrollment_status.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_add_new_enrollment_status.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_enrollment.SetLevel
    (
    Safe(RadioButtonList_disposition.selectedvalue,NUM),
    UserControl_effective_date.selectedvalue,
    Safe(TextBox_note.text,NARRATIVE),
    p.biz_members.IdOf(session['e_item']),
    session['e_item']
    )
  then begin
    server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
  end else begin
    Alert
      (
      kix.USER,
      FAILURE,
      'inveffdat',
      'The new enrollment status was NOT recorded.  Possible reasons are:  (1) The new membership status cannot take effect on a'
      + ' date that is before the current membership status began; (2) A membership status may not be repeated on the same day --'
      + ' consider advancing the effective date by one day.'
      );
  end;
end;

procedure TWebForm_add_new_enrollment_status.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_add_new_enrollment_status.TWebForm_add_new_enrollment_status_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

end.

