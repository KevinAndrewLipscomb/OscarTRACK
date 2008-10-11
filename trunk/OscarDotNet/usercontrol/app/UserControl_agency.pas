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
  System.Web.UI.HtmlControls;

type
  TWebUserControl_agency = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_agency_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_lookup_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_new_record_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_short_designator_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        be_ok_to_config_agencies: boolean;
        biz_agencies: TClass_biz_agencies;
        END;
  strict private
    p: p_type;
    procedure Clear;
    procedure SetDependentFieldAblements(ablement: boolean);
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(short_designator: string): boolean;
    procedure SetLookupMode;
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    Button_lookup: System.Web.UI.WebControls.Button;
    LinkButton_new_record: System.Web.UI.WebControls.LinkButton;
    Label_lookup_arrow: &label;
    Label_lookup_hint: &label;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_short_designator: System.Web.UI.WebControls.TextBox;
    DropDownList_short_designator: System.Web.UI.WebControls.DropDownList;
    TextBox_medium_designator: System.Web.UI.WebControls.TextBox;
    TextBox_long_designator: System.Web.UI.WebControls.TextBox;
    CheckBox_be_active: System.Web.UI.WebControls.CheckBox;
    RequiredFieldValidator_short_designator: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_medium_designator: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_long_designator: System.Web.UI.WebControls.RequiredFieldValidator;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_agency;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_agency.Clear;
begin
  //
  TextBox_short_designator.text := EMPTY;
  DropDownList_short_designator.visible := FALSE;
  TextBox_medium_designator.text := EMPTY;
  TextBox_long_designator.text := EMPTY;
  CheckBox_be_active.checked := FALSE;
  //
  SetDependentFieldAblements(FALSE);
  Button_submit.enabled := FALSE;
  Button_delete.enabled := FALSE;
  //
end;

procedure TWebUserControl_agency.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
//    LinkButton_new_record.visible := p.be_ok_to_config_agencies;
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_short_designator,TRUE);
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
    Button_lookup.enabled := FALSE;
    Label_lookup_arrow.enabled := FALSE;
    Label_lookup_hint.enabled := FALSE;
    LinkButton_reset.enabled := TRUE;
    SetDependentFieldAblements(p.be_ok_to_config_agencies);
    Button_submit.enabled := p.be_ok_to_config_agencies;
    Button_delete.enabled := p.be_ok_to_config_agencies;
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_agency.SetLookupMode;
begin
  Clear;
  TextBox_short_designator.enabled := TRUE;
  Button_lookup.enabled := TRUE;
  Label_lookup_arrow.enabled := TRUE;
  Label_lookup_hint.enabled := TRUE;
  LinkButton_reset.enabled := FALSE;
  LinkButton_new_record.enabled := p.be_ok_to_config_agencies;
  Focus(TextBox_short_designator,TRUE);
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
    p.be_ok_to_config_agencies := Has(string_array(session['privilege_array']),'config-agencies');
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
  Include(Self.Button_lookup.Click, Self.Button_lookup_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.LinkButton_new_record.Click, Self.LinkButton_new_record_Click);
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
  SessionSet('UserControl_agency.p',p);
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
      Safe(TextBox_short_designator.text,PUNCTUATED),
      Safe(TextBox_medium_designator.text,PUNCTUATED),
      Safe(TextBox_long_designator.text,PUNCTUATED),
      CheckBox_be_active.checked
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
    SetLookupMode;
  end else begin
    ValidationAlert(TRUE);
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
  SetLookupMode;
end;

procedure TWebUserControl_agency.LinkButton_new_record_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_short_designator.enabled := Has(string_array(session['privilege_array']),'config-agencies');
  Button_lookup.enabled := FALSE;
  Label_lookup_arrow.enabled := FALSE;
  Label_lookup_hint.enabled := FALSE;
  LinkButton_reset.enabled := TRUE;
  LinkButton_new_record.enabled := FALSE;
  SetDependentFieldAblements(p.be_ok_to_config_agencies);
  Button_submit.enabled := p.be_ok_to_config_agencies;
  Button_delete.enabled := FALSE;
  Focus(TextBox_short_designator,TRUE);
end;

procedure TWebUserControl_agency.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SetLookupMode;
end;

procedure TWebUserControl_agency.SetDependentFieldAblements(ablement: boolean);
begin
  TextBox_medium_designator.enabled := ablement;
  TextBox_long_designator.enabled := ablement;
  CheckBox_be_active.enabled := ablement;
end;

procedure TWebUserControl_agency.Button_lookup_Click(sender: System.Object;
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
        DropDownList_short_designator.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

end.
