unit Class_biz_members;

interface

uses
  Class_db_members;

type
  TClass_biz_members = class
  private
    db_members: TClass_db_members;
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
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
  end;

implementation

constructor TClass_biz_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_members := TClass_db_members.Create;
end;

function TClass_biz_members.AffiliateNumOfId(id: string): string;
begin
  AffiliateNumOfId := db_members.AffiliateNumOfId(id);
end;

function TClass_biz_members.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_members.BeValidProfile(id);
end;

procedure TClass_biz_members.BindDropDownList
  (
  agency_user_id: string;
  target: system.object;
  be_unfiltered: boolean = FALSE
  );
begin
  db_members.BindDropDownList(agency_user_id,target,be_unfiltered);
end;

procedure TClass_biz_members.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
begin
  db_members.GetProfile
    (
    id,
    name,
    be_valid_profile
    );
end;

function TClass_biz_members.NameOf(member_id: string): string;
begin
  NameOf := db_members.NameOf(member_id);
end;

procedure TClass_biz_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  db_members.SetProfile
    (
    id,
    name
    );
end;

procedure TClass_biz_members.BindSquadCommanderOverview
  (
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  db_members.BindSquadCommanderOverview(sort_order,be_sort_order_ascending,target);
end;

end.
