
unit add_member;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  Class_biz_agencies,
  Class_biz_enrollment,
  Class_biz_medical_release_levels,
  Class_biz_members,
  Class_biz_user,
  UserControl_drop_down_date,
  ki_web_ui;

const ID = '$Id$';

type
  p_type =
    RECORD
    biz_agencies: TClass_biz_agencies;
    biz_enrollment: TClass_biz_enrollment;
    biz_medical_release_levels: TClass_biz_medical_release_levels;
    biz_members: TClass_biz_members;
    biz_user: TClass_biz_user;
    END;
  TWebForm_add_member = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_add_member_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_back_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_email_address_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_add_and_stop_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_add_and_repeat_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  //
  // Expected session objects:
  //
  //   waypoint_stack: system.collections.stack;
  //
  //
  strict private
    p: p_type;
    function Add: boolean;
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
    Button_cancel: System.Web.UI.WebControls.Button;
    TextBox_first_name: System.Web.UI.WebControls.TextBox;
    TextBox_last_name: System.Web.UI.WebControls.TextBox;
    TextBox_cad_num: System.Web.UI.WebControls.TextBox;
    DropDownList_medical_release_level: System.Web.UI.WebControls.DropDownList;
    DropDownList_agency: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_first_name: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_last_name: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_cad_num: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator_medical_release_level: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_be_qualified_driver: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_agency: System.Web.UI.WebControls.RequiredFieldValidator;
    TableRow_agency: System.Web.UI.HtmlControls.HtmlTableRow;
    TextBox_email_address: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_email_address: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_email_address: System.Web.UI.WebControls.RegularExpressionValidator;
    CustomValidator_email_address: System.Web.UI.WebControls.CustomValidator;
    RadioButtonList_be_driver_qualified: System.Web.UI.WebControls.RadioButtonList;
    Label_duplicate: System.Web.UI.WebControls.Label;
    Button_add_and_stop: System.Web.UI.WebControls.Button;
    Button_add_and_repeat: System.Web.UI.WebControls.Button;
    DropDownList_enrollment_level: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_enrollment_level: System.Web.UI.WebControls.RequiredFieldValidator;
    UserControl_enrollment_date: TWebUserControl_drop_down_date;
    Label_invalid_enrollment_date: System.Web.UI.WebControls.Label;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  ki;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_add_member.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_back.Click, Self.LinkButton_back_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.CustomValidator_email_address.ServerValidate, Self.CustomValidator_email_address_ServerValidate);
  Include(Self.Button_add_and_stop.Click, Self.Button_add_and_stop_Click);
  Include(Self.Button_add_and_repeat.Click, Self.Button_add_and_repeat_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_add_member_PreRender);
end;
{$ENDREGION}

procedure TWebForm_add_member.Page_Load(sender: System.Object; e: System.EventArgs);
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
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - add_member';
      Label_account_descriptor.text := session[session['target_user_table'].tostring + '_name'].tostring;
      //
      p.biz_agencies := TClass_biz_agencies.Create;
      p.biz_enrollment := TClass_biz_enrollment.Create;
      p.biz_medical_release_levels := TClass_biz_medical_release_levels.Create;
      p.biz_members := TClass_biz_members.Create;
      p.biz_user := TClass_biz_user.Create;
      //
      if p.biz_user.Kind = 'department_staffer' then begin
        TableRow_agency.visible := TRUE;
        p.biz_agencies.BindDropDownList(DropDownList_agency);
      end else begin
        TableRow_agency.visible := FALSE;
      end;
      p.biz_medical_release_levels.BindDropDownList(DropDownList_medical_release_level);
      UserControl_enrollment_date.minyear := '1940';
      UserControl_enrollment_date.maxyear := datetime.Today.Year.tostring;
      p.biz_enrollment.BindUncontrolledDropDownList(DropDownList_enrollment_level);
    end;
  end;
end;

procedure TWebForm_add_member.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_add_member.Button_add_and_repeat_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if Add then begin
    Label_duplicate.visible := FALSE;
    TextBox_first_name.text := system.string.EMPTY;
    TextBox_last_name.text := system.string.EMPTY;
    TextBox_cad_num.text := system.string.EMPTY;
    DropDownList_medical_release_level.selectedindex := 0;
    RadioButtonList_be_driver_qualified.selectedindex := -1;
    DropDownList_agency.selectedindex := 0;
    TextBox_email_address.text := system.string.EMPTY;
    UserControl_enrollment_date.Clear;
    Label_invalid_enrollment_date.visible := FALSE;
    DropDownList_enrollment_level.selectedindex := -1;
  end;
end;

procedure TWebForm_add_member.Button_add_and_stop_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if Add then begin
    server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
  end;
end;

procedure TWebForm_add_member.Button_cancel_Click(sender: System.Object; e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_add_member.CustomValidator_email_address_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := ki.BeValidDomainPartOfEmailAddress(args.value);
end;

procedure TWebForm_add_member.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_add_member.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_add_member.LinkButton_back_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_add_member.TWebForm_add_member_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_add_member.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

function TWebForm_add_member.Add: boolean;
var
  agency_id: string;
begin
  Add := FALSE;
  if UserControl_enrollment_date.isvalid then begin
    if page.isvalid then begin
      if p.biz_user.Kind = 'department_staffer' then begin
        agency_id := Safe(DropDownList_agency.selectedvalue,NUM);
      end else begin
        agency_id := p.biz_user.IdNum;
      end;
      if p.biz_members.Add
        (
        Safe(TextBox_first_name.text,HUMAN_NAME),
        Safe(TextBox_last_name.text,HUMAN_NAME),
        Safe(TextBox_cad_num.text,NUM),
        Safe(DropDownList_medical_release_level.selectedvalue,NUM),
        Safe(RadioButtonList_be_driver_qualified.selectedvalue,ALPHA),
        agency_id,
        Safe(TextBox_email_address.text,EMAIL_ADDRESS),
        UserControl_enrollment_date.selectedvalue,
        Safe(DropDownList_enrollment_level.selectedvalue,NUM)
        )
      then begin
        Add := TRUE;
      end else begin
        Label_duplicate.visible := TRUE;
      end;
      //
    end;
  end else begin
    Label_invalid_enrollment_date.visible := TRUE;
  end;
end;

end.

