unit Class_biz_enrollment;

interface

uses
  Class_db_enrollment;

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
    function SetLevel
      (
      new_level_code: string;
      effective_date: datetime;
      e_item: system.object
      )
      : boolean;
  end;

implementation

constructor TClass_biz_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
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

function TClass_biz_enrollment.SetLevel
  (
  new_level_code: string;
  effective_date: datetime;
  e_item: system.object
  )
  : boolean;
begin
  SetLevel := db_enrollment.SetLevel(new_level_code,effective_date,e_item);
end;

end.
