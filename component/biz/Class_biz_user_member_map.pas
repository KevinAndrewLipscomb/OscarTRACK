unit Class_biz_user_member_map;

interface

uses
  Class_db_user_member_map,
  Class_biz_members,
  system.collections;

type
  TClass_biz_user_member_map = class
  private
    db_user_member_map: TClass_db_user_member_map;
    biz_members: TClass_biz_members;
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

constructor TClass_biz_user_member_map.Create;
begin
  inherited Create;
  db_user_member_map := TClass_db_user_member_map.Create;
  biz_members := TClass_biz_members.Create;
end;

procedure TClass_biz_user_member_map.BindActuals
  (
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  db_user_member_map.BindActuals(sort_order,be_sort_order_ascending,target);
end;

procedure TClass_biz_user_member_map.Save
  (
  member_id: string;
  user_id: string;
  be_granted: boolean
  );
begin
  db_user_member_map.Save(member_id,user_id,be_granted);
end;

end.
