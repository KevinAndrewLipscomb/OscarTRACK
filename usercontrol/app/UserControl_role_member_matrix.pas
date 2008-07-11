unit UserControl_role_member_matrix;

interface

uses
  Class_biz_agencies,
  Class_biz_role_member_map,
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
    biz_agencies: TClass_biz_agencies;
    biz_role_member_map: TClass_biz_role_member_map;
    crosstab_metadata_rec_arraylist: arraylist;
    filter: string;
    sort_order: string;
    END;
  TWebUserControl_role_member_matrix = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_role_member_matrix_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_filter_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure GridView_control_Sorting(sender: System.Object; e: System.Web.UI.WebControls.GridViewSortEventArgs);
    procedure GridView_control_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure Changed(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Checkboxify(row: gridviewrow);
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    GridView_control: System.Web.UI.WebControls.GridView;
    DropDownList_filter: System.Web.UI.WebControls.DropDownList;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_role_member_matrix;
  end;

implementation

uses
  Class_db_role_member_map,
  kix,
  system.configuration;

const
  CHECKBOX_ID_PREFIX_MEMBER_ID = 'CheckBox_member_';
  CHECKBOX_ID_PREFIX_ROLE_ID = '_role_';

procedure TWebUserControl_role_member_matrix.Checkboxify(row: gridviewrow);
type
  crosstab_index_type = CI_FIRST_CROSSTAB..MAXINT;
var
  check_box: CheckBox;
  i: crosstab_index_type;
begin
  for i := CI_FIRST_CROSSTAB to (row.cells.count - 1) do begin
    if row.rowtype = datacontrolrowtype.datarow then begin
      row.cells.item[i].horizontalalign := horizontalalign.CENTER;
      check_box := CheckBox.Create;
      check_box.autopostback := TRUE;
      check_box.id := EMPTY
      + CHECKBOX_ID_PREFIX_MEMBER_ID + row.cells.item[CI_MEMBER_ID].text
      + CHECKBOX_ID_PREFIX_ROLE_ID + crosstab_metadata_rec_type(p.crosstab_metadata_rec_arraylist[i - CI_FIRST_CROSSTAB]).id;
      check_box.checked := (row.cells.item[i].text = '1');
      Include(check_box.checkedchanged,Changed);
      row.cells.item[i].controls.Add(check_box);
      if not p.be_interactive then begin
        CheckBox(row.cells.item[i].controls[0]).enabled := FALSE;
      end;
    end;
  end;
end;

procedure TWebUserControl_role_member_matrix.InjectPersistentClientSideScript;
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

procedure TWebUserControl_role_member_matrix.Page_Load(sender: System.Object; e: System.EventArgs);
var
  row_index: cardinal;
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_agencies.BindListControlShortDashLong(DropDownList_filter);
    p.filter := Safe(DropDownList_filter.selectedvalue,NUM);
    //
    if not p.be_interactive then begin
      DropDownList_filter.enabled := FALSE;
      GridView_control.allowsorting := FALSE;
    end;
    //
    Bind;
    //
    p.be_loaded := TRUE;
    //
  end else begin
    //
    // Dynamic controls must be re-added on each postback.
    //
    for row_index := 0 to (GridView_control.rows.count - 1) do begin
      Checkboxify(GridView_control.rows.item[row_index]);
    end;
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_role_member_matrix.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_role_member_matrix.p'] <> nil then begin
    //
    p := p_type(session['UserControl_role_member_matrix.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_PlaceHolder_content']) = 'UserControl_role_member_matrix');
    //
  end else begin
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    p.biz_role_member_map := TClass_biz_role_member_map.Create;
    //
    p.be_interactive := not assigned(session['mode:report']);
    p.be_loaded := FALSE;
    p.be_sort_order_ascending := TRUE;
    p.sort_order := 'member_name%';
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_role_member_matrix.InitializeComponent;
begin
  Include(Self.DropDownList_filter.SelectedIndexChanged, Self.DropDownList_filter_SelectedIndexChanged);
  Include(Self.GridView_control.Sorting, Self.GridView_control_Sorting);
  Include(Self.GridView_control.RowDataBound, Self.GridView_control_RowDataBound);
  Include(Self.PreRender, Self.TWebUserControl_role_member_matrix_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_role_member_matrix.TWebUserControl_role_member_matrix_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_role_member_matrix.p',p);
end;

function TWebUserControl_role_member_matrix.Fresh: TWebUserControl_role_member_matrix;
begin
  session.Remove('UserControl_role_member_matrix.p');
  Fresh := self;
end;

procedure TWebUserControl_role_member_matrix.Changed(sender: System.Object;
  e: System.EventArgs);
const
  TUPLE_INDEX_MEMBER_ID = 0;
  TUPLE_INDEX_ROLE_ID = 1;
var
  check_box: CheckBox;
  tuple: string_array;
begin
  check_box := CheckBox(sender);
  tuple := check_box.id.Split([CHECKBOX_ID_PREFIX_MEMBER_ID,CHECKBOX_ID_PREFIX_ROLE_ID],stringsplitoptions.REMOVEEMPTYENTRIES);
  p.biz_role_member_map.Save(Safe(tuple[TUPLE_INDEX_MEMBER_ID],NUM),Safe(tuple[TUPLE_INDEX_ROLE_ID],NUM),check_box.checked);
end;

procedure TWebUserControl_role_member_matrix.GridView_control_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
begin
  //
  e.row.cells.item[CI_MEMBER_ID].visible := FALSE;
  e.row.cells.item[CI_MEMBER_NAME].wrap := FALSE;
  //
  Checkboxify(e.row);
  //
end;

procedure TWebUserControl_role_member_matrix.GridView_control_Sorting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewSortEventArgs);
begin
  if (e.SortExpression + '%,member_name') = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := e.SortExpression + '%,member_name';
    p.be_sort_order_ascending := TRUE;
  end;
  GridView_control.editindex := -1;
  Bind;
end;

procedure TWebUserControl_role_member_matrix.DropDownList_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.filter := Safe(DropDownList_filter.selectedvalue,NUM);
  Bind;
end;

procedure TWebUserControl_role_member_matrix.Bind;
var
  metadata: crosstab_metadata_rec_type;
  i: cardinal;
begin
  p.biz_role_member_map.Bind(p.filter,p.sort_order,p.be_sort_order_ascending,GridView_control,p.crosstab_metadata_rec_arraylist);
  LinkButton(GridView_control.headerrow.cells.item[1].controls.item[0]).text := 'Member';
  for i := 0 to (p.crosstab_metadata_rec_arraylist.Count - 1) do begin
    metadata := crosstab_metadata_rec_type(p.crosstab_metadata_rec_arraylist[i]);
    LinkButton(GridView_control.headerrow.cells.item[metadata.index].controls.item[0]).text := metadata.soft_hyphenation_text;
    LinkButton(GridView_control.headerrow.cells.item[metadata.index].controls.item[0]).font.bold := FALSE;
    LinkButton(GridView_control.headerrow.cells.item[metadata.index].controls.item[0]).font.size := fontunit.SMALLER;
  end;
end;

end.
