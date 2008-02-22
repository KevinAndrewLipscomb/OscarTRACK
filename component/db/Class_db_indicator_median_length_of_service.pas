unit Class_db_indicator_median_length_of_service;

interface

uses
  Class_db,
  Class_db_trail,
  system.web.ui.webcontrols;

type
  TClass_db_indicator_median_length_of_service = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure BindLatestRankedYearsOfService
      (
      target: system.object;
      be_trendable: boolean
      );
    procedure Log
      (
      be_trendable: boolean;
      citywide_median: decimal;
      ems_median: decimal;
      r01_median: decimal;
      r02_median: decimal;
      r04_median: decimal;
      r05_median: decimal;
      r06_median: decimal;
      r09_median: decimal;
      r13_median: decimal;
      r14_median: decimal;
      r16_median: decimal;
      r17_median: decimal
      );
  end;

implementation

uses
  mysql.data.mysqlclient;

constructor TClass_db_indicator_median_length_of_service.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_indicator_median_length_of_service.BindLatestRankedYearsOfService
  (
  target: system.object;
  be_trendable: boolean
  );
var
  transaction: mysqltransaction;
begin
  //
  self.Open;
  transaction := connection.BeginTransaction;
  try
    DataGrid(target).datasource := mysqlcommand.Create
      (
      'select NULL as rank'
      + ' , concat(medium_designator," - ",long_designator) as agency'
      + ' , m'
      + ' from indicator_median_length_of_service'
      +   ' join agency on (agency.id=indicator_median_length_of_service.agency_id)'
      + ' where be_trendable = ' + be_trendable.tostring
      +   ' and year = YEAR(CURDATE())'
      +   ' and month = MONTH(CURDATE())'
      +   ' and be_agency_id_applicable = TRUE'
      + ' order by m desc',
      connection,
      transaction
      )
      .ExecuteReader;
    DataGrid(target).DataBind;
    if be_trendable then begin
      mysqlcommand.Create
        ('delete from indicator_median_length_of_service where not be_trendable',connection,transaction).ExecuteNonquery;
    end;
    transaction.Commit;
  except
    transaction.Rollback;
  end;
  self.Close;
  //
end;

procedure TClass_db_indicator_median_length_of_service.Log
  (
  be_trendable: boolean;
  citywide_median: decimal;
  ems_median: decimal;
  r01_median: decimal;
  r02_median: decimal;
  r04_median: decimal;
  r05_median: decimal;
  r06_median: decimal;
  r09_median: decimal;
  r13_median: decimal;
  r14_median: decimal;
  r16_median: decimal;
  r17_median: decimal
  );
var
  sql: string;
begin
  sql := 'START TRANSACTION'
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = FALSE'
  +     ' , m = ' + citywide_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 0'
  +     ' , m = ' + ems_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 1'
  +     ' , m = ' + r01_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 2'
  +     ' , m = ' + r02_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 4'
  +     ' , m = ' + r04_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 5'
  +     ' , m = ' + r05_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 6'
  +     ' , m = ' + r06_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 9'
  +     ' , m = ' + r09_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 13'
  +     ' , m = ' + r13_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 14'
  +     ' , m = ' + r14_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 16'
  +     ' , m = ' + r16_median.tostring
  + ';'
  + ' replace indicator_median_length_of_service'
  +   ' set be_trendable = ' + be_trendable.tostring
  +     ' , year = YEAR(CURDATE())'
  +     ' , month = MONTH(CURDATE())'
  +     ' , be_agency_id_applicable = TRUE'
  +     ' , agency_id = 17'
  +     ' , m = ' + r17_median.tostring
  + ';'
  + ' COMMIT';
  if be_trendable then begin
    sql := db_trail.Saved(sql);
  end;
  self.Open;
  mysqlcommand.Create(sql,connection).ExecuteNonQuery;
  self.Close;
end;

end.
