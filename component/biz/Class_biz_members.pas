unit Class_biz_members;

interface

uses
  Class_biz_enrollment,
  Class_biz_leave,
  Class_db_members;

type
  TClass_biz_members = class
  private
    db_members: TClass_db_members;
  public
    constructor Create;
    function AffiliateNumOfId(id: string): string;
    function BeDriverQualifiedOf(e_item: system.object): string;
    function BeValidProfile(id: string): boolean;
    procedure BindDropDownList
      (
      agency_user_id: string;
      target: system.object;
      be_unfiltered: boolean = FALSE
      );
    procedure BindSquadCommanderOverview
      (
      agency_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
      leave_filter: Class_biz_leave.filter_type = NONE
      );
    function CadNumOf(e_item: system.object): string;
    function EnrollmentOf(e_item: system.object): string;
    function FirstNameOf(e_item: system.object): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function IdOf(e_item: system.object): string;
    function KindOfLeaveOf(e_item: system.object): string;
    function LastNameOf(e_item: system.object): string;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function NameOf(member_id: string): string;
    function OfficershipOf(member_id: string): string;
    procedure SetProfile
      (
      id: string;
      name: string
      );
    function TimeOfLeaveOf(e_item: system.object): string;
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

function TClass_biz_members.BeDriverQualifiedOf(e_item: system.object): string;
begin
  BeDriverQualifiedOf := db_members.BeDriverQualifiedOf(e_item);
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

procedure TClass_biz_members.BindSquadCommanderOverview
  (
  agency_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
  leave_filter: Class_biz_leave.filter_type = NONE
  );
begin
  db_members.BindSquadCommanderOverview(agency_id,sort_order,be_sort_order_ascending,target,enrollment_filter,leave_filter);
end;

function TClass_biz_members.CadNumOf(e_item: system.object): string;
begin
  CadNumOf := db_members.CadNumOf(e_item);
end;

function TClass_biz_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := db_members.EnrollmentOf(e_item);
end;

function TClass_biz_members.FirstNameOf(e_item: system.object): string;
begin
  FirstNameOf := db_members.FirstNameOf(e_item);
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

function TClass_biz_members.IdOf(e_item: system.object): string;
begin
  IdOf := db_members.IdOf(e_item);
end;

function TClass_biz_members.KindOfLeaveOf(e_item: system.object): string;
begin
  KindOfLeaveOf := db_members.KindOfLeaveOf(e_item);
end;

function TClass_biz_members.LastNameOf(e_item: system.object): string;
begin
  LastNameOf := db_members.LastNameOf(e_item);
end;

function TClass_biz_members.MedicalReleaseLevelOf(e_item: system.object): string;
begin
  MedicalReleaseLevelOf := db_members.MedicalReleaseLevelOf(e_item);
end;

function TClass_biz_members.NameOf(member_id: string): string;
begin
  NameOf := db_members.NameOf(member_id);
end;

function TClass_biz_members.OfficershipOf(member_id: string): string;
begin
  OfficerShipOf := db_members.OfficershipOf(member_id);
end;

procedure TClass_biz_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  db_members.SetProfile(id,name);
end;

function TClass_biz_members.TimeOfLeaveOf(e_item: system.object): string;
begin
  TimeOfLeaveOf := db_members.TimeOfLeaveOf(e_item);
end;

end.
