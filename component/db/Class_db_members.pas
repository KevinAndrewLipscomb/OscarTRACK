unit Class_db_members;

interface

uses
  borland.data.provider,
  Class_db,
  Class_db_medical_release_levels,
  Class_biz_enrollment,
  Class_biz_leave,
  ki,
  system.web.ui.webcontrols;

const
  TCCI_ID = 0;
  TCCI_LAST_NAME = 1;
  TCCI_FIRST_NAME = 2;
  TCCI_CAD_NUM = 3;
  TCCI_MEDICAL_RELEASE_LEVEL = 4;
  TCCI_BE_DRIVER_QUALIFIED = 5;
  TCCI_ENROLLMENT = 6;
  TCCI_LEAVE = 7;
  TCCI_KIND_OF_LEAVE_HIDDEN = 8;
  TCCI_TIME_OF_LEAVE_HIDDEN = 9;

type
  TClass_db_members = class(TClass_db)
  private
    db_medical_release_levels: TClass_db_medical_release_levels;
  public
    constructor Create;
    function AffiliateNumOfId(id: string): string;
    function BeDriverQualifiedOf(e_item: system.object): string;
    function BeValidProfile(id: string): boolean;
    procedure BindDropDownList
      (
      agency_user_id: string;
      target: system.object;
      be_unfiltered: boolean = FALSE
      );
    procedure BindSquadCommanderOverview
      (
      agency_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
      leave_filter: Class_biz_leave.filter_type = BOTH
      );
    function CadNumOf(e_item: system.object): string;
    function EnrollmentOf(e_item: system.object): string;
    function FirstNameOf(e_item: system.object): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function IdOf(e_item: system.object): string;
    function KindOfLeaveOf(e_item: system.object): string;
    function LastNameOf(e_item: system.object): string;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function NameOf(member_id: string): string;
    function OfficershipOf(member_id: string): string;
    procedure SetDriverQualification
      (
      be_driver_qualified: boolean;
      e_item: system.object
      );
    procedure SetMedicalReleaseCode
      (
      code: string;
      e_item: system.object
      );
    procedure SetProfile
      (
      id: string;
      name: string
      );
    function TimeOfLeaveOf(e_item: system.object): string;
  end;

implementation

uses
  system.web.ui.HtmlControls;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_medical_release_levels := TClass_db_medical_release_levels.Create;
end;

function TClass_db_members.AffiliateNumOfId(id: string): string;
begin
  self.Open;
  AffiliateNumOfId := borland.data.provider.BdpCommand.Create
    (
    'SELECT affiliate_num FROM member WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.BeDriverQualifiedOf(e_item: system.object): string;
var
  be_driver_qualified_of: string;
begin
  be_driver_qualified_of := Safe(DataGridItem(e_item).cells[TCCI_BE_DRIVER_QUALIFIED].text,ALPHA);
  if be_driver_qualified_of = 'nbsp' then begin
    BeDriverQualifiedOf := system.string.Empty;
  end else begin
    BeDriverQualifiedOf := be_driver_qualified_of;
  end;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = bdpCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

procedure TClass_db_members.BindDropDownList
  (
  agency_user_id: string;
  target: system.object;
  be_unfiltered: boolean = FALSE
  );
var
  bdr: borland.data.provider.bdpdatareader;
  cmdText: string;
begin
  self.Open;
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --','0'));
  //
  cmdText := 'SELECT id,name FROM member_user JOIN member using (id) WHERE be_active = TRUE ';
  if not be_unfiltered then begin
    cmdText := cmdText + 'and agency_code = ' + agency_user_id + ' ';
  end;
  cmdText := cmdText + 'ORDER BY name';
  //
  bdr := Borland.Data.Provider.BdpCommand.Create(cmdText,connection).ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['name'].tostring,bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_members.BindSquadCommanderOverview
  (
  agency_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
  leave_filter: Class_biz_leave.filter_type = BOTH
  );
var
  any_relevant_leave_test_string: string;
  command_text: string;
  current_month_first_date_string: string;
  current_month_num: cardinal;
  current_month_num_string: string;
  current_year_num: cardinal;
  current_year_num_string: string;
  filter: string;
  kind_of_leave_selection_clause: string;
  time_of_leave_selection_clause: string;
  today: datetime;
begin
  //
  today := datetime.Today;
  current_year_num := today.Year;
  current_year_num_string := current_year_num.tostring('d4');
  current_month_num := today.Month;
  current_month_num_string := current_year_num_string + '-' + current_month_num.tostring('d2');
  current_month_first_date_string := current_month_num_string + '-01';
  //
  any_relevant_leave_test_string := '(leave_of_absence.start_date <= "' + current_month_first_date_string + '")'
  + ' and (leave_of_absence.end_date >= LAST_DAY("' + current_month_first_date_string + '"))';
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  filter := system.string.EMPTY;
  //
  if enrollment_filter <> ALL then begin
    filter := ' and obligation_code_description_map.description ';
    case enrollment_filter of
    CURRENT: filter := filter + ' in ("Operational","Associate","Regular","Life","Tenured","Special","Recruit","Admin") ';
    OPERATIONAL: filter := filter + ' in ("Associate","Regular","Life","Tenured","Special") ';
    ASSOCIATE: filter := filter + ' = "Associate" ';
    REGULAR: filter := filter + ' = "Regular" ';
    LIFE: filter := filter + ' = "Life" ';
    TENURED: filter := filter + ' = "Tenured" ';
    SPECIAL: filter := filter + ' = "Special" ';
    RECRUIT: filter := filter + ' = "Recruit" ';
    ADMIN: filter := filter + ' = "Admin" ';
    PAST: filter := filter + '  in ("Disengaged","Resigned","Disabled","Expelled","Deceased") ';
    LOST_INTEREST: filter := filter + ' = "Disengaged" ';
    RESIGNED: filter := filter + ' = "Resigned" ';
    RETIRED: filter := filter + ' = "Retired" ';
    DISABLED: filter := filter + ' = "Disabled" ';
    EXPELLED: filter := filter + ' = "Expelled" ';
    DECEASED: filter := filter + ' = "Deceased" ';
    end;
    //
    case enrollment_filter of
    CURRENT..ADMIN:
      BEGIN
      case leave_filter of
      OBLIGATED: filter := filter + ' and (not(' + any_relevant_leave_test_string + ') or (leave_of_absence.start_date is null)) ';
      ON_LEAVE: filter := filter + ' and ' + any_relevant_leave_test_string + ' ';
      end;
      END;
    end;
  end;
  //
  kind_of_leave_selection_clause := 'if(' + any_relevant_leave_test_string + ',kind_of_leave_code_description_map.description,"")';
  time_of_leave_selection_clause := 'concat('
  +     ' if((leave_of_absence.start_date < "' + current_month_first_date_string + '")'
  +       ' and (leave_of_absence.end_date >= LAST_DAY("' + current_month_first_date_string + '"))'
  +       ' ,"&lt;&nbsp;","")'
  +     ' ,if((leave_of_absence.start_date <= "' + current_month_first_date_string + '")'
  +       ' and (leave_of_absence.end_date >= LAST_DAY("' + current_month_first_date_string + '"))'
  +       ' ,concat(DATE_FORMAT("' + current_month_first_date_string + '","%b"),"&nbsp;"),"")'
  +     ' ,if((leave_of_absence.start_date <= DATE_ADD("' + current_month_first_date_string + '",INTERVAL 1 MONTH))'
  +       ' and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD("' + current_month_first_date_string + '",INTERVAL 1 MONTH)))'
  +       ' ,concat(DATE_FORMAT(DATE_ADD("' + current_month_first_date_string + '",INTERVAL 1 MONTH),"%b"),"&nbsp;"),"")'
  +     ' ,if(leave_of_absence.end_date > LAST_DAY("' + current_month_first_date_string + '"),"&gt;","")'
  +   ' )';
  //
  command_text :=
  'select member.id as member_id'                                                        // column 0
  + ' , last_name'                                                                       // column 1
  + ' , first_name'                                                                      // column 2
  + ' , cad_num'                                                                         // column 3
  + ' , medical_release_code_description_map.description as medical_release_description' // column 4
  + ' , if(be_driver_qualified,"TRUE","false") as be_driver_qualified'                   // column 5
  + ' , obligation_code_description_map.description as enrollment'                       // column 6
  + ' , ' + kind_of_leave_selection_clause + ' as kind_of_leave'                         // column 7.1
  + ' , ' + time_of_leave_selection_clause + ' as time_of_leave'                         // column 7.2
  + ' , ' + kind_of_leave_selection_clause + ' as kind_of_leave_hidden'                  // column 8
  + ' , ' + time_of_leave_selection_clause + ' as time_of_leave_hidden'                  // column 9
  + ' , max(leave_of_absence.start_date) as max_start_date'                              // column 10
  + ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history on (enrollment_history.member_id=member.id)'
  +   ' join obligation_code_description_map on (obligation_code_description_map.code=enrollment_history.obligation_code)'
  +   ' left join leave_of_absence on (leave_of_absence.member_id=member.id)'
  +   ' left join kind_of_leave_code_description_map'
  +     ' on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
  + ' where agency_id = ' + agency_id
  +   ' and end_disposition_code is null'
  +   filter
  + ' group by member_id'
  + ' order by ' + sort_order;
  //
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create(command_text,connection).ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

function TClass_db_members.CadNumOf(e_item: system.object): string;
begin
  CadNumOf := Safe(DataGridItem(e_item).cells[TCCI_CAD_NUM].text,NUM);
end;

function TClass_db_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := Safe(DataGridItem(e_item).cells[TCCI_ENROLLMENT].text,NARRATIVE);
end;

function TClass_db_members.FirstNameOf(e_item: system.object): string;
begin
  FirstNameOf := Safe(DataGridItem(e_item).cells[TCCI_FIRST_NAME].text,HUMAN_NAME);
end;

procedure TClass_db_members.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
var
  bdr: borland.data.provider.BdpDataReader;
begin
  self.Open;
  bdr := borland.data.provider.BdpCommand.Create
    (
    'SELECT name,'
    + 'be_valid_profile '
    + 'FROM member '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteReader;
  bdr.Read;
  name := bdr['name'].tostring;
  be_valid_profile := (bdr['be_valid_profile'].tostring = '1');
  bdr.Close;
  self.Close;
end;

function TClass_db_members.IdOf(e_item: system.object): string;
begin
  IdOf := Safe(DataGridItem(e_item).cells[TCCI_ID].text,NUM);
end;

function TClass_db_members.KindOfLeaveOf(e_item: system.object): string;
var
  kind_of_leave_of: string;
begin
  kind_of_leave_of := Safe(DataGridItem(e_item).cells[TCCI_KIND_OF_LEAVE_HIDDEN].text,ALPHA);
  if kind_of_leave_of = 'nbsp' then begin
    KindOfLeaveOf := system.string.EMPTY;
  end else begin
    KindOfLeaveOf := kind_of_leave_of;
  end;
end;

function TClass_db_members.LastNameOf(e_item: system.object): string;
begin
  LastNameOf := Safe(DataGridItem(e_item).cells[TCCI_LAST_NAME].text,HUMAN_NAME);
end;

function TClass_db_members.MedicalReleaseLevelOf(e_item: system.object): string;
begin
  MedicalReleaseLevelOf := Safe(DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_LEVEL].text,NARRATIVE);
end;

function TClass_db_members.NameOf(member_id: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.OfficershipOf(member_id: string): string;
var
  rank_name_obj: system.object;
begin
  self.Open;
  rank_name_obj := bdpcommand.Create
    (
    'select rank.name'
    + ' from member join officership on (officership.member_id=member.id)'
    +   ' join rank on (rank.code=officership.rank_code)'
    + ' where member.id = ' + member_id,
    connection
    )
    .ExecuteScalar;
  if rank_name_obj <> nil then begin
    OfficershipOf := rank_name_obj.tostring;
  end else begin
    OfficershipOf := system.string.EMPTY;
  end;
  self.Close;
end;

procedure TClass_db_members.SetDriverQualification
  (
  be_driver_qualified: boolean;
  e_item: system.object
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE member'
    + ' SET be_driver_qualified = ' + be_driver_qualified.tostring
    + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text,
    connection
    )
    .ExecuteNonQuery;
  if be_driver_qualified then begin
    DataGridItem(e_item).cells[TCCI_BE_DRIVER_QUALIFIED].Text := 'TRUE';
  end else begin
    DataGridItem(e_item).cells[TCCI_BE_DRIVER_QUALIFIED].Text := 'false';
  end;
  self.Close;
end;

procedure TClass_db_members.SetMedicalReleaseCode
  (
  code: string;
  e_item: system.object
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE member SET medical_release_code = ' + code + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text,
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_LEVEL].Text := db_medical_release_levels.DescriptionOf(code);
  self.Close;
end;

procedure TClass_db_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE member '
    + 'SET name = "' + name + '"'
    +   ', be_valid_profile = TRUE '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

function TClass_db_members.TimeOfLeaveOf(e_item: system.object): string;
begin
  TimeOfLeaveOf := DataGridItem(e_item).cells[TCCI_TIME_OF_LEAVE_HIDDEN].text;
end;

end.
