unit Class_db_privileges;

interface

uses
  Class_db,
  Class_db_trail,
  kix;

type
  TClass_db_privileges = class(TClass_db)
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
      unselected_literal: string = '-- Privilege --';
      selected_value: string = EMPTY
      );
    function Get
      (
      name: string;
      out soft_hyphenation_text: string
      )
      : boolean;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_privileges.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_privileges.Bind
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
    'SELECT name FROM privilege WHERE name like "' + partial_name + '%" order by name',
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

procedure TClass_db_privileges.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Privilege --';
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
    'select privilege.id as privilege_id'
    + ' , name as privilege_name'
    + ' from privilege'
    + ' order by privilege_name',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).items.Add(listitem.Create(dr['privilege_name'].tostring,dr['privilege_id'].tostring));
  end;
  dr.Close;
  self.Close;
  //
  if selected_value <> EMPTY then begin
    ListControl(target).selectedvalue := selected_value;
  end;
  //
end;

function TClass_db_privileges.Get
  (
  name: string;
  out soft_hyphenation_text: string
  )
  : boolean;
var
  dr: mysqldatareader;
begin
  Get := FALSE;
  self.Open;
  dr := mysqlcommand.Create('select * from privilege where CAST(name AS CHAR) = "' + name + '"',connection).ExecuteReader;
  if dr.Read then begin
    //
    name := dr['name'].tostring;
    soft_hyphenation_text := dr['soft_hyphenation_text'].tostring;
    //
    Get := TRUE;
    //
  end;
  dr.Close;
  self.Close;
end;

end.
