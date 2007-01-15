unit Class_db_enrollment;

interface

uses
  Class_db;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_DESCRIPTION = 2;
  TCCI_END_DISPOSITION = 3;

type
  TClass_db_enrollment = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    procedure BindMemberHistory
      (
      member_id: string;
      target: system.object
      );
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_enrollment.BindMemberHistory
  (
  member_id: string;
  target: system.object
  );
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select enrollment_history.id as id'                                       // column 0
    + ' , date_format(start_date,"%Y-%m-%d") as start_date'                    // column 1
    + ' , obligation_code_description_map.description as description'          // column 2
    + ' , end_disposition_code_description_map.description as end_disposition' // column 3
    + ' from enrollment_history'
    +   ' join member on (member.id=enrollment_history.member_id)'
    +   ' join obligation_code_description_map on (obligation_code_description_map.code=enrollment_history.obligation_code)'
    +   ' left join end_disposition_code_description_map'
    +     ' on (end_disposition_code_description_map.code=enrollment_history.end_disposition_code)'
    + ' where member.id = ' + member_id
    + ' order by start_date desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

end.
