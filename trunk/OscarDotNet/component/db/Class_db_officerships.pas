unit Class_db_officerships;

interface

uses
  Class_db;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_END_DATE = 2;
  TCCI_RANK = 3;

type
  TClass_db_officerships = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    procedure Bind
      (
      member_id: string;
      target: system.object
      );
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_officerships.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_officerships.Bind
  (
  member_id: string;
  target: system.object
  );
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select officership.id as id'                           // column 0
    + ' , date_format(start_date,"%Y-%m-%d") as start_date' // column 1
    + ' , date_format(end_date,"%Y-%m-%d") as end_date'     // column 2
    + ' , rank.name as rank'                                // column 3
    + ' from officership'
    +   ' join member on (member.id=officership.member_id)'
    +   ' join rank on (rank.code=officership.rank_code)'
    + ' where member.id = ' + member_id
    + ' order by start_date desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

end.
