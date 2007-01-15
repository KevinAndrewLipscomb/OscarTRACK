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
    procedure BindKindDropDownList(target: system.object);
    procedure BindMemberRecords
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

procedure TClass_db_leaves.BindKindDropDownList(target: system.object);
var
  bdr: borland.data.provider.bdpdatareader;
begin
  self.Open;
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  //
  bdr := Borland.Data.Provider.BdpCommand.Create
    ('SELECT code,description FROM kind_of_leave_code_description_map ORDER BY description',connection).ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['description'].tostring,bdr['code'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_leaves.BindMemberRecords
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  self.Open;
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select leave_of_absence.id as id'                                     // column 0
    + ' , date_format(start_date,"%Y-%m") as start_date'                   // column 1
    + ' , date_format(end_date,"%Y-%m") as end_date'                       // column 2
    + ' , kind_of_leave_code_description_map.description as kind_of_leave' // column 3
    + ' , num_obliged_shifts'                                              // column 4
    + ' , note'                                                            // column 5
    + ' from leave_of_absence'
    +   ' join member on (member.id=leave_of_absence.member_id)'
    +   ' join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    + ' where member.id = ' + member_id
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

end.
