unit Class_biz_leaves;

interface

uses
  Class_db_leaves;

type
  TClass_biz_leaves = class
  private
    db_leaves: TClass_db_leaves;
  public
    constructor Create;
    procedure Bind
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
  end;

implementation

constructor TClass_biz_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_leaves := TClass_db_leaves.Create;
end;

procedure TClass_biz_leaves.Bind
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  db_leaves.Bind(member_id,sort_order,be_sort_order_ascending,target);
end;

end.
