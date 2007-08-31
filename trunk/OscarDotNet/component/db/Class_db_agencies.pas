unit Class_db_agencies;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

type
  commensuration_rec_type =
    RECORD
    agency_id: string;
    commensuration_factor: decimal;
    be_agency_id_applicable: boolean;
    END;
  serial_indicator_rec_type =
    RECORD
    year: cardinal;
    month: cardinal;
    value: double;
    END;
  TClass_db_agencies = class(TClass_db)
  private
    db_trail: TClass_db_trail;
    procedure BindDropDownList
      (
      unselected_literal: string;
      designator_clause: string;
      target: system.object;
      selected_id: string = ''
      );
  public
    constructor Create;
    function Bind
      (
      partial_short_designator: string;
      target: system.object
      )
      : boolean;
    procedure BindDropDownListShort
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE
      );
    procedure BindDropDownListShortDashLong(target: system.object);
    procedure BindForCommensuration(target: system.object);
    procedure BindForControlCharts
      (
      indicator: string;
      target: system.object
      );
    procedure BindRankedCommensuration(target: system.object);
    procedure Delete(short_designator: string);
    function Get
      (
      short_designator: string;
      out medium_designator: string;
      out long_designator: string;
      out be_active: boolean
      )
      : boolean;
    function IdOfShortDesignator(short_designator: string): string;
    function LongDesignatorOf(id: string): string;
    function MediumDesignatorOf(id: string): string;
    function OverallCommensuration: string;
    function SerialIndicatorData
      (
      indicator: string;
      agency_id: string;
      be_agency_id_applicable: string
      )
      : queue;
    procedure &Set
      (
      short_designator: string;
      medium_designator: string;
      long_designator: string;
      be_active: boolean
      );
    procedure SetCommensuration(commensuration_rec_q: queue);
    function ShortDesignatorOf(id: string): string;
  end;

implementation

uses
  borland.data.provider,
  Class_db_members,
  system.web.ui.webcontrols;

constructor TClass_db_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_agencies.Bind
  (
  partial_short_designator: string;
  target: system.object
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  //
  bdr := bdpcommand.Create
    (
    'SELECT short_designator FROM agency WHERE short_designator like "' + partial_short_designator + '%" order by short_designator',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add
      (listitem.Create(bdr['short_designator'].tostring,bdr['short_designator'].tostring));
  end;
  bdr.Close;
  self.Close;
  Bind := DropDownList(target).items.count > 0;
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

procedure TClass_db_agencies.BindForCommensuration(target: system.object);
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select agency.id as agency_id'
    + ' , concat(medium_designator," - ",long_designator) as designator'
    + ' , '
    + Class_db_members.CrewShiftsForecastMetricFromWhereClause('1')
    +   ' and agency.id < 200'
    +   ' and be_active'
    + ' group by agency.id'
    + ' order by agency.id',
    connection
    )
    .ExecuteReader;
  DataGrid(target).databind;
  self.Close;
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

procedure TClass_db_agencies.BindRankedCommensuration(target: system.object);
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , value'
    + ' from indicator_commensuration'
    +   ' join agency on (agency.id=indicator_commensuration.agency_id)'
    + ' where year = YEAR(CURDATE())'
    +   ' and month = MONTH(CURDATE())'
    +   ' and be_agency_id_applicable = TRUE'
    + ' order by value desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_agencies.Delete(short_designator: string);
begin
  self.Open;
  bdpcommand.Create(db_trail.Saved('delete from agency where short_designator = ' + short_designator),connection).ExecuteNonquery;
  self.Close;
end;

function TClass_db_agencies.Get
  (
      short_designator: string;
      out medium_designator: string;
      out long_designator: string;
      out be_active: boolean
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  Get := FALSE;
  self.Open;
  bdr := bdpcommand.Create('select * from agency where short_designator = "' + short_designator + '"',connection).ExecuteReader;
  if bdr.Read then begin
    //
    short_designator := bdr['short_designator'].tostring;
    medium_designator := bdr['medium_designator'].tostring;
    long_designator := bdr['long_designator'].tostring;
    be_active := (bdr['be_active'].tostring = '1');
    //
    Get := TRUE;
    //
  end;
  bdr.Close;
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

function TClass_db_agencies.OverallCommensuration: string;
var
  overall_commensuration_obj: system.object;
begin
  OverallCommensuration := system.string.EMPTY;
  self.Open;
  overall_commensuration_obj := bdpcommand.Create
    (
    'select FORMAT(value,0)'
    + ' from indicator_commensuration'
    + ' where year = YEAR(CURDATE())'
    +   ' and month = MONTH(CURDATE())'
    +   ' and not be_agency_id_applicable',
    connection
    )
    .ExecuteScalar;
  if overall_commensuration_obj <> nil then begin
    OverallCommensuration := overall_commensuration_obj.tostring;
  end;
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

procedure TClass_db_agencies.&Set
  (
      short_designator: string;
      medium_designator: string;
      long_designator: string;
      be_active: boolean
  );
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'replace agency'
      + ' set short_designator = ' + short_designator + ''
      + ' , medium_designator = ' + medium_designator + ''
      + ' , long_designator = ' + long_designator + ''
      + ' , be_active = ' + be_active.tostring
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

procedure TClass_db_agencies.SetCommensuration(commensuration_rec_q: queue);
var
  commensuration_rec: commensuration_rec_type;
  i: cardinal;
  month: string;
  sql: string;
  this_day_next_month: datetime;
  year: string;
begin
  //
  this_day_next_month := datetime.today.AddMonths(1);
  year := this_day_next_month.year.tostring;
  month := this_day_next_month.month.tostring;
  sql := 'replace indicator_commensuration (year,month,be_agency_id_applicable,agency_id,value) values';
  for i := 1 to commensuration_rec_q.Count do begin
    commensuration_rec := commensuration_rec_type(commensuration_rec_q.Dequeue);
    sql := sql
    + ' ('
    +   year
    +   ','
    +   month
    +   ','
    +   commensuration_rec.be_agency_id_applicable.tostring
    +   ','
    +   commensuration_rec.agency_id
    +   ','
    +   (commensuration_rec.commensuration_factor*100).tostring('F0')
    + ' ),';
  end;
  //
  self.Open;
  bdpcommand.Create(db_trail.Saved(sql.Substring(0,sql.Length - 1)),connection).ExecuteNonquery;
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
