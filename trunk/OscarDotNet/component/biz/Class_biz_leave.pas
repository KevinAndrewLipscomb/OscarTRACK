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
  end;

implementation

constructor TClass_biz_leave.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

end.
