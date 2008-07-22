unit Class_db_role_notification_map;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

const
  CI_NOTIFICATION_ID = 0;
  CI_NOTIFICATION_NAME = 1;
  CI_FIRST_CROSSTAB = 2;

  type
  TClass_db_role_notification_map = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure Bind
      (
      tier_quoted_value_list: string;
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata_rec_arraylist: arraylist
      );
    procedure Save
      (
      notification_id: string;
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

constructor TClass_db_role_notification_map.Create;
begin
  inherited Create;
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_role_notification_map.Bind
  (
  tier_quoted_value_list: string;
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
    'select id,name,soft_hyphenation_text'
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
    crosstab_sql := crosstab_sql
    + COMMA_SPACE
    + 'IFNULL((select 1 from role_notification_map where role_id = "'
    + dr['id'].tostring
    + '" and notification_id = notification.id),0) as ' + crosstab_metadata_rec.sql_name;
    crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
  end;
  dr.Close;
  //
  if be_sort_order_descending then begin
    sort_order := sort_order.Replace('%',' desc');
  end else begin
    sort_order := sort_order.Replace('%',' asc');
  end;
  //
  GridView(target).datasource := mysqlcommand.Create
    (
    'select notification.id as notification_id'
    + ' , notification.name as notification_name'
    + crosstab_sql
    + ' from notification'
    +   ' left outer join role_notification_map on (role_notification_map.notification_id=notification.id)'
    +   ' left outer join role on (role.id=role_notification_map.role_id)'
    + ' group by notification.id'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_role_notification_map.Save
  (
  notification_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  self.Open;
  if be_granted then begin
    mysqlcommand.Create
      (
      db_trail.Saved('insert ignore role_notification_map set notification_id = "' + notification_id + '", role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end else begin
    mysqlcommand.Create
      (
      db_trail.Saved('delete from role_notification_map where notification_id = "' + notification_id + '" and role_id = "' + role_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end;
  self.Close;
end;

end.
