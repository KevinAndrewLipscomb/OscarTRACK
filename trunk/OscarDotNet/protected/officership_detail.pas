
unit officership_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  borland.data.provider,
  Class_biz_members,
  Class_biz_officerships,
  ki,
  ki_web_ui,
  UserControl_print_div;

type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    biz_members: TClass_biz_members;
    biz_officerships: TClass_biz_officerships;
    num_datagrid_rows: cardinal;
    END;
  TWebForm_officership_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_back_Click(sender: System.Object; e: System.EventArgs);
    procedure DataGrid_officerships_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_officerships_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure TWebForm_officership_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
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
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    Label_member_designator: System.Web.UI.WebControls.Label;
    DataGrid_officerships: System.Web.UI.WebControls.DataGrid;
    UserControl_print_div: TWebUserControl_print_div;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_db_officerships;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_officership_detail.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_back.Click, Self.LinkButton_back_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.DataGrid_officerships.ItemCommand, Self.DataGrid_officerships_ItemCommand);
  Include(Self.DataGrid_officerships.ItemDataBound, Self.DataGrid_officerships_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_officership_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_officership_detail.Page_Load(sender: System.Object; e: System.EventArgs);
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
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - officership_detail';
      HtmlInputButton(UserControl_print_div.controls[0]).value := 'Print form body';
      Label_account_descriptor.text := session['squad_commander_name'].tostring;
      //
      // Initialize implementation-wide vars.
      //
      p.biz_members := TClass_biz_members.Create;
      p.biz_officerships := TClass_biz_officerships.Create;
      p.num_datagrid_rows := 0;
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
      Bind;
      //
    end;
  end;
end;

procedure TWebForm_officership_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_officership_detail.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_officership_detail.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_officership_detail.TWebForm_officership_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_officership_detail.DataGrid_officerships_ItemCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridCommandEventArgs);
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    if e.commandname = 'Select' then begin
      system.collections.stack(session['waypoint_stack']).Push('emsof_request_status_filter.aspx');
      server.Transfer('full_request_review_approve.aspx');
    end;
    //
  end;
end;

procedure TWebForm_officership_detail.DataGrid_officerships_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    if e.item.cells[Class_db_officerships.TCCI_END_DATE].text = '&nbsp;' then begin
      e.item.cells[Class_db_officerships.TCCI_END_DATE].text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebForm_officership_detail.LinkButton_back_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_officership_detail.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_officership_detail.Bind;
begin
  p.biz_officerships.Bind(p.biz_members.IdOf(session['e_item']),DataGrid_officerships);
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  DataGrid_officerships.visible := not p.be_datagrid_empty;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.num_datagrid_rows := 0;
  //
end;

end.

