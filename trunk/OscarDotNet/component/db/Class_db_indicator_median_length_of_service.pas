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
    procedure BindLatestRankedYearsOfService(target: system.object);
    procedure Log
      (
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
  borland.data.provider;

constructor TClass_db_indicator_median_length_of_service.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_indicator_median_length_of_service.BindLatestRankedYearsOfService(target: system.object);
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select NULL as rank'
    + ' , concat(medium_designator," - ",long_designator) as agency'
    + ' , m'
    + ' from indicator_median_length_of_service'
    +   ' join agency on (agency.id=indicator_median_length_of_service.agency_id)'
    + ' where year = YEAR(CURDATE())'
    +   ' and month = MONTH(CURDATE())'
    +   ' and be_agency_id_applicable = TRUE'
    + ' order by m desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_indicator_median_length_of_service.Log
  (
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
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'START TRANSACTION'
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = FALSE'
      +     ' , m = ' + citywide_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 0'
      +     ' , m = ' + ems_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 1'
      +     ' , m = ' + r01_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 2'
      +     ' , m = ' + r02_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 4'
      +     ' , m = ' + r04_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 5'
      +     ' , m = ' + r05_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 6'
      +     ' , m = ' + r06_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 9'
      +     ' , m = ' + r09_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 13'
      +     ' , m = ' + r13_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 14'
      +     ' , m = ' + r14_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 16'
      +     ' , m = ' + r16_median.tostring
      + ';'
      + ' replace indicator_median_length_of_service'
      +   ' set year = YEAR(CURDATE())'
      +     ' , month = MONTH(CURDATE())'
      +     ' , be_agency_id_applicable = TRUE'
      +     ' , agency_id = 17'
      +     ' , m = ' + r17_median.tostring
      + ';'
      + ' COMMIT'
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

end.
