unit change_member_medical_release_level;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_medical_release_levels,
  Class_biz_members,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_medical_release_levels: TClass_biz_medical_release_levels;
    biz_members: TClass_biz_members;
    saved_level: string;
    END;
  TWebForm_change_member_medical_release_level = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_member_medical_release_level_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_control_ServerValidate(source: System.Object; args: System.Web.UI.WebControls.ServerValidateEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlTitle;
    Label_member_name_1: System.Web.UI.WebControls.Label;
    Label_member_name_2: System.Web.UI.WebControls.Label;
    Label_member_name_3: System.Web.UI.WebControls.Label;
    DropDownList_medical_release_level: System.Web.UI.WebControls.DropDownList;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    HtmlTable_proper_release_reminder: System.Web.UI.HtmlControls.HtmlTable;
    Label_current_medical_release_level: System.Web.UI.WebControls.Label;
    RequiredFieldValidator_medical_release_level: System.Web.UI.WebControls.RequiredFieldValidator;
    CustomValidator_control: System.Web.UI.WebControls.CustomValidator;
  protected
    procedure OnInit(e: EventArgs); override;
  end;

implementation

uses
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_member_medical_release_level.InitializeComponent;
begin
  Include(Self.CustomValidator_control.ServerValidate, Self.CustomValidator_control_ServerValidate);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.PreRender, Self.TWebForm_change_member_medical_release_level_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_change_member_medical_release_level.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if IsPostback then begin
    if assigned(session['change_member_medical_release_level.p']) then begin
      p := p_type(session['change_member_medical_release_level.p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      Title.text := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_member_medical_release_level';
      //
      Label_member_name_1.text :=
        p.biz_members.FirstNameOf(session['e_item']) + SPACE + p.biz_members.LastNameOf(session['e_item']);
      Label_member_name_2.text := Label_member_name_1.text;
      Label_member_name_3.text := Label_member_name_2.text;
      //
      HtmlTable_proper_release_reminder.visible := not Has(string_array(session['privilege_array']),'release-trainees');
      //
      Label_current_medical_release_level.text := p.saved_level;
      p.biz_medical_release_levels.BindListControl(DropDownList_medical_release_level);
      //
    end;
  end;
end;

procedure TWebForm_change_member_medical_release_level.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  p.biz_members := TClass_biz_members.Create;
  p.biz_medical_release_levels := TClass_biz_medical_release_levels.Create;
  //
  p.saved_level := p.biz_members.MedicalReleaseLevelOf(session['e_item']);
  //
end;

procedure TWebForm_change_member_medical_release_level.CustomValidator_control_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
var
  current_enrollment_level: string;
  first_name: string;
begin
  args.isvalid := FALSE;
  current_enrollment_level := p.biz_members.EnrollmentOf(session['e_item']);
  first_name := p.biz_members.FirstNameOf(session['e_item']);
  if p.biz_medical_release_levels.BeValidForCurrentEnrollmentLevel
    (Safe(DropDownList_medical_release_level.selectedvalue,NUM),current_enrollment_level)
  then begin
    args.isvalid := TRUE;
  end else begin
    CustomValidator_control.errormessage := first_name + ' is currently a(n) ' + current_enrollment_level + ' member, and '
    + current_enrollment_level + ' members must remain certified.  If ' + first_name + ' is no longer certified, please go back to '
    + first_name + APOSTROPHE + 's member_detail page and give ' + first_name + ' a Membership status that does not require '
    + 'certification.  Then perform your current action again.';
  end;
end;

procedure TWebForm_change_member_medical_release_level.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_change_member_medical_release_level.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.isvalid then begin
    p.biz_members.SetMedicalReleaseCode(p.saved_level,Safe(DropDownList_medical_release_level.selectedvalue,NUM),session['e_item']);
    BackTrack;
  end;
end;

procedure TWebForm_change_member_medical_release_level.TWebForm_change_member_medical_release_level_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('change_member_medical_release_level.p',p);
end;

end.

