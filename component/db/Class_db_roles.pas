unit Class_db_roles;

interface

uses
  Class_db,
  Class_db_trail,
  kix;

type
  crosstab_metadata_rec_type =
    RECORD
    index: cardinal;
    sql_name: string;
    id: string;
    natural_text: string;
    soft_hyphenation_text: string;
    tier_id: string;
    END;
  TClass_db_roles = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    function Bind
      (
      partial_name: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      has_config_roles_and_matrices: boolean;
      tier_quoted_value_list: string = DOUBLE_QUOTE;
      unselected_literal: string = '-- Role --';
      selected_value: string = EMPTY
      );
    function Delete(name: string): boolean;
    function Get
      (
      name: string;
      out tier_id: string;
      out soft_hyphenation_text: string;
      out pecking_order: string
      )
      : boolean;
    function NameOfId(id: string): string;
    procedure &Set
      (
      name: string;
      tier_id: string;
      soft_hyphenation_text: string;
      pecking_order: string
      );
    function TierOfId(id: string): string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_roles.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_roles.Bind
  (
  partial_name: string;
  target: system.object
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  //
  dr := mysqlcommand.Create
    (
    'SELECT name FROM role WHERE name like "' + partial_name + '%" order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['name'].tostring,dr['name'].tostring));
  end;
  dr.Close;
  self.Close;
  Bind := ListControl(target).items.count > 0;
end;

procedure TClass_db_roles.BindDirectToListControl
  (
  target: system.object;
  has_config_roles_and_matrices: boolean;
  tier_quoted_value_list: string = DOUBLE_QUOTE;
  unselected_literal: string = '-- Role --';
  selected_value: string = EMPTY
  );
var
  dr: mysqldatareader;
  where_clause: string;
begin
  //
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).items.Add(listitem.Create(unselected_literal,EMPTY));
  end;
  //
  where_clause := ' where name <> "Member"';
  if tier_quoted_value_list <> DOUBLE_QUOTE then begin
    where_clause := where_clause + ' and (tier_id in (' + tier_quoted_value_list + '))';
  end;
  if not has_config_roles_and_matrices then begin
    where_clause := where_clause + ' and (name <> "Application Administrator")';
  end;
  //
  self.Open;
  dr := mysqlcommand.Create('SELECT id,name FROM role' + where_clause + ' order by pecking_order',connection).ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['name'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

function TClass_db_roles.Delete(name: string): boolean;
begin
  //
  Delete := TRUE;
  //
  self.Open;
  try
    mysqlcommand.Create(db_trail.Saved('delete from role where name = ' + name),connection).ExecuteNonquery;
  except on e: exception do
    if e.message.StartsWith('Cannot delete or update a parent row: a foreign key constraint fails',TRUE,nil) then begin
      Delete := FALSE;
    end else begin
      raise e;
    end;
  end;
  self.Close;
end;

function TClass_db_roles.Get
  (
  name: string;
  out tier_id: string;
  out soft_hyphenation_text: string;
  out pecking_order: string
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  Get := FALSE;
  self.Open;
  dr := mysqlcommand.Create('select * from role where CAST(name AS CHAR) = "' + name + '"',connection).ExecuteReader;
  if dr.Read then begin
    //
    name := dr['name'].tostring;
    tier_id := dr['tier_id'].tostring;
    soft_hyphenation_text := dr['soft_hyphenation_text'].tostring;
    pecking_order := dr['pecking_order'].tostring;
    //
    Get := TRUE;
    //
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_roles.NameOfId(id: string): string;
begin
  self.Open;
  NameOfId := mysqlcommand.Create('select name from role where id = "' + id + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_roles.&Set
  (
  name: string;
  tier_id: string;
  soft_hyphenation_text: string;
  pecking_order: string
  );
var
  childless_field_assignments_clause: string;
begin
  //
  childless_field_assignments_clause := ' tier_id = NULLIF("' + tier_id + '","")'
  + ' , soft_hyphenation_text = NULLIF("' + soft_hyphenation_text + '","")'
  + ' , pecking_order = NULLIF("' + pecking_order + '","")';
  //
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'insert role'
      + ' set name = NULLIF("' + name + '","")'
      + ' , ' + childless_field_assignments_clause
      + ' on duplicate key update '
      + childless_field_assignments_clause
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
  //
end;

function TClass_db_roles.TierOfId(id: string): string;
begin
  self.Open;
  TierOfId := mysqlcommand.Create('select tier_id from role where id = "' + id + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
