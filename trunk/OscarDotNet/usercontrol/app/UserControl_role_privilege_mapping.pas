unit UserControl_role_privilege_mapping;

interface

uses
  Class_biz_privileges,
  Class_biz_role_privilege_map,
  Class_biz_roles,
  Class_biz_tiers,
  ki_web_ui,
  System.Collections,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    TIER_ID_DEPARTMENT: string;
    TIER_ID_SQUAD: string;
    be_interactive: boolean;
    be_loaded: boolean;
    be_sort_order_ascending: boolean;
    biz_privileges: TClass_biz_privileges;
    biz_role_privilege_map: TClass_biz_role_privilege_map;
    biz_roles: TClass_biz_roles;
    biz_tiers: TClass_biz_tiers;
    may_add_mappings: boolean;
    may_see_all_squads: boolean;
    own_tier: string;
    sort_order: string;
    tier_filter: string;
    END;
  TWebUserControl_role_privilege_mapping = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_role_privilege_mapping_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure GridView_control_Sorting(sender: System.Object; e: System.Web.UI.WebControls.GridViewSortEventArgs);
    procedure DropDownList_tier_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure Button_add_Click(sender: System.Object; e: System.EventArgs);
    procedure GridView_control_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure GridView_control_RowDeleting(sender: System.Object; e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    DropDownList_tier_filter: System.Web.UI.WebControls.DropDownList;
    GridView_control: System.Web.UI.WebControls.GridView;
    Button_add: System.Web.UI.WebControls.Button;
    DropDownList_role: System.Web.UI.WebControls.DropDownList;
    DropDownList_privilege: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_role: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_privilege: System.Web.UI.WebControls.RequiredFieldValidator;
    TableCell_add_mapping: System.Web.UI.HtmlControls.HtmlTableCell;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_role_privilege_mapping;
  end;

implementation

uses
  Class_db_roles,
  Class_db_role_privilege_map,
  kix,
  system.configuration;

const
  CI_UNMAP = 0;
  CI_ROLE_ID = 1;
  CI_ROLE_TIER_ID = 2;
  CI_ROLE_PECKING_ORDER = 3;
  CI_ROLE_NAME = 4;
  CI_PRIVILEGE_NAME = 5;
  CI_PRIVILEGE_ID = 6;
  INITIAL_SORT_ORDER = 'role_pecking_order%,privilege_name';

procedure TWebUserControl_role_privilege_mapping.InjectPersistentClientSideScript;
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

procedure TWebUserControl_role_privilege_mapping.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_tiers.BindListControl(DropDownList_tier_filter,EMPTY,TRUE,'All');
    DropDownList_tier_filter.selectedvalue := p.tier_filter;
    //
    if not p.be_interactive then begin
      GridView_control.allowsorting := FALSE;
    end;
    //
    Bind;
    //
    p.be_loaded := TRUE;
    //
  end else begin
    //
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_role_privilege_mapping.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_role_privilege_mapping.p'] <> nil then begin
    //
    p := p_type(session['UserControl_role_privilege_mapping.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content']) = 'UserControl_role_privilege_mapping');
    //
  end else begin
    //
    p.biz_privileges := TClass_biz_privileges.Create;
    p.biz_role_privilege_map := TClass_biz_role_privilege_map.Create;
    p.biz_roles := TClass_biz_roles.Create;
    p.biz_tiers := TClass_biz_tiers.Create;
    //
    p.TIER_ID_DEPARTMENT := p.biz_tiers.IdOfName('Department');
    p.TIER_ID_SQUAD := p.biz_tiers.IdOfName('Squad');
    //
    p.may_see_all_squads := Has(string_array(session['privilege_array']),'see-all-squads');
    if p.may_see_all_squads then begin
      p.own_tier := p.TIER_ID_DEPARTMENT;
    end else begin
      p.own_tier := p.TIER_ID_SQUAD;
    end;
    //
    p.be_interactive := not assigned(session['mode:report']);
    p.be_loaded := FALSE;
    p.be_sort_order_ascending := TRUE;
    p.may_add_mappings := Has(string_array(session['privilege_array']),'config-roles-and-matrices');
    p.sort_order := INITIAL_SORT_ORDER;
    p.tier_filter := p.own_tier;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_role_privilege_mapping.InitializeComponent;
begin
  Include(Self.DropDownList_tier_filter.SelectedIndexChanged, Self.DropDownList_tier_filter_SelectedIndexChanged);
  Include(Self.GridView_control.Sorting, Self.GridView_control_Sorting);
  Include(Self.GridView_control.RowDataBound, Self.GridView_control_RowDataBound);
  Include(Self.GridView_control.RowDeleting, Self.GridView_control_RowDeleting);
  Include(Self.Button_add.Click, Self.Button_add_Click);
  Include(Self.PreRender, Self.TWebUserControl_role_privilege_mapping_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_role_privilege_mapping.TWebUserControl_role_privilege_mapping_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_role_privilege_mapping.p',p);
end;

function TWebUserControl_role_privilege_mapping.Fresh: TWebUserControl_role_privilege_mapping;
begin
  session.Remove('UserControl_role_privilege_mapping.p');
  Fresh := self;
end;

procedure TWebUserControl_role_privilege_mapping.GridView_control_RowDeleting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewDeleteEventArgs);
begin
  p.biz_role_privilege_map.Save
    (
    Safe(GridView_control.rows[e.rowindex].cells[CI_PRIVILEGE_ID].text,NUM),
    Safe(GridView_control.rows[e.rowindex].cells[CI_ROLE_ID].text,NUM),
    FALSE
    );
  Bind;
end;

procedure TWebUserControl_role_privilege_mapping.GridView_control_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
var
  be_ok_to_delete: boolean;
begin
  if e.row.rowtype <> datacontrolrowtype.EMPTYDATAROW then begin
    be_ok_to_delete := p.be_interactive and Has(string_array(session['privilege_array']),'config-roles-and-matrices');
    if be_ok_to_delete then begin
// Appears to clobber a necessary ASP.NET onclick event.  Should probably use AJAX instead.
//      RequireConfirmation
//        (
//        ImageButton(e.row.cells[CI_UNMAP].controls[0]),
//        'Are you sure you want to unmap the ' + e.row.cells[CI_ROLE_NAME].text + ' role from privilege '
//        + e.row.cells[CI_PRIVILEGE_NAME].text + '?' + NEW_LINE
//        + NEW_LINE
//        + 'Clicking Ok may prevent the privilege from using certain ' + configurationmanager.appsettings['application_name']
//        + ' features and receiving certain privileges and reports.'
//        );
    end else begin
      e.row.cells[CI_UNMAP].enabled := FALSE;
      e.row.cells[CI_UNMAP].text := EMPTY;
    end;
    e.row.cells[CI_ROLE_ID].visible := FALSE;
    e.row.cells[CI_ROLE_TIER_ID].visible := FALSE;
    e.row.cells[CI_ROLE_PECKING_ORDER].visible := FALSE;
    e.row.cells[CI_PRIVILEGE_ID].visible := FALSE;
  end;
end;

procedure TWebUserControl_role_privilege_mapping.Button_add_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_role_privilege_map.Save(Safe(DropDownList_privilege.selectedvalue,NUM),Safe(DropDownList_role.selectedvalue,NUM),TRUE);
  Bind;
end;

procedure TWebUserControl_role_privilege_mapping.DropDownList_tier_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.tier_filter := Safe(DropDownList_tier_filter.selectedvalue,NUM);
  p.sort_order := INITIAL_SORT_ORDER;
  p.be_sort_order_ascending := TRUE;
  Bind;
end;

procedure TWebUserControl_role_privilege_mapping.GridView_control_Sorting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewSortEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := e.SortExpression;
    p.be_sort_order_ascending := TRUE;
  end;
  GridView_control.editindex := -1;
  Bind;
end;

procedure TWebUserControl_role_privilege_mapping.Bind;
var
  tier_limiter: string;
begin
  //
  p.biz_role_privilege_map.BindActuals(p.tier_filter,p.sort_order,p.be_sort_order_ascending,GridView_control);
  //
  TableCell_add_mapping.visible := p.may_add_mappings;
  if TableCell_add_mapping.visible then begin
    //
    if (p.own_tier = p.TIER_ID_DEPARTMENT)
      or (p.tier_filter > p.TIER_ID_SQUAD) // Keep in mind that TIER_ID_SECTION (3) is GREATER than TIER_ID_SQUAD (2).
    then begin
      tier_limiter := p.tier_filter;
    end else begin
      tier_limiter := p.TIER_ID_SQUAD;
    end;
    p.biz_roles.BindDirectToListControl
      (
      DropDownList_role,
      Has(string_array(session['privilege_array']),'config-roles-and-matrices'),
      tier_limiter
      );
    //
    p.biz_privileges.BindDirectToListControl(DropDownList_privilege);
  end;
  //
end;

end.
