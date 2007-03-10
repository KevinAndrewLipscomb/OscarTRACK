unit Class_biz_sections;

interface

type
  TClass_biz_sections = class
  private
    { Private Declarations }
  public
    constructor Create;
    procedure BindDropDownList
      (
      target: system.object;
      selected_description: string = ''
      );
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_biz_sections.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_biz_sections.BindDropDownList
  (
  target: system.object;
  selected_description: string = ''
  );
var
  i: cardinal;
begin
  DropDownList(target).items.Clear;
  if selected_description = system.string.EMPTY then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  for i := 1 to 14 do begin
    DropDownList(target).Items.Add(listitem.Create(i.tostring,i.ToString));
    if i.tostring = selected_description then begin
      DropDownList(target).selectedvalue := i.tostring;
    end;
  end;
end;

end.
