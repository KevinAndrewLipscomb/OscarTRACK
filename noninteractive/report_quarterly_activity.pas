unit report_quarterly_activity;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  Class_biz_role_member_map;

type
  TWebForm_report_quarterly_activity = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        biz_role_member_map: TClass_biz_role_member_map;
        END;
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_application_name: System.Web.UI.WebControls.Label;
    Label_application_name_2: System.Web.UI.WebControls.Label;
    Label_application_name_3: System.Web.UI.WebControls.Label;
    HyperLink_web_site: System.Web.UI.WebControls.HyperLink;
  protected
    procedure OnInit(e: EventArgs); override;
    procedure Render(writer: HtmlTextWriter); override;
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
procedure TWebForm_report_quarterly_activity.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_quarterly_activity.Page_Load(sender: System.Object; e: System.EventArgs);
var
  url: string;
begin
  //
  Title.InnerText := configurationmanager.AppSettings['application_name'] + ' - report_quarterly_activity';
  Label_application_name.text := configurationmanager.appsettings['application_name'];
  Label_application_name_2.text := Label_application_name.text;
  Label_application_name_3.text := Label_application_name.text;
  //
  url := configurationmanager.appsettings['runtime_root_fullspec'];
  HyperLink_web_site.text := url;
  HyperLink_web_site.navigateurl := url;
  //
end;

procedure TWebForm_report_quarterly_activity.OnInit(e: EventArgs);
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
  session.Add('mode:report/quarterly-behind-the-scenes-activity',EMPTY);
  //
  p.biz_role_member_map := TClass_biz_role_member_map.Create;
  //
end;

procedure TWebForm_report_quarterly_activity.Render(writer: HtmlTextWriter);
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
    p.biz_role_member_map.EmailTargetOf('Department Authority','EMS'),
    //subject
    'Report: Quarterly Behind-The-Scenes Activity',
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
