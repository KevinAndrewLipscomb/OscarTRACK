unit Class_biz_medical_release_levels;

interface

uses
  Class_db_medical_release_levels;

type
  filter_type =
    (
    ALL,
      NOT_RELEASED,
        NONE,
        IN_CLASS,
        TRAINEE,
      RELEASED,
        EMT_B,
        EMT_ST,
        EMT_E,
        EMT_CT,
        EMT_I,
        EMT_P
    );
  TClass_biz_medical_release_levels = class
  private
    db_medical_release_levels: TClass_db_medical_release_levels;
  public
    constructor Create;
    function BeLeaf(filter: filter_type): boolean;
    function BeRecruitAdminOrSpecOpsBoundByCode(level_code: string): boolean;
    function BeRecruitAdminOrSpecOpsBoundByDescription(level_description: string): boolean;
    function BeReleased(peck_code: string): boolean;
    procedure BindDropDownList
      (
      target: system.object;
      selected_description: string = ''
      );
    function DescriptionOf(code: string): string;
  end;

implementation

constructor TClass_biz_medical_release_levels.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_medical_release_levels := TClass_db_medical_release_levels.Create;
end;

function TClass_biz_medical_release_levels.BeLeaf(filter: filter_type): boolean;
begin
  BeLeaf := FALSE;
  if not (filter in [ALL,NOT_RELEASED,RELEASED]) then begin
    BeLeaf := TRUE;
  end;
end;

function TClass_biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByCode(level_code: string): boolean;
begin
  BeRecruitAdminOrSpecOpsBoundByCode := (level_code = '1') or (level_code = '9');
end;

function TClass_biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByDescription(level_description: string): boolean;
var
  lowercase_level_description: string;
begin
  lowercase_level_description := level_description.ToLower;
  BeRecruitAdminOrSpecOpsBoundByDescription :=
    (lowercase_level_description = 'none') or (lowercase_level_description = 'emt intern');
end;

function TClass_biz_medical_release_levels.BeReleased(peck_code: string): boolean;
begin
  BeReleased := (uint32.Parse(peck_code) >= Class_db_medical_release_levels.LOWEST_RELEASED_PECK_CODE);
end;

procedure TClass_biz_medical_release_levels.BindDropDownList
  (
  target: system.object;
  selected_description: string = ''
  );
begin
  db_medical_release_levels.BindDropDownList(target,selected_description);
end;

function TClass_biz_medical_release_levels.DescriptionOf(code: string): string;
begin
  DescriptionOf := db_medical_release_levels.DescriptionOf(code);
end;

end.
