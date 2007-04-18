unit Class_db_members;

interface

uses
  borland.data.provider,
  Class_db,
  Class_db_medical_release_levels,
  Class_db_trail,
  Class_biz_enrollment,
  Class_biz_medical_release_levels,
  Class_biz_leave,
  Class_biz_sections,
  ki,
  system.web.ui.webcontrols;

const
  TCCI_ID                        =  0;
  TCCI_LAST_NAME                 =  1;
  TCCI_FIRST_NAME                =  2;
  TCCI_CAD_NUM                   =  3;
  TCCI_AGENCY                    =  4;
  TCCI_SECTION_NUM               =  5;
  TCCI_MEDICAL_RELEASE_PECK_CODE =  6;
  TCCI_MEDICAL_RELEASE_LEVEL     =  7;
  TCCI_BE_DRIVER_QUALIFIED       =  8;
  TCCI_ENROLLMENT                =  9;
  TCCI_ENROLLMENT_OBLIGATION     = 10;
  TCCI_LEAVE                     = 11;
  TCCI_OBLIGED_SHIFTS            = 12;
  TCCI_EMAIL_ADDRESS             = 13;

type
  TClass_db_members = class(TClass_db)
  private
    db_medical_release_levels: TClass_db_medical_release_levels;
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure Add
      (
      first_name: string;
      last_name: string;
      cad_num: string;
      medical_release_code: cardinal;
      be_driver_qualified: boolean;
      agency_id: cardinal;
      email_address: string;
      enrollment_date: datetime;
      enrollment_code: cardinal = 10
      );
    function AgencyIdOfId(id: string): string;
    function BeDriverQualifiedOf(e_item: system.object): string;
    function BeKnown
      (
      first_name: string;
      last_name: string;
      cad_num: string
      )
      : boolean;
    function BeLinkedToUser(id: string): boolean;
    function BeValidProfile(id: string): boolean;
    procedure BindRoster
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      relative_month: string;
      agency_filter: string;
      enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
      leave_filter: Class_biz_leave.filter_type = BOTH;
      med_release_level_filter: Class_biz_medical_release_levels.filter_type = ALL;
      section_filter: Class_biz_sections.filter_type = 0
      );
    function CadNumOf(e_item: system.object): string;
    function CadNumOfMemberId(member_id: string): string;
    function EnrollmentOf(e_item: system.object): string;
    function FirstNameOf(e_item: system.object): string;
    function FirstNameOfMemberId(member_id: string): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    procedure GetUserIdAndEmailAddress
      (
      member_id: string;
      out user_id: cardinal;
      out email_address: string
      );
    function IdOf(e_item: system.object): string;
    function IdOfUserId(user_id: string): string;
    function LastNameOf(e_item: system.object): string;
    function LastNameOfMemberId(member_id: string): string;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function OfficershipOf(member_id: string): string;
    function SectionOf(e_item: system.object): string;
    procedure SetDriverQualification
      (
      be_driver_qualified: boolean;
      e_item: system.object
      );
    procedure SetEmailAddress
      (
      id: string;
      email_address: string
      );
    procedure SetSection
      (
      section_num: string;
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
  end;

implementation

uses
  system.web.ui.HtmlControls;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_medical_release_levels := TClass_db_medical_release_levels.Create;
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_members.Add
  (
  first_name: string;
  last_name: string;
  cad_num: string;
  medical_release_code: cardinal;
  be_driver_qualified: boolean;
  agency_id: cardinal;
  email_address: string;
  enrollment_date: datetime;
  enrollment_code: cardinal = 10
  );
var
  sql: string;
begin
  sql := 'START TRANSACTION;'
  + ' insert into member'
  + ' set first_name = "' + first_name + '"'
  +   ' , last_name = "' + last_name + '"';
  if cad_num <> system.string.EMPTY then begin
    sql := sql + ' , cad_num = "' + cad_num + '"';
  end;
  sql := sql
  +   ' , email_address = "' + email_address + '"'
  +   ' , medical_release_code = ' + medical_release_code.tostring
  +   ' , be_driver_qualified = ' + be_driver_qualified.tostring
  +   ' , agency_id = ' + agency_id.tostring
  + ';'
  + ' insert into enrollment_history'
  + ' set member_id = (select max(id) from member)'
  +   ' , level_code = ' + enrollment_code.tostring
  +   ' , start_date = "' + enrollment_date.tostring('yyyy-MM-dd') + '"'
  + ';'
  + ' COMMIT';
  self.Open;
  bdpcommand.Create(db_trail.Saved(sql),connection).ExecuteNonQuery;
  self.Close;
end;

function TClass_db_members.AgencyIdOfId(id: string): string;
begin
  self.Open;
  AgencyIdOfId := borland.data.provider.BdpCommand.Create
    (
    'SELECT agency_id FROM member WHERE id = ' + id,
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

function TClass_db_members.BeKnown
  (
  first_name: string;
  last_name: string;
  cad_num: string
  )
  : boolean;
var
  sql: string;
begin
  sql := 'select 1 from member where'
  + ' ('
  + ' first_name = "' + first_name + '"'
  + ' and last_name = "' + last_name + '"';
  if cad_num = '' then begin
    sql := sql + ')';
  end else begin
    sql := sql + ' and (cad_num = "' + cad_num + '" or cad_num is null)) or (cad_num = "' + cad_num + '")';
  end;
  self.Open;
  BeKnown := (bdpcommand.Create(sql,connection).ExecuteScalar <> nil);
  self.Close;
end;

function TClass_db_members.BeLinkedToUser(id: string): boolean;
begin
  self.Open;
  BeLinkedToUser := (dbnull.value <> bdpcommand.Create('select user_id from member where id = ' + id,connection).ExecuteScalar); 
  self.Close;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = bdpCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

procedure TClass_db_members.BindRoster
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  relative_month: string;
  agency_filter: string;
  enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
  leave_filter: Class_biz_leave.filter_type = BOTH;
  med_release_level_filter: Class_biz_medical_release_levels.filter_type = ALL;
  section_filter: Class_biz_sections.filter_type = 0
  );
var
  any_relevant_leave: string;
  command_text: string;
  filter: string;
  kind_of_leave_selection_clause: string;
begin
  //
  any_relevant_leave :=
  '(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH))'
  + ' and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH)))';
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  filter := ' where 1=1 ';
  //
  if agency_filter <> system.string.EMPTY then begin
    filter := filter + ' and agency_id = ' + agency_filter + ' ';
  end;
  //
  if enrollment_filter <> Class_biz_enrollment.ALL then begin
    filter := filter + ' and enrollment_level.description ';
    case enrollment_filter of
    CURRENT: filter := filter + ' in ("Applicant","Operational","Associate","Regular","Life","Tenured","Special","Recruit","Admin"'
    + ',"Reduced (1)","Reduced (2)","Reduced (3)") ';
    APPLICANT: filter := filter + ' = "Applicant" ';
    OPERATIONAL: filter := filter + ' in ("Associate","Regular","Life","Tenured","Special","Reduced (1)","Reduced (2)"'
    + ',"Reduced (3)") ';
    ASSOCIATE: filter := filter + ' = "Associate" ';
    REDUCED: filter := filter + ' in ("Reduced (1)","Reduced (2)","Reduced (3)") ';
    REGULAR: filter := filter + ' = "Regular" ';
    LIFE: filter := filter + ' = "Life" ';
    TENURED: filter := filter + ' = "Tenured" ';
    SPECIAL: filter := filter + ' = "Special" ';
    RECRUIT: filter := filter + ' = "Recruit" ';
    ADMIN: filter := filter + ' = "Admin" ';
    PAST: filter := filter + '  in ("Disengaged","Resigned","Retired","Disabled","Expelled") ';
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
      OBLIGATED: filter := filter + ' and (not(' + any_relevant_leave + ') or (leave_of_absence.start_date is null)) ';
      ON_LEAVE: filter := filter + ' and ' + any_relevant_leave + ' ';
      end;
      END;
    end;
  end;
  //
  if med_release_level_filter <> Class_biz_medical_release_levels.ALL then begin
    filter := filter + ' and medical_release_code_description_map.description ';
    case med_release_level_filter of
    NOT_RELEASED: filter := filter + ' in ("None","In class","Trainee") ';
    Class_biz_medical_release_levels.NONE: filter := filter + ' = "none" ';
    IN_CLASS: filter := filter + ' = "In class" ';
    TRAINEE: filter := filter + ' = "Trainee" ';
    RELEASED: filter := filter + ' in ("EMT-B","EMT-ST","EMT-E","EMT-CT","EMT-I","EMT-P") ';
    EMT_B: filter := filter + ' = "EMT-B" ';
    EMT_ST: filter := filter + ' = "EMT-ST" ';
    EMT_E: filter := filter + ' = "EMT-E" ';
    EMT_CT: filter := filter + ' = "EMT-CT" ';
    EMT_I: filter := filter + ' = "EMT-I" ';
    EMT_P: filter := filter + ' = "EMT-P" ';
    end;
  end;
  //
  if section_filter > 0 then begin
    filter := filter + ' and section_num = ' + uint32(section_filter).tostring + ' ';
  end;
  //
  kind_of_leave_selection_clause := 'if(' + any_relevant_leave + ',kind_of_leave_code_description_map.description,"")';
  //
  command_text :=
  'select member.id as member_id'                                                        // column 0
  + ' , last_name'                                                                       // column 1
  + ' , first_name'                                                                      // column 2
  + ' , cad_num'                                                                         // column 3
  + ' , agency_id'                                                                       // column 4
  + ' , section_num'                                                                     // column 5
  + ' , medical_release_code_description_map.pecking_order as medical_release_peck_code' // column 6
  + ' , medical_release_code_description_map.description as medical_release_description' // column 7
  + ' , if(be_driver_qualified,"TRUE","false") as be_driver_qualified'                   // column 8
  + ' , enrollment_level.description as enrollment'                                      // column 9
  + ' , num_shifts as enrollment_obligation'                                             // column 10
  + ' , ' + kind_of_leave_selection_clause + ' as kind_of_leave'                         // column 11
  + ' , if(' + any_relevant_leave + ',num_obliged_shifts,num_shifts) as obliged_shifts'  // column 12
  + ' , email_address'                                                                   // column 13
  + ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history'
  +     ' on'
  +       ' ('
  +       ' enrollment_history.member_id=member.id'
  +       ' and'
  +         ' ('
  +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH))'
  +         ' and'
  +           ' ('
  +             ' (enrollment_history.end_date is null)'
  +           ' or'
  +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH)))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
  +   ' left join leave_of_absence'
  +     ' on'
  +       ' ('
  +       ' leave_of_absence.member_id=member.id'
  +       ' and '
  +         ' ('
  +           ' (leave_of_absence.start_date is null)'
  +         ' or'
  +           ' ('
  +             ' (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH))'
  +           ' and'
  +             ' (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH)))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' left join kind_of_leave_code_description_map'
  +     ' on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
  +   filter
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

function TClass_db_members.CadNumOfMemberId(member_id: string): string;
begin
  self.Open;
  CadNumOfMemberId := bdpcommand.Create('select cad_num from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := Safe(DataGridItem(e_item).cells[TCCI_ENROLLMENT].text,NARRATIVE);
end;

function TClass_db_members.FirstNameOf(e_item: system.object): string;
begin
  FirstNameOf := Safe(DataGridItem(e_item).cells[TCCI_FIRST_NAME].text,HUMAN_NAME);
end;

function TClass_db_members.FirstNameOfMemberId(member_id: string): string;
begin
  self.Open;
  FirstNameOfMemberId := bdpcommand.Create('select first_name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
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

procedure TClass_db_members.GetUserIdAndEmailAddress
  (
  member_id: string;
  out user_id: cardinal;
  out email_address: string
  );
var
  bdr: bdpdatareader;
begin
  //
  user_id := 0;
  email_address := system.string.EMPTY;
  //
  self.Open;
  bdr := bdpcommand.Create('select user_id,email_address from member where id = ' + member_id,connection).ExecuteReader;
  bdr.Read;
  if bdr['user_id'] <> dbnull.value then begin
    user_id := uint32.Parse(bdr['user_id'].tostring);
  end;
  if bdr['email_address'] <> dbnull.value then begin
    email_address := bdr['email_address'].tostring;
  end;
  self.Close;
end;

function TClass_db_members.IdOf(e_item: system.object): string;
begin
  IdOf := Safe(DataGridItem(e_item).cells[TCCI_ID].text,NUM);
end;

function TClass_db_members.IdOfUserId(user_id: string): string;
begin
  self.Open;
  IdOfUserId := bdpcommand.Create('select id from member where user_id = ' + user_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.LastNameOf(e_item: system.object): string;
begin
  LastNameOf := Safe(DataGridItem(e_item).cells[TCCI_LAST_NAME].text,HUMAN_NAME);
end;

function TClass_db_members.LastNameOfMemberId(member_id: string): string;
begin
  self.Open;
  LastNameOfMemberId := bdpcommand.Create('select last_name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.MedicalReleaseLevelOf(e_item: system.object): string;
begin
  MedicalReleaseLevelOf := Safe(DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_LEVEL].text,NARRATIVE);
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

function TClass_db_members.SectionOf(e_item: system.object): string;
begin
  SectionOf := Safe(DataGridItem(e_item).cells[TCCI_SECTION_NUM].text,NUM);
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
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET be_driver_qualified = ' + be_driver_qualified.tostring
      + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text
      ),
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

procedure TClass_db_members.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member '
      + 'SET email_address = "' + email_address + '"'
      + 'WHERE id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_members.SetSection
  (
  section_num: string;
  e_item: system.object
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    db_trail.Saved('UPDATE member SET section_num = ' + section_num + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_SECTION_NUM].Text := section_num;
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
    db_trail.Saved('UPDATE member SET medical_release_code = ' + code + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text),
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
    db_trail.Saved
      (
      'UPDATE member '
      + 'SET name = "' + name + '"'
      +   ', be_valid_profile = TRUE '
      + 'WHERE id = "' + id + '"'
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

end.
