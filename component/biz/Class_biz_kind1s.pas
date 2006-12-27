unit Class_biz_kind1s;

interface

uses
  Class_db_kind1s;

type
  TClass_biz_kind1s = class
  private
    db_kind1s: TClass_db_kind1s;
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

constructor TClass_biz_kind1s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_kind1s := TClass_db_kind1s.Create;
end;

function TClass_biz_kind1s.AffiliateNumOfId(id: string): string;
begin
  AffiliateNumOfId := db_kind1s.AffiliateNumOfId(id);
end;

function TClass_biz_kind1s.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_kind1s.BeValidProfile(id);
end;

procedure TClass_biz_kind1s.BindDropDownList
  (
  kind3_user_id: string;
  target: system.object;
  be_unfiltered: boolean = FALSE
  );
begin
  db_kind1s.BindDropDownList(kind3_user_id,target,be_unfiltered);
end;

procedure TClass_biz_kind1s.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
begin
  db_kind1s.GetProfile
    (
    id,
    name,
    be_valid_profile
    );
end;

function TClass_biz_kind1s.NameOf(kind1_id: string): string;
begin
  NameOf := db_kind1s.NameOf(kind1_id);
end;

procedure TClass_biz_kind1s.SetProfile
  (
  id: string;
  name: string
  );
begin
  db_kind1s.SetProfile
    (
    id,
    name
    );
end;

end.
