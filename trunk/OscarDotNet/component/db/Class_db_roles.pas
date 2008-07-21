unit Class_db_roles;

interface

uses
  Class_db,
  Class_db_trail;

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
    procedure BindDirectToListControl(target: system.object);
    function Delete(name: string): boolean;
    function Get
      (
      name: string;
      out tier_id: string;
      out soft_hyphenation_text: string
      )
      : boolean;
    function NameOfId(id: string): string;
    procedure &Set
      (
      name: string;
      tier_id: string;
      soft_hyphenation_text: string
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
    'SELECT name FROM role WHERE name like "' + partial_name + '%" order by name',
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

procedure TClass_db_roles.BindDirectToListControl(target: system.object);
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  //
  dr := mysqlcommand.Create('SELECT id,name FROM role order by name',connection).ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add
      (listitem.Create(dr['name'].tostring,dr['id'].tostring));
  end;
  dr.Close;
  self.Close;
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
  out soft_hyphenation_text: string
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
  soft_hyphenation_text: string
  );
//
// If any fields in this table are foreign keys for a subordinate table:
// a. Uncomment the "//1" lines.
// b. Customize the SQL as indicated by {bracketed comments}.
//
//1 var
//1   childless_field_assignments_clause: string;
begin
  //
//1  childless_field_assignments_clause := // {Move childless field assignments here.}
  //
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
//1      'insert role'
//1      + ' set // {Move parent field assignments here.}
//1      + ' , ' + childless_field_assignments_clause
//1      + ' on duplicate key update '
//1      + childless_field_assignments_clause
      'replace role'
      + ' set name = NULLIF("' + name + '","")'
      + ' , tier_id = NULLIF("' + tier_id + '","")'
      + ' , soft_hyphenation_text = NULLIF("' + soft_hyphenation_text + '","")'
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
