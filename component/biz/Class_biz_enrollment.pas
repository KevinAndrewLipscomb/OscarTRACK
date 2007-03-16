unit Class_biz_enrollment;

interface

uses
  Class_db_enrollment,
  Class_biz_notifications;

type
  //
  filter_type =
    (
    ALL,
      CURRENT,
        OPERATIONAL,
          TENURED,
          LIFE,
          REGULAR,
          REDUCED,
          ASSOCIATE,
          SPECIAL,
        RECRUIT,
        ADMIN,
      PAST,
        LOST_INTEREST,
        RESIGNED,
        RETIRED,
        DISABLED,
        EXPELLED,
      DECEASED
    );
  //
  TClass_biz_enrollment = class
  private
    db_enrollment: TClass_db_enrollment;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    procedure BindMemberHistory
      (
      member_id: string;
      target: system.object
      );
    procedure BindTransitionRadioButtonList
      (
      member_id: string;
      target: system.object
      );
    procedure BindUncontrolledDropDownList(target: system.object);
    function DescriptionOf(level_code: string): string;
    function SetLevel
      (
      new_level_code: string;
      effective_date: datetime;
      member_id: string;
      e_item: system.object
      )
      : boolean;
  end;

implementation

uses
  Class_biz_members;

constructor TClass_biz_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

procedure TClass_biz_enrollment.BindMemberHistory
  (
  member_id: string;
  target: system.object
  );
begin
  db_enrollment.BindMemberHistory(member_id,target);
end;

procedure TClass_biz_enrollment.BindTransitionRadioButtonList
  (
  member_id: string;
  target: system.object
  );
begin
  db_enrollment.BindTransitionRadioButtonList(member_id,target);
end;


procedure TClass_biz_enrollment.BindUncontrolledDropDownList(target: system.object);
begin
  db_enrollment.BindUncontrolledDropDownList(target);
end;

function TClass_biz_enrollment.DescriptionOf(level_code: string): string;
begin
  DescriptionOf := db_enrollment.DescriptionOf(level_code);
end;

function TClass_biz_enrollment.SetLevel
  (
  new_level_code: string;
  effective_date: datetime;
  member_id: string;
  e_item: system.object
  )
  : boolean;
var
  biz_members: TClass_biz_members;
begin
  //
  biz_members := TClass_biz_members.Create;
  //
  SetLevel := db_enrollment.SetLevel(new_level_code,effective_date,member_id,e_item);
  //
  biz_notifications.IssueForNewEnrollmentLevel
    (
    member_id,
    biz_members.FirstNameOfMemberId(member_id),
    biz_members.LastNameOfMemberId(member_id),
    biz_members.CadNumOfMemberId(member_id),
    db_enrollment.DescriptionOf(new_level_code),
    effective_date.tostring
    );
  //
end;

end.
