
unit leave_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  mysql.data.mysqlclient,
  Class_biz_leaves,
  Class_biz_members,
  Class_biz_user,
  kix,
  ki_web_ui,
  UserControl_print_div;

type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    be_sort_order_ascending: boolean;
    be_user_privileged_to_grant_leave: boolean;
    biz_leaves: TClass_biz_leaves;
    biz_members: TClass_biz_members;
    biz_user: TClass_biz_user;
    cad_num_string: string;
    num_datagrid_rows: cardinal;
    sort_order: string;
    END;
  TWebForm_leave_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure DataGrid_leaves_SortCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
    procedure DataGrid_leaves_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure TWebForm_leave_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_new_Click(sender: System.Object; e: System.EventArgs);
    procedure DataGrid_leaves_DeleteCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure DataGrid_leaves_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    DataGrid_leaves: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    Label_member_designator: System.Web.UI.WebControls.Label;
    LinkButton_new: System.Web.UI.WebControls.LinkButton;
    UserControl_print_div: TWebUserControl_print_div;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_db_leaves;

const
  TCCI_EDIT = 6;
  TCCI_DELETE = 7;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_leave_detail.InitializeComponent;
begin
  Include(Self.LinkButton_new.Click, Self.LinkButton_new_Click);
  Include(Self.DataGrid_leaves.ItemCommand, Self.DataGrid_leaves_ItemCommand);
  Include(Self.DataGrid_leaves.SortCommand, Self.DataGrid_leaves_SortCommand);
  Include(Self.DataGrid_leaves.DeleteCommand, Self.DataGrid_leaves_DeleteCommand);
  Include(Self.DataGrid_leaves.ItemDataBound, Self.DataGrid_leaves_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_leave_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_leave_detail.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - leave_detail';
    //
    Label_member_designator.Text := p.biz_members.FirstNameOf(session['e_item'])
      + SPACE
      + p.biz_members.LastNameOf(session['e_item'])
      + ' (CAD # '
      + p.cad_num_string
      + ')';
    LinkButton_new.visible := p.be_user_privileged_to_grant_leave;
    //
    Bind;
    //
  end;
end;

procedure TWebForm_leave_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback then begin
    if assigned(session['p']) then begin
      p := p_type(session['p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      p.biz_leaves := TClass_biz_leaves.Create;
      p.biz_members := TClass_biz_members.Create;
      p.biz_user := TClass_biz_user.Create;
      //
      p.be_sort_order_ascending := FALSE;
      p.be_user_privileged_to_grant_leave := Has(string_array(session['privilege_array']),'grant-leave')
        and p.biz_members.BeAuthorizedTierOrSameAgency(p.biz_members.IdOfUserId(p.biz_user.IdNum),p.biz_members.IdOf(session['e_item']));
      p.num_datagrid_rows := 0;
      p.sort_order := 'start_date%';
      //
      p.cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if p.cad_num_string = EMPTY then begin
        p.cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      //
    end;
  end;
end;

procedure TWebForm_leave_detail.DataGrid_leaves_ItemCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridCommandEventArgs);
begin
  if e.commandname = 'Select' then begin
    SessionSet('leave_item',e.item);
    stack(session['waypoint_stack']).Push('leave_detail.aspx');
    server.Transfer('change_leave.aspx');
  end;
end;

procedure TWebForm_leave_detail.DataGrid_leaves_DeleteCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridCommandEventArgs);
begin
  p.biz_leaves.Delete(Safe(e.Item.Cells[p.biz_leaves.TcciOfId].Text,NUM));
  DataGrid_leaves.EditItemIndex := -1;
  Bind;
end;

procedure TWebForm_leave_detail.LinkButton_new_Click(sender: System.Object; e: System.EventArgs);
begin
  DropCrumbAndTransferTo('grant_leave.aspx');
end;

procedure TWebForm_leave_detail.TWebForm_leave_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('p',p);
end;

procedure TWebForm_leave_detail.DataGrid_leaves_ItemDataBound(sender: System.Object;
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
    case p.biz_leaves.RelativityOf
      (
      e.item.cells[Class_db_leaves.TCCI_START_DATE].text,
      e.item.cells[Class_db_leaves.TCCI_END_DATE].text
      )
    of
    PAST:
      BEGIN
      LinkButton(e.item.cells[TCCI_DELETE].controls.item[0]).visible := FALSE;
      LinkButton(e.item.cells[TCCI_EDIT].controls.item[0]).visible := FALSE;
      END;
    ESTABLISHED:
      BEGIN
      LinkButton(e.item.cells[TCCI_DELETE].controls.item[0]).visible := FALSE;
      LinkButton(e.item.cells[TCCI_EDIT].controls.item[0]).text :=
        ExpandTildePath(LinkButton(e.item.cells[TCCI_EDIT].controls.item[0]).text);
      END;
    FORMATIVE,
    FUTURE:
      BEGIN
      LinkButton(e.item.cells[TCCI_DELETE].controls.item[0]).text :=
        ExpandTildePath(LinkButton(e.item.cells[TCCI_DELETE].controls.item[0]).text);
      RequireConfirmation
        (
        LinkButton(e.item.cells[TCCI_DELETE].controls.item[0]),
        'Are you sure you want to delete this leave-of-absence?'
        );
      LinkButton(e.item.cells[TCCI_EDIT].controls.item[0]).text :=
        ExpandTildePath(LinkButton(e.item.cells[TCCI_EDIT].controls.item[0]).text);
      END;
    end;
    //
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebForm_leave_detail.DataGrid_leaves_SortCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := Safe(e.SortExpression,KI_SORT_EXPRESSION);
    p.be_sort_order_ascending := TRUE;
  end;
  DataGrid_leaves.EditItemIndex := -1;
  Bind;
end;

procedure TWebForm_leave_detail.Bind;
begin
  //
  DataGrid_leaves.columns[TCCI_EDIT].visible := p.be_user_privileged_to_grant_leave;
  DataGrid_leaves.columns[TCCI_DELETE].visible := p.be_user_privileged_to_grant_leave;
  //
  p.biz_leaves.BindMemberRecords(p.biz_members.IdOf(session['e_item']),p.sort_order,p.be_sort_order_ascending,DataGrid_leaves);
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  DataGrid_leaves.visible := not p.be_datagrid_empty;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.num_datagrid_rows := 0;
  //
end;

end.

