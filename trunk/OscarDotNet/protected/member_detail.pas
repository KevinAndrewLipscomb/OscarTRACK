unit member_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_enrollment,
  Class_biz_leaves,
  Class_biz_members,
  Class_biz_user,
  kix,
  ki_web_ui;

type
  TWebForm_member_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_member_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_member_email_address_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_leave_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_officership_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_medical_release_level_Click(sender: System.Object; 
      e: System.EventArgs);
    procedure LinkButton_enrollment_detail_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_driver_qual_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_section_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_agency_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_cad_num_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_name_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_member_phone_num_Click(sender: System.Object; 
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        biz_enrollment: TClass_biz_enrollment;
        biz_leaves: TClass_biz_leaves;
        biz_members: TClass_biz_members;
        biz_user: TClass_biz_user;
        cad_num_string: string;
        leave_next_month_description: string;
        leave_this_month_description: string;
        raw_member_email_address: string;
        raw_member_phone_num: string;
        END;
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlTitle;
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
    Label_phone_num: System.Web.UI.WebControls.Label;
    LinkButton_change_member_phone_num: System.Web.UI.WebControls.LinkButton;
    Label_email_address: System.Web.UI.WebControls.Label;
    LinkButton_change_member_email_address: System.Web.UI.WebControls.LinkButton;
    Label_leave_this_month: System.Web.UI.WebControls.Label;
    Label_leave_next_month: System.Web.UI.WebControls.Label;
    Label_section: System.Web.UI.WebControls.Label;
    LinkButton_change_section: System.Web.UI.WebControls.LinkButton;
    Label_years_of_service: System.Web.UI.WebControls.Label;
    Label_elaboration: System.Web.UI.WebControls.Label;
    Label_agency: System.Web.UI.WebControls.Label;
    LinkButton_change_agency: System.Web.UI.WebControls.LinkButton;
    Label_cad_num: System.Web.UI.WebControls.Label;
    LinkButton_change_cad_num: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_name: System.Web.UI.WebControls.LinkButton;
  protected
    procedure OnInit(e: EventArgs); override;
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
  Include(Self.LinkButton_change_name.Click, Self.LinkButton_change_name_Click);
  Include(Self.LinkButton_change_cad_num.Click, Self.LinkButton_change_cad_num_Click);
  Include(Self.LinkButton_change_member_phone_num.Click, Self.LinkButton_change_member_phone_num_Click);
  Include(Self.LinkButton_change_member_email_address.Click, Self.LinkButton_change_member_email_address_Click);
  Include(Self.LinkButton_leave_detail.Click, Self.LinkButton_leave_detail_Click);
  Include(Self.LinkButton_officership_detail.Click, Self.LinkButton_officership_detail_Click);
  Include(Self.LinkButton_change_agency.Click, Self.LinkButton_change_agency_Click);
  Include(Self.LinkButton_change_section.Click, Self.LinkButton_change_section_Click);
  Include(Self.LinkButton_change_medical_release_level.Click, Self.LinkButton_change_medical_release_level_Click);
  Include(Self.LinkButton_enrollment_detail.Click, Self.LinkButton_enrollment_detail_Click);
  Include(Self.LinkButton_change_driver_qual.Click, Self.LinkButton_change_driver_qual_Click);
  Include(Self.PreRender, Self.TWebForm_member_detail_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_member_detail.Page_Load(sender: System.Object; e: System.EventArgs);
var
  target_member_id: string;
begin
  if not IsPostback then begin
    //
    Title.text := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - member_detail';
    //
    target_member_id := p.biz_members.IdOf(session['e_item']);
    //
    if p.raw_member_phone_num <> EMPTY then begin
      Label_phone_num.text := FormatAsNanpPhoneNum(p.raw_member_phone_num);
    end else begin
      Label_phone_num.text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    //
    if p.raw_member_email_address <> EMPTY then begin
      Label_email_address.Text := p.raw_member_email_address;
    end else begin
      Label_email_address.Text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    Label_member_designator.Text := p.biz_members.FirstNameOf(session['e_item'])
      + SPACE
      + p.biz_members.LastNameOf(session['e_item']);
    LinkButton_change_name.visible := Has(string_array(session['privilege_array']),'change-member-name')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    LinkButton_change_name.text := ExpandTildePath(LinkButton_change_name.text);
    //
    Label_cad_num.text := p.cad_num_string;
    LinkButton_change_cad_num.visible := Has(string_array(session['privilege_array']),'change-cad-num')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    LinkButton_change_cad_num.text := ExpandTildePath(LinkButton_change_cad_num.text);
    //
    Label_leave_this_month.text := p.leave_this_month_description;
    Label_leave_next_month.text := p.leave_next_month_description;
    LinkButton_leave_detail.text := ExpandTildePath(LinkButton_leave_detail.text);
    //
    Label_officership.Text := p.biz_members.OfficershipOf(p.biz_members.IdOf(session['e_item']));
    if Label_officership.Text = EMPTY then begin
      Label_officership.Text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    LinkButton_officership_detail.text := ExpandTildePath(LinkButton_officership_detail.text);
    //
    Label_agency.text := p.biz_members.AgencyOf(session['e_item']);
    LinkButton_change_agency.text := ExpandTildePath(LinkButton_change_agency.text);
    //
    Label_section.text := p.biz_members.SectionOf(session['e_item']);
    LinkButton_change_section.text := ExpandTildePath(LinkButton_change_section.text);
    //
    Label_medical_release_level.Text := p.biz_members.MedicalReleaseLevelOf(session['e_item']);
    //
    Label_enrollment.Text := p.biz_members.EnrollmentOf(session['e_item']);
    Label_elaboration.text := p.biz_enrollment.ELaborationOf(Label_enrollment.text);
    LinkButton_enrollment_detail.text := ExpandTildePath(LinkButton_enrollment_detail.text);
    //
    if p.biz_members.RetentionOf(session['e_item']) <> EMPTY then begin
      Label_years_of_service.text := p.biz_members.RetentionOf(session['e_item']);
    end else begin
      Label_years_of_service.text := '(See membership status detail)';
    end;
    //
    Label_be_driver_qualified.text := YesNoOf(p.biz_members.BeDriverQualifiedOf(session['e_item']));
    LinkButton_change_driver_qual.text := ExpandTildePath(LinkButton_change_driver_qual.text);
    //
    LinkButton_change_member_phone_num.visible := (target_member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum))
      or
        (
          Has(string_array(session['privilege_array']),'change-member-phone-num')
        and
          p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id)
        );
    LinkButton_change_member_phone_num.text := ExpandTildePath(LinkButton_change_member_phone_num.text);
    //
    if p.biz_members.UserIdOf(target_member_id) = EMPTY then begin
      LinkButton_change_member_email_address.visible := Has(string_array(session['privilege_array']),'change-member-email-address')
        and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    end;
    LinkButton_change_member_email_address.text := ExpandTildePath(LinkButton_change_member_email_address.text);
    //
    LinkButton_change_medical_release_level.visible := Has(string_array(session['privilege_array']),'change-med-release-level')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);

    LinkButton_change_medical_release_level.text := ExpandTildePath(LinkButton_change_medical_release_level.text);
    //
    LinkButton_change_driver_qual.visible := Has(string_array(session['privilege_array']),'change-driver-qual')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    LinkButton_change_agency.visible := Has(string_array(session['privilege_array']),'change-agency')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    LinkButton_change_section.visible := Has(string_array(session['privilege_array']),'change-section')
      and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),target_member_id);
    //
  end;
end;

procedure TWebForm_member_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  if IsPostback then begin
    if assigned(session['member_detail.p']) then begin
      p := p_type(session['member_detail.p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
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
      p.biz_enrollment := TClass_biz_enrollment.Create;
      p.biz_leaves := TClass_biz_leaves.Create;
      p.biz_members := TClass_biz_members.Create;
      p.biz_user := TClass_biz_user.Create;
      //
      p.raw_member_phone_num := p.biz_members.PhoneNumOf(p.biz_members.IdOf(session['e_item']));
      p.raw_member_email_address := p.biz_members.EmailAddressOf(p.biz_members.IdOf(session['e_item']));
      p.cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if p.cad_num_string = EMPTY then begin
        p.cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      p.biz_leaves.DescribeThisAndNextMonthForMember
        (
        p.biz_members.IdOf(session['e_item']),
        p.leave_this_month_description,
        p.leave_next_month_description,
        NOT_APPLICABLE_INDICATION_HTML
        );
      //
    end;
  end;
end;

procedure TWebForm_member_detail.LinkButton_change_member_phone_num_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('member_phone_num',p.raw_member_phone_num);
  DropCrumbAndTransferTo('change_phone_num.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_name_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_name.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_cad_num_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_cad_num.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_agency_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_member_agency.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_section_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_member_section.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_driver_qual_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_member_driver_qualification.aspx');
end;

procedure TWebForm_member_detail.LinkButton_enrollment_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('enrollment_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_medical_release_level_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('change_member_medical_release_level.aspx');
end;

procedure TWebForm_member_detail.LinkButton_officership_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('officership_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_leave_detail_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('leave_detail.aspx');
end;

procedure TWebForm_member_detail.LinkButton_change_member_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('member_email_address',p.raw_member_email_address);
  DropCrumbAndTransferTo('change_member_email_address.aspx');
end;

procedure TWebForm_member_detail.TWebForm_member_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('member_detail.p',p);
end;

end.

