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
