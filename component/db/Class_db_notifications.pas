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
    function TargetOfAboutAgency
      (
      name: string;
      agency_id: string
      )
      : string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.configuration;

constructor TClass_db_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_data_conditions := TClass_biz_data_conditions.Create;
  tier_2_match_field := configurationmanager.appsettings['tier_2_match_field'];
  tier_3_match_field := configurationmanager.appsettings['tier_3_match_field'];
end;

function TClass_db_notifications.TargetOf
  (
  name: string;
  member_id: string
  )
  : string;
var
  dr: mysqldatareader;
  target_of: string;
  tier_2_match_value: string;
  tier_3_match_value: string;
begin
  target_of := system.string.EMPTY;
  self.Open;
  //
  // Get tier 2 and 3 associations of target member.
  //
  dr := mysqlcommand.Create
    ('select ' + tier_2_match_field + ',' + tier_3_match_field + ' from member where id = ' + member_id,connection).ExecuteReader;
  dr.Read;
  tier_2_match_value := dr[tier_2_match_field].tostring;
  tier_3_match_value := dr[tier_3_match_field].tostring;
  dr.Close;
  //
  // Tier 1 stakeholders
  //
  dr := mysqlcommand.Create
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
  if dr <> nil then begin
    while dr.Read do begin
      if (dr['data_condition_name'].tostring = 'none')
        or ((dr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + dr['email_address'].tostring + ',';
      end;
    end;
  end;
  dr.Close;
  //
  // Tier 2 stakeholders
  //
  dr := mysqlcommand.Create
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
  if dr <> nil then begin
    while dr.Read do begin
      if (dr['data_condition_name'].tostring = 'none')
        or ((dr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + dr['email_address'].tostring + ',';
      end;
    end;
  end;
  dr.Close;
  //
  // Tier 3 stakeholders
  //
  dr := mysqlcommand.Create
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
  if dr <> nil then begin
    while dr.Read do begin
      if (dr['data_condition_name'].tostring = 'none')
        or ((dr['data_condition_name'].tostring = 'BeMemberTrainee') and biz_data_conditions.BeMemberTrainee(member_id))
      then begin
        target_of := target_of + dr['email_address'].tostring + ',';
      end;
    end;
  end;
  dr.Close;
  //
  self.Close;
  if target_of <> system.string.EMPTY then begin
    TargetOf := target_of.Substring(0,target_of.Length - 1);
  end else begin
    TargetOf := system.string.EMPTY;
  end;
end;

function TClass_db_notifications.TargetOfAboutAgency
  (
  name: string;
  agency_id: string
  )
  : string;
var
  dr: mysqldatareader;
  variant_condition: string;
  target_of_about_agency: string;
begin
  target_of_about_agency := system.string.EMPTY;
  self.Open;
  //
  if agency_id = '0' then begin // EMS is tier 1
    variant_condition := ' where (tier_id = 1)';
  end else begin // All other agencies are tier 2
    variant_condition := ' where (tier_id = 2) and (agency_id = "' + agency_id + '")';
  end;
  //
  dr := mysqlcommand.Create
    (
    'select email_address'
    + ' from member'
    +   ' join role_member_map on (role_member_map.member_id=member.id)'
    +   ' join role_notification_map on (role_notification_map.role_id=role_member_map.role_id)'
    +   ' join role on (role.id=role_member_map.role_id)'
    +   ' join notification on (notification.id=role_notification_map.notification_id)'
    + variant_condition
    +   ' and notification.name = "' + name + '"',
    connection
    )
    .ExecuteReader;
  if dr <> nil then begin
    while dr.Read do begin
      target_of_about_agency := target_of_about_agency + dr['email_address'].tostring + ',';
    end;
  end;
  dr.Close;
  //
  self.Close;
  //
  if target_of_about_agency <> system.string.EMPTY then begin
    TargetOfAboutAgency := target_of_about_agency.Substring(0,target_of_about_agency.Length - 1);
  end else begin
    TargetOfAboutAgency := system.string.EMPTY;
  end;
  //
end;

end.
