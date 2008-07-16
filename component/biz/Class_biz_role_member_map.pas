unit Class_biz_role_member_map;

interface

uses
  Class_db_role_member_map,
  Class_biz_notifications,
  system.collections;

type
  TClass_biz_role_member_map = class
  private
    db_role_member_map: TClass_db_role_member_map;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    function BePrivilegedToModifyTuple
      (
      has_assign_department_roles_to_members: boolean;
      has_assign_squad_roles_to_members: boolean;
      role_tier_id: string
      )
      : boolean;
    procedure Bind
      (
      tier_filter: string;
      agency_filter: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      out crosstab_metadata: arraylist
      );
    procedure BindHolders
      (
      role_name: string;
      target: system.object;
      sort_order: string;
      be_sort_order_ascending: boolean
      );
    procedure Save
      (
      member_id: string;
      role_id: string;
      be_granted: boolean
      );
  end;

implementation

constructor TClass_biz_role_member_map.Create;
begin
  inherited Create;
  db_role_member_map := TClass_db_role_member_map.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

function TClass_biz_role_member_map.BePrivilegedToModifyTuple
  (
  has_assign_department_roles_to_members: boolean;
  has_assign_squad_roles_to_members: boolean;
  role_tier_id: string
  )
  : boolean;
begin
  BePrivilegedToModifyTuple :=
    (
      (
        has_assign_department_roles_to_members
      and
        (role_tier_id >= '1')
      )
    or
      (
        has_assign_squad_roles_to_members
      and
        (role_tier_id >= '2')
      )
    );
end;

procedure TClass_biz_role_member_map.Bind
  (
  tier_filter: string;
  agency_filter: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  out crosstab_metadata: arraylist
  );
begin
  db_role_member_map.Bind(tier_filter,agency_filter,sort_order,be_sort_order_ascending,target,crosstab_metadata);
end;

procedure TClass_biz_role_member_map.BindHolders
  (
  role_name: string;
  target: system.object;
  sort_order: string;
  be_sort_order_ascending: boolean
  );
begin
  db_role_member_map.BindHolders(role_name,target,sort_order,be_sort_order_ascending);
end;

procedure TClass_biz_role_member_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  db_role_member_map.Save(member_id,role_id,be_granted);
end;

end.
