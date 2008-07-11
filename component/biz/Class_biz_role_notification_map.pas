unit Class_biz_role_notification_map;

interface

uses
  Class_db_role_notification_map,
  Class_biz_notifications,
  system.collections;

type
  TClass_biz_role_notification_map = class
  private
    db_role_notification_map: TClass_db_role_notification_map;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    procedure Bind
      (
      filter: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
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

constructor TClass_biz_role_notification_map.Create;
begin
  inherited Create;
  db_role_notification_map := TClass_db_role_notification_map.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

procedure TClass_biz_role_notification_map.Bind
  (
  filter: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  out crosstab_metadata: arraylist
  );
begin
  db_role_notification_map.Bind(filter,sort_order,be_sort_order_ascending,target,crosstab_metadata);
end;

procedure TClass_biz_role_notification_map.Save
  (
  member_id: string;
  role_id: string;
  be_granted: boolean
  );
begin
  db_role_notification_map.Save(member_id,role_id,be_granted);
end;

end.
