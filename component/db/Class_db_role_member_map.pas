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

  type
  crosstab_metadata_rec_type =
    RECORD
    index: cardinal;
    sql_name: string;
    id: string;
    natural_text: string;
    soft_hyphenation_text: string;
    tier_id: string;
    END;
  TClass_db_role_member_map = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure Bind
      (
      tier_filter: string;
      agency_filter: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      out crosstab_metadata_rec_arraylist: arraylist
      );
    procedure BindHolders
      (
      role_name: string;
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
  tier_filter: string;
  agency_filter: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
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
  if tier_filter = EMPTY then begin
    crosstab_where_clause := EMPTY;
  end else begin
    crosstab_where_clause := ' and tier_id = "' + tier_filter + '"';
  end;
  //
  self.Open;
  //
  dr := mysqlcommand.Create
    (
    'select id,name,soft_hyphenation_text,tier_id'
    + ' from role'
    + ' where name <> "Member"'
    + crosstab_where_clause,
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
  if agency_filter = EMPTY then begin
    where_clause := EMPTY;
  end else begin
    where_clause := ' where agency_id = "' + agency_filter + '"';
  end;
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  GridView(target).datasource := mysqlcommand.Create
    (
    'select member.id as member_id'
    + ' , concat(last_name,"' + COMMA_SPACE + '",first_name) as member_name'
    + crosstab_sql
    + ' from member'
    +   ' left outer join role_member_map on (role_member_map.member_id=member.id)'
    +   ' left outer join role on (role.id=role_member_map.role_id)'
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
  target: system.object
  );
begin
  self.Open;
  GridView(target).datasource := mysqlcommand.Create
    (
    'select concat(last_name," ",first_name) as member_name'
    + ' , short_designator as agency_designator'
    + ' from role_member_map'
    +   ' join member on (member.id=role_member_map.id)'
    +   ' join agency on (agency.id=member.agency_id)'
    +   ' join role on (role.id=role_member_map.id)'
    + ' where role.name = "' + role_name + '"',
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
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
