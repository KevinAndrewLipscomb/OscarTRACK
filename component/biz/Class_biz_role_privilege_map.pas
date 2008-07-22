unit Class_biz_role_privilege_map;

interface

uses
  Class_db_role_privilege_map,
  Class_biz_notifications,
  system.collections;

type
  TClass_biz_role_privilege_map = class
  private
    db_role_privilege_map: TClass_db_role_privilege_map;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    procedure Bind
      (
      tier_filter: string;
      sort_order: string;
      be_sort_order_descending: boolean;
      target: system.object;
      out crosstab_metadata: arraylist
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
  kix;

constructor TClass_biz_role_privilege_map.Create;
begin
  inherited Create;
  db_role_privilege_map := TClass_db_role_privilege_map.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

procedure TClass_biz_role_privilege_map.Bind
  (
  tier_filter: string;
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
  db_role_privilege_map.Bind(tier_quoted_value_list,sort_order,be_sort_order_descending,target,crosstab_metadata);
end;

procedure TClass_biz_role_privilege_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  db_role_privilege_map.Save(member_id,role_id,be_granted);
end;

end.
