unit UserControl_establish_membership;

interface

uses
  Class_biz_user,
  Class_biz_users,
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
    biz_user: TClass_biz_user;
    biz_users: TClass_biz_users;
    END;
  TWebUserControl_establish_membership = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_establish_membership_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_trouble_handler_Click(sender: System.Object; e: System.EventArgs);
    procedure LinkButton_proceed_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name_1: System.Web.UI.WebControls.Label;
    Label_sponsor_1: System.Web.UI.WebControls.Label;
    Label_sponsor_2: System.Web.UI.WebControls.Label;
    Label_sponsor_3: System.Web.UI.WebControls.Label;
    Label_shared_secret_description: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    TextBox_shared_secret: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_shared_secret: System.Web.UI.WebControls.RequiredFieldValidator;
    RegularExpressionValidator_shared_secret: System.Web.UI.WebControls.RegularExpressionValidator;
    TextBox_noop_ie_behavior_workaround: System.Web.UI.WebControls.TextBox;
    LinkButton_trouble_handler: System.Web.UI.WebControls.LinkButton;
    LinkButton_proceed: System.Web.UI.WebControls.LinkButton;
    Table_proceed: System.Web.UI.HtmlControls.HtmlTable;
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

procedure TWebUserControl_establish_membership.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not IsPostback then begin
    //
    Label_application_name_1.text := configurationsettings.appsettings['application_name'];
    Label_sponsor_1.text := configurationsettings.appsettings['sponsor'];
    Label_sponsor_2.text := configurationsettings.appsettings['sponsor'];
    Label_sponsor_3.text := configurationsettings.appsettings['sponsor'];
    Label_shared_secret_description.text := configurationsettings.appsettings['shared_secret_description'];
//    HyperLink_contact_appadmin.navigateurl := 'mailto:'
//    + configurationsettings.appsettings['application_name'] + '-appadmin@' + configurationsettings.appsettings['host_domain_name']
//    + '?subject=Unable%20to%20establish%20membership'
//    + '&body=Please%20replace%20this%20text%20with%20an%20explanation%20that%20includes%20your%20FULL%20NAME%20and%20why%20the%20'
//    + 'department%20may%20have%20supplied%20the%20wrong%20data%20to%20' + configurationsettings.appsettings['application_name']
//    + '.';
    //
  end;
  //
end;

procedure TWebUserControl_establish_membership.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback and (session['UserControl_establish_membership.p'].GetType.namespace = p.GetType.namespace) then begin
    p := p_type(session['UserControl_establish_membership.p']);
  end else begin
    //
    p.biz_user := TClass_biz_user.Create;
    p.biz_users := TClass_biz_users.Create;
    //
  end;
  //
end;

procedure TWebUserControl_establish_membership.LinkButton_proceed_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('~/Default.aspx');
end;

procedure TWebUserControl_establish_membership.LinkButton_trouble_handler_Click(sender: System.Object;
  e: System.EventArgs);
begin
  server.Transfer('establish_membership_trouble.aspx');
end;

procedure TWebUserControl_establish_membership.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if p.biz_users.AcceptAsMember(Safe(TextBox_shared_secret.text,NUM),p.biz_user.IdNum) then begin
    Alert(ki.USER,ki.SUCCESS,'memaccept','Link to membership record established.  Membership privileges granted.');
    Table_proceed.visible := TRUE;
  end else begin
    Alert(ki.USER,ki.FAILURE,'nosuchmem','No such membership record could be located.  Please check your submission for accuracy.');
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_establish_membership.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.LinkButton_trouble_handler.Click, Self.LinkButton_trouble_handler_Click);
  Include(Self.LinkButton_proceed.Click, Self.LinkButton_proceed_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_establish_membership_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_establish_membership.TWebUserControl_establish_membership_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_establish_membership.p');
  session.Add('UserControl_establish_membership.p',p);
end;

end.
