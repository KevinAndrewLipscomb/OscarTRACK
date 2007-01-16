
unit grant_leave;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  Class_biz_leaves,
  Class_biz_members,
  ki_web_ui;

const ID = '$Id$';

type
  p_type =
    RECORD
    biz_leaves: TClass_biz_leaves;
    biz_members: TClass_biz_members;
    END;
  TWebForm_grant_leave = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure TWebForm_grant_leave_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_back_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_end_month_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
  {$ENDREGION}
  //
  // Expected session objects:
  //
  //   waypoint_stack: system.collections.stack;
  //
  //
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    Label_account_descriptor: System.Web.UI.WebControls.Label;
    LinkButton_back: System.Web.UI.WebControls.LinkButton;
    LinkButton_drill_down: System.Web.UI.WebControls.LinkButton;
    Label_member_designator: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    DropDownList_kind_of_leave: System.Web.UI.WebControls.DropDownList;
    DropDownList_num_obligated_shifts: System.Web.UI.WebControls.DropDownList;
    TextBox_note: System.Web.UI.WebControls.TextBox;
    DropDownList_start_month: System.Web.UI.WebControls.DropDownList;
    DropDownList_end_month: System.Web.UI.WebControls.DropDownList;
    CustomValidator_end_month: System.Web.UI.WebControls.CustomValidator;
    RequiredFieldValidator_start_month: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_end_month: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_kind_of_leave: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_num_obligated_shifts: System.Web.UI.WebControls.RequiredFieldValidator;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_grant_leave.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_back.Click, Self.LinkButton_back_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.CustomValidator_end_month.ServerValidate, Self.CustomValidator_end_month_ServerValidate);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_grant_leave_PreRender);
end;
{$ENDREGION}

procedure TWebForm_grant_leave.Page_Load(sender: System.Object; e: System.EventArgs);
var
  cad_num_string: string;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - grant_leave';
      Label_account_descriptor.text := session.item['squad_commander_name'].tostring;
      //
      p.biz_leaves := TClass_biz_leaves.Create;
      p.biz_members := TClass_biz_members.Create;
      //
      cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if cad_num_string = system.string.EMPTY then begin
        cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      Label_member_designator.Text := p.biz_members.FirstNameOf(session['e_item'])
        + ' '
        + p.biz_members.LastNameOf(session['e_item'])
        + ' (CAD # '
        + cad_num_string
        + ')';
      //
      p.biz_leaves.BindStartMonthDropDownList(DropDownList_start_month);
      p.biz_leaves.BindEndMonthDropDownList(DropDownList_end_month);
      p.biz_leaves.BindKindDropDownList(DropDownList_kind_of_leave);
      p.biz_leaves.BindNumObligatedShiftsDropDownList
        (p.biz_members.EnrollmentOf(session['e_item']),DropDownList_num_obligated_shifts);
      //
    end;
  end;
end;

procedure TWebForm_grant_leave.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_grant_leave.CustomValidator_end_month_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := p.biz_leaves.BeValid(DropDownList_start_month.selectedvalue,args.value);
end;

//{$REGION 'Waypoint management code for drill-down server.Transfer calls.'}
//procedure TWebForm_grant_leave.LinkButton_drill_down_Click(sender: System.Object;
//  e: System.EventArgs);
//begin
//  system.collections.stack(session['waypoint_stack']).Push('grant_leave.aspx');
//  server.Transfer('detail.aspx');
//end;
//{$ENDREGION}

procedure TWebForm_grant_leave.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_grant_leave.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_grant_leave.LinkButton_back_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_grant_leave.TWebForm_grant_leave_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_grant_leave.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

end.

