unit UserControl_role_holders_per_agency;

interface

uses
  Class_biz_agencies,
  Class_biz_role_member_map,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    agency_id: string;
    be_interactive: boolean;
    be_loaded: boolean;
    biz_agencies: TClass_biz_agencies;
    biz_role_member_map: TClass_biz_role_member_map;
    END;
  TWebUserControl_role_holders_per_agency = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_role_holders_per_agency_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    GridView_role_holders: System.Web.UI.WebControls.GridView;
    GridView_unassigned_roles: System.Web.UI.WebControls.GridView;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_role_holders_per_agency;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_role_holders_per_agency.InjectPersistentClientSideScript;
begin
{$REGION 'Persistent client-side script'}
//  EstablishClientSideFunction(EL);
//  EstablishClientSideFunction(KGS_TO_LBS);
//  EstablishClientSideFunction(LBS_TO_KGS);
//  EstablishClientSideFunction
//    (
//    'RecalculateDependentValues()',
//    EMPTY
//    + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
//    + NEW_LINE
//    + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
//    +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
//    + NEW_LINE
//    + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
//    +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
//    );
//  //
//  TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
//  TextBox_gross_landed_weight_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_gross_landed_weight_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_pounds.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
//  TextBox_net_landed_in_kgs.attributes.Add
//    (
//    'onkeyup',
//    'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
//    + ' RecalculateDependentValues();'
//    );
{$ENDREGION}
end;

procedure TWebUserControl_role_holders_per_agency.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Bind;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_role_holders_per_agency.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_role_holders_per_agency.p'] <> nil then begin
    p := p_type(session['UserControl_role_holders_per_agency.p']);
    p.be_loaded := IsPostBack and (string(session['parent_PlaceHolder_content']) = 'UserControl_role_holders_per_agency');
  end else begin
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    p.biz_role_member_map := TClass_biz_role_member_map.Create;
    //
    p.agency_id := p.biz_agencies.IdOfShortDesignator(session['agency_short_designator'].tostring);
    p.be_interactive := not assigned(session['mode:report']);
    p.be_loaded := FALSE;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_role_holders_per_agency.InitializeComponent;
begin
  Include(Self.PreRender, Self.TWebUserControl_role_holders_per_agency_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_role_holders_per_agency.TWebUserControl_role_holders_per_agency_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_role_holders_per_agency.p',p);
end;

function TWebUserControl_role_holders_per_agency.Fresh: TWebUserControl_role_holders_per_agency;
begin
  session.Remove('UserControl_role_holders_per_agency.p');
  Fresh := self;
end;

procedure TWebUserControl_role_holders_per_agency.Bind;
begin
  p.biz_role_member_map.BindHoldersPerAgency(p.agency_id,GridView_role_holders);
  p.biz_role_member_map.BindUnassignedPerAgency(p.agency_id,GridView_unassigned_roles);
end;

end.
