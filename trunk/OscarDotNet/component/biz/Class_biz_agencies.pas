unit Class_biz_agencies;

interface

uses
  Class_db_agencies,
  system.collections;

type
  serial_indicator_rec_type = Class_db_agencies.serial_indicator_rec_type;
  TClass_biz_agencies = class
  private
    db_agencies: TClass_db_agencies;
  public
    constructor Create;
    function BeOkToSharePhoneListWithSiblings(id: string): boolean;
    function Bind
      (
      partial_username: string;
      target: system.object
      )
      : boolean;
    procedure BindListControlShort
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE;
      unselected_literal: string = 'All'
      );
    procedure BindListControlShortDashLong
      (
      target: system.object;
      selected_id: string = '';
      be_available_option_all: boolean = TRUE;
      option_all_text: string = '-- Select --'
      );
    procedure BindForCommensuration(target: system.object);
    procedure BindForControlCharts
      (
      indicator: string;
      target: system.object
      );
    procedure BindRankedCommensuration(target: system.object);
    procedure Delete(username: string);
    function Get
      (
      short_designator: string;
      out medium_designator: string;
      out long_designator: string;
      out be_active: boolean
      )
      : boolean;
    function IdOfShortDesignator(short_designator: string): string;
    function LongDesignatorOf(id: string): string;
    function MediumDesignatorOf(id: string): string;
    function OverallCommensuration: string;
    function SerialIndicatorData
      (
      indicator: string;
      agency_id: string;
      be_agency_id_applicable: string
      )
      : queue;
    procedure &Set
      (
      short_designator: string;
      medium_designator: string;
      long_designator: string;
      be_active: boolean
      );
    procedure SetCommensuration(commensuration_rec_q: queue);
    function ShortDesignatorOf(id: string): string;
  end;

implementation

constructor TClass_biz_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_agencies := TClass_db_agencies.Create;
end;

function TClass_biz_agencies.BeOkToSharePhoneListWithSiblings(id: string): boolean;
begin
  BeOkToSharePhoneListWithSiblings := (id <> '14');
end;

function TClass_biz_agencies.Bind
  (
  partial_username: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_agencies.Bind(partial_username,target);
end;

procedure TClass_biz_agencies.BindListControlShort
  (
  target: system.object;
  selected_id: string = '';
  be_available_option_all: boolean = TRUE;
  unselected_literal: string = 'All'
  );
begin
  db_agencies.BindListControlShort(target,selected_id,be_available_option_all,unselected_literal);
end;

procedure TClass_biz_agencies.BindListControlShortDashLong
  (
  target: system.object;
  selected_id: string = '';
  be_available_option_all: boolean = TRUE;
  option_all_text: string = '-- Select --'
  );
begin
  db_agencies.BindListControlShortDashLong(target,selected_id,be_available_option_all,option_all_text);
end;

procedure TClass_biz_agencies.BindForCommensuration(target: system.object);
begin
  db_agencies.BindForCommensuration(target);
end;

procedure TClass_biz_agencies.BindForControlCharts
  (
  indicator: string;
  target: system.object
  );
begin
  db_agencies.BindForControlCharts(indicator,target);
end;

procedure TClass_biz_agencies.BindRankedCommensuration(target: system.object);
begin
  db_agencies.BindRankedCommensuration(target);
end;

procedure TClass_biz_agencies.Delete(username: string);
begin
  db_agencies.Delete(username);
end;

function TClass_biz_agencies.Get
  (
      short_designator: string;
      out medium_designator: string;
      out long_designator: string;
      out be_active: boolean
  )
  : boolean;
begin
  //
  Get := db_agencies.Get
    (
    short_designator,
    medium_designator,
    long_designator,
    be_active
    );
  //
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

function TClass_biz_agencies.OverallCommensuration: string;
begin
  OverallCommensuration := db_agencies.OverallCommensuration;
end;

function TClass_biz_agencies.SerialIndicatorData
  (
  indicator: string;
  agency_id: string;
  be_agency_id_applicable: string
  )
  : queue;
begin
  SerialIndicatorData := db_agencies.SerialIndicatorData(indicator,agency_id,be_agency_id_applicable);
end;

procedure TClass_biz_agencies.&Set
  (
      short_designator: string;
      medium_designator: string;
      long_designator: string;
      be_active: boolean
  );
begin
  //
  db_agencies.&Set
    (
    short_designator,
    medium_designator,
    long_designator,
    be_active
    );
  //
end;

procedure TClass_biz_agencies.SetCommensuration(commensuration_rec_q: queue);
begin
  db_agencies.SetCommensuration(commensuration_rec_q);
end;

function TClass_biz_agencies.ShortDesignatorOf(id: string): string;
begin
  ShortDesignatorOf := db_agencies.ShortDesignatorOf(id);
end;

end.
