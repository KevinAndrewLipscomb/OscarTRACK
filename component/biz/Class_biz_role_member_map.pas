unit Class_biz_role_member_map;

interface

uses
  Class_db_role_member_map,
  Class_biz_members,
  Class_biz_notifications,
  Class_biz_user,
  system.collections;

type
  TClass_biz_role_member_map = class
  private
    db_role_member_map: TClass_db_role_member_map;
    biz_members: TClass_biz_members;
    biz_notifications: TClass_biz_notifications;
    biz_user: TClass_biz_user;
  public
    constructor Create;
    function BePrivilegedToModifyTuple
      (
      has_config_roles_and_matrices: boolean;
      has_assign_department_roles_to_members: boolean;
      has_assign_squad_roles_to_members: boolean;
      role_tier_id: string;
      role_natural_text: string;
      subject_member_agency_id: string
      )
      : boolean;
    procedure Bind
      (
      tier_filter: string;
      agency_filter: string;
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata: arraylist
      );
    procedure BindActuals
      (
      tier_filter: string;
      agency_filter: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
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
    procedure BindUnassignedPerAgency
      (
      agency_id: string;
      target: system.object
      );
    function EmailTargetOf
      (
      role_name: string;
      agency_short_designator: string
      )
      : string;
    function HolderOf(role_name: string): string;
    procedure Save
      (
      member_id: string;
      role_id: string;
      be_granted: boolean
      );
  end;

implementation

uses
  kix;

constructor TClass_biz_role_member_map.Create;
begin
  inherited Create;
  db_role_member_map := TClass_db_role_member_map.Create;
  biz_members := TClass_biz_members.Create;
  biz_notifications := TClass_biz_notifications.Create;
  biz_user := TClass_biz_user.Create;
end;

function TClass_biz_role_member_map.BePrivilegedToModifyTuple
  (
  has_config_roles_and_matrices: boolean;
  has_assign_department_roles_to_members: boolean;
  has_assign_squad_roles_to_members: boolean;
  role_tier_id: string;
  role_natural_text: string;
  subject_member_agency_id: string
  )
  : boolean;
begin
  BePrivilegedToModifyTuple :=
    has_config_roles_and_matrices
    or
    (
      (role_natural_text <> 'Application Administrator')
      and
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
        and
          (subject_member_agency_id = biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum)))
        )
      )
    );
end;

procedure TClass_biz_role_member_map.Bind
  (
  tier_filter: string;
  agency_filter: string;
  sort_order: string;
  be_sort_order_descending: boolean;
  target: system.object;
  out crosstab_metadata: arraylist
  );
var
  tier_quoted_value_list: string;
begin
  if tier_filter = '2' then begin
    tier_quoted_value_list := '2' + QUOTE + COMMA + QUOTE + '3';
  end else begin
    tier_quoted_value_list := tier_filter;
  end;
  tier_quoted_value_list := QUOTE + tier_quoted_value_list + QUOTE;
  db_role_member_map.Bind(tier_quoted_value_list,agency_filter,sort_order,be_sort_order_descending,target,crosstab_metadata);
end;

procedure TClass_biz_role_member_map.BindActuals
  (
  tier_filter: string;
  agency_filter: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
var
  tier_quoted_value_list: string;
begin
  if tier_filter = '2' then begin
    tier_quoted_value_list := '2' + QUOTE + COMMA + QUOTE + '3';
  end else begin
    tier_quoted_value_list := tier_filter;
  end;
  tier_quoted_value_list := QUOTE + tier_quoted_value_list + QUOTE;
  db_role_member_map.BindActuals(tier_quoted_value_list,agency_filter,sort_order,be_sort_order_ascending,target);
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

procedure TClass_biz_role_member_map.BindHoldersPerAgency
  (
  agency_id: string;
  target: system.object
  );
begin
  db_role_member_map.BindHoldersPerAgency(agency_id,target);
end;

procedure TClass_biz_role_member_map.BindUnassignedPerAgency
  (
  agency_id: string;
  target: system.object
  );
begin
  db_role_member_map.BindUnassignedPerAgency(agency_id,target);
end;

function TClass_biz_role_member_map.EmailTargetOf
  (
  role_name: string;
  agency_short_designator: string
  )
  : string;
begin
  EmailTargetOf := db_role_member_map.EmailTargetOf(role_name,agency_short_designator);
end;

function TClass_biz_role_member_map.HolderOf(role_name: string): string;
begin
  HolderOf := db_role_member_map.HolderOf(role_name);
end;

procedure TClass_biz_role_member_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  db_role_member_map.Save(member_id,role_id,be_granted);
  biz_notifications.IssueForRoleChange(member_id,role_id,be_granted);
end;

end.
