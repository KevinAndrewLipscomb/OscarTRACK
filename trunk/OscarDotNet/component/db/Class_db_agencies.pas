unit Class_db_agencies;

interface

uses
  Class_db,
  system.collections;

type
  serial_indicator_rec_type =
    RECORD
    year: cardinal;
    month: cardinal;
    value: double;
    END;
  TClass_db_agencies = class(TClass_db)
  private
    procedure BindDropDownList
      (
      unselected_literal: string;
      designator_clause: string;
      target: system.object;
      selected_id: string = ''
      );
  public
    constructor Create;
    procedure BindDropDownListShort
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE
      );
    procedure BindDropDownListShortDashLong(target: system.object);
    procedure BindForControlCharts
      (
      indicator: string;
      target: system.object
      );
    function IdOfShortDesignator(short_designator: string): string;
    function LongDesignatorOf(id: string): string;
    function MediumDesignatorOf(id: string): string;
    function SerialIndicatorData
      (
      indicator: string;
      agency_id: string;
      be_agency_id_applicable: string
      )
      : queue;
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
  target: system.object;
  selected_id: string = ''
  );
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  if unselected_literal <> system.string.EMPTY then begin
    DropDownList(target).Items.Add(listitem.Create(unselected_literal,''));
  end;
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
  if selected_id <> system.string.EMPTY then begin
    DropDownList(target).selectedvalue := selected_id;
  end;
  self.Close;
end;

procedure TClass_db_agencies.BindDropDownListShort
  (
  target: system.object;
  selected_id: string = '';
  be_available_option_all: boolean = TRUE
  );
begin
  if be_available_option_all then begin
    BindDropDownList('All','short_designator',target,selected_id);
  end else begin
    BindDropDownList(system.string.EMPTY,'short_designator',target,selected_id);
  end;
end;

procedure TClass_db_agencies.BindDropDownListShortDashLong(target: system.object);
begin
  BindDropDownList('-- Select --','concat(short_designator," - ",long_designator)',target);
end;

procedure TClass_db_agencies.BindForControlCharts
  (
  indicator: string;
  target: system.object
  );
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select distinct if(be_agency_id_applicable,concat(medium_designator," - ",long_designator),"CITYWIDE") as designator'
    + ' , id'
    + ' , be_agency_id_applicable'
    + ' from indicator_' + indicator
    +   ' join agency on (agency.id=indicator_' + indicator + '.agency_id)'
    + ' order by be_agency_id_applicable,id',
    connection
    )
    .ExecuteReader;
  DataGrid(target).databind;
  self.Close;
end;

function TClass_db_agencies.IdOfShortDesignator(short_designator: string): string;
begin
  self.Open;
  IdOfShortDesignator := bdpcommand.Create
    ('select id from agency where short_designator = "' + short_designator + '"',connection)
    .ExecuteScalar.tostring;
  self.Close;
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

function TClass_db_agencies.SerialIndicatorData
  (
  indicator: string;
  agency_id: string;
  be_agency_id_applicable: string
  )
  : queue;
var
  additional_where_clause: string;
  bdr: bdpdatareader;
  dependent_parameter_name: string;
  serial_indicator_rec: serial_indicator_rec_type;
  serial_indicator_rec_q: queue;
begin
  //
  if indicator = 'median_length_of_service' then begin
    dependent_parameter_name := 'm';
    additional_where_clause := ' and be_trendable';
  end else begin
    dependent_parameter_name := 'value';
    additional_where_clause := system.string.EMPTY;
  end;
  //
  serial_indicator_rec_q := queue.Create;
  //
  self.Open;
  bdr := bdpcommand.Create
    (
    'select year,month,' + dependent_parameter_name
    + ' from indicator_' + indicator
    + ' where agency_id = ' + agency_id + ' and be_agency_id_applicable = ' + be_agency_id_applicable + additional_where_clause
    ,connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    with serial_indicator_rec do begin
      year := uint32.Parse(bdr['year'].tostring);
      month := uint32.Parse(bdr['month'].tostring);
      value := system.double.Parse(bdr[dependent_parameter_name].tostring);
    end;
    serial_indicator_rec_q.Enqueue(serial_indicator_rec);
  end;
  bdr.Close;
  self.Close;
  //
  SerialIndicatorData := serial_indicator_rec_q;
  //
end;

function TClass_db_agencies.ShortDesignatorOf(id: string): string;
begin
  self.Open;
  ShortDesignatorOf :=
    bdpcommand.Create('select short_designator from agency where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
