unit Class_db_leaves;

interface

uses
  Class_db;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_END_DATE = 2;
  TCCI_KIND_OF_LEAVE = 3;
  TCCI_NOTE = 4;

type
  TClass_db_leaves = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    procedure Bind
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_leaves.Bind
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select leave_of_absence.id as id'                                     // column 0
    + ' , date_format(start_date,"%Y-%m-%d") as start_date'                // column 1
    + ' , date_format(end_date,"%Y-%m-%d") as end_date'                    // column 2
    + ' , kind_of_leave_code_description_map.description as kind_of_leave' // column 3
    + ' , note'                                                            // column 4
    + ' from leave_of_absence'
    +   ' join member on (member.id=leave_of_absence.member_id)'
    +   ' join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    + ' where member.id = ' + member_id
    + ' order by start_date desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

end.
