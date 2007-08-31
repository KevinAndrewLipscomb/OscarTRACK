unit UserControl_agency;

interface

uses
  Class_biz_agencies,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  p_type =
    RECORD
    be_loaded: boolean;
    biz_agencies: TClass_biz_agencies;
    END;
  TWebUserControl_agency = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_agency_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_search_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_short_designator_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Clear;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(short_designator: string): boolean;
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    LinkButton_search: System.Web.UI.WebControls.LinkButton;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_short_designator: System.Web.UI.WebControls.TextBox;
    DropDownList_short_designator: System.Web.UI.WebControls.DropDownList;
    TextBox_medium_designator: System.Web.UI.WebControls.TextBox;
    TextBox_long_designator: System.Web.UI.WebControls.TextBox;
    CheckBox_be_active: System.Web.UI.WebControls.CheckBox;
    RequiredFieldValidator_short_designator: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_medium_designator: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_long_designator: System.Web.UI.WebControls.RequiredFieldValidator;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_agency;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

procedure TWebUserControl_agency.Clear;
begin
  //
  TextBox_short_designator.text := system.string.EMPTY;
  DropDownList_short_designator.visible := FALSE;
  TextBox_medium_designator.text := system.string.EMPTY;
  TextBox_long_designator.text := system.string.EMPTY;
  CheckBox_be_active.checked := FALSE;
  //
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_agency.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_short_designator);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

function TWebUserControl_agency.PresentRecord(short_designator: string): boolean;
var
  medium_designator: string;
  long_designator: string;
  be_active: boolean;
begin
  PresentRecord := FALSE;
  if p.biz_agencies.Get
    (
    short_designator,
    medium_designator,
    long_designator,
    be_active
    )
  then begin
    //
    TextBox_short_designator.text := short_designator;
    TextBox_medium_designator.text := medium_designator;
    TextBox_long_designator.text := long_designator;
    CheckBox_be_active.checked := be_active;
    //
    TextBox_short_designator.enabled := FALSE;
    Button_delete.enabled := TRUE;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_agency.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_agency.p'] <> nil)
    and (session['UserControl_agency.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_agency.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_agency.InitializeComponent;
begin
  Include(Self.LinkButton_search.Click, Self.LinkButton_search_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.DropDownList_short_designator.SelectedIndexChanged, Self.DropDownList_short_designator_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_agency_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_agency.TWebUserControl_agency_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_agency.p');
  session.Add('UserControl_agency.p',p);
end;

function TWebUserControl_agency.Fresh: TWebUserControl_agency;
begin
  session.Remove('UserControl_agency.p');
  Fresh := self;
end;

procedure TWebUserControl_agency.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    //
    //
    p.biz_agencies.&Set
      (
      Safe(TextBox_short_designator.text,NARRATIVE),
      Safe(TextBox_medium_designator.text,NARRATIVE),
      Safe(TextBox_long_designator.text,NARRATIVE),
      CheckBox_be_active.checked
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.');
  end else begin
    ValidationAlert;
  end;
end;

procedure TWebUserControl_agency.DropDownList_short_designator_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  PresentRecord(DropDownList_short_designator.selectedvalue);
end;

procedure TWebUserControl_agency.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_agencies.Delete(Safe(TextBox_short_designator.text,ALPHANUM));
  Clear;
end;

procedure TWebUserControl_agency.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_short_designator.enabled := TRUE;
  Focus(TextBox_short_designator);
end;

procedure TWebUserControl_agency.LinkButton_search_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_short_designator: string;
begin
  saved_short_designator := TextBox_short_designator.text;
  Clear;
  if not PresentRecord(saved_short_designator) then begin
    TextBox_short_designator.text := saved_short_designator;
    p.biz_agencies.Bind(saved_short_designator,DropDownList_short_designator);
    num_matches := DropDownList_short_designator.items.count;
    if num_matches > 0 then begin
      DropDownList_short_designator.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_short_designator.selectedvalue);
      end else begin
        DropDownList_short_designator.items.Insert(0,listitem.Create('-- Select --',system.string.EMPTY));
      end;
    end;
  end;
end;

end.
