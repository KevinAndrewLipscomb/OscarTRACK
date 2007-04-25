unit Class_db_user;

interface

uses
  ki,
  borland.data.provider,
  Class_db,
  system.collections;

type
  TClass_db_user = class(Class_db.TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function RolesOf(id: string): ki.string_array;
  end;

implementation

constructor TClass_db_user.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_user.RolesOf(id: string): ki.string_array;
var
  bdr: bdpdatareader;
  num_roles: cardinal;
  roles_of: ki.string_array;
begin
  self.Open;
  bdr := bdpcommand.Create
    (
    'select name'
    + ' from role'
    +   ' join role_member_map on (role_member_map.role_id=role.id)'
    +   ' join user_member_map on (user_member_map.member_id=role_member_map.member_id)'
    + ' where user_member_map.user_id = ' + id,
    connection
    )
    .ExecuteReader;
  num_roles := 0;
  while bdr.Read do begin
    num_roles := num_roles + 1;
    SetLength(roles_of,num_roles);
    roles_of[num_roles - 1] := bdr['name'].tostring;
  end;
  bdr.Close;
  self.Close;
  RolesOf := roles_of;
end;

end.
