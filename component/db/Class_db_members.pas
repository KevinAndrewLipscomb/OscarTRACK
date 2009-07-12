unit Class_db_members;

interface

uses
  mysql.data.mysqlclient,
  Class_db,
  Class_db_agencies,
  Class_db_medical_release_levels,
  Class_db_trail,
  Class_biz_enrollment,
  Class_biz_medical_release_levels,
  Class_biz_leave,
  Class_biz_notifications,
  Class_biz_sections,
  kix,
  system.collections,
  system.web.ui.webcontrols;

const
  TCCI_DRILLDOWN_LINKBUTTON      =  0;
  TCCI_ID                        =  1;
  TCCI_LAST_NAME                 =  2;
  TCCI_FIRST_NAME                =  3;
  TCCI_CAD_NUM                   =  4;
  TCCI_AGENCY                    =  5;
  TCCI_SECTION_NUM               =  6;
  TCCI_MEDICAL_RELEASE_PECK_CODE =  7;
  TCCI_MEDICAL_RELEASE_LEVEL     =  8;
  TCCI_BE_DRIVER_QUALIFIED       =  9;
  TCCI_ENROLLMENT                = 10;
  TCCI_LENGTH_OF_SERVICE         = 11;
  TCCI_COMMITMENT_LEVEL_CODE     = 12;
  TCCI_ENROLLMENT_OBLIGATION     = 13;
  TCCI_LEAVE                     = 14;
  TCCI_OBLIGED_SHIFTS            = 15;
  TCCI_EMAIL_ADDRESS             = 16;
  TCCI_PHONE_NUM                 = 17;

type
  TClass_db_members = class(TClass_db)
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
      enrollment_code: cardinal = 17;
      phone_num: string = ''
      );
    function AgencyOf(e_item: system.object): string;
    function AgencyIdOfId(id: string): string;
    function BeDriverQualifiedOf(e_item: system.object): boolean;
    function BeKnown(cad_num: string): boolean; overload;
    function BeKnown
      (
      first_name: string;
      last_name: string;
      cad_num: string
      )
      : boolean; overload;
    function BeValidProfile(id: string): boolean;
    procedure BindCurrentDirectToListControl
      (
      target: system.object;
      agency_filter: string = EMPTY;
      unselected_literal: string = '-- Member --';
      selected_value: string = EMPTY
      );
    procedure BindRankedCoreOpsSize
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedCrewShiftsForecast
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedNumMembersInPipeline
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedStandardEnrollment
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedUtilization
      (
      target: system.object;
      do_log: boolean = TRUE
      );
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
      section_filter: Class_biz_sections.filter_type = 0;
      running_only_filter: boolean = FALSE
      );
    procedure BindSpecialForRankedLengthOfService(target: system.object);
    function CadNumOf(e_item: system.object): string;
    function CadNumOfMemberId(member_id: string): string;
    function CurrentMemberEmailAddresses: queue;
    function EmailAddressOf(member_id: string): string;
    function EnrollmentOf(e_item: system.object): string;
    function EnrollmentOfMemberId(member_id: string): string;
    function FirstNameOf(e_item: system.object): string;
    function FirstNameOfMemberId(member_id: string): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function HighestTierOf(id: string): string;
    function IdOf(e_item: system.object): string;
    function IdOfFirstnameLastnameCadnum
      (
      first_name: string;
      last_name: string;
      cad_num: string
      )
      : string;
    function IdOfRoleHolder(role_name: string): string;
    function IdOfRoleHolderAtAgency
      (
      role_name: string;
      agency_short_designator: string
      )
      : string;
    function IdOfUserId(user_id: string): string;
    function LastNameOf(e_item: system.object): string;
    function LastNameOfMemberId(member_id: string): string;
    procedure MakeMemberStatusStatements;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function MedicalReleaseLevelOfMemberId(member_id: string): string;
    function OfficershipOf(member_id: string): string;
    function PhoneNumOf(member_id: string): string;
    function PeckCodeOf(e_item: system.object): string;
    function RetentionOf(e_item: system.object): string;
    function SectionOf(e_item: system.object): string;
    procedure SetAgency
      (
      agency_id: string;
      e_item: system.object
      );
    procedure SetCadNum
      (
      cad_num: string;
      e_item: system.object
      );
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
    procedure SetName
      (
      first: string;
      last: string;
      e_item: system.object
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
    procedure SetPhoneNum
      (
      phone_num: string;
      e_item: system.object
      );
    procedure SetProfile
      (
      id: string;
      name: string
      );
    function UserIdOf(member_id: string): string;
  strict private
    biz_notifications: TClass_biz_notifications;
    db_agencies: TClass_db_agencies;
    db_medical_release_levels: TClass_db_medical_release_levels;
    db_trail: TClass_db_trail;
  end;

function CrewShiftsForecastMetricFromWhereClause(relative_month: string): string;

implementation

uses
  system.web.ui.HtmlControls;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_notifications := TClass_biz_notifications.Create;
  db_agencies := TClass_db_agencies.Create;
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
  enrollment_code: cardinal = 17;
  phone_num: string = ''
  );
var
  enrollment_date_string: string;
  sql: string;
begin
  //
  enrollment_date_string := enrollment_date.tostring('yyyy-MM-dd');
  //
  sql := 'START TRANSACTION;'
  + ' insert into member'
  +   ' set first_name = "' + first_name.ToUpper + '"'
  +     ' , last_name = "' + last_name.ToUpper + '"';
  if cad_num <> EMPTY then begin
    sql := sql + ' , cad_num = "' + cad_num + '"';
  end;
  sql := sql
  +     ' , email_address = "' + email_address + '"'
  +     ' , medical_release_code = ' + medical_release_code.tostring
  +     ' , be_driver_qualified = ' + be_driver_qualified.tostring
  +     ' , agency_id = ' + agency_id.tostring
  +     ' , phone_num = "' + phone_num + '"';
  if enrollment_code in [1,2,3,4,5,6,7,8,9,10,18,21] then begin
    sql := sql + ' , equivalent_los_start_date = "' + enrollment_date_string + '"';
  end;
  sql := sql
  + ';'
  + ' insert into enrollment_history'
  +   ' set member_id = (select max(id) from member)'
  +     ' , level_code = ' + enrollment_code.tostring
  +     ' , start_date = "' + enrollment_date_string + '"'
  + ';'
  + ' COMMIT';
  self.Open;
  mysqlcommand.Create(db_trail.Saved(sql),connection).ExecuteNonQuery;
  self.Close;
end;

function TClass_db_members.AgencyOf(e_item: system.object): string;
begin
  AgencyOf := Safe(DataGridItem(e_item).cells[TCCI_AGENCY].text,ALPHANUM);
end;

function TClass_db_members.AgencyIdOfId(id: string): string;
var
  agency_id_of_id_obj: system.object;
begin
  self.Open;
  agency_id_of_id_obj := mysqlcommand.Create('SELECT agency_id FROM member WHERE id = "' + id + '"',connection).ExecuteScalar;
  self.Close;
  if assigned(agency_id_of_id_obj) then begin
    AgencyIdOfId := agency_id_of_id_obj.tostring;
  end else begin
    AgencyIdOfId := EMPTY;
  end;
end;

function TClass_db_members.BeDriverQualifiedOf(e_item: system.object): boolean;
begin
  BeDriverQualifiedOf := BooleanOfYesNo(Safe(DataGridItem(e_item).cells[TCCI_BE_DRIVER_QUALIFIED].text,ALPHA));
end;

function TClass_db_members.BeKnown(cad_num: string): boolean;
begin
  self.Open;
  BeKnown := (mysqlcommand.Create('select 1 from member where cad_num = "' + cad_num + '"',connection).ExecuteScalar <> nil);
  self.Close;
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
    sql := sql + ' and (cad_num = "' + cad_num + '" or cad_num is null or cad_num like "9%")) or (cad_num = "' + cad_num + '")';
  end;
  self.Open;
  BeKnown := (mysqlcommand.Create(sql,connection).ExecuteScalar <> nil);
  self.Close;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = mysqlcommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

procedure TClass_db_members.BindCurrentDirectToListControl
  (
  target: system.object;
  agency_filter: string = EMPTY;
  unselected_literal: string = '-- Member --';
  selected_value: string = EMPTY
  );
var
  dr: mysqldatareader;
  where_clause: string;
begin
  //
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).items.Add(listitem.Create(unselected_literal,EMPTY));
  end;
  //
  where_clause := ' where (enrollment_level.description in ("Applicant","Associate","Regular","Life","Tenured","Atypical",'
  + '"Recruit","Admin","Reduced (1)","Reduced (2)","Reduced (3)","SpecOps","Transferring","Suspended","New trainee"))';
  if agency_filter <> EMPTY then begin
    where_clause := where_clause + ' and (agency_id = "' + agency_filter + '")';
  end;
  //
  self.Open;
  dr := mysqlcommand.Create
    (
    'select member.id as member_id'
    + ' , concat(last_name,", ",first_name," (",IFNULL(cad_num,""),")") as member_designator'
    + ' from member'
    +   ' join enrollment_history'
    +     ' on'
    +       ' ('
    +       '   enrollment_history.member_id=member.id'
    +       ' and'
    +       '   (enrollment_history.end_date is null)'
    +       ' )'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    + where_clause
    + ' order by member_designator',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['member_designator'].tostring,dr['member_id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

procedure TClass_db_members.BindRankedCoreOpsSize
  (
  target: system.object;
  do_log: boolean = TRUE
  );
var
  from_where_phrase: string;
  metric_phrase: string;
begin
  //
  metric_phrase := ' count(*)';
  from_where_phrase := ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history'
  +     ' on'
  +       ' ('
  +       ' enrollment_history.member_id=member.id'
  +       ' and'
  +         ' ('
  +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
  +         ' and'
  +           ' ('
  +             ' (enrollment_history.end_date is null)'
  +           ' or'
  +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
  +   ' join agency on (agency.id=member.agency_id)'
  + ' where'
  +     ' enrollment_level.description in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)","Reduced (3)","New trainee")'
  +   ' and'
  +     ' medical_release_code_description_map.pecking_order >= ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring;
  //
  self.Open;
  if do_log then begin
    mysqlcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        //
        // Log squad-by-squad indicators.
        //
        + ' replace indicator_core_ops_size (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , TRUE'
        +     ' , agency.id'
        +     ' , ' + metric_phrase
        + from_where_phrase
        +   ' group by agency.id'
        + ';'
        //
        // Log citywide indicator.
        //
        + ' replace indicator_core_ops_size (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , FALSE'
        +     ' , 0'
        +     ' , ' + metric_phrase
        + from_where_phrase
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    //
  end;
  //
  // Bind datagrid for display.
  //
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , ' + metric_phrase + ' as count'
    + from_where_phrase
    + ' group by agency.id'
    + ' order by count desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_members.BindRankedCrewShiftsForecast
  (
  target: system.object;
  do_log: boolean = TRUE
  );
var
  metric_from_where_clause: string;
begin
  metric_from_where_clause := CrewShiftsForecastMetricFromWhereClause('0');
  self.Open;
  if do_log then begin
    mysqlcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        //
        // Log squad-by-squad indicators.
        //
        + ' replace indicator_crew_shifts_forecast (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , TRUE'
        +     ' , agency.id'
        +     ' , ' + metric_from_where_clause
        +   ' group by agency.id'
        + ';'
        //
        // Log citywide indicator.
        //
        + ' replace indicator_crew_shifts_forecast (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , FALSE'
        +     ' , 0'
        +     ' , ' + metric_from_where_clause
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    //
  end;
  //
  // Bind datagrid for display.
  //
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , ' + metric_from_where_clause
    + ' group by agency.id'
    + ' order by num_crew_shifts desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_members.BindRankedNumMembersInPipeline
  (
  target: system.object;
  do_log: boolean = TRUE
  );
var
  from_where_phrase: string;
  metric_phrase: string;
begin
  //
  metric_phrase := ' count(*)';
  from_where_phrase := ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history'
  +     ' on'
  +       ' ('
  +       ' enrollment_history.member_id=member.id'
  +       ' and'
  +         ' ('
  +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
  +         ' and'
  +           ' ('
  +             ' (enrollment_history.end_date is null)'
  +           ' or'
  +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
  +   ' join agency on (agency.id=member.agency_id)'
  + ' where'
  +     ' (enrollment_level.description in ("Recruit","New trainee"))'
  +   ' or'
  +     ' ('
  +       ' enrollment_level.description in ("Regular")'
  +     ' and'
  +       ' medical_release_code_description_map.pecking_order < ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring
  +     ' )';
  //
  self.Open;
  if do_log then begin
    mysqlcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        //
        // Log squad-by-squad indicators.
        //
        + ' replace indicator_num_members_in_pipeline (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , TRUE'
        +     ' , agency.id'
        +     ' , ' + metric_phrase
        + from_where_phrase
        +   ' group by agency.id'
        + ';'
        //
        // Log citywide indicator.
        //
        + ' replace indicator_num_members_in_pipeline (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , FALSE'
        +     ' , 0'
        +     ' , ' + metric_phrase
        + from_where_phrase
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    //
  end;
  //
  // Bind datagrid for display.
  //
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , ' + metric_phrase + ' as count'
    + from_where_phrase
    + ' group by agency.id'
    + ' order by count desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_members.BindRankedStandardEnrollment
  (
  target: system.object;
  do_log: boolean = TRUE
  );
var
  from_where_phrase: string;
  metric_phrase: string;
begin
  //
  metric_phrase := ' count(if((core_ops_commitment_level_code = 3),1,NULL))/count(*)';
  from_where_phrase := ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history'
  +     ' on'
  +       ' ('
  +       ' enrollment_history.member_id=member.id'
  +       ' and'
  +         ' ('
  +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
  +         ' and'
  +           ' ('
  +             ' (enrollment_history.end_date is null)'
  +           ' or'
  +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
  +   ' join agency on (agency.id=member.agency_id)'
  + ' where'
  +     ' enrollment_level.description in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)","Reduced (3)","New trainee")'
  +   ' and'
  +     ' medical_release_code_description_map.pecking_order >= ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring;
  //
  self.Open;
  if do_log then begin
    mysqlcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        //
        // Log squad-by-squad indicators.
        //
        + ' replace indicator_standard_enrollment (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , TRUE'
        +     ' , agency.id'
        +     ' , ' + metric_phrase + '*100'
        + from_where_phrase
        +   ' group by agency.id'
        + ';'
        //
        // Log citywide indicator.
        //
        + ' replace indicator_standard_enrollment (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , FALSE'
        +     ' , 0'
        +     ' , ' + metric_phrase + '*100'
        + from_where_phrase
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    //
  end;
  //
  // Bind datagrid for display.
  //
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , count(if((core_ops_commitment_level_code = 3),1,NULL)) as num_standard_enrollments'
    + ' , count(*) as num_core_ops_members'
    + ' , ' + metric_phrase + ' as factor'
    + from_where_phrase
    + ' group by agency.id'
    + ' order by factor desc, num_core_ops_members desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_members.BindRankedUtilization
  (
  target: system.object;
  do_log: boolean = TRUE
  );
var
  from_where_phrase: string;
  metric_phrase: string;
begin
  //
  metric_phrase := ' sum('
  +     ' if'
  +       ' ('
  +         ' (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),'
  +         ' num_obliged_shifts,'
  +         ' num_shifts'
  +       ' )'
  +     ' )/sum(num_shifts)';
  from_where_phrase := ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history'
  +     ' on'
  +       ' ('
  +       ' enrollment_history.member_id=member.id'
  +       ' and'
  +         ' ('
  +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
  +         ' and'
  +           ' ('
  +             ' (enrollment_history.end_date is null)'
  +           ' or'
  +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
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
  +             ' (leave_of_absence.start_date <= CURDATE())'
  +           ' and'
  +             ' (leave_of_absence.end_date >= LAST_DAY(CURDATE()))'
  +           ' )'
  +         ' )'
  +       ' )'
  +   ' join agency on (agency.id=member.agency_id)'
  + ' where'
  +     ' enrollment_level.description in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)","Reduced (3)","New trainee")'
  +   ' and'
  +     ' medical_release_code_description_map.pecking_order >= ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring;
  //
  self.Open;
  if do_log then begin
    mysqlcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        //
        // Log squad-by-squad indicators.
        //
        + ' replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , TRUE'
        +     ' , agency.id'
        +     ' , ' + metric_phrase + '*100'
        + from_where_phrase
        +   ' group by agency.id'
        + ';'
        //
        // Log citywide indicator.
        //
        + ' replace indicator_utilization (year,month,be_agency_id_applicable,agency_id,value)'
        +   ' select YEAR(CURDATE())'
        +     ' , MONTH(CURDATE())'
        +     ' , FALSE'
        +     ' , 0'
        +     ' , ' + metric_phrase + '*100'
        + from_where_phrase
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    //
  end;
  //
  // Bind datagrid for display.
  //
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , sum('
    +     ' if'
    +       ' ('
    +         ' (leave_of_absence.start_date <= CURDATE()) and (leave_of_absence.end_date >= LAST_DAY(CURDATE())),'
    +         ' num_obliged_shifts,'
    +         ' num_shifts'
    +       ' )'
    +     ' ) as num_cooked_shifts'
    + ' , sum(num_shifts) as num_raw_shifts'
    + ' , ' + metric_phrase + ' as utilization'
    + from_where_phrase
    + ' group by agency.id'
    + ' order by utilization desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
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
  section_filter: Class_biz_sections.filter_type = 0;
  running_only_filter: boolean = FALSE
  );
var
  any_relevant_leave: string;
  command_text: string;
  filter: string;
  kind_of_leave_selection_clause: string;
  obliged_shifts_selection_clause: string;
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
  if agency_filter <> EMPTY then begin
    filter := filter + ' and agency_id = ' + agency_filter + SPACE;
  end;
  //
  if enrollment_filter <> Class_biz_enrollment.ALL then begin
    filter := filter + ' and enrollment_level.description ';
    case enrollment_filter of
    CURRENT: filter := filter + ' in ("Applicant","Associate","Regular","Life","Tenured","Atypical","Recruit","Admin"'
    + ',"Reduced (1)","Reduced (2)","Reduced (3)","SpecOps","Transferring","Suspended","New trainee") ';
    APPLICANT: filter := filter + ' = "Applicant" ';
    OPERATIONAL: filter := filter + ' in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)"'
    + ',"Reduced (3)","SpecOps","New trainee") ';
    STANDARD_OPS: filter := filter + ' in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)"'
    + ',"Reduced (3)","New trainee") ';
    ASSOCIATE: filter := filter + ' = "Associate" ';
    REDUCED: filter := filter + ' in ("Reduced (1)","Reduced (2)","Reduced (3)") ';
    REGULAR: filter := filter + ' = "Regular" ';
    LIFE: filter := filter + ' = "Life" ';
    TENURED: filter := filter + ' = "Tenured" ';
    ATYPICAL: filter := filter + ' = "Atypical" ';
    SPECOPS: filter := filter + ' = "SpecOps" ';
    RECRUIT: filter := filter + ' = "Recruit" ';
    ADMIN: filter := filter + ' = "Admin" ';
    TRANSFERRING: filter := filter + ' = "Transferring" ';
    SUSPENDED: filter := filter + ' = "Suspended" ';
    PAST: filter := filter + '  in ("Withdrew application","Unknown","Resigned","Retired","Disabled","Dismissed") ';
    WITHDREW_APPLICATION: filter := filter + ' = "Withdrew application" ';
    UNKNOWN: filter := filter + ' = "Unknown" ';
    RESIGNED: filter := filter + ' = "Resigned" ';
    RETIRED: filter := filter + ' = "Retired" ';
    DISABLED: filter := filter + ' = "Disabled" ';
    DISMISSED: filter := filter + ' = "Dismissed" ';
    DECEASED: filter := filter + ' = "Deceased" ';
    NEW_TRAINEE: filter := filter + ' = "New trainee" ';
    end;
    //
    case enrollment_filter of
    CURRENT..ADMIN:
      BEGIN
      case leave_filter of
      OBLIGATED: filter := filter + ' and (not(' + any_relevant_leave + ') or (leave_of_absence.start_date is null)) ';
      ON_LEAVE: filter := filter + ' and ' + any_relevant_leave + SPACE;
      end;
      END;
    end;
  end;
  //
  if med_release_level_filter <> Class_biz_medical_release_levels.ALL then begin
    filter := filter + ' and medical_release_code_description_map.description ';
    case med_release_level_filter of
    NOT_RELEASED: filter := filter + ' in ("None","EMT Intern","Trainee") ';
    Class_biz_medical_release_levels.NONE: filter := filter + ' = "none" ';
    IN_CLASS: filter := filter + ' = "EMT Intern" ';
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
    filter := filter + ' and section_num = ' + uint32(section_filter).tostring + SPACE;
  end;
  //
  kind_of_leave_selection_clause := 'if(' + any_relevant_leave + ',kind_of_leave_code_description_map.description,"")';
  obliged_shifts_selection_clause := 'if(' + any_relevant_leave + ',num_obliged_shifts,num_shifts)';
  //
  if running_only_filter then begin
    filter := filter + ' and ' + obliged_shifts_selection_clause + ' > 0 ';
  end;
  //
  command_text :=
  'select member.id as member_id'                                                           // column 1
  + ' , last_name'                                                                          // column 2
  + ' , first_name'                                                                         // column 3
  + ' , cad_num'                                                                            // column 4
  + ' , short_designator as agency'                                                         // column 5
  + ' , section_num'                                                                        // column 6
  + ' , medical_release_code_description_map.pecking_order as medical_release_peck_code'    // column 7
  + ' , medical_release_code_description_map.description as medical_release_description'    // column 8
  + ' , if(be_driver_qualified,"Yes","No") as be_driver_qualified'                          // column 9
  + ' , enrollment_level.description as enrollment'                                         // column 10
  + ' , (TO_DAYS(CURDATE()) - TO_DAYS(equivalent_los_start_date))/365 as length_of_service' // column 11
  + ' , core_ops_commitment_level_code'                                                     // column 12
  + ' , num_shifts as enrollment_obligation'                                                // column 13
  + ' , ' + kind_of_leave_selection_clause + ' as kind_of_leave'                            // column 14
  + ' , ' + obliged_shifts_selection_clause + ' as obliged_shifts'                          // column 15
  + ' , email_address'                                                                      // column 16
  + ' , phone_num'                                                                          // column 17
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
  +   ' join agency on (agency.id=member.agency_id)'
  +   filter
  + ' order by ' + sort_order;
  //
  self.Open;
  DataGrid(target).datasource := mysqlcommand.Create(command_text,connection).ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_members.BindSpecialForRankedLengthOfService(target: system.object);
begin
  //
  self.Open;
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select agency.id as agency'
    + ' , (TO_DAYS(CURDATE()) - TO_DAYS((select min(start_date) from enrollment_history where member_id = member.id and level_code in (1,2,3,4,5,6,7,8,9,18))))/365'
    +     ' as length_of_service'
    + ' from member'
    +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
    +   ' join enrollment_history'
    +     ' on'
    +       ' ('
    +       ' enrollment_history.member_id=member.id'
    +       ' and'
    +         ' ('
    +           ' (enrollment_history.start_date <= CURDATE())'
    +         ' and'
    +           ' ('
    +             ' (enrollment_history.end_date is null)'
    +           ' or'
    +             ' (enrollment_history.end_date >= LAST_DAY(CURDATE()))'
    +           ' )'
    +         ' )'
    +       ' )'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    +   ' join agency on (agency.id=member.agency_id)'
    + ' where'
    +     ' enrollment_level.description in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)","Reduced (3)","New trainee")'
    +   ' and'
    +     ' medical_release_code_description_map.pecking_order >= ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring
    +   ' and'
    +     ' core_ops_commitment_level_code > 1',
    connection
    )
    .ExecuteReader;
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
  CadNumOfMemberId := mysqlcommand.Create('select cad_num from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.CurrentMemberEmailAddresses: queue;
var
  current_member_email_addresses: queue;
  dr: mysqldatareader;
begin
  current_member_email_addresses := queue.Create;
  self.Open;
  dr := mysqlcommand.Create
    (
    'select email_address'
    + ' from member'
    +   ' join enrollment_history'
    +     ' on'
    +       ' ('
    +       ' enrollment_history.member_id=member.id'
    +       ' and'
    +         ' ('
    +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
    +         ' and'
    +           ' ('
    +             ' (enrollment_history.end_date is null)'
    +           ' or'
    +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
    +           ' )'
    +         ' )'
    +       ' )'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    + ' where email_address is not null'
    +   ' and email_address <> ""'
    +   ' and enrollment_level.description in'
    +     ' ('
    +     ' "Applicant"'
    +     ' , "Associate"'
    +     ' , "Regular"'
    +     ' , "Life"'
    +     ' , "Tenured"'
    +     ' , "Atypical"'
    +     ' , "Recruit"'
    +     ' , "Admin"'
    +     ' , "Reduced (1)"'
    +     ' , "Reduced (2)"'
    +     ' , "Reduced (3)"'
    +     ' , "SpecOps"'
    +     ' , "Transferring"'
    +     ' , "Suspended"'
    +     ' , "New trainee"'
    +     ' )',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    current_member_email_addresses.Enqueue(dr['email_address']);
  end;
  dr.Close;
  self.Close;
  CurrentMemberEmailAddresses := current_member_email_addresses;
end;

function TClass_db_members.EmailAddressOf(member_id: string): string;
var
  email_address_obj: system.object;
begin
  //
  self.Open;
  email_address_obj :=
    mysqlcommand.Create('select email_address from member where id = "' + member_id + '"',connection).ExecuteScalar;
  if email_address_obj <> nil then begin
    EmailAddressOf := email_address_obj.tostring;
  end else begin
    EmailAddressOf := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := Safe(DataGridItem(e_item).cells[TCCI_ENROLLMENT].text,PUNCTUATED);
end;

function TClass_db_members.EnrollmentOfMemberId(member_id: string): string;
begin
  self.Open;
  EnrollmentOfMemberId := mysqlcommand.Create
    (
    'select description'
    + ' from member'
    +   ' join enrollment_history on (enrollment_history.member_id=member.id)'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    + ' where member.id = ' + member_id
    +   ' and start_date <= CURDATE()'
    +   ' and ((end_date >= CURDATE()) or (end_date is null))'
    + ' order by enrollment_history.id desc'
    + ' limit 1',
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.FirstNameOf(e_item: system.object): string;
begin
  FirstNameOf := Safe(DataGridItem(e_item).cells[TCCI_FIRST_NAME].text,HUMAN_NAME);
end;

function TClass_db_members.FirstNameOfMemberId(member_id: string): string;
begin
  self.Open;
  FirstNameOfMemberId := mysqlcommand.Create('select first_name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_members.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
var
  dr: mysqldatareader;
begin
  self.Open;
  dr := mysqlcommand.Create
    (
    'SELECT name,'
    + 'be_valid_profile '
    + 'FROM member '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteReader;
  dr.Read;
  name := dr['name'].tostring;
  be_valid_profile := (dr['be_valid_profile'].tostring = '1');
  dr.Close;
  self.Close;
end;

function TClass_db_members.HighestTierOf(id: string): string;
var
  tier_id_obj: system.object;
begin
  //
  // Note that tier_id=1 is the "highest" tier.
  //
  self.Open;
  tier_id_obj := mysqlcommand.Create
    (
    'select min(tier_id)'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    + ' where member.id = ' + id,
    connection
    )
    .ExecuteScalar;
  if tier_id_obj <> nil then begin
    HighestTierOf := tier_id_obj.tostring;
  end else begin
    HighestTierOf := MAXINT.tostring;
  end;
  self.Close;
end;

function TClass_db_members.IdOf(e_item: system.object): string;
begin
  IdOf := Safe(DataGridItem(e_item).cells[TCCI_ID].text,NUM);
end;

function TClass_db_members.IdOfFirstnameLastnameCadnum
  (
  first_name: string;
  last_name: string;
  cad_num: string
  )
  : string;
var
  id_obj: system.object;
  sql: string;
begin
  sql := 'select id from member where first_name = "' + first_name + '" and last_name = "' + last_name + '"';
  if cad_num <> EMPTY then begin
    sql := sql + ' and cad_num = "' + cad_num + '"';
  end;
  self.Open;
  id_obj := mysqlcommand.Create(sql,connection).ExecuteScalar;
  self.Close;
  if id_obj <> nil then begin
    IdOfFirstnameLastnameCadnum := id_obj.tostring;
  end else begin
    IdOfFirstnameLastnameCadnum := EMPTY;
  end;
end;

function TClass_db_members.IdOfRoleHolder(role_name: string): string;
var
  member_id_obj: system.object;
begin
  self.Open;
  member_id_obj := mysqlcommand.Create
    (
    'select member.id'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join agency on (agency.id=member.agency_id)'
    + ' where role.name = "' + role_name + '"',
    connection
    )
    .ExecuteScalar;
  if member_id_obj <> nil then begin
    IdOfRoleHolder := member_id_obj.tostring;
  end else begin
    IdOfRoleHolder := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.IdOfRoleHolderAtAgency
  (
  role_name: string;
  agency_short_designator: string
  )
  : string;
var
  member_id_obj: system.object;
begin
  self.Open;
  member_id_obj := mysqlcommand.Create
    (
    'select member.id'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join agency on (agency.id=member.agency_id)'
    + ' where role.name = "' + role_name + '"'
    +   ' and agency.short_designator = "' + agency_short_designator + '"',
    connection
    )
    .ExecuteScalar;
  if member_id_obj <> nil then begin
    IdOfRoleHolderAtAgency := member_id_obj.tostring;
  end else begin
    IdOfRoleHolderAtAgency := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.IdOfUserId(user_id: string): string;
var
  member_id_obj: system.object;
begin
  self.Open;
  member_id_obj := mysqlcommand.Create('select member_id from user_member_map where user_id = ' + user_id,connection).ExecuteScalar;
  if member_id_obj <> nil then begin
    IdOfUserId := member_id_obj.tostring;
  end else begin
    IdOfUserId := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.LastNameOf(e_item: system.object): string;
begin
  LastNameOf := Safe(DataGridItem(e_item).cells[TCCI_LAST_NAME].text,HUMAN_NAME);
end;

function TClass_db_members.LastNameOfMemberId(member_id: string): string;
begin
  self.Open;
  LastNameOfMemberId := mysqlcommand.Create('select last_name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_members.MakeMemberStatusStatements;
var
  any_relevant_leave: string;
  dr: mysqldatareader;
  kind_of_leave: string;
  length_of_service: string;
begin
  //
  any_relevant_leave :=
  '(leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
  + ' and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))';
  //
  self.Open;
  dr := mysqlcommand.Create
    (
    'select last_name'
    + ' , first_name'
    + ' , cad_num'
    + ' , short_designator as agency'
    + ' , section_num'
    + ' , medical_release_code_description_map.description as medical_release_description'
    + ' , if(be_driver_qualified,"Yes","No") as be_driver_qualified'
    + ' , enrollment_level.description as enrollment'
    + ' , (TO_DAYS(CURDATE()) - TO_DAYS((select min(start_date) from enrollment_history where member_id = member.id and level_code in (1,2,3,4,5,6,7,8,9,18))))/365'
    +     ' as length_of_service'
    + ' , if(' + any_relevant_leave + ',kind_of_leave_code_description_map.description,"") as kind_of_leave'
    + ' , if(' + any_relevant_leave + ',num_obliged_shifts,num_shifts) as obliged_shifts'
    + ' , email_address'
    + ' , phone_num'
    + ' from member'
    +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
    +   ' join enrollment_history'
    +     ' on'
    +       ' ('
    +       ' enrollment_history.member_id=member.id'
    +       ' and'
    +         ' ('
    +           ' (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
    +         ' and'
    +           ' ('
    +             ' (enrollment_history.end_date is null)'
    +           ' or'
    +             ' (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
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
    +             ' (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL 1 MONTH))'
    +           ' and'
    +             ' (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)))'
    +           ' )'
    +         ' )'
    +       ' )'
    +   ' left join kind_of_leave_code_description_map'
    +     ' on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    +   ' join agency on (agency.id=member.agency_id)'
    + ' where enrollment_level.description in ("Applicant","Operational","Associate","Regular","Life","Tenured","Atypical"'
    +   ' , "Recruit","Admin","Reduced (1)","Reduced (2)","Reduced (3)","SpecOps","Transferring","Suspended")'
    +   ' and email_address is not null'
    +   ' and TRIM(email_address) <> ""'
    + ' order by RAND()',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    if dr['length_of_service'] <> dbnull.Value then begin
      length_of_service := decimal(dr['length_of_service']).tostring('F2') + ' years';
    end else begin
      length_of_service := EMPTY;
    end;
    kind_of_leave := dr['kind_of_leave'].tostring.ToUpper;
    if kind_of_leave = EMPTY then begin
      kind_of_leave := 'NONE';
    end;
    biz_notifications.IssueMemberStatusStatement
      (
      dr['email_address'].tostring,
      dr['first_name'].tostring.ToUpper,
      dr['last_name'].tostring.ToUpper,
      dr['cad_num'].tostring,
      dr['agency'].tostring,
      dr['section_num'].tostring,
      dr['medical_release_description'].tostring.ToUpper,
      dr['be_driver_qualified'].tostring.ToUpper,
      dr['enrollment'].tostring.ToUpper,
      length_of_service,
      kind_of_leave,
      dr['obliged_shifts'].tostring,
      dr['phone_num'].tostring
      );
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_members.MedicalReleaseLevelOf(e_item: system.object): string;
begin
  MedicalReleaseLevelOf := Safe(DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_LEVEL].text,PUNCTUATED);
end;

function TClass_db_members.MedicalReleaseLevelOfMemberId(member_id: string): string;
begin
  self.Open;
  MedicalReleaseLevelOfMemberId := mysqlcommand.Create
    (
    'select description'
    + ' from member'
    +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
    + ' where id = ' + member_id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.OfficershipOf(member_id: string): string;
var
  rank_name_obj: system.object;
begin
  self.Open;
  rank_name_obj := mysqlcommand.Create
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
    OfficershipOf := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.PhoneNumOf(member_id: string): string;
var
  phone_num_obj: system.object;
begin
  //
  self.Open;
  phone_num_obj :=
    mysqlcommand.Create('select phone_num from member where id = "' + member_id + '"',connection).ExecuteScalar;
  if phone_num_obj <> nil then begin
    PhoneNumOf := phone_num_obj.tostring;
  end else begin
    PhoneNumOf := EMPTY;
  end;
  self.Close;
end;

function TClass_db_members.PeckCodeOf(e_item: system.object): string;
begin
  PeckCodeOf := Safe(DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_PECK_CODE].text,NUM);
end;

function TClass_db_members.RetentionOf(e_item: system.object): string;
begin
  RetentionOf := Safe(DataGridItem(e_item).cells[TCCI_LENGTH_OF_SERVICE].text,REAL_NUM);
end;

function TClass_db_members.SectionOf(e_item: system.object): string;
begin
  SectionOf := Safe(DataGridItem(e_item).cells[TCCI_SECTION_NUM].text,NUM);
end;

procedure TClass_db_members.SetAgency
  (
  agency_id: string;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved('UPDATE member SET agency_id = ' + agency_id + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_AGENCY].text := db_agencies.ShortDesignatorOf(agency_id);
  self.Close;
end;

procedure TClass_db_members.SetCadNum
  (
  cad_num: string;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET cad_num = "' + cad_num + '"'
      + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text
      ),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_CAD_NUM].Text := cad_num;
  self.Close;
end;

procedure TClass_db_members.SetDriverQualification
  (
  be_driver_qualified: boolean;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
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
  DataGridItem(e_item).cells[TCCI_BE_DRIVER_QUALIFIED].text := YesNoOf(be_driver_qualified);
  self.Close;
end;

procedure TClass_db_members.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET email_address = "' + email_address + '"'
      + ' WHERE id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_members.SetName
  (
  first: string;
  last: string;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE member'
      + ' SET first_name = "' + first + '"'
      +   ' , last_name = "' + last + '"'
      + '  WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text
      ),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_FIRST_NAME].Text := first;
  DataGridItem(e_item).cells[TCCI_LAST_NAME].Text := last;
  self.Close;
end;

procedure TClass_db_members.SetSection
  (
  section_num: string;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
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
  mysqlcommand.Create
    (
    db_trail.Saved('UPDATE member SET medical_release_code = ' + code + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_MEDICAL_RELEASE_LEVEL].Text := db_medical_release_levels.DescriptionOf(code);
  self.Close;
end;

procedure TClass_db_members.SetPhoneNum
  (
  phone_num: string;
  e_item: system.object
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved('UPDATE member SET phone_num = ' + phone_num + ' WHERE id = ' + DataGridItem(e_item).cells[TCCI_ID].text),
    connection
    )
    .ExecuteNonQuery;
  DataGridItem(e_item).cells[TCCI_PHONE_NUM].text := FormatAsNanpPhoneNum(phone_num);
  self.Close;
end;

procedure TClass_db_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  self.Open;
  mysqlcommand.Create
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

function TClass_db_members.UserIdOf(member_id: string): string;
var
  user_id_obj: system.object;
begin
  //
  self.Open;
  user_id_obj := mysqlcommand.Create('select user_id from user_member_map where member_id = ' + member_id,connection).ExecuteScalar;
  if user_id_obj <> nil then begin
    UserIdOf := user_id_obj.tostring;
  end else begin
    UserIdOf := EMPTY;
  end;
  self.Close;
end;

function CrewShiftsForecastMetricFromWhereClause(relative_month: string): string;
begin
  CrewShiftsForecastMetricFromWhereClause := ' sum('
  +   ' if'
  +     ' ('
  +       ' (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH))'
  +         ' and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_month + ' MONTH))),'
  +       ' num_obliged_shifts,'
  +       ' num_shifts'
  +     ' )'
  +   ' )/2 as num_crew_shifts'
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
  +   ' join agency on (agency.id=member.agency_id)'
  + ' where'
  +     ' enrollment_level.description in ("Associate","Regular","Life","Tenured","Atypical","Reduced (1)","Reduced (2)","Reduced (3)","New trainee")'
  +   ' and'
  +     ' medical_release_code_description_map.pecking_order >= ' + uint32(Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE).tostring;
end;

end.
