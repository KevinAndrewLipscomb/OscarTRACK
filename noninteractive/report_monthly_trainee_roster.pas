unit report_monthly_trainee_roster;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  Class_biz_members,
  Class_biz_role_member_map;

type
  p_type =
    RECORD
    agency_short_designator: string;
    biz_members: TClass_biz_members;
    biz_role_member_map: TClass_biz_role_member_map;
    role_name: string;
    END;
  TWebForm_report_monthly_trainee_roster = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_application_name_1: System.Web.UI.WebControls.Label;
    Label_application_name_2: System.Web.UI.WebControls.Label;
    HyperLink_web_site: System.Web.UI.WebControls.HyperLink;
    PlaceHolder_roster: System.Web.UI.WebControls.PlaceHolder;
  protected
    procedure OnInit(e: EventArgs); override;
    procedure Render(writer: HtmlTextWriter); override;
  end;

implementation

uses
  kix,
  system.configuration,
  system.io,
  system.text,
  UserControl_roster;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_report_monthly_trainee_roster.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_monthly_trainee_roster.Page_Load(sender: System.Object; e: System.EventArgs);
var
  url: string;
begin
  //
  Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - report_monthly_trainee_roster';
  Label_application_name_1.text := configurationmanager.appsettings['application_name'];
  Label_application_name_2.text := configurationmanager.appsettings['application_name'];
  //
  url :=
    'http://' + configurationmanager.appsettings['host_domain_name'] + '/' + configurationmanager.appsettings['application_name'];
  HyperLink_web_site.text := url;
  HyperLink_web_site.navigateurl := url;
  //
end;

procedure TWebForm_report_monthly_trainee_roster.OnInit(e: EventArgs);
var
  privilege_array: kix.string_array;
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  p.biz_members := TClass_biz_members.Create;
  p.biz_role_member_map := TClass_biz_role_member_map.Create;
  //
  // Set session objects referenced by UserControl_roster.
  //
  session.Add('mode:report',EMPTY);
  session.Add('mode:report/monthly-trainee-roster',EMPTY);
  //
  p.agency_short_designator := request['agency'];
  if p.agency_short_designator = 'EMS' then begin
    p.role_name := 'Department BLS ID Coordinator';
    SetLength(privilege_array,1);
    privilege_array[0] := 'see-all-squads';
    session.Add('privilege_array',privilege_array);
  end else begin
    p.role_name := 'Squad Training Officer';
    SetLength(privilege_array,0);
    session.Add('privilege_array',privilege_array);
  end;
  //
  session.Add('member_id',p.biz_members.IdOfAppropriateRoleHolder(p.role_name,p.agency_short_designator));
  //
  PlaceHolder_roster.controls.Add(TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')));
  //
end;

procedure TWebForm_report_monthly_trainee_roster.Render(writer: HtmlTextWriter);
var
  body: string;
  sb: StringBuilder;
begin
  //
  // Write the HTML stream into a StringBuilder.
  //
  sb := StringBuilder.Create;
  inherited Render(HtmlTextWriter.Create(StringWriter.Create(sb)));
//  //
//  writer.Write(sb.tostring);
//  //
  body := sb.tostring;
  //
  // Send output stream as an email message.
  //
  kix.SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    //to
    p.biz_role_member_map.EmailTargetOf(p.role_name,p.agency_short_designator),
    //subject
    'Report: Monthly Trainee Roster',
    //body
    body,
    //be_html
    TRUE
    );
  //
  session.Abandon;
  //
end;

end.

