unit Class_biz_leave;

interface

type
  //
  filter_type =
    (
    NONE,
    BOTH,
      OBLIGATED,
      ON_LEAVE
    );
  //
  TClass_biz_leave = class
  private
    { Private Declarations }
  public
    constructor Create;
    function BeLeaf(filter: filter_type): boolean;
  end;

implementation

constructor TClass_biz_leave.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_biz_leave.BeLeaf(filter: filter_type): boolean;
begin
  BeLeaf := FALSE;
  if filter in [OBLIGATED,ON_LEAVE] then begin
    BeLeaf := TRUE;
  end;
end;

end.
