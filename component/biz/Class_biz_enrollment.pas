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

end.
