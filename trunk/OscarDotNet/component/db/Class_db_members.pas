unit Class_db_members;

interface

uses
  borland.data.provider,
  Class_db,
  system.web.ui.webcontrols;

type
  TClass_db_members = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function AffiliateNumOfId(id: string): string;
    function BeValidProfile(id: string): boolean;
    procedure BindDropDownList
      (
      agency_user_id: string;
      target: system.object;
      be_unfiltered: boolean = FALSE
      );
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function NameOf(member_id: string): string;
    procedure SetProfile
      (
      id: string;
      name: string
      );
    procedure BindSquadCommanderOverview
      (
      agency_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
  end;

implementation

const
  TCCI_LAST_NAME = 0;
  TCCI_FIRST_NAME = 1;
  TCCI_CAD_NUM = 2;

constructor TClass_db_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_members.AffiliateNumOfId(id: string): string;
begin
  self.Open;
  AffiliateNumOfId := borland.data.provider.BdpCommand.Create
    (
    'SELECT affiliate_num FROM member WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_members.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = bdpCommand.Create('select be_valid_profile from member where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

procedure TClass_db_members.BindDropDownList
  (
  agency_user_id: string;
  target: system.object;
  be_unfiltered: boolean = FALSE
  );
var
  bdr: borland.data.provider.bdpdatareader;
  cmdText: string;
begin
  self.Open;
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --','0'));
  //
  cmdText := 'SELECT id,name FROM member_user JOIN member using (id) WHERE be_active = TRUE ';
  if not be_unfiltered then begin
    cmdText := cmdText + 'and agency_code = ' + agency_user_id + ' ';
  end;
  cmdText := cmdText + 'ORDER BY name';
  //
  bdr := Borland.Data.Provider.BdpCommand.Create(cmdText,connection).ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['name'].tostring,bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_members.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
var
  bdr: borland.data.provider.BdpDataReader;
begin
  self.Open;
  bdr := borland.data.provider.BdpCommand.Create
    (
    'SELECT name,'
    + 'be_valid_profile '
    + 'FROM member '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteReader;
  bdr.Read;
  name := bdr['name'].tostring;
  be_valid_profile := (bdr['be_valid_profile'].tostring = '1');
  bdr.Close;
  self.Close;
end;

function TClass_db_members.NameOf(member_id: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from member where id = ' + member_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE member '
    + 'SET name = "' + name + '"'
    +   ', be_valid_profile = TRUE '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_members.BindSquadCommanderOverview
  (
  agency_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
var
  command_text: string;
  current_month_first_date_string: string;
  current_month_num: cardinal;
  current_month_num_string: string;
  current_year_num: cardinal;
  current_year_num_string: string;
  today: datetime;
begin
  //
  today := datetime.Today;
  current_year_num := today.Year;
  current_year_num_string := current_year_num.tostring('d4');
  current_month_num := today.Month;
  current_month_num_string := current_year_num_string + '-' + current_month_num.tostring('d2');
  current_month_first_date_string := current_month_num_string + '-01';
  //
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  //
  command_text :=
  'select last_name'                                                                     // column 0
  + ' , first_name'                                                                      // column 1
  + ' , cad_num'                                                                         // column 2
  + ' , medical_release_code_description_map.description as medical_release_description' // column 3
  + ' , if(be_driver_qualified,"Y","") as be_driver_qualified'                           // column 4
  + ' , obligation_code_description_map.description as enrollment'                       // column 5
  + ' , if((leave_of_absence.start_date <= "' + current_month_first_date_string + '")'
  +     ' and (leave_of_absence.end_date >= LAST_DAY("' + current_month_first_date_string + '"))'
  +     ' ,concat('
  +       ' if(leave_of_absence.start_date < "' + current_month_first_date_string + '","&lt;","")'
  +       ' ,kind_of_leave_code_description_map.description'
  +       ' ,if(leave_of_absence.end_date > LAST_DAY("' + current_month_first_date_string + '"),"&gt;","")'
  +       ')'
  +     ' ,""'
  +   ' ) as leave_status'                                                               // column 6
  + ' from member'
  +   ' join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)'
  +   ' join enrollment_history on (enrollment_history.member_id=member.id)'
  +   ' join obligation_code_description_map on (obligation_code_description_map.code=enrollment_history.obligation_code)'
  +   ' left join leave_of_absence on (leave_of_absence.member_id=member.id)'
  +   ' left join kind_of_leave_code_description_map'
  +     ' on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
  + ' where agency_id = ' + agency_id
  +   ' and end_disposition_code is null'
  + ' order by ' + sort_order;
  //
  self.Open;
  DataGrid(target).datasource := bdpcommand.Create(command_text,connection).ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

end.
