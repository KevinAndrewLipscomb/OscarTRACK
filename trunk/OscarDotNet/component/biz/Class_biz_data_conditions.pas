unit Class_biz_data_conditions;

interface

type
  TClass_biz_data_conditions = class
  private
  public
    constructor Create;
    function BeMemberTrainee(member_id: string): boolean;
  end;

implementation

uses
  Class_biz_members;

constructor TClass_biz_data_conditions.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_biz_data_conditions.BeMemberTrainee(member_id: string): boolean;
begin
  BeMemberTrainee := (TClass_biz_members.Create.MedicalReleaseLevelOfMemberId(member_id) = 'Trainee');
end;

end.
