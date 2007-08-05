unit Class_biz_scheduled_tasks;

interface

uses
  Class_biz_enrollment,
  Class_db_members;

type
  TClass_biz_scheduled_tasks = class
  private
    biz_enrollment: TClass_biz_enrollment;
    db_members: TClass_db_members;
  public
    constructor Create;
    procedure DoDailyChores;
    procedure DoMemberStatusStatements;
  end;

implementation

constructor TClass_biz_scheduled_tasks.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_enrollment := TClass_biz_enrollment.Create;
  db_members := TClass_db_members.Create;
end;

procedure TClass_biz_scheduled_tasks.DoDailyChores;
begin
  biz_enrollment.MakeSeniorityPromotions;
end;

procedure TClass_biz_scheduled_tasks.DoMemberStatusStatements;
begin
  db_members.MakeMemberStatusStatements;
end;

end.
