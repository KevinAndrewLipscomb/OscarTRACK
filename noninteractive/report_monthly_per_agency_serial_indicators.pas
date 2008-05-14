unit report_monthly_per_agency_serial_indicators;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  Class_biz_agencies,
  Class_biz_members,
  UserControl_roster;

type
  p_type =
    RECORD
    biz_agencies: TClass_biz_agencies;
    biz_members: TClass_biz_members;
    member_id: string;
    END;
  TWebForm_report_monthly_per_agency_serial_indicators = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_application_name: System.Web.UI.WebControls.Label;
    HyperLink_web_site: System.Web.UI.WebControls.HyperLink;
    Label_agency: System.Web.UI.WebControls.Label;
    Img_core_ops_size: System.Web.UI.HtmlControls.HtmlImage;
    Img_num_members_in_pipeline: System.Web.UI.HtmlControls.HtmlImage;
    Img_crew_shifts_forecast: System.Web.UI.HtmlControls.HtmlImage;
    Img_utilization: System.Web.UI.HtmlControls.HtmlImage;
    Img_standard_enrollment: System.Web.UI.HtmlControls.HtmlImage;
    Img_median_length_of_service: System.Web.UI.HtmlControls.HtmlImage;
    Img_commensuration: System.Web.UI.HtmlControls.HtmlImage;
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
  kix,
  system.configuration,
  system.io,
  system.text;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_report_monthly_per_agency_serial_indicators.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_monthly_per_agency_serial_indicators.Page_Load(sender: System.Object; e: System.EventArgs);
var
  agency_id: string;
  passthrough_parms: string;
  url: string;
begin
  //
  Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - report_monthly_per_agency_serial_indicators';
  Label_application_name.text := configurationmanager.appsettings['application_name'];
  //
  url :=
    'http://' + configurationmanager.appsettings['host_domain_name'] + '/' + configurationmanager.appsettings['application_name'];
  HyperLink_web_site.text := url;
  HyperLink_web_site.navigateurl := url;
  //
  Label_agency.text := request['agency'];
  //
  agency_id := p.biz_agencies.IdOfShortDesignator(request['agency']);
  if request['agency'] = 'EMS' then begin
    passthrough_parms := '&agency=' + agency_id + '&be_agency_applicable=0';
  end else begin
    passthrough_parms := '&agency=' + agency_id + '&be_agency_applicable=1';
  end;
  Img_core_ops_size.attributes['src'] := Img_core_ops_size.attributes['src'] + passthrough_parms;
  Img_num_members_in_pipeline.attributes['src'] := Img_num_members_in_pipeline.attributes['src'] + passthrough_parms;
  Img_crew_shifts_forecast.attributes['src'] := Img_crew_shifts_forecast.attributes['src'] + passthrough_parms;
  Img_utilization.attributes['src'] := Img_utilization.attributes['src'] + passthrough_parms;
  Img_standard_enrollment.attributes['src'] := Img_standard_enrollment.attributes['src'] + passthrough_parms;
  Img_median_length_of_service.attributes['src'] := Img_median_length_of_service.attributes['src'] + passthrough_parms;
  Img_commensuration.attributes['src'] := Img_commensuration.attributes['src'] + passthrough_parms;
  //
end;

procedure TWebForm_report_monthly_per_agency_serial_indicators.OnInit(e: EventArgs);
var
  privilege_array: kix.string_array;
  role_name: string;
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  p.biz_agencies := TClass_biz_agencies.Create;
  p.biz_members := TClass_biz_members.Create;
  //
  // Set session objects referenced by UserControl_roster.
  //
  session.Add('mode:report',system.string.EMPTY);
  session.Add('mode:report/monthly-per-agency-serial-indicators',system.string.EMPTY);
  //
  if request['agency'] = 'EMS' then begin
    role_name := 'Department Authority';
    SetLength(privilege_array,1);
    privilege_array[0] := 'see-all-squads';
    session.Add('privilege_array',privilege_array);
  end else begin
    role_name := 'Squad Commander';
    SetLength(privilege_array,0);
    session.Add('privilege_array',privilege_array);
  end;
  //
  p.member_id := p.biz_members.IdOfAppropriateRoleHolder(role_name,request['agency']);
  //
end;

procedure TWebForm_report_monthly_per_agency_serial_indicators.Render(writer: HtmlTextWriter);
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
    p.biz_members.EmailAddressOf(p.member_id),
    //subject
    'Report: Monthly Per-Agency Serial Indicators',
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

