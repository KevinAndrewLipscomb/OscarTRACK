unit Class_biz_enrollment;

interface

type
  //
  filter_type =
    (
    ALL,
      CURRENT,
        OPERATIONAL,
          ASSOCIATE,
          REGULAR,
          LIFE,
          TENURED,
          SPECIAL,
        RECRUIT,
        ADMIN,
      PAST,
        LOST_INTEREST,
        RESIGNED,
        RETIRED,
        DISABLED,
        EXPELLED,
      DECEASED
    );
  //
  TClass_biz_enrollment = class
  private
    { Private Declarations }
  public
    constructor Create;
  end;

implementation

constructor TClass_biz_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

end.
