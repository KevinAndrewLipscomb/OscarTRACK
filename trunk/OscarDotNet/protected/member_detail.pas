
unit member_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_accounts,
  Class_biz_leaves,
  Class_biz_members,
  ki,
  ki_web_ui;

const ID = '$Id$';

type
  p_type =
    RECORD
    biz_accounts: TClass_biz_accounts;
    biz_leaves: TClass_biz_leaves;
    biz_members: TClass_biz_members;
    raw_member_email_address: string;
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
    procedure LinkButton_change_member_email_address_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_leave_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_officership_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_medical_release_level_Click(sender: System.Object; 
      e: System.EventArgs);
    procedure LinkButton_enrollment_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_driver_qual_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
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
    Label_member_designator: System.Web.UI.WebControls.Label;
    LinkButton_change_medical_release_level: System.Web.UI.WebControls.LinkButton;
    Label_medical_release_level: System.Web.UI.WebControls.Label;
    Label_be_driver_qualified: System.Web.UI.WebControls.Label;
    LinkButton_change_driver_qual: System.Web.UI.WebControls.LinkButton;
    Label_enrollment: System.Web.UI.WebControls.Label;
    LinkButton_enrollment_detail: System.Web.UI.WebControls.LinkButton;
    LinkButton_leave_detail: System.Web.UI.WebControls.LinkButton;
    Label_officership: System.Web.UI.WebControls.Label;
    LinkButton_officership_detail: System.Web.UI.WebControls.LinkButton;
    Label_email_address: System.Web.UI.WebControls.Label;
    LinkButton_change_member_email_address: System.Web.UI.WebControls.LinkButton;
    Label_leave_this_month: System.Web.UI.WebControls.Label;
    Label_leave_next_month: System.Web.UI.WebControls.Label;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon;

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
  Include(Self.LinkButton_change_member_email_address.Click, Self.LinkButton_change_member_email_address_Click);
  Include(Self.LinkButton_leave_detail.Click, Self.LinkButton_leave_detail_Click);
  Include(Self.LinkButton_officership_detail.Click, Self.LinkButton_officership_detail_Click);
  Include(Self.LinkButton_change_medical_release_level.Click, Self.LinkButton_change_medical_release_level_Click);
  Include(Self.LinkButton_enrollment_detail.Click, Self.LinkButton_enrollment_detail_Click);
  Include(Self.LinkButton_change_driver_qual.Click, Self.LinkButton_change_driver_qual_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_member_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_member_detail.Page_Load(sender: System.Object; e: System.EventArgs);
var
  cad_num_string: string;
  leave_next_month_description: string;
  leave_this_month_description: string;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore
      // unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - member_detail';
      Label_account_descriptor.text := session.item['squad_commander_name'].tostring;
      //
      p.biz_accounts := TClass_biz_accounts.Create;
      p.biz_leaves := TClass_biz_leaves.Create;
      p.biz_members := TClass_biz_members.Create;
      //
      p.raw_member_email_address := p.biz_accounts.EmailAddressByKindId('member',p.biz_members.IdOf(session['e_item']));
      if p.raw_member_email_address <> system.string.Empty then begin
        Label_email_address.Text := p.raw_member_email_address;
      end else begin
        Label_email_address.Text := NOT_APPLICABLE_INDICATION_HTML;
      end;
      cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if cad_num_string = system.string.EMPTY then begin
        cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      Label_member_designator.Text := p.biz_members.FirstNameOf(session['e_item'])
        + ' '
        + p.biz_members.LastNameOf(session['e_item'])
        + ' (CAD # '
        + cad_num_string
        + ')';
      p.biz_leaves.DescribeThisAndNextMonthForMember
        (
        p.biz_members.IdOf(session['e_item']),
        leave_this_month_description,
        leave_next_month_description,
        NOT_APPLICABLE_INDICATION_HTML
        );
      Label_leave_this_month.text := leave_this_month_description;
      Label_leave_next_month.text := leave_next_month_description;
      Label_officership.Text := p.biz_members.OfficershipOf(p.biz_members.IdOf(session['e_item']));
      if Label_officership.Text = system.string.Empty then begin
        Label_officership.Text := NOT_APPLICABLE_INDICATION_HTML;
      end;
      Label_medical_release_level.Text := p.biz_members.MedicalReleaseLevelOf(session['e_item']);
      Label_enrollment.Text := p.biz_members.EnrollmentOf(session['e_item']);
      Label_be_driver_qualified.Text := p.biz_members.BeDriverQualifiedOf(session['e_item']);
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

procedure TWebForm_member_detail.LinkButton_change_driver_qual_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('change_member_driver_qualification.aspx');
end;

procedure TWebForm_member_detail.LinkButton_enrollment_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('enrollment_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_medical_release_level_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('change_member_medical_release_level.aspx');
end;

procedure TWebForm_member_detail.LinkButton_officership_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('officership_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_leave_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('leave_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_member_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('member_email_address');
  session.Add('member_email_address',p.raw_member_email_address);
  system.collections.stack(session['waypoint_stack']).Push('member_detail.aspx');
  server.Transfer('change_member_email_address.aspx');
end;

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

