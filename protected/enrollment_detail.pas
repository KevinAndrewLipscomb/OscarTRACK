
unit enrollment_detail;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  mysql.data.mysqlclient,
  Class_biz_enrollment,
  Class_biz_members,
  Class_biz_user,
  kix,
  ki_web_ui,
  UserControl_print_div;

type
  p_type =
    RECORD
    be_datagrid_empty: boolean;
    biz_enrollment: TClass_biz_enrollment;
    biz_members: TClass_biz_members;
    biz_user: TClass_biz_user;
    cad_num_string: string;
    num_datagrid_rows: cardinal;
    END;
  TWebForm_enrollment_detail = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure DataGrid_member_history_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_member_history_ItemCommand(source: System.Object; e: System.Web.UI.WebControls.DataGridCommandEventArgs);
    procedure TWebForm_enrollment_detail_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure LinkButton_add_new_enrollment_status_Click(sender: System.Object; 
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Bind;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlTitle;
    DataGrid_member_history: System.Web.UI.WebControls.DataGrid;
    TableRow_none: System.Web.UI.HtmlControls.HtmlTableRow;
    Label_member_designator: System.Web.UI.WebControls.Label;
    LinkButton_add_new_enrollment_status: System.Web.UI.WebControls.LinkButton;
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
  appcommon;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_enrollment_detail.InitializeComponent;
begin
  Include(Self.LinkButton_add_new_enrollment_status.Click, Self.LinkButton_add_new_enrollment_status_Click);
  Include(Self.DataGrid_member_history.ItemCommand, Self.DataGrid_member_history_ItemCommand);
  Include(Self.DataGrid_member_history.ItemDataBound, Self.DataGrid_member_history_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_enrollment_detail_PreRender);
end;
{$ENDREGION}

procedure TWebForm_enrollment_detail.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.text := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - enrollment_detail';
    Label_member_designator.Text := p.biz_members.FirstNameOf(session['e_item'])
      + SPACE
      + p.biz_members.LastNameOf(session['e_item'])
      + ' (CAD # '
      + p.cad_num_string
      + ')';
    LinkButton_add_new_enrollment_status.visible := p.biz_members.BeUserAuthorizedToEditEnrollments
      (
      p.biz_members.IdOfUserId(p.biz_user.IdNum),
      session['e_item'],
      Has(string_array(session['privilege_array']),'edit-enrollments'),
      Has(string_array(session['privilege_array']),'edit-enrollments-of-trainees-only')
      );
    //
    Bind;
    //
  end;
end;

procedure TWebForm_enrollment_detail.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback then begin
    if assigned(session['enrollment_detail.p']) then begin
      p := p_type(session['enrollment_detail.p']);
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
      p.biz_enrollment := TClass_biz_enrollment.Create;
      p.biz_members := TClass_biz_members.Create;
      p.biz_user := TClass_biz_user.Create;
      //
      p.num_datagrid_rows := 0;
      //
      p.cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if p.cad_num_string = EMPTY then begin
        p.cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      //
    end;
  end;
end;

procedure TWebForm_enrollment_detail.LinkButton_add_new_enrollment_status_Click(sender: System.Object;
  e: System.EventArgs);
begin
  DropCrumbAndTransferTo('add_new_enrollment_status.aspx');
end;

procedure TWebForm_enrollment_detail.TWebForm_enrollment_detail_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('enrollment_detail.p',p);
end;

procedure TWebForm_enrollment_detail.DataGrid_member_history_ItemCommand(source: System.Object;
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

procedure TWebForm_enrollment_detail.DataGrid_member_history_ItemDataBound(sender: System.Object;
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

procedure TWebForm_enrollment_detail.Bind;
begin
  p.biz_enrollment.BindMemberHistory(p.biz_members.IdOf(session['e_item']),DataGrid_member_history);
  //
  // Manage control visibilities.
  //
  p.be_datagrid_empty := (p.num_datagrid_rows = 0);
  TableRow_none.visible := p.be_datagrid_empty;
  DataGrid_member_history.visible := not p.be_datagrid_empty;
  //
  // Clear aggregation vars for next bind, if any.
  //
  p.num_datagrid_rows := 0;
  //
end;

end.

