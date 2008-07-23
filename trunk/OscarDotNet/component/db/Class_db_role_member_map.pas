unit Class_db_role_member_map;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

const
  CI_MEMBER_ID = 0;
  CI_MEMBER_NAME = 1;
  CI_FIRST_CROSSTAB = 2;
  ROLE_HOLDER_EMAIL_ADDRESS_CI = 2;

  type
  TClass_db_role_member_map = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure Bind
      (
      tier_quoted_value_list: string;
      agency_filter: string;
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata_rec_arraylist: arraylist
      );
    procedure BindHolders
      (
      role_name: string;
      target: system.object;
      sort_order: string;
      be_sort_order_ascending: boolean
      );
    procedure BindHoldersPerAgency
      (
      agency_id: string;
      target: system.object
      );
    procedure Save
      (
      member_id: string;
      role_id: string;
      be_granted: boolean
      );
  end;

implementation

uses
  Class_db_roles,
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_role_member_map.Create;
begin
  inherited Create;
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_role_member_map.Bind
  (
  tier_quoted_value_list: string;
  agency_filter: string;
  sort_order: string;
  be_sort_order_descending: boolean;
  target: system.object;
  out crosstab_metadata_rec_arraylist: arraylist
  );
var
  crosstab_metadata_rec: crosstab_metadata_rec_type;
  crosstab_sql: string;
  crosstab_where_clause: string;
  dr: mysqldatareader;
  where_clause: string;
begin
  //
  crosstab_metadata_rec.index := 1;  // init to index of last non-dependent column
  crosstab_metadata_rec_arraylist := arraylist.Create;
  crosstab_sql := EMPTY;
  if tier_quoted_value_list = DOUBLE_QUOTE then begin
    crosstab_where_clause := EMPTY;
  end else begin
    crosstab_where_clause := ' and tier_id in (' + tier_quoted_value_list + ')';
  end;
  //
  self.Open;
  //
  dr := mysqlcommand.Create
    (
    'select id,name,soft_hyphenation_text,tier_id'
    + ' from role'
    + ' where name <> "Member"'
    + crosstab_where_clause
    + ' order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    crosstab_metadata_rec.index := crosstab_metadata_rec.index + 1;
    crosstab_metadata_rec.id := dr['id'].tostring;
    crosstab_metadata_rec.natural_text := dr['name'].tostring;
    crosstab_metadata_rec.soft_hyphenation_text := dr['soft_hyphenation_text'].tostring;
    crosstab_metadata_rec.sql_name := Safe(crosstab_metadata_rec.natural_text,ECMASCRIPT_WORD);
    crosstab_metadata_rec.tier_id := dr['tier_id'].tostring;
    crosstab_sql := crosstab_sql
    + COMMA_SPACE
    + 'IFNULL((select 1 from role_member_map where role_id = "'
    + dr['id'].tostring
    + '" and member_id = member.id),0) as ' + crosstab_metadata_rec.sql_name;
    crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
  end;
  dr.Close;
  //
  where_clause := ' where enrollment_level.description in ("Applicant","Associate","Regular","Life","Tenured","Atypical","Recruit","Admin"'
    + ',"Reduced (1)","Reduced (2)","Reduced (3)","SpecOps","Transferring","Suspended","New trainee") ';
  if agency_filter <> EMPTY then begin
    where_clause := where_clause + ' and agency_id = "' + agency_filter + '"';
  end;
  //
  if be_sort_order_descending then begin
    sort_order := sort_order.Replace('%',' desc');
  end else begin
    sort_order := sort_order.Replace('%',' asc');
  end;
  //
  GridView(target).datasource := mysqlcommand.Create
    (
    'select member.id as member_id'
    + ' , concat(last_name,"' + COMMA_SPACE + '",first_name," (",IFNULL(cad_num,""),")") as member_name'
    + crosstab_sql
    + ' from member'
    +   ' left outer join role_member_map on (role_member_map.member_id=member.id)'
    +   ' left outer join role on (role.id=role_member_map.role_id)'
    +   ' join enrollment_history'
    +     ' on'
    +       ' ('
    +       '   enrollment_history.member_id=member.id'
    +       ' and'
    +       '   (enrollment_history.end_date is null)'
    +       ' )'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    + where_clause
    + ' group by member.id'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_role_member_map.BindHolders
  (
  role_name: string;
  target: system.object;
  sort_order: string;
  be_sort_order_ascending: boolean
  );
begin
  //
  self.Open;
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  GridView(target).datasource := mysqlcommand.Create
    (
    'select concat(last_name,", ",first_name) as member_name'
    + ' , short_designator as agency_designator'
    + ' , email_address'
    + ' from role_member_map'
    +   ' join member on (member.id=role_member_map.member_id)'
    +   ' join agency on (agency.id=member.agency_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    + ' where role.name = "' + role_name + '"'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  //
  self.Close;
  //
end;

procedure TClass_db_role_member_map.BindHoldersPerAgency
  (
  agency_id: string;
  target: system.object
  );
var
  role_name_construction_clause: string;
  tier_specific_sort_hint_column: string;
  tier_specific_where_conditions: string;
begin
  //
  if agency_id = '0' then begin
    role_name_construction_clause := 'IF(role.name = "Squad Commander",concat(agency.short_designator," ",role.name),role.name)';
    tier_specific_sort_hint_column := ' , IF(role.name = "Squad Commander",agency.short_designator,"") as sort_hint';
    tier_specific_where_conditions := EMPTY
    + ' and tier_id is null'
    + ' or tier_id = "1"'
    + ' or role.name = "Squad Commander"';
  end else begin
    role_name_construction_clause := 'role.name';
    tier_specific_sort_hint_column := ' , "" as sort_hint';
    tier_specific_where_conditions := EMPTY
    + ' and agency_id = "' + agency_id + '"'
    + ' and tier_id > "1"';
  end;
  //
  self.Open;
  GridView(target).datasource := mysqlcommand.Create
    (
    'select ' + role_name_construction_clause + ' as role_name'
    + ' , concat(first_name," ",last_name," (",IFNULL(cad_num,""),")") as member_name'
    + tier_specific_sort_hint_column
    + ' from role_member_map'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join member on (member.id=role_member_map.member_id)'
    +   ' join agency on (agency.id=member.agency_id)'
    + ' where role.name <> "Member"'
    + tier_specific_where_conditions
    + ' order by role.pecking_order,sort_hint',
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_role_member_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  self.Open;
  if be_granted then begin
    mysqlcommand.Create
      (
      db_trail.Saved('insert ignore role_member_map set member_id = "' + member_id + '", role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end else begin
    mysqlcommand.Create
      (
      db_trail.Saved('delete from role_member_map where member_id = "' + member_id + '" and role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end;
  self.Close;
end;

end.
