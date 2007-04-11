unit Class_db_agencies;

interface

uses
  Class_db;

type
  TClass_db_agencies = class(TClass_db)
  private
    procedure BindDropDownList
      (
      unselected_literal: string;
      designator_clause: string;
      target: system.object
      );
  public
    constructor Create;
    procedure BindDropDownListShort(target: system.object);
    procedure BindDropDownListShortDashLong(target: system.object);
    function LongDesignatorOf(id: string): string;
    function MediumDesignatorOf(id: string): string;
    function ShortDesignatorOf(id: string): string;
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_agencies.BindDropDownList
  (
  unselected_literal: string;
  designator_clause: string;
  target: system.object
  );
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).Items.Add(listitem.Create(unselected_literal,''));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT id'
    + ' , ' + designator_clause + ' as designator'
    + ' from agency'
    + ' where be_active = TRUE'
    + ' order by short_designator',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['designator'].tostring,bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_agencies.BindDropDownListShort(target: system.object);
begin
  BindDropDownList('All','short_designator',target);
end;

procedure TClass_db_agencies.BindDropDownListShortDashLong(target: system.object);
begin
  BindDropDownList('-- Select --','concat(short_designator," - ",long_designator)',target);
end;

function TClass_db_agencies.LongDesignatorOf(id: string): string;
begin
  self.Open;
  LongDesignatorOf :=
    bdpcommand.Create('select long_designator from agency where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_agencies.MediumDesignatorOf(id: string): string;
begin
  self.Open;
  MediumDesignatorOf :=
    bdpcommand.Create('select medium_designator from agency where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_agencies.ShortDesignatorOf(id: string): string;
begin
  self.Open;
  ShortDesignatorOf :=
    bdpcommand.Create('select short_designator from agency where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
