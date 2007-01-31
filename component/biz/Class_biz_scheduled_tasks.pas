unit Class_biz_scheduled_tasks;

interface

uses
  Class_db_enrollment;

type
  TClass_biz_scheduled_tasks = class
  private
    db_enrollment: TClass_db_enrollment;
  public
    constructor Create;
    procedure DoDailyChores;
  end;

implementation

constructor TClass_biz_scheduled_tasks.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
end;

procedure TClass_biz_scheduled_tasks.DoDailyChores;
begin
  db_enrollment.MakeSeniorityPromotions;
end;

end.
