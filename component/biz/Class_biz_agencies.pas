unit Class_biz_agencies;

interface

uses
  Class_db_agencies;

type
  TClass_biz_agencies = class
  private
    db_agencies: TClass_db_agencies;
  public
    constructor Create;
    procedure BindDropDownListShort
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE
      );
    procedure BindDropDownListShortDashLong(target: system.object);
    function IdOfShortDesignator(short_designator: string): string;
    function LongDesignatorOf(id: string): string;
    function MediumDesignatorOf(id: string): string;
    function ShortDesignatorOf(id: string): string;
  end;

implementation

constructor TClass_biz_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_agencies := TClass_db_agencies.Create;
end;

procedure TClass_biz_agencies.BindDropDownListShort
  (
  target: system.object;
  selected_id: string = '';
  be_available_option_all: boolean = TRUE
  );
begin
  db_agencies.BindDropDownListShort(target,selected_id,be_available_option_all);
end;

procedure TClass_biz_agencies.BindDropDownListShortDashLong(target: system.object);
begin
  db_agencies.BindDropDownListShortDashLong(target);
end;

function TClass_biz_agencies.IdOfShortDesignator(short_designator: string): string;
begin
  IdOfShortDesignator := db_agencies.IdOfShortDesignator(short_designator);
end;

function TClass_biz_agencies.LongDesignatorOf(id: string): string;
begin
  LongDesignatorOf := db_agencies.LongDesignatorOf(id);
end;

function TClass_biz_agencies.MediumDesignatorOf(id: string): string;
begin
  MediumDesignatorOf := db_agencies.MediumDesignatorOf(id);
end;

function TClass_biz_agencies.ShortDesignatorOf(id: string): string;
begin
  ShortDesignatorOf := db_agencies.ShortDesignatorOf(id);
end;

end.
