unit UserControl_user_member_mapping;

interface

uses
  Class_biz_members,
  Class_biz_user_member_map,
  Class_biz_users,
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
    be_interactive: boolean;
    be_loaded: boolean;
    be_sort_order_ascending: boolean;
    biz_members: TClass_biz_members;
    biz_user_member_map: TClass_biz_user_member_map;
    biz_users: TClass_biz_users;
    may_add_mappings: boolean;
    sort_order: string;
    END;
  TWebUserControl_user_member_mapping = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_user_member_mapping_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure GridView_control_Sorting(sender: System.Object; e: System.Web.UI.WebControls.GridViewSortEventArgs);
    procedure GridView_control_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    GridView_control: System.Web.UI.WebControls.GridView;
    Button_add: System.Web.UI.WebControls.Button;
    DropDownList_user: System.Web.UI.WebControls.DropDownList;
    DropDownList_member: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_user: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_member: System.Web.UI.WebControls.RequiredFieldValidator;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_user_member_mapping;
  end;

implementation

uses
  Class_db_users,
  Class_db_user_member_map,
  kix,
  system.configuration;

const
  CI_USER_ID = 0;
  CI_USER_NAME = 1;
  CI_MEMBER_NAME = 2;
  CI_MEMBER_ID = 3;
  INITIAL_SORT_ORDER = 'user_name';

procedure TWebUserControl_user_member_mapping.InjectPersistentClientSideScript;
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

procedure TWebUserControl_user_member_mapping.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
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

procedure TWebUserControl_user_member_mapping.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_user_member_mapping.p'] <> nil then begin
    //
    p := p_type(session['UserControl_user_member_mapping.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_users_and_matrices_binder_PlaceHolder_content']) = 'UserControl_user_member_mapping');
    //
  end else begin
    //
    p.biz_members := TClass_biz_members.Create;
    p.biz_user_member_map := TClass_biz_user_member_map.Create;
    p.biz_users := TClass_biz_users.Create;
    //
    p.be_interactive := not assigned(session['mode:report']);
    p.be_loaded := FALSE;
    p.be_sort_order_ascending := TRUE;
    p.may_add_mappings := Has(string_array(session['privilege_array']),'config-users-and-matrices');
    p.sort_order := INITIAL_SORT_ORDER;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_user_member_mapping.InitializeComponent;
begin
  Include(Self.GridView_control.Sorting, Self.GridView_control_Sorting);
  Include(Self.GridView_control.RowDataBound, Self.GridView_control_RowDataBound);
  Include(Self.PreRender, Self.TWebUserControl_user_member_mapping_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_user_member_mapping.TWebUserControl_user_member_mapping_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_user_member_mapping.p',p);
end;

function TWebUserControl_user_member_mapping.Fresh: TWebUserControl_user_member_mapping;
begin
  session.Remove('UserControl_user_member_mapping.p');
  Fresh := self;
end;

procedure TWebUserControl_user_member_mapping.GridView_control_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
begin
  if e.row.rowtype <> datacontrolrowtype.EMPTYDATAROW then begin
    e.row.cells[CI_USER_ID].visible := FALSE;
    e.row.cells[CI_MEMBER_ID].visible := FALSE;
  end;
end;

procedure TWebUserControl_user_member_mapping.GridView_control_Sorting(sender: System.Object;
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

procedure TWebUserControl_user_member_mapping.Bind;
begin
  //
  p.biz_user_member_map.BindActuals(p.sort_order,p.be_sort_order_ascending,GridView_control);
  //
end;

end.
