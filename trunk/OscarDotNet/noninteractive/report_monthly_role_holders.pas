unit report_monthly_role_holders;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  Class_biz_members,
  Class_biz_role_member_map,
  UserControl_role_holders_per_agency;

type
  p_type =
    RECORD
    biz_role_member_map: TClass_biz_role_member_map;
    role_name: string;
    END;
  TWebForm_report_monthly_role_holders = class(System.Web.UI.Page)
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
    HyperLink_roles_help: System.Web.UI.WebControls.HyperLink;
    HyperLink_web_site: System.Web.UI.WebControls.HyperLink;
    PlaceHolder_control: System.Web.UI.WebControls.PlaceHolder;
  protected
    procedure OnInit(e: EventArgs); override;
    procedure Render(writer: HtmlTextWriter); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  Class_biz_agencies,
  kix,
  system.configuration,
  system.io,
  system.text;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_report_monthly_role_holders.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_monthly_role_holders.Page_Load(sender: System.Object; e: System.EventArgs);
var
  url: string;
begin
  //
  Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - report_monthly_role_holders';
  Label_application_name_1.text := configurationmanager.appsettings['application_name'];
  Label_application_name_2.text := configurationmanager.appsettings['application_name'];
  //
  url := configurationmanager.appsettings['runtime_root_fullspec'];
  HyperLink_web_site.text := url;
  HyperLink_web_site.navigateurl := url;
  //
  HyperLink_roles_help.navigateurl := url + 'doc/roles.aspx';
  //
end;

procedure TWebForm_report_monthly_role_holders.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  // Set session objects referenced by UserControl_roster.
  //
  session.Add('mode:report',EMPTY);
  session.Add('mode:report/monthly-role-holders-per-agency',EMPTY);
  //
  p.biz_role_member_map := TClass_biz_role_member_map.Create;
  //
  if request['agency'] = 'EMS' then begin
    p.role_name := 'Department Authority';
  end else begin
    p.role_name := 'Squad Commander';
  end;
  //
  session.Add('agency_short_designator',request['agency']);
  //
  PlaceHolder_control.controls.Add(TWebUserControl_role_holders_per_agency(LoadControl('~/usercontrol/app/UserControl_role_holders_per_agency.ascx')));
  //
end;

procedure TWebForm_report_monthly_role_holders.Render(writer: HtmlTextWriter);
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
  SmtpMailSend
    (
    //from
    configurationmanager.appsettings['sender_email_address'],
    //to
    p.biz_role_member_map.EmailTargetOf(p.role_name,request['agency']),
    //subject
    'Report: Monthly Role Holders',
    //body
    body,
    //be_html
    TRUE,
    //cc
    configurationmanager.appsettings['sender_email_address']
    );
  //
  session.Abandon;
  //
end;

end.
