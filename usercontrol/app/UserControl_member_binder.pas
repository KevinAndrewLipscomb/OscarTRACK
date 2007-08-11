unit UserControl_member_binder;

interface

uses
  ki_web_ui,
  Microsoft.Web.UI.WebControls,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls,
  UserControl_dashboard_binder,
  UserControl_roster;

type
  p_type =
    RECORD
    END;
  TWebUserControl_member_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_member_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip1: Microsoft.Web.UI.WebControls.TabStrip;
    MultiPage1: Microsoft.Web.UI.WebControls.MultiPage;
    UserControl_roster: TWebUserControl_roster;
    UserControl_dashboard_binder: TWebUserControl_dashboard_binder;
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

const
  TSSI_PERSONNEL = 0;
  TSSI_DASHBOARD = 1;
  TSSI_CONFIG = 2;
  TSSI_ABOUT = 3;

procedure TWebUserControl_member_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    //
  end;
  //
end;

procedure TWebUserControl_member_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['UserControl_member_binder.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_member_binder.p']);
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
procedure TWebUserControl_member_binder.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_member_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_member_binder.TWebUserControl_member_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  session.Remove('UserControl_member_binder.p');
  session.Add('UserControl_member_binder.p',p);
  //
end;

end.
