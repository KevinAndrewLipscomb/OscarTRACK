unit Class_biz_indicator_median_length_of_service;

interface

uses
  Class_db_indicator_median_length_of_service,
  system.collections;

type
  TClass_biz_indicator_median_length_of_service = class
  private
    db_indicator_median_length_of_service: TClass_db_indicator_median_length_of_service;
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
      citywide_array_list: arraylist;
      ems_array_list: arraylist;
      r01_array_list: arraylist;
      r02_array_list: arraylist;
      r04_array_list: arraylist;
      r05_array_list: arraylist;
      r06_array_list: arraylist;
      r09_array_list: arraylist;
      r13_array_list: arraylist;
      r14_array_list: arraylist;
      r16_array_list: arraylist;
      r17_array_list: arraylist
      );
  end;

implementation

uses
  ki;

constructor TClass_biz_indicator_median_length_of_service.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_indicator_median_length_of_service := TClass_db_indicator_median_length_of_service.Create;
end;

procedure TClass_biz_indicator_median_length_of_service.BindLatestRankedYearsOfService
  (
  target: system.object;
  be_trendable: boolean
  );
begin
  db_indicator_median_length_of_service.BindLatestRankedYearsOfService(target,be_trendable);
end;

procedure TClass_biz_indicator_median_length_of_service.Log
  (
  be_trendable: boolean;
  citywide_array_list: arraylist;
  ems_array_list: arraylist;
  r01_array_list: arraylist;
  r02_array_list: arraylist;
  r04_array_list: arraylist;
  r05_array_list: arraylist;
  r06_array_list: arraylist;
  r09_array_list: arraylist;
  r13_array_list: arraylist;
  r14_array_list: arraylist;
  r16_array_list: arraylist;
  r17_array_list: arraylist
  );
begin
  citywide_array_list.Sort;
  ems_array_list.Sort;
  r01_array_list.Sort;
  r02_array_list.Sort;
  r04_array_list.Sort;
  r05_array_list.Sort;
  r06_array_list.Sort;
  r09_array_list.Sort;
  r13_array_list.Sort;
  r14_array_list.Sort;
  r16_array_list.Sort;
  r17_array_list.Sort;
  //
  db_indicator_median_length_of_service.Log
    (
    be_trendable,
    Median(citywide_array_list),
    Median(ems_array_list),
    Median(r01_array_list),
    Median(r02_array_list),
    Median(r04_array_list),
    Median(r05_array_list),
    Median(r06_array_list),
    Median(r09_array_list),
    Median(r13_array_list),
    Median(r14_array_list),
    Median(r16_array_list),
    Median(r17_array_list)
    );
end;

end.
