unit Class_db_tiers;

interface

uses
  Class_db,
  system.collections;

type
  TClass_db_tiers = class(TClass_db)
  private
  public
    constructor Create;
    procedure BindListControl
      (
      target: system.object;
      unselected_literal: string;
      selected_id: string = ''
      );
    function IdOfName(name: string): string;
  end;

implementation

uses
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_tiers.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_tiers.BindListControl
  (
  target: system.object;
  unselected_literal: string;
  selected_id: string = ''
  );
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  if unselected_literal <> EMPTY then begin
    ListControl(target).Items.Add(listitem.Create(unselected_literal,''));
  end;
  dr := mysqlcommand.Create('SELECT id,name from tier order by id',connection).ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add(listitem.Create(dr['name'].tostring,dr['id'].ToString));
  end;
  dr.Close;
  if selected_id <> EMPTY then begin
    ListControl(target).selectedvalue := selected_id;
  end;
  self.Close;
end;

function TClass_db_tiers.IdOfName(name: string): string;
begin
  self.Open;
  IdOfName := mysqlcommand.Create('select id from tier where name = "' + name + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
