unit UserControl_funddrive_binder;
  // Derived from KiAspdotnetFramework/UserControl/app/UserControl~funddrive~binder.pas

interface

uses
  AjaxControlToolkit,
  ki_web_ui,
  System.Data,
  System.Drawing,
  System.Web,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.HtmlControls;

type
  TWebUserControl_funddrive_binder = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_funddrive_binder_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure TabContainer_control_ActiveTabChanged(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    type
      p_type =
        RECORD
        be_loaded: boolean;
        content_id: string;
        tab_index: cardinal;
        END;
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    TabContainer_control: AjaxControlToolkit.TabContainer;
    PlaceHolder_content: System.Web.UI.WebControls.PlaceHolder;
    TabPanel_about: tabpanel;
    TabPanel_new_donation: tabpanel;
    TabPanel_old_donation: tabpanel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  published
    function Fresh: TWebUserControl_funddrive_binder;
  end;

implementation

uses
  kix,
  System.Collections,
  system.configuration,
  UserControl_funddrive_teaser,
  UserControl_log_new_donation
//  ,UserControl_log_old_donation
  ;

const
  TSSI_TEASER = 0;
  TSSI_NEW_DONATION = 1;
//  TSSI_OLD_DONATION = 2;

procedure TWebUserControl_funddrive_binder.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    TabContainer_control.activetabindex := p.tab_index;
    //
    if Has(string_array(session['privilege_array']),'log-donations') then begin
      TabPanel_about.enabled := FALSE;
      TabPanel_new_donation.enabled := TRUE;
      TabPanel_old_donation.enabled := TRUE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_funddrive_binder.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if session['UserControl_funddrive_binder.p'] <> nil then begin
    p := p_type(session['UserControl_funddrive_binder.p']);
    p.be_loaded := IsPostBack and (string(session['UserControl_member_binder_PlaceHolder_content']) = 'UserControl_funddrive_binder');
    //
    if assigned(session['UserControl_funddrive_binder_selected_tab']) then begin
      p.tab_index := session['UserControl_funddrive_binder_selected_tab'].GetHashCode;
      session.Remove('UserControl_funddrive_binder_selected_tab');
    end;
    //
    // Dynamic controls must be re-added on each postback.
    //
    case p.tab_index of
    TSSI_TEASER:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_funddrive_teaser(LoadControl('~/usercontrol/app/UserControl_funddrive_teaser.ascx')),
        'UserControl_funddrive_teaser',
        PlaceHolder_content
        );
    TSSI_NEW_DONATION:
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_log_new_donation(LoadControl('~/usercontrol/app/UserControl_log_new_donation.ascx')),
        'UserControl_log_new_donation',
        PlaceHolder_content
        );
//    TSSI_1:
//      p.content_id := AddIdentifiedControlToPlaceHolder
//        (
//        TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')),
//        'UserControl2',
//        PlaceHolder_content
//        );
//    TSSI_2:
//      p.content_id := AddIdentifiedControlToPlaceHolder
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
    if Has(string_array(session['privilege_array']),'log-donations') then begin
      p.tab_index := TSSI_NEW_DONATION;
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_log_new_donation(LoadControl('~/usercontrol/app/UserControl_log_new_donation.ascx')).Fresh,
        'UserControl_log_new_donation',
        PlaceHolder_content
        );
    end else begin
      p.tab_index := TSSI_TEASER;
      p.content_id := AddIdentifiedControlToPlaceHolder
        (
        TWebUserControl_funddrive_teaser(LoadControl('~/usercontrol/app/UserControl_funddrive_teaser.ascx')).Fresh,
        'UserControl_funddrive_teaser',
        PlaceHolder_content
        );
    end;
    //
  end;
  //
end;

procedure TWebUserControl_funddrive_binder.TabContainer_control_ActiveTabChanged(sender: System.Object;
  e: System.EventArgs);
begin
  //
  p.tab_index := TabContainer_control.activetabindex;
  //
  PlaceHolder_content.controls.Clear;
  //
  case p.tab_index of
  TSSI_TEASER:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_funddrive_teaser(LoadControl('~/usercontrol/app/UserControl_funddrive_teaser.ascx')).Fresh,
      'UserControl_funddrive_teaser',
      PlaceHolder_content
      );
  TSSI_NEW_DONATION:
    p.content_id := AddIdentifiedControlToPlaceHolder
      (
      TWebUserControl_log_new_donation(LoadControl('~/usercontrol/app/UserControl_log_new_donation.ascx')).Fresh,
      'UserControl_log_new_donation',
      PlaceHolder_content
      );
//  TSSI_1:
//    p.content_id := AddIdentifiedControlToPlaceHolder
//      (
//      TWebUserControl2(LoadControl('~/usercontrol/app/UserControl2.ascx')).Fresh,
//      'UserControl2',
//      PlaceHolder_content
//      );
//  TSSI_2:
//    p.content_id := AddIdentifiedControlToPlaceHolder
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
procedure TWebUserControl_funddrive_binder.InitializeComponent;
begin
  Include(Self.TabContainer_control.ActiveTabChanged, Self.TabContainer_control_ActiveTabChanged);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_funddrive_binder_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_funddrive_binder.TWebUserControl_funddrive_binder_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  //
  // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
  // not it is already loaded in the user's browser.
  //
  SessionSet(PlaceHolder_content.clientid,p.content_id);
  //
  SessionSet('UserControl_funddrive_binder.p',p);
  //
end;

function TWebUserControl_funddrive_binder.Fresh: TWebUserControl_funddrive_binder;
begin
  session.Remove('UserControl_funddrive_binder.p');
  Fresh := self;
end;

end.
