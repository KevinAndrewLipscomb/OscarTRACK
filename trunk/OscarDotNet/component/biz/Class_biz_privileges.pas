unit Class_biz_privileges;

interface

uses
  Class_db_privileges,
  kix;

type
  TClass_biz_privileges = class
  private
    db_privileges: TClass_db_privileges;
  public
    constructor Create;
    function Bind
      (
      partial_name: string;
      target: system.object
      )
      : boolean;
    procedure BindDirectToListControl
      (
      target: system.object;
      unselected_literal: string = '-- Privilege --';
      selected_value: string = EMPTY
      );
    function Get
      (
      name: string;
      out soft_hyphenation_text: string
      )
      : boolean;
  end;

implementation

constructor TClass_biz_privileges.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_privileges := TClass_db_privileges.Create;
end;

function TClass_biz_privileges.Bind
  (
  partial_name: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_privileges.Bind(partial_name,target);
end;

procedure TClass_biz_privileges.BindDirectToListControl
  (
  target: system.object;
  unselected_literal: string = '-- Privilege --';
  selected_value: string = EMPTY
  );
begin
  db_privileges.BindDirectToListControl(target,unselected_literal,selected_value);
end;

function TClass_biz_privileges.Get
  (
  name: string;
  out soft_hyphenation_text: string
  )
  : boolean;
begin
  //
  Get := db_privileges.Get
    (
    name,
    soft_hyphenation_text
    );
  //
end;

end.
