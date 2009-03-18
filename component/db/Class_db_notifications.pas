unit Class_db_notifications;

interface

uses
  Class_biz_data_conditions,
  Class_db,
  Class_db_trail,
  kix;

type
  TClass_db_notifications = class(TClass_db)
  private
    biz_data_conditions: TClass_biz_data_conditions;
    db_trail: TClass_db_trail;
    tier_2_match_field: string;
    tier_3_match_field: string;
  public
    constructor Create;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Notification --';
      selected_value: string = EMPTY
      );
    procedure BindTallies
      (
      DataGrid_for_cycle: system.object;
      DataGrid_for_lifetime: system.object
      );
    procedure CycleTallies;
    procedure IncrementTallies
      (
      name: string;
      num_addressees: cardinal = 0
      );
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
  system.configuration,
  system.web.ui.webcontrols;

constructor TClass_db_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_data_conditions := TClass_biz_data_conditions.Create;
  db_trail := TClass_db_trail.Create;
  tier_2_match_field := configurationmanager.appsettings['tier_2_match_field'];
  tier_3_match_field := configurationmanager.appsettings['tier_3_match_field'];
end;

procedure TClass_db_notifications.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Notification --';
  selected_value: string = EMPTY
  );
var
  dr: mysqldatareader;
begin
  //
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).items.Add(listitem.Create(unselected_literal,EMPTY));
  end;
  //
  self.Open;
  dr := mysqlcommand.Create
    (
    'select notification.id as notification_id'
    + ' , name as notification_name'
    + ' from notification'
    + ' order by notification_name',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['notification_name'].tostring,dr['notification_id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

procedure TClass_db_notifications.BindTallies
  (
  DataGrid_for_cycle: system.object;
  DataGrid_for_lifetime: system.object
  );
begin
  self.Open;
  //
  DataGrid(DataGrid_for_cycle).datasource := mysqlcommand.Create
    (
    'select name'
    + ' , tally_of_events_for_cycle'
    + ' , activity_description'
    + ' , tally_of_messages_for_cycle'
    + ' from notification'
    + ' where name <> "needs-enrollment-review"'
    + ' order by activity_pecking_order',
    connection
    )
    .ExecuteReader;
  DataGrid(DataGrid_for_cycle).DataBind;
  mysqldatareader(DataGrid(DataGrid_for_cycle).datasource).Close;
  //
  DataGrid(DataGrid_for_lifetime).datasource := mysqlcommand.Create
    (
    'select name'
    + ' , tally_of_events_for_lifetime'
    + ' , activity_description'
    + ' , tally_of_messages_for_lifetime'
    + ' from notification'
    + ' where name <> "needs-enrollment-review"'
    + ' order by activity_pecking_order',
    connection
    )
    .ExecuteReader;
  DataGrid(DataGrid_for_lifetime).DataBind;
  mysqldatareader(DataGrid(DataGrid_for_lifetime).datasource).Close;
  //
  self.Close;
end;

procedure TClass_db_notifications.CycleTallies;
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved('update notification set tally_of_messages_for_cycle = 0, tally_of_events_for_cycle = 0'),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

procedure TClass_db_notifications.IncrementTallies
  (
  name: string;
  num_addressees: cardinal = 0
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'update notification'
      + ' set tally_of_messages_for_cycle = tally_of_messages_for_cycle + ' + num_addressees.tostring
      +   ' , tally_of_events_for_cycle = tally_of_events_for_cycle + 1'
      +   ' , tally_of_messages_for_lifetime = tally_of_messages_for_lifetime + ' + num_addressees.tostring
      +   ' , tally_of_events_for_lifetime = tally_of_events_for_lifetime + 1'
      + ' where name = "' + name + '"'
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

function TClass_db_notifications.TargetOf
  (
  name: string;
  member_id: string
  )
  : string;
var
  dr: mysqldatareader;
  num_addressees: cardinal;
  target_of: string;
  tier_2_match_value: string;
  tier_3_match_value: string;
begin
  target_of := EMPTY;
  num_addressees := 0;
  self.Open;
  //
  // Get tier 2 and 3 associations of target member.
  //
  dr := mysqlcommand.Create
    ('select ' + tier_2_match_field + COMMA + tier_3_match_field + ' from member where id = ' + member_id,connection).ExecuteReader;
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
        target_of := target_of + dr['email_address'].tostring + COMMA;
        num_addressees := num_addressees + 1;
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
        target_of := target_of + dr['email_address'].tostring + COMMA;
        num_addressees := num_addressees + 1;
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
        target_of := target_of + dr['email_address'].tostring + COMMA;
        num_addressees := num_addressees + 1;
      end;
    end;
  end;
  dr.Close;
  //
  IncrementTallies(name,num_addressees);
  //
  self.Close;
  if target_of <> EMPTY then begin
    TargetOf := target_of.Substring(0,target_of.Length - 1);
  end else begin
    TargetOf := EMPTY;
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
  num_addressees: cardinal;
  target_of_about_agency: string;
  variant_condition: string;
begin
  target_of_about_agency := EMPTY;
  num_addressees := 0;
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
      target_of_about_agency := target_of_about_agency + dr['email_address'].tostring + COMMA;
      num_addressees := num_addressees + 1;
    end;
  end;
  dr.Close;
  //
  IncrementTallies(name,num_addressees);
  //
  self.Close;
  //
  if target_of_about_agency <> EMPTY then begin
    TargetOfAboutAgency := target_of_about_agency.Substring(0,target_of_about_agency.Length - 1);
  end else begin
    TargetOfAboutAgency := EMPTY;
  end;
  //
end;

end.
