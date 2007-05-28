unit Class_biz_scheduled_tasks;

interface

uses
  Class_db_enrollment,
  Class_db_members;

type
  TClass_biz_scheduled_tasks = class
  private
    db_enrollment: TClass_db_enrollment;
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
  db_enrollment := TClass_db_enrollment.Create;
  db_members := TClass_db_members.Create;
end;

procedure TClass_biz_scheduled_tasks.DoDailyChores;
begin
  db_enrollment.MakeSeniorityPromotions;
end;

procedure TClass_biz_scheduled_tasks.DoMemberStatusStatements;
begin
  db_members.MakeMemberStatusStatements;
end;

end.
