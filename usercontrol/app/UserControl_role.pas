unit UserControl_role;

interface

uses
  Class_biz_members,
  Class_biz_role_member_map,
  Class_biz_roles,
  Class_biz_tiers,
  Class_biz_user,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_drop_down_date;

type
  TWebUserControl_role = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_role_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_lookup_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_new_record_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_delete_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_name_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_send_Click(sender: System.Object; e: System.EventArgs);
    procedure GridView_holders_RowDataBound(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure GridView_holders_RowCreated(sender: System.Object; e: System.Web.UI.WebControls.GridViewRowEventArgs);
    procedure GridView_holders_Sorting(sender: System.Object; e: System.Web.UI.WebControls.GridViewSortEventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_gridview_empty: boolean;
        be_loaded: boolean;
        be_ok_to_config_roles: boolean;
        be_sort_order_ascending: boolean;
        biz_members: TClass_biz_members;
        biz_role_member_map: TClass_biz_role_member_map;
        biz_roles: TClass_biz_roles;
        biz_tiers: TClass_biz_tiers;
        biz_user: TClass_biz_user;
        distribution_list: string;
        num_gridview_rows: cardinal;
        role_name: string;
        sort_order: string;
        END;
  strict private
    p: p_type;
    procedure BindHolders(role_name: string);
    procedure Clear;
    procedure InjectPersistentClientSideScript;
    procedure SetDependentFieldAblements(ablement: boolean);
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
    function PresentRecord(name: string): boolean;
    procedure SetLookupMode;
  strict protected
    Button_submit: System.Web.UI.WebControls.Button;
    Button_delete: System.Web.UI.WebControls.Button;
    Button_lookup: System.Web.UI.WebControls.Button;
    LinkButton_new_record: System.Web.UI.WebControls.LinkButton;
    Label_lookup_arrow: &label;
    Label_lookup_hint: &label;
    LinkButton_reset: System.Web.UI.WebControls.LinkButton;
    TextBox_name: System.Web.UI.WebControls.TextBox;
    DropDownList_name: System.Web.UI.WebControls.DropDownList;
    TextBox_pecking_order: System.Web.UI.WebControls.TextBox;
    TextBox_soft_hyphenation_text: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_name: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_pecking_order: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_pecking_order: System.Web.UI.WebControls.RegularExpressionValidator;
    RequiredFieldValidator_soft_hyphenation_text: System.Web.UI.WebControls.RequiredFieldValidator;
    GridView_holders: System.Web.UI.WebControls.GridView;
    Label_num_rows: System.Web.UI.WebControls.Label;
    TextBox_quick_message_subject: System.Web.UI.WebControls.TextBox;
    TextBox_quick_message_body: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_quick_message_body: System.Web.UI.WebControls.RequiredFieldValidator;
    Button_send: System.Web.UI.WebControls.Button;
    Table_holders: System.Web.UI.HtmlControls.HtmlTable;
    Table_quick_message: System.Web.UI.HtmlControls.HtmlTable;
    Label_author_email_address: System.Web.UI.WebControls.Label;
    Label_distribution_list: System.Web.UI.WebControls.Label;
    TableRow_pecking_order: System.Web.UI.HtmlControls.HtmlTableRow;
    TableRow_soft_hyphenation_text: System.Web.UI.HtmlControls.HtmlTableRow;
    DropDownList_tier: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_tier: System.Web.UI.WebControls.RequiredFieldValidator;
    Anchor_quick_message_shortcut: System.Web.UI.HtmlControls.HtmlAnchor;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_role;
  end;

implementation

uses
  appcommon,
  Class_db_role_member_map,
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_role.Clear;
begin
  //
  TextBox_name.text := EMPTY;
  DropDownList_name.visible := FALSE;
  DropDownList_tier.ClearSelection;
  TextBox_pecking_order.text := EMPTY;
  TextBox_soft_hyphenation_text.text := EMPTY;
  //
  SetDependentFieldAblements(FALSE);
  Button_submit.enabled := FALSE;
  Button_delete.enabled := FALSE;
  Anchor_quick_message_shortcut.visible := FALSE;
  //
  Table_holders.visible := FALSE;
  Table_quick_message.visible := FALSE;
  //
end;

procedure TWebUserControl_role.InjectPersistentClientSideScript;
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

procedure TWebUserControl_role.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_tiers.BindListControl(DropDownList_tier,EMPTY,FALSE,'Unselected');
    Anchor_quick_message_shortcut.href := page.request.rawurl + '#QuickMessage';
    //
    if not assigned(session['mode:report']) then begin
      Label_author_email_address.text := p.biz_user.EmailAddress;
      if p.be_ok_to_config_roles then begin
        LinkButton_new_record.visible := TRUE;
        TableRow_pecking_order.visible := TRUE;
        TableRow_soft_hyphenation_text.visible := TRUE;
      end;
    end else begin
      TextBox_quick_message_subject.enabled := FALSE;
      TextBox_quick_message_body.enabled := FALSE;
      RequiredFieldValidator_quick_message_body.enabled := FALSE;
      Button_send.enabled := FALSE;
    end;
    //
    RequireConfirmation(Button_delete,'Are you sure you want to delete this record?');
    //
    Focus(TextBox_name,TRUE);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

function TWebUserControl_role.PresentRecord(name: string): boolean;
var
  tier_id: string;
  soft_hyphenation_text: string;
  pecking_order: string;
begin
  PresentRecord := FALSE;
  if p.biz_roles.Get
    (
    name,
    tier_id,
    soft_hyphenation_text,
    pecking_order
    )
  then begin
    //
    TextBox_name.text := name;
    DropDownList_tier.selectedvalue := tier_id;
    TextBox_pecking_order.text := pecking_order;
    TextBox_soft_hyphenation_text.text := soft_hyphenation_text;
    //
    TextBox_name.enabled := FALSE;
    Button_lookup.enabled := FALSE;
    Label_lookup_arrow.enabled := FALSE;
    Label_lookup_hint.enabled := FALSE;
    LinkButton_reset.enabled := TRUE;
    SetDependentFieldAblements(p.be_ok_to_config_roles);
    Button_submit.enabled := p.be_ok_to_config_roles;
    Button_delete.enabled := p.be_ok_to_config_roles;
    //
    BindHolders(name);
    //
    PresentRecord := TRUE;
    //
  end;
end;

procedure TWebUserControl_role.SetLookupMode;
begin
  Clear;
  TextBox_name.enabled := TRUE;
  Button_lookup.enabled := TRUE;
  Label_lookup_arrow.enabled := TRUE;
  Label_lookup_hint.enabled := TRUE;
  LinkButton_reset.enabled := FALSE;
  LinkButton_new_record.enabled := p.be_ok_to_config_roles;
  Focus(TextBox_name,TRUE);
end;

procedure TWebUserControl_role.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_role.p'] <> nil then begin
    p := p_type(session['UserControl_role.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content']) = 'UserControl_role');
  end else begin
    //
    p.be_gridview_empty := TRUE;
    p.be_loaded := FALSE;
    p.be_ok_to_config_roles := Has(string_array(session['privilege_array']),'config-roles-and-matrices');
    p.be_sort_order_ascending := TRUE;
    p.distribution_list := EMPTY;
    p.num_gridview_rows := 0;
    p.role_name := EMPTY;
    p.sort_order := 'member_name%';
    //
    p.biz_members := TClass_biz_members.Create;
    p.biz_role_member_map := TClass_biz_role_member_map.Create;
    p.biz_roles := TClass_biz_roles.Create;
    p.biz_tiers := TClass_biz_tiers.Create;
    p.biz_user := TClass_biz_user.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_role.InitializeComponent;
begin
  Include(Self.Button_lookup.Click, Self.Button_lookup_Click);
  Include(Self.LinkButton_reset.Click, Self.LinkButton_reset_Click);
  Include(Self.LinkButton_new_record.Click, Self.LinkButton_new_record_Click);
  Include(Self.DropDownList_name.SelectedIndexChanged, Self.DropDownList_name_SelectedIndexChanged);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_delete.Click, Self.Button_delete_Click);
  Include(Self.GridView_holders.Sorting, Self.GridView_holders_Sorting);
  Include(Self.GridView_holders.RowDataBound, Self.GridView_holders_RowDataBound);
  Include(Self.GridView_holders.RowCreated, Self.GridView_holders_RowCreated);
  Include(Self.Button_send.Click, Self.Button_send_Click);
  Include(Self.PreRender, Self.TWebUserControl_role_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_role.TWebUserControl_role_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_role.p',p);
end;

function TWebUserControl_role.Fresh: TWebUserControl_role;
begin
  session.Remove('UserControl_role.p');
  Fresh := self;
end;

procedure TWebUserControl_role.GridView_holders_Sorting(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewSortEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := e.SortExpression;
    p.be_sort_order_ascending := TRUE;
  end;
  GridView_holders.editindex := -1;
  BindHolders(p.role_name);
end;

procedure TWebUserControl_role.GridView_holders_RowCreated(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
begin
  e.row.cells[Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].visible := FALSE;
end;

procedure TWebUserControl_role.GridView_holders_RowDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.GridViewRowEventArgs);
begin
  if (e.row.rowtype = datacontrolrowtype.datarow)
    and (e.row.cells[Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].text <> '&nbsp;')
  then begin
    p.distribution_list := p.distribution_list + e.row.cells[Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].text + COMMA_SPACE;
    p.num_gridview_rows := p.num_gridview_rows + 1;
  end;
end;

procedure TWebUserControl_role.Button_send_Click(sender: System.Object; e: System.EventArgs);
begin
  SmtpMailSend
    (
    // from
    configurationmanager.appsettings['sender_email_address'],
    // to
    Label_distribution_list.text,
    // subject
    TextBox_quick_message_subject.text,
    // body
    '-- From ' + p.biz_user.Roles[0] + SPACE + p.biz_members.FirstNameOfMemberId(session['member_id'].tostring) + SPACE
    + p.biz_members.LastNameOfMemberId(session['member_id'].tostring) + ' (' + p.biz_user.EmailAddress + ') [via '
    + configurationmanager.appsettings['application_name'] + ']' + NEW_LINE
    + NEW_LINE
    + TextBox_quick_message_body.text,
    // be_html
    FALSE,
    // cc
    EMPTY,
    // bcc
    p.biz_user.EmailAddress
    );
  TextBox_quick_message_subject.text := EMPTY;
  TextBox_quick_message_body.text := EMPTY;
  Alert(kix.LOGIC,kix.NORMAL,'messagsnt','Message sent',TRUE);
end;

procedure TWebUserControl_role.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin
    //
    //
    p.biz_roles.&Set
      (
      Safe(TextBox_name.text,HUMAN_NAME).trim,
      Safe(DropDownList_tier.selectedvalue,NUM).trim,
      Safe(TextBox_soft_hyphenation_text.text,PUNCTUATED).trim,
      Safe(TextBox_pecking_order.text,NUM).trim
      );
    Alert(USER,SUCCESS,'recsaved','Record saved.',TRUE);
    SetLookupMode;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebUserControl_role.DropDownList_name_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.role_name := Safe(DropDownList_name.selectedvalue,HUMAN_NAME);
  PresentRecord(p.role_name);
end;

procedure TWebUserControl_role.Button_delete_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_roles.Delete(Safe(TextBox_name.text,HUMAN_NAME)) then begin
    SetLookupMode;
  end else begin
    Alert(kix.APPDATA,kix.FAILURE,'dependency',' Cannot delete this record because another record depends on it.',TRUE);
  end;
end;

procedure TWebUserControl_role.LinkButton_new_record_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
  TextBox_name.enabled := p.be_ok_to_config_roles;
  Button_lookup.enabled := FALSE;
  Label_lookup_arrow.enabled := FALSE;
  Label_lookup_hint.enabled := FALSE;
  LinkButton_reset.enabled := TRUE;
  LinkButton_new_record.enabled := FALSE;
  SetDependentFieldAblements(p.be_ok_to_config_roles);
  Button_submit.enabled := p.be_ok_to_config_roles;
  Button_delete.enabled := FALSE;
  Focus(TextBox_name,TRUE);
end;

procedure TWebUserControl_role.LinkButton_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  SetLookupMode;
end;

procedure TWebUserControl_role.SetDependentFieldAblements(ablement: boolean);
begin
  DropDownList_tier.enabled := ablement;
  TextBox_pecking_order.enabled := ablement;
  TextBox_soft_hyphenation_text.enabled := ablement;
end;

procedure TWebUserControl_role.Button_lookup_Click(sender: System.Object;
  e: System.EventArgs);
var
  num_matches: cardinal;
  saved_name: string;
begin
  saved_name := TextBox_name.text;
  Clear;
  if not PresentRecord(saved_name) then begin
    TextBox_name.text := saved_name;
    p.biz_roles.Bind(saved_name,DropDownList_name);
    num_matches := DropDownList_name.items.count;
    if num_matches > 0 then begin
      DropDownList_name.visible := TRUE;
      if num_matches = 1 then begin
        PresentRecord(DropDownList_name.selectedvalue);
      end else begin
        DropDownList_name.items.Insert(0,listitem.Create('-- Select --',EMPTY));
      end;
    end;
  end;
end;

procedure TWebUserControl_role.BindHolders(role_name: string);
var
  be_user_authorized_to_send_quickmessages: boolean;
begin
  //
  p.biz_role_member_map.BindHolders(role_name,GridView_holders,p.sort_order,p.be_sort_order_ascending);
  //
  p.be_gridview_empty := (p.num_gridview_rows = 0);
  Table_holders.visible := not p.be_gridview_empty;
  Label_distribution_list.text := (p.distribution_list + SPACE).TrimEnd([',',' ']);
  Label_num_rows.text := p.num_gridview_rows.tostring;
  //
  be_user_authorized_to_send_quickmessages := Has(string_array(session['privilege_array']),'send-quickmessages')
    and not p.be_gridview_empty;
  Anchor_quick_message_shortcut.visible := be_user_authorized_to_send_quickmessages;
  Table_quick_message.visible := be_user_authorized_to_send_quickmessages;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.distribution_list := EMPTY;
  p.num_gridview_rows := 0;
  //
end;

end.
