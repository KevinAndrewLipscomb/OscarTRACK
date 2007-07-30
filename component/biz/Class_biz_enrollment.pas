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
        APPLICANT,
        OPERATIONAL,
          STANDARD_OPS,
            TENURED,
            LIFE,
            REGULAR,
            REDUCED,
            ASSOCIATE,
            ATYPICAL,
            NEW_TRAINEE,
          SPECOPS,
        RECRUIT,
        ADMIN,
        TRANSFERRING,
        SUSPENDED,
      PAST,
        WITHDREW_APPLICATION,
        UNKNOWN,
        RESIGNED,
        RETIRED,
        DISABLED,
        DISMISSED,
      DECEASED
    );
  //
  TClass_biz_enrollment = class
  private
    db_enrollment: TClass_db_enrollment;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    function BeLeaf(filter: filter_type): boolean;
    function BePastDescription(description: string): boolean;
    procedure BindMemberHistory
      (
      member_id: string;
      target: system.object
      );
    procedure BindTransitionRadioButtonList
      (
      member_id: string;
      tier_id: string;
      target: system.object
      );
    procedure BindUncontrolledDropDownList(target: system.object);
    function CodeOf(description: string): string;
    function DescriptionOf(level_code: string): string;
    function ElaborationOf(description: string): string;
    function SetLevel
      (
      new_level_code: string;
      effective_date: datetime;
      note: string;
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

function TClass_biz_enrollment.BeLeaf(filter: filter_type): boolean;
begin
  BeLeaf := FALSE;
  if not (filter in [ALL,CURRENT,OPERATIONAL,STANDARD_OPS,PAST]) then begin
    BeLeaf := TRUE;
  end;
end;

function TClass_biz_enrollment.BePastDescription(description: string): boolean;
begin
  BePastDescription := (description = 'Withdrew application')
    or (description = 'Resigned')
    or (description = 'Retired')
    or (description = 'Disabled')
    or (description = 'Unknown')
    or (description = 'Dismissed')
    or (description = 'Died');
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
  tier_id: string;
  target: system.object
  );
begin
  db_enrollment.BindTransitionRadioButtonList(member_id,tier_id,target);
end;


procedure TClass_biz_enrollment.BindUncontrolledDropDownList(target: system.object);
begin
  db_enrollment.BindUncontrolledDropDownList(target);
end;

function TClass_biz_enrollment.ElaborationOf(description: string): string;
begin
  ElaborationOf := db_enrollment.ElaborationOf(description);
end;

function TClass_biz_enrollment.CodeOf(description: string): string;
begin
  CodeOf := db_enrollment.CodeOf(description);
end;

function TClass_biz_enrollment.DescriptionOf(level_code: string): string;
begin
  DescriptionOf := db_enrollment.DescriptionOf(level_code);
end;

function TClass_biz_enrollment.SetLevel
  (
  new_level_code: string;
  effective_date: datetime;
  note: string;
  member_id: string;
  e_item: system.object
  )
  : boolean;
var
  biz_members: TClass_biz_members;
begin
  //
  SetLevel := FALSE;
  //
  biz_members := TClass_biz_members.Create;
  //
  if db_enrollment.SetLevel(new_level_code,effective_date,note,member_id,e_item) then begin
    SetLevel := TRUE;
    biz_notifications.IssueForNewEnrollmentLevel
      (
      member_id,
      biz_members.FirstNameOfMemberId(member_id),
      biz_members.LastNameOfMemberId(member_id),
      biz_members.CadNumOfMemberId(member_id),
      db_enrollment.DescriptionOf(new_level_code),
      effective_date.tostring('yyyy-MM-dd'),
      note
      );
    //
  end;
  //
end;

end.
