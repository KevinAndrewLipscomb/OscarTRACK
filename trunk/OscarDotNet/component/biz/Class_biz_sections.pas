unit Class_biz_sections;

interface

type
  filter_type = 0..14;
  TClass_biz_sections = class
  private
    { Private Declarations }
  public
    constructor Create;
    procedure BindListControl
      (
      target: system.object;
      selected_description: string = ''
      );
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_biz_sections.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_biz_sections.BindListControl
  (
  target: system.object;
  selected_description: string = ''
  );
var
  i: cardinal;
begin
  DropDownList(target).items.Clear;
  if selected_description = EMPTY then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  DropDownList(target).Items.Add(listitem.Create('*','0'));
  for i := 1 to 14 do begin
    DropDownList(target).Items.Add(listitem.Create(i.tostring,i.ToString));
    if i.tostring = selected_description then begin
      DropDownList(target).selectedvalue := i.tostring;
    end;
  end;
end;

end.
