unit Class_biz_medical_release_levels;

interface

uses
  Class_db_medical_release_levels;

type
  TClass_biz_medical_release_levels = class
  private
    db_medical_release_levels: TClass_db_medical_release_levels;
  public
    constructor Create;
    procedure BindDropDownList
      (
      target: system.object;
      selected_description: string = ''
      );
  end;

implementation

constructor TClass_biz_medical_release_levels.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_medical_release_levels := TClass_db_medical_release_levels.Create;
end;

procedure TClass_biz_medical_release_levels.BindDropDownList
  (
  target: system.object;
  selected_description: string = ''
  );
begin
  db_medical_release_levels.BindDropDownList(target,selected_description);
end;

end.
