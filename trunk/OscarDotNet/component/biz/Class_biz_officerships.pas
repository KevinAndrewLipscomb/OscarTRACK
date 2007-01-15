unit Class_biz_officerships;

interface

uses
  Class_db_officerships;

type
  TClass_biz_officerships = class
  private
    db_officerships: TClass_db_officerships;
  public
    constructor Create;
    procedure Bind
      (
      member_id: string;
      target: system.object
      );
  end;

implementation

constructor TClass_biz_officerships.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_officerships := TClass_db_officerships.Create;
end;

procedure TClass_biz_officerships.Bind
  (
  member_id: string;
  target: system.object
  );
begin
  db_officerships.Bind(member_id,target);
end;

end.
