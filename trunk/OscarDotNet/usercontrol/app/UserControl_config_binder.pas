unit UserControl_config_binder;

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
//  UserControl_agency,
  UserControl_user;

type
  p_type =
    RECORD
    be_loaded: boolean;
    tab_index: cardinal;
    END;
  TWebUserControl_config_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_config_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabStrip1_SelectedIndexChange(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabStrip1: Microsoft.Web.UI.WebControls.TabStrip;
    MultiPage1: Microsoft.Web.UI.WebControls.MultiPage;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_config_binder;
  end;

implementation

uses
  appcommon,
  ki,
  System.Collections,
  system.configuration;

const
//  TSSI_AGENCIES = 0;
  TSSI_USERS = 0;

procedure TWebUserControl_config_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    if Has(string_array(session['privilege_array']),'config-users') then begin
      TabStrip1.items[TSSI_USERS].enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_config_binder.p'] <> nil)
    and (session['UserControl_config_binder.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_config_binder.p']);
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_USERS:
      AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')),
        'UserControl_user',
        PlaceHolder_content
        );
//    TSSI_1:
//      AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')),
//        'UserControl2',
//        PlaceHolder_content
//        );
//    TSSI_2:
//      AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')),
//        'UserControl3',
//        PlaceHolder_content
//        );
    end;
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.tab_index := 0;
    //
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')).Fresh,
      'UserControl_user',
      PlaceHolder_content
      );
    //
  end;
  //
end;

procedure TWebUserControl_config_binder.TabStrip1_SelectedIndexChange(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabStrip1.selectedindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_USERS:
    AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_user(LoadControl('~/usercontrol/app/UserControl_user.ascx')).Fresh,
      'UserControl_user',
      PlaceHolder_content
      );
//  TSSI_1:
//    AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')).Fresh,
//      'UserControl2',
//      PlaceHolder_content
//      );
//  TSSI_2:
//    AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl3(LoadControl('~/usercontrol/app/UserControl3.ascx')).Fresh,
//      'UserControl3',
//      PlaceHolder_content
//      );
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_config_binder.InitializeComponent;
begin
  Include(Self.TabStrip1.SelectedIndexChange, Self.TabStrip1_SelectedIndexChange);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_config_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_config_binder.TWebUserControl_config_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_config_binder.p');
  session.Add('UserControl_config_binder.p',p);
end;

function TWebUserControl_config_binder.Fresh: TWebUserControl_config_binder;
begin
  session.Remove('UserControl_config_binder.p');
  Fresh := self;
end;

end.
