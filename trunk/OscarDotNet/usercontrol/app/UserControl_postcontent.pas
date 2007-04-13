unit UserControl_postcontent;

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
  TWebUserControl_postcontent = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_postcontent_PreRender(sender: System.Object;
      e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
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

procedure TWebUserControl_postcontent.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    //
  end;
  //
end;

procedure TWebUserControl_postcontent.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['UserControl_postcontent.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_postcontent.p']);
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
procedure TWebUserControl_postcontent.InitializeComponent;
begin
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_postcontent_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_postcontent.TWebUserControl_postcontent_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_postcontent.p');
  session.Add('UserControl_postcontent.p',p);
end;

end.
