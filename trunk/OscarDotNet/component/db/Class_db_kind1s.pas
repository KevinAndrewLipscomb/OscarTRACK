unit Class_db_kind1s;

interface

uses
  borland.data.provider,
  Class_db,
  system.web.ui.webcontrols;

type
  TClass_db_kind1s = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function AffiliateNumOfId(id: string): string;
    function BeValidProfile(id: string): boolean;
    procedure BindDropDownList
      (
      kind3_user_id: string;
      target: system.object;
      be_unfiltered: boolean = FALSE
      );
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function NameOf(kind1_id: string): string;
    procedure SetProfile
      (
      id: string;
      name: string
      );
  end;

implementation

constructor TClass_db_kind1s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_kind1s.AffiliateNumOfId(id: string): string;
begin
  self.Open;
  AffiliateNumOfId := borland.data.provider.BdpCommand.Create
    (
    'SELECT affiliate_num FROM kind1 WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_kind1s.BeValidProfile(id: string): boolean;
begin
  self.Open;
  BeValidProfile :=
    ('1' = bdpCommand.Create('select be_valid_profile from kind1 where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

procedure TClass_db_kind1s.BindDropDownList
  (
  kind3_user_id: string;
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
  cmdText := 'SELECT id,name FROM kind1_user JOIN kind1 using (id) WHERE be_active = TRUE ';
  if not be_unfiltered then begin
    cmdText := cmdText + 'and kind3_code = ' + kind3_user_id + ' ';
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

procedure TClass_db_kind1s.GetProfile
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
    + 'FROM kind1 '
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

function TClass_db_kind1s.NameOf(kind1_id: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from kind1 where id = ' + kind1_id,connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_kind1s.SetProfile
  (
  id: string;
  name: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE kind1 '
    + 'SET name = "' + name + '"'
    +   ', be_valid_profile = TRUE '
    + 'WHERE id = "' + id + '"',
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

end.
