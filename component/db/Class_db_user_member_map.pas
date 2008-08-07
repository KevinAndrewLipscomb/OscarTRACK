unit Class_db_user_member_map;

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
  TClass_db_user_member_map = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure BindActuals
      (
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
    procedure Save
      (
      member_id: string;
      user_id: string;
      be_granted: boolean
      );
  end;

implementation

uses
  Class_db_users,
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_user_member_map.Create;
begin
  inherited Create;
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_user_member_map.BindActuals
  (
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  self.Open;
  GridView(target).datasource := mysqlcommand.Create
    (
    'select user_id'
    + ' , user.username as user_name'
    + ' , concat(member.last_name,", ",member.first_name) as member_name'
    + ' , member_id'
    + ' from user_member_map'
    +   ' join member on (member.id=user_member_map.member_id)'
    +   ' join user on (user.id=user_member_map.user_id)'
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  GridView(target).DataBind;
  self.Close;
  //
end;

procedure TClass_db_user_member_map.Save
  (
  member_id: string;
  user_id: string;
  be_granted: boolean
  );
begin
  self.Open;
  if be_granted then begin
    mysqlcommand.Create
      (
      db_trail.Saved('insert ignore user_member_map set member_id = "' + member_id + '", user_id = "' + user_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end else begin
    mysqlcommand.Create
      (
      db_trail.Saved('delete from user_member_map where member_id = "' + member_id + '" and user_id = "' + user_id + '"'),
      connection
      )
      .ExecuteNonquery;
  end;
  self.Close;
end;

end.
