unit UserControl_roster;

interface

uses
  Class_biz_agencies,
  Class_biz_enrollment,
  Class_biz_leave,
  Class_biz_medical_release_levels,
  Class_biz_members,
  Class_biz_sections,
  Class_biz_user,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_print_div;

type
  p_type =
    RECORD
    agency_filter: string;
    be_datagrid_empty: boolean;
    be_sort_order_ascending: boolean;
    be_user_privileged_to_see_all_squads: boolean;
    biz_agencies: TClass_biz_agencies;
    biz_enrollment: TClass_biz_enrollment;
    biz_leave: TClass_biz_leave;
    biz_medical_release_levels: TClass_biz_medical_release_levels;
    biz_members: TClass_biz_members;
    biz_sections: TClass_biz_sections;
    biz_user: TClass_biz_user;
    distribution_list: string;
    enrollment_filter: Class_biz_enrollment.filter_type;
    leave_filter: Class_biz_leave.filter_type;
    med_release_level_filter: Class_biz_medical_release_levels.filter_type;
    num_cooked_shifts: cardinal;  // takes into account leaves
    num_datagrid_rows: cardinal;
    num_raw_shifts: cardinal;  // does not take into account leaves
    section_filter: Class_biz_sections.filter_type;
    sort_order: string;
    END;
  TWebUserControl_roster = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_roster_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_roster_SortCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
    procedure DataGrid_roster_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_roster_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_add_member_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_med_release_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_section_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure Button_send_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_agency_filter_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_leave_filter: System.Web.UI.WebControls.Label;
    DataGrid_roster: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    DropDownList_leave_filter: System.Web.UI.WebControls.DropDownList;
    DropDownList_enrollment_filter: System.Web.UI.WebControls.DropDownList;
    Label_num_rows: System.Web.UI.WebControls.Label;
    RadioButtonList_which_month: System.Web.UI.WebControls.RadioButtonList;
    LinkButton_add_member: System.Web.UI.WebControls.LinkButton;
    Label_num_crew_shifts: System.Web.UI.WebControls.Label;
    Label_utilization: System.Web.UI.WebControls.Label;
    Label_utilization_caption: System.Web.UI.WebControls.Label;
    DropDownList_med_release_filter: System.Web.UI.WebControls.DropDownList;
    DropDownList_section_filter: System.Web.UI.WebControls.DropDownList;
    TableRow_data: System.Web.UI.HtmlControls.HtmlTableRow;
    UserControl_print_div: TWebUserControl_print_div;
    Label_distribution_list: System.Web.UI.WebControls.Label;
    TextBox_quick_message_subject: System.Web.UI.WebControls.TextBox;
    TextBox_quick_message_body: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_quick_message_body: System.Web.UI.WebControls.RequiredFieldValidator;
    Button_send: System.Web.UI.WebControls.Button;
    Table_quick_message: System.Web.UI.HtmlControls.HtmlTable;
    TableData_agency_filter: System.Web.UI.HtmlControls.HtmlTableCell;
    DropDownList_agency_filter: System.Web.UI.WebControls.DropDownList;
    Paragraph_quick_message_shortcut: System.Web.UI.HtmlControls.HtmlGenericControl;
    TableData_section_filter: System.Web.UI.HtmlControls.HtmlTableCell;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_db_members,
  ki,
  System.Collections,
  system.configuration,
  system.security.principal;

procedure TWebUserControl_roster.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    UserControl_print_div.text := '[print]';
    //
    LinkButton_add_member.visible := Has(string_array(session['privilege_array']),'add-members');
    //
    p.biz_agencies.BindDropDownListShort(DropDownList_agency_filter);
    if not p.be_user_privileged_to_see_all_squads then begin
      DropDownList_agency_filter.selectedvalue := p.agency_filter;
    end;
    DropDownList_agency_filter.enabled := p.be_user_privileged_to_see_all_squads;
    //
    p.biz_sections.BindDropDownList(DropDownList_section_filter,'0*');
    TableData_section_filter.visible := p.agency_filter <> system.string.EMPTY;
    //
    if httpcontext.current.user.IsInRole('Squad Scheduler')
      or httpcontext.current.user.IsInRole('Department Scheduler')
      or (session['mode:report/monthly-core-ops-roster'] <> nil)
    then begin
      p.enrollment_filter := STANDARD_OPS;
      DropDownList_enrollment_filter.selectedvalue := 'standard_ops';
      RadioButtonList_which_month.selectedvalue := '1'; // next month
    end else if session['mode:report/monthly-in-class-roster'] <> nil then begin
      p.enrollment_filter := CURRENT;
      DropDownList_enrollment_filter.selectedvalue := 'current';
      RadioButtonList_which_month.selectedvalue := '0'; // this month
      p.med_release_level_filter := IN_CLASS;
    end else if session['mode:report/monthly-trainee-roster'] <> nil then begin
      p.enrollment_filter := CURRENT;
      DropDownList_enrollment_filter.selectedvalue := 'current';
      RadioButtonList_which_month.selectedvalue := '0'; // this month
      p.med_release_level_filter := TRAINEE;
    end else if session['mode:report/monthly-applicant-roster'] <> nil then begin
      p.enrollment_filter := APPLICANT;
      DropDownList_enrollment_filter.selectedvalue := 'current';
      RadioButtonList_which_month.selectedvalue := '0'; // this month
    end else if session['mode:report/monthly-recruit-awaiting-class-roster'] <> nil then begin
      p.enrollment_filter := RECRUIT;
      DropDownList_enrollment_filter.selectedvalue := 'current';
      RadioButtonList_which_month.selectedvalue := '0'; // this month
      p.med_release_level_filter := Class_biz_medical_release_levels.NONE;
    end else begin
      p.enrollment_filter := CURRENT;
      DropDownList_enrollment_filter.selectedvalue := 'current';
      RadioButtonList_which_month.selectedvalue := '0'; // this month
    end;
    //
    if session['mode:report'] <> nil then begin
      DataGrid_roster.enabled := FALSE;
      DataGrid_roster.columns[TCCI_DRILLDOWN_LINKBUTTON].visible := FALSE;
      DataGrid_roster.allowsorting := FALSE;
      DropDownList_leave_filter.enabled := FALSE;
      DropDownList_enrollment_filter.enabled := FALSE;
      RadioButtonList_which_month.enabled := FALSE;
      LinkButton_add_member.enabled := FALSE;
      DropDownList_med_release_filter.enabled := FALSE;
      DropDownList_section_filter.enabled := FALSE;
      UserControl_print_div.visible := FALSE;
      TextBox_quick_message_subject.enabled := FALSE;
      TextBox_quick_message_body.enabled := FALSE;
      RequiredFieldValidator_quick_message_body.enabled := FALSE;
      Button_send.enabled := FALSE;
      DropDownList_agency_filter.enabled := FALSE;
    end;
    //
    Bind;
    //
    Paragraph_quick_message_shortcut.visible := Has(string_array(session['privilege_array']),'send-quickmessages');
    Table_quick_message.visible := Has(string_array(session['privilege_array']),'send-quickmessages');
    //
  end;
  //
end;

procedure TWebUserControl_roster.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['UserControl_roster.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_roster.p']);
  end else begin
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    p.biz_enrollment := TClass_biz_enrollment.Create;
    p.biz_leave := TClass_biz_leave.Create;
    p.biz_medical_release_levels := TClass_biz_medical_release_levels.Create;
    p.biz_members := TClass_biz_members.Create;
    p.biz_sections := TClass_biz_sections.Create;
    p.biz_user := TClass_biz_user.Create;
    //
    p.be_user_privileged_to_see_all_squads := Has(string_array(session['privilege_array']),'see-all-squads');
    if p.be_user_privileged_to_see_all_squads then begin
      p.agency_filter := system.string.EMPTY;
    end else begin
      p.agency_filter := p.biz_members.AgencyIdOfId(session['member_id'].tostring);
    end;
    p.be_sort_order_ascending := TRUE;
    p.distribution_list := system.string.EMPTY;
    p.leave_filter := Class_biz_leave.NONE;
    p.med_release_level_filter := ALL;
    p.section_filter := 0;
    p.num_cooked_shifts := 0;
    p.num_datagrid_rows := 0;
    p.num_raw_shifts := 0;
    p.sort_order := 'last_name,first_name,cad_num';
  end;
  //
end;

procedure TWebUserControl_roster.DropDownList_agency_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.agency_filter := Safe(DropDownList_agency_filter.selectedvalue,NUM);
  TableData_section_filter.visible := (p.agency_filter <> system.string.EMPTY);
  //
  // Always reset section filter when agency filter changes.
  //
  DropDownList_section_filter.selectedindex := 0;
  p.section_filter := 0;
  //
  Bind;
end;

procedure TWebUserControl_roster.Button_send_Click(sender: System.Object; e: System.EventArgs);
begin
  ki.SmtpMailSend
    (
    // from
    configurationsettings.appsettings['sender_email_address'],
    // to
    Label_distribution_list.text,
    // subject
    TextBox_quick_message_subject.text,
    // body
    '-- From ' + p.biz_user.Roles[0] + SPACE + p.biz_members.FirstNameOfMemberId(session['member_id'].tostring) + SPACE
    + p.biz_members.LastNameOfMemberId(session['member_id'].tostring) + ' (via '
    + configurationsettings.appsettings['application_name'] + ')' + NEW_LINE
    + NEW_LINE
    + TextBox_quick_message_body.text
    );
  TextBox_quick_message_subject.text := system.string.EMPTY;
  TextBox_quick_message_body.text := system.string.EMPTY;
  Alert(ki.LOGIC,ki.NORMAL,'messagsnt','Message sent');
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_roster.InitializeComponent;
begin
  Include(Self.LinkButton_add_member.Click, Self.LinkButton_add_member_Click);
  Include(Self.DropDownList_agency_filter.SelectedIndexChanged, Self.DropDownList_agency_filter_SelectedIndexChanged);
  Include(Self.DropDownList_section_filter.SelectedIndexChanged, Self.DropDownList_section_filter_SelectedIndexChanged);
  Include(Self.DropDownList_med_release_filter.SelectedIndexChanged, Self.DropDownList_med_release_filter_SelectedIndexChanged);
  Include(Self.DropDownList_enrollment_filter.SelectedIndexChanged, Self.DropDownList_enrollment_filter_SelectedIndexChanged);
  Include(Self.DropDownList_leave_filter.SelectedIndexChanged, Self.DropDownList_leave_filter_SelectedIndexChanged);
  Include(Self.RadioButtonList_which_month.SelectedIndexChanged, Self.RadioButtonList_which_month_SelectedIndexChanged);
  Include(Self.DataGrid_roster.ItemCommand, Self.DataGrid_roster_ItemCommand);
  Include(Self.DataGrid_roster.SortCommand, Self.DataGrid_roster_SortCommand);
  Include(Self.DataGrid_roster.ItemDataBound, Self.DataGrid_roster_ItemDataBound);
  Include(Self.Button_send.Click, Self.Button_send_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_roster_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_roster.DropDownList_section_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.section_filter := uint32.Parse(DropDownList_section_filter.selectedvalue);
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_med_release_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.med_release_level_filter := Class_biz_medical_release_levels.filter_type
    (
    enum.Parse(system.object(p.med_release_level_filter).GetType,DropDownList_med_release_filter.selectedvalue,TRUE)
    );
  Bind;
end;

procedure TWebUserControl_roster.LinkButton_add_member_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('add_member.aspx');
end;

procedure TWebUserControl_roster.RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.leave_filter :=
    Class_biz_leave.filter_type(enum.Parse(system.object(p.leave_filter).GetType,DropDownList_leave_filter.selectedvalue,TRUE));
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.enrollment_filter := Class_biz_enrollment.filter_type
    (enum.Parse(system.object(p.enrollment_filter).GetType,DropDownList_enrollment_filter.selectedvalue,TRUE));
  case p.enrollment_filter of CURRENT..ADMIN:
    BEGIN
    Label_leave_filter.Enabled := TRUE;
    DropDownList_leave_filter.Enabled := TRUE;
    END;
  else
    BEGIN
    Label_leave_filter.Enabled := FALSE;
    DropDownList_leave_filter.selectedindex := 0;
    DropDownList_leave_filter.Enabled := FALSE;
    p.leave_filter := Class_biz_leave.NONE;
    END;
  end;
  Bind;
end;

procedure TWebUserControl_roster.DataGrid_roster_ItemCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridCommandEventArgs);
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    session.Remove('e_item');
    session.Add('e_item',e.item);
    system.collections.stack(session['waypoint_stack']).Push('overview.aspx');
    server.Transfer('member_detail.aspx');
    //
  end;
end;

procedure TWebUserControl_roster.DataGrid_roster_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    LinkButton(e.item.cells[Class_db_members.TCCI_DRILLDOWN_LINKBUTTON].controls.item[0]).text :=
      ExpandTildePath(LinkButton(e.item.cells[Class_db_members.TCCI_DRILLDOWN_LINKBUTTON].controls.item[0]).text);
    //
    if e.item.cells[Class_db_members.TCCI_CAD_NUM].text = '&nbsp;' then begin
      e.item.cells[Class_db_members.TCCI_CAD_NUM].text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    //
    if p.biz_medical_release_levels.BeReleased(e.item.cells[Class_db_members.TCCI_MEDICAL_RELEASE_PECK_CODE].text) then begin
      if e.item.cells[Class_db_members.TCCI_ENROLLMENT_OBLIGATION].text <> '&nbsp;' then begin
        p.num_raw_shifts := p.num_raw_shifts + uint32.Parse(e.item.cells[Class_db_members.TCCI_ENROLLMENT_OBLIGATION].text);
      end;
      if e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text <> '&nbsp;' then begin
        p.num_cooked_shifts := p.num_cooked_shifts + uint32.Parse(e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text);
      end;
    end;
    //
    if e.item.cells[Class_db_members.TCCI_EMAIL_ADDRESS].text <> '&nbsp;' then begin
       p.distribution_list := p.distribution_list + e.item.cells[Class_db_members.TCCI_EMAIL_ADDRESS].text + ', ';
    end;
    //
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebUserControl_roster.TWebUserControl_roster_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_roster.p');
  session.Add('UserControl_roster.p',p);
end;

procedure TWebUserControl_roster.DataGrid_roster_SortCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := Safe(e.SortExpression,KI_SORT_EXPRESSION);
    p.be_sort_order_ascending := TRUE;
  end;
  DataGrid_roster.EditItemIndex := -1;
  Bind;
end;

procedure TWebUserControl_roster.Bind;
var
  be_raw_shifts_nonzero: boolean;
begin
  //
  DataGrid_roster.columns[TCCI_AGENCY].visible := (p.agency_filter = system.string.EMPTY);
  DataGrid_roster.columns[TCCI_SECTION_NUM].visible := (p.agency_filter <> system.string.EMPTY) and (p.section_filter = 0);
  DataGrid_roster.columns[TCCI_MEDICAL_RELEASE_LEVEL].visible := not p.biz_medical_release_levels.BeLeaf(p.med_release_level_filter)
    and (not (p.enrollment_filter = ADMIN));
  DataGrid_roster.columns[TCCI_ENROLLMENT].visible := not p.biz_enrollment.BeLeaf(p.enrollment_filter);
  DataGrid_roster.columns[TCCI_LEAVE].visible := (p.leave_filter <> OBLIGATED);
  DataGrid_roster.columns[TCCI_OBLIGED_SHIFTS].visible := not (p.enrollment_filter = ADMIN);
  //
  p.biz_members.BindRoster
    (
    session['member_id'].tostring,
    p.sort_order,
    p.be_sort_order_ascending,
    DataGrid_roster,
    RadioButtonList_which_month.selectedvalue,
    p.agency_filter,
    p.enrollment_filter,
    p.leave_filter,
    p.med_release_level_filter,
    p.section_filter
    );
  //
  be_raw_shifts_nonzero := (p.num_raw_shifts > 0);
  Label_utilization.visible := be_raw_shifts_nonzero;
  Label_utilization_caption.visible := be_raw_shifts_nonzero;
  if be_raw_shifts_nonzero then begin
    Label_utilization.text := decimal(p.num_cooked_shifts/p.num_raw_shifts).tostring('P0');
  end;
  Label_num_crew_shifts.text := decimal(p.num_cooked_shifts/2).tostring;
  Label_num_rows.text := p.num_datagrid_rows.tostring;
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  TableRow_data.visible := not p.be_datagrid_empty;
  Table_quick_message.visible := Has(string_array(session['privilege_array']),'send-quickmessages') and not p.be_datagrid_empty;
  Label_distribution_list.text := (p.distribution_list + SPACE).TrimEnd([',',' ']);
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.distribution_list := system.string.EMPTY;
  p.num_cooked_shifts := 0;
  p.num_datagrid_rows := 0;
  p.num_raw_shifts := 0;
  //
end;

end.
