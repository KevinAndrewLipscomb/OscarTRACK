unit UserControl_roster;

interface

uses
  Class_biz_enrollment,
  Class_biz_leave,
  Class_biz_medical_release_levels,
  Class_biz_members,
  Class_biz_sections,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;
     
type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    be_sort_order_ascending: boolean;
    biz_sections: TClass_biz_sections;
    biz_medical_release_levels: TClass_biz_medical_release_levels;
    biz_members: TClass_biz_members;
    enrollment_filter: Class_biz_enrollment.filter_type;
    leave_filter: Class_biz_leave.filter_type;
    med_release_level_filter: Class_biz_medical_release_levels.filter_type;
    num_cooked_shifts: cardinal;  // takes into account leaves
    num_datagrid_rows: cardinal;
    num_raw_shifts: cardinal;  // does not take into account leaves
    section_filter: Class_biz_sections.filter_type;
    sort_order: string;
    END;
  TWebUserControl_roster = class(System.Web.UI.UserControl)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_roster_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_roster_SortCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridSortCommandEventArgs);
    procedure DataGrid_roster_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_roster_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_add_member_Click(sender: System.Object; e: System.EventArgs);
    procedure DropDownList_med_release_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
    procedure DropDownList_section_filter_SelectedIndexChanged(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_leave_filter: System.Web.UI.WebControls.Label;
    DataGrid_roster: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    DropDownList_leave_filter: System.Web.UI.WebControls.DropDownList;
    DropDownList_enrollment_filter: System.Web.UI.WebControls.DropDownList;
    Label_num_rows: System.Web.UI.WebControls.Label;
    RadioButtonList_which_month: System.Web.UI.WebControls.RadioButtonList;
    LinkButton_add_member: System.Web.UI.WebControls.LinkButton;
    Label_num_crew_shifts: System.Web.UI.WebControls.Label;
    Label_utilization: System.Web.UI.WebControls.Label;
    Label_utilization_caption: System.Web.UI.WebControls.Label;
    DropDownList_med_release_filter: System.Web.UI.WebControls.DropDownList;
    DropDownList_section_filter: System.Web.UI.WebControls.DropDownList;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  appcommon,
  Class_db_members,
  ki,
  System.Collections;
 
procedure TWebUserControl_roster.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if IsPostback and (session[self.id + '.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session[self.id + '.p']);
  end else begin
    p.biz_medical_release_levels := TClass_biz_medical_release_levels.Create;
    p.biz_members := TClass_biz_members.Create;
    p.biz_sections := TClass_biz_sections.Create;
    p.be_sort_order_ascending := TRUE;
    p.enrollment_filter := CURRENT;
    p.leave_filter := Class_biz_leave.NONE;
    p.med_release_level_filter := ALL;
    p.section_filter := 0;
    p.num_cooked_shifts := 0;
    p.num_datagrid_rows := 0;
    p.num_raw_shifts := 0;
    p.sort_order := 'last_name,first_name,cad_num';
    //
    p.biz_sections.BindDropDownList(DropDownList_section_filter,'0*');
    Bind;
  end;
  //
end;

procedure TWebUserControl_roster.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_roster.InitializeComponent;
begin
  Include(Self.LinkButton_add_member.Click, Self.LinkButton_add_member_Click);
  Include(Self.DropDownList_leave_filter.SelectedIndexChanged, Self.DropDownList_leave_filter_SelectedIndexChanged);
  Include(Self.RadioButtonList_which_month.SelectedIndexChanged, Self.RadioButtonList_which_month_SelectedIndexChanged);
  Include(Self.DataGrid_roster.ItemCommand, Self.DataGrid_roster_ItemCommand);
  Include(Self.DataGrid_roster.SortCommand, Self.DataGrid_roster_SortCommand);
  Include(Self.DataGrid_roster.ItemDataBound, Self.DataGrid_roster_ItemDataBound);
  Include(Self.DropDownList_enrollment_filter.SelectedIndexChanged, Self.DropDownList_enrollment_filter_SelectedIndexChanged);
  Include(Self.DropDownList_med_release_filter.SelectedIndexChanged, Self.DropDownList_med_release_filter_SelectedIndexChanged);
  Include(Self.DropDownList_section_filter.SelectedIndexChanged, Self.DropDownList_section_filter_SelectedIndexChanged);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_roster_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_roster.DropDownList_section_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.section_filter := uint32.Parse(DropDownList_section_filter.selectedvalue);
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_med_release_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.med_release_level_filter := Class_biz_medical_release_levels.filter_type
    (
    enum.Parse(system.object(p.med_release_level_filter).GetType,DropDownList_med_release_filter.selectedvalue,TRUE)
    );
  Bind;
end;

procedure TWebUserControl_roster.LinkButton_add_member_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('add_member.aspx');
end;

procedure TWebUserControl_roster.RadioButtonList_which_month_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_leave_filter_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.leave_filter :=
    Class_biz_leave.filter_type(enum.Parse(system.object(p.leave_filter).GetType,DropDownList_leave_filter.selectedvalue,TRUE));
  Bind;
end;

procedure TWebUserControl_roster.DropDownList_enrollment_filter_SelectedIndexChanged(sender: System.Object;
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
    p.leave_filter := Class_biz_leave.NONE;
    END;
  end;
  Bind;
end;

procedure TWebUserControl_roster.DataGrid_roster_ItemCommand(source: System.Object;
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

procedure TWebUserControl_roster.DataGrid_roster_ItemDataBound(sender: System.Object;
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
    if p.biz_medical_release_levels.BeReleased(e.item.cells[Class_db_members.TCCI_MEDICAL_RELEASE_PECK_CODE].text) then begin
      if e.item.cells[Class_db_members.TCCI_ENROLLMENT_OBLIGATION].text <> '&nbsp;' then begin
        p.num_raw_shifts := p.num_raw_shifts + uint32.Parse(e.item.cells[Class_db_members.TCCI_ENROLLMENT_OBLIGATION].text);
      end;
      if e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text <> '&nbsp;' then begin
        p.num_cooked_shifts := p.num_cooked_shifts + uint32.Parse(e.item.cells[Class_db_members.TCCI_OBLIGED_SHIFTS].text);
      end;
    end;
    p.num_datagrid_rows := p.num_datagrid_rows + 1;
  end;
end;

procedure TWebUserControl_roster.TWebUserControl_roster_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove(self.id + '.p');
  session.Add(self.id + '.p',p);
end;

procedure TWebUserControl_roster.DataGrid_roster_SortCommand(source: System.Object;
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

procedure TWebUserControl_roster.Bind;
var
  be_raw_shifts_nonzero: boolean;
begin
  //
  p.biz_members.BindSquadCommanderOverview
    (
    session['squad_commander_user_id'].tostring,
    p.sort_order,
    p.be_sort_order_ascending,
    DataGrid_roster,
    RadioButtonList_which_month.selectedvalue,
    p.enrollment_filter,
    p.leave_filter,
    p.med_release_level_filter,
    p.section_filter
    );
  //
  be_raw_shifts_nonzero := (p.num_raw_shifts > 0);
  Label_utilization.visible := be_raw_shifts_nonzero;
  Label_utilization_caption.visible := be_raw_shifts_nonzero;
  if be_raw_shifts_nonzero then begin
    Label_utilization.text := decimal(p.num_cooked_shifts/p.num_raw_shifts).tostring('P0');
  end;
  Label_num_crew_shifts.text := decimal(p.num_cooked_shifts/2).tostring;
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
  p.num_cooked_shifts := 0;
  p.num_datagrid_rows := 0;
  p.num_raw_shifts := 0;
  //
end;

end.
