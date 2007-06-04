unit report_monthly_core_ops_dashboard;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  Class_biz_members,
  UserControl_ranked_core_ops_size,
  UserControl_ranked_crew_shifts_forecast;

type
  p_type =
    RECORD
    biz_members: TClass_biz_members;
    member_id: string;
    END;
  TWebForm_report_monthly_core_ops_dashboard = class(System.Web.UI.Page)
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
    PlaceHolder_ranked_core_ops_size: System.Web.UI.WebControls.PlaceHolder;
    PlaceHolder_ranked_crew_shifts_forecast: System.Web.UI.WebControls.PlaceHolder;
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
  ki,
  system.configuration,
  system.io,
  system.text;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_report_monthly_core_ops_dashboard.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_monthly_core_ops_dashboard.Page_Load(sender: System.Object; e: System.EventArgs);
var
  url: string;
begin
  //
  Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - report_monthly_core_ops_dashboard';
  Label_application_name_1.text := configurationsettings.appsettings['application_name'];
  //
  url :=
    'http://' + configurationsettings.appsettings['host_domain_name'] + '/' + configurationsettings.appsettings['application_name'];
  HyperLink_web_site.text := url;
  HyperLink_web_site.navigateurl := url;
  //
end;

procedure TWebForm_report_monthly_core_ops_dashboard.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  p.biz_members := TClass_biz_members.Create;
  //
  // Set session objects referenced by UserControl_roster.
  //
  session.Add('mode:report',system.string.EMPTY);
  session.Add('mode:report/monthly-core-ops-dashboard',system.string.EMPTY);
  //
  PlaceHolder_ranked_core_ops_size.controls.Add(TWebUserControl_ranked_core_ops_size(LoadControl('~/usercontrol/app/UserControl_ranked_core_ops_size.ascx')));
  PlaceHolder_ranked_crew_shifts_forecast.controls.Add(TWebUserControl_ranked_crew_shifts_forecast(LoadControl('~/usercontrol/app/UserControl_ranked_crew_shifts_forecast.ascx')));
  //
end;

procedure TWebForm_report_monthly_core_ops_dashboard.Render(writer: HtmlTextWriter);
var
  sb: StringBuilder;
begin
  //
  // Write the HTML stream into a StringBuilder.
  //
  sb := StringBuilder.Create;
  inherited Render(HtmlTextWriter.Create(StringWriter.Create(sb)));
  //
  writer.Write(sb.tostring);
//  //
//  // Send output stream as an email message.
//  //
//  ki.SmtpMailSend
//    (
//    //from
//    configurationsettings.appsettings['sender_email_address'],
//    //to
//    p.biz_members.AllEmailAddresses,
//    //subject
//    'Report: Monthly Core Ops Dashboard',
//    //body
//    sb.tostring,
//    //be_html
//    TRUE
//    );
  //
end;

end.

