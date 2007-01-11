
unit enrollment_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  borland.data.provider,
  Class_biz1,
  ki,
  ki_web_ui;

const ID = '$Id$';

type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    be_sort_order_ascending: boolean;
    biz1: TClass_biz1;
    tcci_id: cardinal; // tcci = TableCellCollection Index
    tcci_field1: cardinal;
    tcci_field2: cardinal;
    num_datagrid_rows: cardinal;
    sort_order: string;
    END;
  TWebForm_enrollment_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_back_Click(sender: System.Object; e: System.EventArgs);
    procedure DataGrid1_SortCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
    procedure DataGrid1_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid1_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure TWebForm_enrollment_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
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
    DataGrid1: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    Label_member_name: System.Web.UI.WebControls.Label;
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
procedure TWebForm_enrollment_detail.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_back.Click, Self.LinkButton_back_Click);
  Include(Self.DataGrid1.ItemCommand, Self.DataGrid1_ItemCommand);
  Include(Self.DataGrid1.SortCommand, Self.DataGrid1_SortCommand);
  Include(Self.DataGrid1.ItemDataBound, Self.DataGrid1_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_enrollment_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_enrollment_detail.Page_Load(sender: System.Object; e: System.EventArgs);
var
  waypoint_stack: stack;
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
      Title.InnerText := server.HtmlEncode(ConfigurationSettings.AppSettings['application_name']) + ' - enrollment_detail';
      Label_account_descriptor.text := session['_name'].tostring;
      //
      // Initialize implementation-wide vars.
      //
      p.biz1 := TClass_biz1.Create;
      p.be_sort_order_ascending := TRUE;
      p.tcci_id := 1;
      p.tcci_field1 := 2;
      p.tcci_field2 := 3;
      p.num_datagrid_rows := 0;
      p.sort_order := 'field1';
      //
      {$REGION 'Keep this block iff the user lands on this form immediately after login.'}
      session.Remove('waypoint_stack');
      waypoint_stack := system.collections.stack.Create;
      waypoint_stack.Push('regional_staffer_overview.aspx');
      session.Add('waypoint_stack',waypoint_stack);
      {$ENDREGION}
      //
      Bind;
      //
    end;
  end;
end;

procedure TWebForm_enrollment_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_enrollment_detail.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_enrollment_detail.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_enrollment_detail.TWebForm_enrollment_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_enrollment_detail.DataGrid1_ItemCommand(source: System.Object;
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

procedure TWebForm_enrollment_detail.DataGrid1_ItemDataBound(sender: System.Object;
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
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebForm_enrollment_detail.DataGrid1_SortCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := e.SortExpression;
    p.be_sort_order_ascending := TRUE;
  end;
  DataGrid1.EditItemIndex := -1;
  Bind;
end;

procedure TWebForm_enrollment_detail.LinkButton_back_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer(stack(session['waypoint_stack']).Pop.tostring);
end;

procedure TWebForm_enrollment_detail.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_enrollment_detail.Bind;
begin
  p.biz1.BindTemplateProtectedDatagridSortable(p.sort_order,p.be_sort_order_ascending,DataGrid1);
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  DataGrid1.visible := not p.be_datagrid_empty;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.num_datagrid_rows := 0;
  //
end;

end.

