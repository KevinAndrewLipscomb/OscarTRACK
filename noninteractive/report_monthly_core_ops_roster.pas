unit report_monthly_core_ops_roster;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls,
  UserControl_roster;

type
  TWebForm_report_monthly_core_ops_roster = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    PlaceHolder_roster: System.Web.UI.WebControls.PlaceHolder;
    procedure OnInit(e: EventArgs); override;
    procedure Render(writer: HtmlTextWriter); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  Class_biz_members,
  ki,
  system.configuration,
  system.io,
  system.text;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_report_monthly_core_ops_roster.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_report_monthly_core_ops_roster.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  Title.InnerText := ConfigurationSettings.AppSettings['application_name'] + ' - report_monthly_core_ops_roster';
end;

procedure TWebForm_report_monthly_core_ops_roster.OnInit(e: EventArgs);
var
  privilege_array: ki.string_array;
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  // Set session objects referenced by UserControl_roster.
  //
  session.Add('mode:report',system.string.EMPTY);
  session.Add('mode:report/monthly-core-ops-roster',system.string.EMPTY);
  //
  SetLength(privilege_array,0);
  session.Add('privilege_array',privilege_array);
  //
  session.Add('member_id',TClass_biz_members.Create.IdOfRoleHolderAtAgency('Squad Scheduler',request['agency']));
  //
  PlaceHolder_roster.controls.Add(TWebUserControl_roster(LoadControl('~/usercontrol/app/UserControl_roster.ascx')));
  //
end;

procedure TWebForm_report_monthly_core_ops_roster.Render(writer: HtmlTextWriter);
var
  sb: StringBuilder;
begin
  //
  // Write the HTML stream into a StringBuilder.
  //
  sb := StringBuilder.Create;
  inherited Render(HtmlTextWriter.Create(StringWriter.Create(sb)));
  //
  // Send output stream as an email message.
  //
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    'recipient@frompaper2web.com',
    //subject
    'Test Report',
    //body
    sb.tostring,
    //be_html
    TRUE
    );
  //
end;

end.

