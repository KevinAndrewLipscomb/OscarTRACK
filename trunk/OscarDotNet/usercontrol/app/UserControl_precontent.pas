unit UserControl_precontent;
//
// UserControl_precontent must not attempt to access session state because UserControl_precontent is invoked on the timeout page
// and session state is by definition nonexistent in a timeout situation.
//

interface

uses
  ki_web_ui,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_precontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    HtmlImage_sponsor_logoseal: System.Web.UI.HtmlControls.HtmlImage;
    HtmlImage_sponsor_sponsor_logoseal: System.Web.UI.HtmlControls.HtmlImage;
    ValidationSummary1: System.Web.UI.WebControls.ValidationSummary;
    HyperLink_sponsor: System.Web.UI.WebControls.HyperLink;
    HtmlImage_partner_logoseal: System.Web.UI.HtmlControls.HtmlImage;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  system.configuration;

procedure TWebUserControl_precontent.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    HyperLink_sponsor.text := configurationsettings.appsettings['sponsor'];
    Label_application_name.text := configurationsettings.appsettings['application_name'];
    HtmlImage_sponsor_logoseal.src := HtmlImage_sponsor_logoseal.src
      .Replace('\','/')
      .Replace('~','/' + configurationsettings.appsettings['virtual_directory_name']);
    HtmlImage_partner_logoseal.src := HtmlImage_partner_logoseal.src
      .Replace('\','/')
      .Replace('~','/' + configurationsettings.appsettings['virtual_directory_name']);
    HtmlImage_sponsor_sponsor_logoseal.src := HtmlImage_sponsor_sponsor_logoseal.src
      .Replace('\','/')
      .Replace('~','/' + configurationsettings.appsettings['virtual_directory_name']);
    //
  end;
  //
end;

procedure TWebUserControl_precontent.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_precontent.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

end.
