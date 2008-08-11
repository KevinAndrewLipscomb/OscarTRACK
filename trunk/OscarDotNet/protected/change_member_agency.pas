unit change_member_agency;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  appcommon,
  Class_biz_agencies,
  Class_biz_members,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_agencies: TClass_biz_agencies;
    biz_members: TClass_biz_members;
    saved_agency_id: string;
    END;
  TWebForm_change_member_agency = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_member_agency_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
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
    Label_member_name_1: System.Web.UI.WebControls.Label;
    Label_member_name_2: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    DropDownList_agency: System.Web.UI.WebControls.DropDownList;
    Button_cancel: System.Web.UI.WebControls.Button;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_member_agency.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_member_agency_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_member_agency.Page_Load(sender: System.Object; e: System.EventArgs);
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
      Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_member_agency';
      //
      p.biz_members := TClass_biz_members.Create;
      p.biz_agencies := TClass_biz_agencies.Create;
      //
      Label_member_name_1.text :=
        p.biz_members.FirstNameOf(session['e_item']) + SPACE + p.biz_members.LastNameOf(session['e_item']);
      Label_member_name_2.text := Label_member_name_1.text;
      //
      p.saved_agency_id := p.biz_agencies.IdOfShortDesignator(p.biz_members.AgencyOf(session['e_item']));
      //
      p.biz_agencies.BindListControlShort(DropDownList_agency,p.saved_agency_id,FALSE);
      //
    end;
  end;
end;

procedure TWebForm_change_member_agency.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_change_member_agency.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_change_member_agency.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_members.SetAgency(p.saved_agency_id,Safe(DropDownList_agency.selectedvalue,NUM),session['e_item']);
  BackTrack;
end;

procedure TWebForm_change_member_agency.TWebForm_change_member_agency_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('p',p);
end;

end.

