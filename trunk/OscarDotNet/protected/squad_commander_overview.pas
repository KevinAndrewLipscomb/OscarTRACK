unit squad_commander_overview;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, ki, system.configuration, borland.data.provider,
  system.web.security,
  Class_biz_accounts,
  Class_biz_enrollment,
  Class_biz_leave,
  Class_biz_members,
  Class_biz_user;

type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    be_sort_order_ascending: boolean;
    biz_accounts: TClass_biz_accounts;
    biz_user: TClass_biz_user;
    biz_members: TClass_biz_members;
    enrollment_filter: Class_biz_enrollment.filter_type;
    leave_filter: Class_biz_leave.filter_type;
    num_shifts: cardinal;
    num_datagrid_rows: cardinal;
    sort_order: string;
    END;
  TWebForm_squad_commander_overview = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure LinkButton_logout_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_password_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_change_email_address_Click(sender: System.Object; e: System.EventArgs);
    procedure DataGrid_roster_SortCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
    procedure DataGrid_roster_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_roster_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure TWebForm_squad_commander_overview_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure LinkButton_add_member_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_precontent: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_postcontent: System.Web.UI.WebControls.PlaceHolder;
    Label_agency_name: System.Web.UI.WebControls.Label;
    LinkButton_logout: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_password: System.Web.UI.WebControls.LinkButton;
    LinkButton_change_email_address: System.Web.UI.WebControls.LinkButton;
    Label_leave_filter: System.Web.UI.WebControls.Label;
    DataGrid_roster: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    DropDownList_leave_filter: System.Web.UI.WebControls.DropDownList;
    DropDownList_enrollment_filter: System.Web.UI.WebControls.DropDownList;
    Label_num_rows: System.Web.UI.WebControls.Label;
    RadioButtonList_which_month: System.Web.UI.WebControls.RadioButtonList;
    LinkButton_add_member: System.Web.UI.WebControls.LinkButton;
    Label_num_crew_shifts: System.Web.UI.WebControls.Label;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_db_members;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_squad_commander_overview.InitializeComponent;
begin
  Include(Self.LinkButton_logout.Click, Self.LinkButton_logout_Click);
  Include(Self.LinkButton_change_password.Click, Self.LinkButton_change_password_Click);
  Include(Self.LinkButton_change_email_address.Click, Self.LinkButton_change_email_address_Click);
  Include(Self.LinkButton_add_member.Click, Self.LinkButton_add_member_Click);
  Include(Self.DropDownList_enrollment_filter.SelectedIndexChanged, Self.DropDownList_enrollment_filter_SelectedIndexChanged);
  Include(Self.DropDownList_leave_filter.SelectedIndexChanged, Self.DropDownList_leave_filter_SelectedIndexChanged);
  Include(Self.RadioButtonList_which_month.SelectedIndexChanged, Self.RadioButtonList_which_month_SelectedIndexChanged);
  Include(Self.DataGrid_roster.ItemCommand, Self.DataGrid_roster_ItemCommand);
  Include(Self.DataGrid_roster.SortCommand, Self.DataGrid_roster_SortCommand);
  Include(Self.DataGrid_roster.ItemDataBound, Self.DataGrid_roster_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_squad_commander_overview_PreRender);
end;
{$ENDREGION}

procedure TWebForm_squad_commander_overview.Page_Load(sender: System.Object; e: System.EventArgs);
var
  be_stale_password: boolean;
  squad_commander_user_email_address: string;
  waypoint_stack: stack;
begin
  appcommon.PopulatePlaceHolders(PlaceHolder_precontent,PlaceHolder_postcontent);
  if IsPostback and (session['p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['p']);
  end else begin
    if (session['squad_commander_user_id'] = nil) or (session['squad_commander_name'] = nil) then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - squad_commander_overview';
    //
    p.biz_accounts := TClass_biz_accounts.Create;
    p.biz_user := TClass_biz_user.Create;
    p.biz_members := TClass_biz_members.Create;
    p.be_sort_order_ascending := TRUE;
    p.enrollment_filter := CURRENT;
    p.leave_filter := NONE;
    p.num_shifts := 0;
    p.num_datagrid_rows := 0;
    p.sort_order := 'last_name,first_name,cad_num';
    //
    Label_agency_name.Text := session['squad_commander_name'].ToString;
    //
    p.biz_accounts.Check(p.biz_user.Kind,p.biz_user.IdNum,be_stale_password,squad_commander_user_email_address);
    if not be_stale_password then begin
      //
      // Do meaningful processing...
      session.Remove('waypoint_stack');
      waypoint_stack := system.collections.stack.Create;
      waypoint_stack.Push('squad_commander_overview.aspx');
      session.Add('waypoint_stack',waypoint_stack);
      //
      Bind;
      //
    end else begin
      server.Transfer('change_password.aspx');
    end;
  end;
end;

procedure TWebForm_squad_commander_overview.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_squad_commander_overview.LinkButton_add_member_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('add_member.aspx');
end;

procedure TWebForm_squad_commander_overview.RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  Bind;
end;

procedure TWebForm_squad_commander_overview.DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.leave_filter :=
    Class_biz_leave.filter_type(enum.Parse(system.object(p.leave_filter).GetType,DropDownList_leave_filter.selectedvalue,TRUE));
  Bind;
end;

procedure TWebForm_squad_commander_overview.DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.enrollment_filter := Class_biz_enrollment.filter_type
    (enum.Parse(system.object(p.enrollment_filter).GetType,DropDownList_enrollment_filter.selectedvalue,TRUE));
  case p.enrollment_filter of CURRENT..ADMIN:
    BEGIN
    Label_leave_filter.Enabled := TRUE;
    DropDownList_leave_filter.Enabled := TRUE;
    END;
  else
    BEGIN
    Label_leave_filter.Enabled := FALSE;
    DropDownList_leave_filter.selectedindex := 0;
    DropDownList_leave_filter.Enabled := FALSE;
    p.leave_filter := NONE;
    END;
  end;
  Bind;
end;

procedure TWebForm_squad_commander_overview.TWebForm_squad_commander_overview_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('p');
  session.Add('p',p);
end;

procedure TWebForm_squad_commander_overview.LinkButton_change_email_address_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_email_address.aspx');
end;

procedure TWebForm_squad_commander_overview.LinkButton_change_password_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('change_password.aspx');
end;

procedure TWebForm_squad_commander_overview.DataGrid_roster_ItemCommand(source: System.Object;
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
    session.Remove('e_item');
    session.Add('e_item',e.item);
    system.collections.stack(session['waypoint_stack']).Push('squad_commander_overview.aspx');
    server.Transfer('member_detail.aspx');
    //
  end;
end;

procedure TWebForm_squad_commander_overview.DataGrid_roster_ItemDataBound(sender: System.Object;
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
    if e.item.cells[Class_db_members.TCCI_CAD_NUM].text = '&nbsp;' then begin
      e.item.cells[Class_db_members.TCCI_CAD_NUM].text := NOT_APPLICABLE_INDICATION_HTML;
    end;
    //
    if e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text <> '&nbsp;' then begin
      p.num_shifts := p.num_shifts + uint32.Parse(e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text);
    end;
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebForm_squad_commander_overview.DataGrid_roster_SortCommand(source: System.Object;
  e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
begin
  if e.SortExpression = p.sort_order then begin
    p.be_sort_order_ascending := not p.be_sort_order_ascending;
  end else begin
    p.sort_order := Safe(e.SortExpression,KI_SORT_EXPRESSION);
    p.be_sort_order_ascending := TRUE;
  end;
  DataGrid_roster.EditItemIndex := -1;
  Bind;
end;

procedure TWebForm_squad_commander_overview.LinkButton_logout_Click(sender: System.Object;
  e: System.EventArgs);
begin
  formsauthentication.SignOut;
  session.Clear;
  server.Transfer('../Default.aspx');
end;

procedure TWebForm_squad_commander_overview.Bind;
begin
  p.biz_members.BindSquadCommanderOverview
    (
    session['squad_commander_user_id'].tostring,
    p.sort_order,
    p.be_sort_order_ascending,
    DataGrid_roster,
    RadioButtonList_which_month.selectedvalue,
    p.enrollment_filter,
    p.leave_filter
    );
  Label_num_crew_shifts.text := decimal(p.num_shifts/2).tostring;
  Label_num_rows.text := p.num_datagrid_rows.tostring;
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  DataGrid_roster.visible := not p.be_datagrid_empty;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.num_shifts := 0;
  p.num_datagrid_rows := 0;
  //
end;

end.

