unit UserControl_precontent;

interface

uses
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  p_type =
    RECORD
    END;
  TWebUserControl_precontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_precontent_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
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
  appcommon,
  ki,
  System.Collections,
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
  if IsPostback and (session['UserControl_precontent.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_precontent.p']);
  end else begin
    //
    //
  end;
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
  Include(Self.PreRender, Self.TWebUserControl_precontent_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_precontent.TWebUserControl_precontent_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_precontent.p');
  session.Add('UserControl_precontent.p',p);
end;

end.
