unit UserControl_about;

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
    be_loaded: boolean;
    END;
  TWebUserControl_about = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_about_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_about;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

procedure TWebUserControl_about.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Label_application_name.text := configurationsettings.appsettings['application_name'];
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_about.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_about.p'] <> nil)
    and (session['UserControl_about.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_about.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_about.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_about_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_about.TWebUserControl_about_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_about.p');
  session.Add('UserControl_about.p',p);
end;

function TWebUserControl_about.Fresh: TWebUserControl_about;
begin
  session.Remove('UserControl_about.p');
  Fresh := self;
end;

end.
