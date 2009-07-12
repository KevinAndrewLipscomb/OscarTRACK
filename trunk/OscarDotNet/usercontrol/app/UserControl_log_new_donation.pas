unit UserControl_log_new_donation;
  // Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~std.pas

interface

uses
  Class_biz_residents,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_log_new_donation = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_log_new_donation_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_reset_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_rod_num_ServerValidate(source: System.Object; args: System.Web.UI.WebControls.ServerValidateEventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        biz_residents: TClass_biz_residents;
        END;
  strict private
    p: p_type;
    procedure Clear;
    procedure InjectPersistentClientSideScript;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TextBox_rod_num: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_rod_num: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_rod_num: System.Web.UI.WebControls.RegularExpressionValidator;
    TextBox_amount: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_amount: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_amount: System.Web.UI.WebControls.RegularExpressionValidator;
    TextBox_in_memory_of: System.Web.UI.WebControls.TextBox;
    DropDownList_prospectivity: System.Web.UI.WebControls.DropDownList;
    DropDownList_method: System.Web.UI.WebControls.DropDownList;
    TextBox_note: System.Web.UI.WebControls.TextBox;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_reset: System.Web.UI.WebControls.Button;
    CustomValidator_rod_num: System.Web.UI.WebControls.CustomValidator;
    Label_succeeded: System.Web.UI.WebControls.Label;
    Button_undo: System.Web.UI.WebControls.Button;
    Label_previous_rod_num: System.Web.UI.WebControls.Label;
    Label_previous_lookup_data: System.Web.UI.WebControls.Label;
    Label_previous_priors_data: System.Web.UI.WebControls.Label;
    Panel_previous_priors: System.Web.UI.WebControls.Panel;
    Label_previous_amount: System.Web.UI.WebControls.Label;
    Label_previous_prospectivity: System.Web.UI.WebControls.Label;
    Label_previous_method: System.Web.UI.WebControls.Label;
    Label_previous_in_memory_of: System.Web.UI.WebControls.Label;
    Label_previous_note: System.Web.UI.WebControls.Label;
    Panel_previous_none: System.Web.UI.WebControls.Panel;
    Panel_previous_data: System.Web.UI.WebControls.Panel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_log_new_donation;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_log_new_donation.Clear;
begin
  TextBox_rod_num.text := EMPTY;
  TextBox_amount.text := EMPTY;
  TextBox_in_memory_of.text := EMPTY;
  DropDownList_prospectivity.ClearSelection;
  DropDownList_method.ClearSelection;
  TextBox_note.text := EMPTY;
end;

procedure TWebUserControl_log_new_donation.InjectPersistentClientSideScript;
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

procedure TWebUserControl_log_new_donation.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    //
    p.be_loaded := TRUE;
    //
  end;
  //
  InjectPersistentClientSideScript;
  //
end;

procedure TWebUserControl_log_new_donation.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_log_new_donation.p'] <> nil then begin
    p := p_type(session['UserControl_log_new_donation.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_UserControl_funddrive_binder_PlaceHolder_content']) = 'UserControl_log_new_donation');
  end else begin
    //
    p.biz_residents := TClass_biz_residents.Create;
    //
    p.be_loaded := FALSE;
    //
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_log_new_donation.InitializeComponent;
begin
  Include(Self.CustomValidator_rod_num.ServerValidate, Self.CustomValidator_rod_num_ServerValidate);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_reset.Click, Self.Button_reset_Click);
  Include(Self.PreRender, Self.TWebUserControl_log_new_donation_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_log_new_donation.TWebUserControl_log_new_donation_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_log_new_donation.p',p);
end;

function TWebUserControl_log_new_donation.Fresh: TWebUserControl_log_new_donation;
begin
  session.Remove('UserControl_log_new_donation.p');
  Fresh := self;
end;

procedure TWebUserControl_log_new_donation.CustomValidator_rod_num_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := p.biz_residents.BeExtantId(Safe(TextBox_rod_num.text,NUM));
end;

procedure TWebUserControl_log_new_donation.Button_reset_Click(sender: System.Object;
  e: System.EventArgs);
begin
  Clear;
end;

procedure TWebUserControl_log_new_donation.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.IsValid then begin

  end;
end;

end.
