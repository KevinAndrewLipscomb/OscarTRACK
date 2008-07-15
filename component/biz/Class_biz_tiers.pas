unit Class_biz_tiers;

interface

uses
  Class_db_tiers,
  system.collections;

type
  TClass_biz_tiers = class
  private
    db_tiers: TClass_db_tiers;
  public
    constructor Create;
    procedure BindListControl
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE;
      unselected_literal: string = 'All'
      );
    function IdOfName(name: string): string;
  end;

implementation

constructor TClass_biz_tiers.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_tiers := TClass_db_tiers.Create;
end;

procedure TClass_biz_tiers.BindListControl
  (
  target: system.object;
  selected_id: string = '';
  be_available_option_all: boolean = TRUE;
  unselected_literal: string = 'All'
  );
begin
  db_tiers.BindListControl(target,unselected_literal,selected_id);
end;

function TClass_biz_tiers.IdOfName(name: string): string;
begin
  IdOfName := db_tiers.IdOfName(name);
end;

end.
