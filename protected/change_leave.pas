unit change_leave;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_leaves,
  Class_biz_members,
  kix,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_leaves: TClass_biz_leaves;
    biz_members: TClass_biz_members;
    effective_start_month_offset: string;
    saved_effective_start_month_offset: string;
    saved_note: string;
    END;
  TWebForm_change_leave = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_leave_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure CustomValidator_end_month_ServerValidate(source: System.Object; 
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_overlap_ServerValidate(source: System.Object; args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure DropDownList_start_month_SelectedIndexChanged(sender: System.Object; 
      e: System.EventArgs);
    procedure CustomValidator_actual_change_ServerValidate(source: System.Object; 
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
    Label_member_designator: System.Web.UI.WebControls.Label;
    DropDownList_kind_of_leave: System.Web.UI.WebControls.DropDownList;
    DropDownList_end_month: System.Web.UI.WebControls.DropDownList;
    CustomValidator_end_month: System.Web.UI.WebControls.CustomValidator;
    RequiredFieldValidator_kind_of_leave: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_num_obligated_shifts: System.Web.UI.WebControls.RequiredFieldValidator;
    TextBox_note: System.Web.UI.WebControls.TextBox;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    DropDownList_num_obligated_shifts: System.Web.UI.WebControls.DropDownList;
    Label_member_first_name: System.Web.UI.WebControls.Label;
    LinkButton1: System.Web.UI.WebControls.LinkButton;
    CustomValidator_overlap: System.Web.UI.WebControls.CustomValidator;
    DropDownList_start_month: System.Web.UI.WebControls.DropDownList;
    RequiredFieldValidator_start_month: System.Web.UI.WebControls.RequiredFieldValidator;
    RequiredFieldValidator_end_month: System.Web.UI.WebControls.RequiredFieldValidator;
    Label_saved_start_month: System.Web.UI.WebControls.Label;
    Label_saved_end_month: System.Web.UI.WebControls.Label;
    Label_saved_num_obliged_shifts: System.Web.UI.WebControls.Label;
    Label_saved_kind_of_leave: System.Web.UI.WebControls.Label;
    CustomValidator_actual_change: System.Web.UI.WebControls.CustomValidator;
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
procedure TWebForm_change_leave.InitializeComponent;
begin
  Include(Self.DropDownList_start_month.SelectedIndexChanged, Self.DropDownList_start_month_SelectedIndexChanged);
  Include(Self.CustomValidator_end_month.ServerValidate, Self.CustomValidator_end_month_ServerValidate);
  Include(Self.CustomValidator_overlap.ServerValidate, Self.CustomValidator_overlap_ServerValidate);
  Include(Self.CustomValidator_actual_change.ServerValidate, Self.CustomValidator_actual_change_ServerValidate);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_leave_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_leave.Page_Load(sender: System.Object; e: System.EventArgs);
var
  cad_num_string: string;
  i: cardinal;
begin
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
      Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_leave';
      //
      p.biz_leaves := TClass_biz_leaves.Create;
      p.biz_members := TClass_biz_members.Create;
      //
      cad_num_string := p.biz_members.CadNumOf(session['e_item']);
      if cad_num_string = EMPTY then begin
        cad_num_string := NOT_APPLICABLE_INDICATION_HTML;
      end;
      Label_member_first_name.Text := p.biz_members.FirstNameOf(session['e_item']);
      Label_member_designator.Text := Label_member_first_name.Text
        + SPACE
        + p.biz_members.LastNameOf(session['e_item'])
        + ' (CAD # '
        + cad_num_string
        + ')';
      //
      Label_saved_start_month.text := datetime.Parse(p.biz_leaves.StartMonthOf(session['leave_item']) + '-01').tostring('MMM yyyy');
      Label_saved_end_month.text := datetime.Parse(p.biz_leaves.EndMonthOf(session['leave_item']) + '-01').tostring('MMM yyyy');
      Label_saved_kind_of_leave.text := p.biz_leaves.KindOf(session['leave_item']);
      Label_saved_num_obliged_shifts.text := p.biz_leaves.NumObligedShiftsOfTcc(session['leave_item']);
      p.saved_note := p.biz_leaves.NoteOfTcc(session['leave_item']);
      //
      // Start month
      //
      if p.biz_leaves.StartMonthOf(session['leave_item']) > datetime.Today.tostring('yyyy-MM') then begin
        p.biz_leaves.BindStartMonthDropDownList(DropDownList_start_month,FALSE);
        i := 0;
        while DropDownList_start_month.items.item[i].text <> Label_saved_start_month.text do begin
          i := i + 1;
        end;
        DropDownList_start_month.selectedindex := i;
        p.saved_effective_start_month_offset := Safe(DropDownList_start_month.selectedvalue,NUM);
      end else begin
        DropDownList_start_month.visible := FALSE;
        RequiredFieldValidator_start_month.enabled := FALSE;
        p.saved_effective_start_month_offset := math.Round
          (
          timespan
            (
            datetime.Parse(p.biz_leaves.StartMonthOf(session['leave_item']) + '-01')
            - datetime.Create(datetime.Today.Year,datetime.Today.Month,1)
            )
          .Days/30
          )
          .tostring('F0');
      end;
      p.effective_start_month_offset := p.saved_effective_start_month_offset;
      //
      // End month
      //
      p.biz_leaves.BindEndMonthDropDownList(DropDownList_end_month,FALSE,(int16.Parse(p.saved_effective_start_month_offset) < 0));
      i := 0;
      while DropDownList_end_month.items.item[i].text <> Label_saved_end_month.text do begin
        i := i + 1;
      end;
      DropDownList_end_month.selectedindex := i;
      //
      // Kind of leave
      //
      p.biz_leaves.BindKindDropDownList(DropDownList_kind_of_leave,FALSE);
      i := 0;
      while DropDownList_kind_of_leave.items.item[i].text <> Label_saved_kind_of_leave.text do begin
        i := i + 1;
      end;
      DropDownList_kind_of_leave.selectedindex := i;
      //
      // Num obligated shifts
      //
      p.biz_leaves.BindNumObligatedShiftsDropDownList
        (p.biz_members.EnrollmentOf(session['e_item']),DropDownList_num_obligated_shifts);
      DropDownList_num_obligated_shifts.selectedvalue := p.biz_leaves.NumObligedShiftsOfTcc(session['leave_item']);
      //
      // Note
      //
      TextBox_note.text := p.saved_note;
      //
    end;
  end;
end;

procedure TWebForm_change_leave.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_change_leave.CustomValidator_actual_change_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := (p.effective_start_month_offset <> p.saved_effective_start_month_offset)
    or (DropDownList_end_month.selecteditem.text <> Label_saved_end_month.text)
    or (DropDownList_kind_of_leave.selecteditem.text <> Label_saved_kind_of_leave.text)
    or (DropDownList_num_obligated_shifts.selectedvalue <> Label_saved_num_obliged_shifts.text)
    or (TextBox_note.text <> p.saved_note);
end;

procedure TWebForm_change_leave.DropDownList_start_month_SelectedIndexChanged(sender: System.Object;
  e: System.EventArgs);
begin
  p.effective_start_month_offset := Safe(DropDownList_start_month.selectedvalue,NUM);
end;

procedure TWebForm_change_leave.CustomValidator_overlap_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := not p.biz_leaves.BeOverlap
    (
    p.biz_members.IdOf(session['e_item']),
    p.effective_start_month_offset,
    Safe(DropDownList_end_month.selectedvalue,NUM),
    p.biz_leaves.IdOf(session['leave_item'])
    );
end;

procedure TWebForm_change_leave.Button_cancel_Click(sender: System.Object; e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_change_leave.Button_submit_Click(sender: System.Object; e: System.EventArgs);
begin
  if page.isvalid then begin
    p.biz_leaves.Change
      (
      p.biz_leaves.IdOf(session['leave_item']),
      p.biz_members.IdOf(session['e_item']),
      Label_saved_start_month.text,
      Label_saved_end_month.text,
      Label_saved_kind_of_leave.text,
      Label_saved_num_obliged_shifts.text,
      p.saved_note,
      p.effective_start_month_offset,
      Safe(DropDownList_end_month.selectedvalue,HYPHENATED_NUM),
      Safe(DropDownList_kind_of_leave.selectedvalue,NUM),
      Safe(DropDownList_num_obligated_shifts.selectedvalue,NUM),
      Safe(TextBox_note.text,PUNCTUATED)
      );
    BackTrack;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

procedure TWebForm_change_leave.CustomValidator_end_month_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := p.biz_leaves.BeValid(p.effective_start_month_offset,args.value);
end;

procedure TWebForm_change_leave.TWebForm_change_leave_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('p',p);
end;

end.

