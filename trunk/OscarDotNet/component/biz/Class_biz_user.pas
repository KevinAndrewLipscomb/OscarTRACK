unit Class_biz_user;

interface

uses
  Class_db_user,
  Class_db_users,
  ki,
  system.web;

type
  TClass_biz_user = class
  private
    db_user: TClass_db_user;
    db_users: TClass_db_users;
  public
    constructor Create;
    function EmailAddress: string;
    function IdNum: string;
    function Privileges: ki.string_array;
    function Roles: ki.string_array;
  end;

implementation

constructor TClass_biz_user.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_user := TClass_db_user.Create;
  db_users := TClass_db_users.Create;
end;

function TClass_biz_user.EmailAddress: string;
begin
  EmailAddress := db_users.PasswordResetEmailAddressOfId(IdNum);
end;

function TClass_biz_user.IdNum: string;
begin
  IdNum := db_users.IdOf(httpcontext.current.user.identity.name);
end;

function TClass_biz_user.Privileges: ki.string_array;
begin
  Privileges := db_users.PrivilegesOf(IdNum);
end;

function TClass_biz_user.Roles: ki.string_array;
begin
  Roles := db_user.RolesOf(IdNum);
end;

end.
