unit Class_db_notifications;

interface

uses
  Class_biz_data_conditions,
  Class_db;

type
  TClass_db_notifications = class(TClass_db)
  private
    biz_data_conditions: TClass_biz_data_conditions;
    tier_2_match_field: string;
    tier_3_match_field: string;
  public
    constructor Create;
    function TargetOf
      (
      name: string;
      member_id: string
      )
      : string;
  end;

implementation

uses
  borland.data.provider,
  system.configuration;

constructor TClass_db_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_data_conditions := TClass_biz_data_conditions.Create;
  tier_2_match_field := configurationsettings.appsettings['tier_2_match_field'];
  tier_3_match_field := configurationsettings.appsettings['tier_3_match_field'];
end;

function TClass_db_notifications.TargetOf
  (
  name: string;
  member_id: string
  )
  : string;
var
  bdr: bdpdatareader;
  target_of: string;
  tier_2_match_value: string;
  tier_3_match_value: string;
begin
  target_of := system.string.EMPTY;
  self.Open;
  //
  // Get tier 2 and 3 associations of target member.
  //
  bdr := bdpcommand.Create
    ('select ' + tier_2_match_field + ',' + tier_3_match_field + ' from member where id = ' + member_id,connection).ExecuteReader;
  bdr.Read;
  tier_2_match_value := bdr[tier_2_match_field].tostring;
  tier_3_match_value := bdr[tier_3_match_field].tostring;
  bdr.Close;
  //
  // Tier 1 stakeholders
  //
  bdr := bdpcommand.Create
    (
    'select email_address'
    + ' , data_condition.name as data_condition_name'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join notification on (notification.id=role_notification_map.notification_id)'
    +   ' join data_condition on (data_condition.id=role_notification_map.data_condition_id)'
    + ' where tier_id = 1'
    +   ' and notification.name = "' + name + '"',
    connection
    )
    .ExecuteReader;
  if bdr <> nil then begin
    while bdr.Read do begin
      if (bdr['data_condition_name'].tostring = 'none')
        or ((bdr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + bdr['email_address'].tostring + ',';
      end;
    end;
  end;
  bdr.Close;
  //
  // Tier 2 stakeholders
  //
  bdr := bdpcommand.Create
    (
    'select email_address'
    + ' , data_condition.name as data_condition_name'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join notification on (notification.id=role_notification_map.notification_id)'
    +   ' join data_condition on (data_condition.id=role_notification_map.data_condition_id)'
    + ' where tier_id = 2'
    +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
    +   ' and notification.name = "' + name + '"',
    connection
    )
    .ExecuteReader;
  if bdr <> nil then begin
    while bdr.Read do begin
      if (bdr['data_condition_name'].tostring = 'none')
        or ((bdr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + bdr['email_address'].tostring + ',';
      end;
    end;
  end;
  bdr.Close;
  //
  // Tier 3 stakeholders
  //
  bdr := bdpcommand.Create
    (
    'select email_address'
    + ' , data_condition.name as data_condition_name'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join notification on (notification.id=role_notification_map.notification_id)'
    +   ' join data_condition on (data_condition.id=role_notification_map.data_condition_id)'
    + ' where tier_id = 3'
    +   ' and ' + tier_2_match_field + ' = ' + tier_2_match_value
    +   ' and ' + tier_3_match_field + ' = ' + tier_3_match_value
    +   ' and notification.name = "' + name + '"',
    connection
    )
    .ExecuteReader;
  if bdr <> nil then begin
    while bdr.Read do begin
      if (bdr['data_condition_name'].tostring = 'none')
        or ((bdr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + bdr['email_address'].tostring + ',';
      end;
    end;
  end;
  bdr.Close;
  //
  self.Close;
  if target_of <> system.string.EMPTY then begin
    TargetOf := target_of.Substring(0,target_of.Length - 1);
  end else begin
    TargetOf := system.string.EMPTY;
  end;
end;

end.
