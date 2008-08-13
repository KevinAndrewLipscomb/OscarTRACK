unit change_member_email_address;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, system.configuration, system.web.security,
  Class_biz_members,
  Class_biz_users,
  ki_web_ui;

type
  p_type =
    RECORD
    biz_members: TClass_biz_members;
    biz_users: TClass_biz_users;
    END;
  TWebForm_change_member_email_address = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebForm_change_member_email_address_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure CustomValidator_member_email_address_ServerValidate(source: System.Object;
      args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlGenericControl;
    Label_member_name_1: System.Web.UI.WebControls.Label;
    Label_member_name_2: System.Web.UI.WebControls.Label;
    Label_member_name_3: System.Web.UI.WebControls.Label;
    TextBox_noop_ie_behavior_workaround: System.Web.UI.WebControls.TextBox;
    TextBox_member_email_address: System.Web.UI.WebControls.TextBox;
    RegularExpressionValidator_member_email_address: System.Web.UI.WebControls.RegularExpressionValidator;
    CustomValidator_member_email_address: System.Web.UI.WebControls.CustomValidator;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
  protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  kix;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_member_email_address.InitializeComponent;
begin
  Include(Self.CustomValidator_member_email_address.ServerValidate, Self.CustomValidator_member_email_address_ServerValidate);
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebForm_change_member_email_address_PreRender);
end;
{$ENDREGION}

procedure TWebForm_change_member_email_address.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if not IsPostback then begin
    //
    Title.InnerText := server.HtmlEncode(configurationmanager.AppSettings['application_name']) + ' - change_member_email_address';
    //
    Label_member_name_1.text :=
      p.biz_members.FirstNameOf(session['e_item']) + SPACE + p.biz_members.LastNameOf(session['e_item']);
    Label_member_name_2.text := Label_member_name_1.text;
    Label_member_name_3.text := Label_member_name_2.text;
    Textbox_member_email_address.text := session['member_email_address'].tostring;
    //
    Focus(TextBox_member_email_address);
    //
  end;
end;

procedure TWebForm_change_member_email_address.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback then begin
    if assigned(session['change_member_email_address.p']) then begin
      p := p_type(session['change_member_email_address.p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      //
      // The request for this page could not have been the result of a server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
      //
      session.Clear;
      server.Transfer('~/login.aspx');
    end else begin
      //
      p.biz_members := TClass_biz_members.Create;
      p.biz_users := TClass_biz_users.Create;
      //
    end;
  end;
  //
end;

procedure TWebForm_change_member_email_address.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_change_member_email_address.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  p.biz_members.SetEmailAddress(p.biz_members.IdOf(session['e_item']),Safe(Textbox_member_email_address.text,EMAIL_ADDRESS));
  BackTrack;
end;

procedure TWebForm_change_member_email_address.CustomValidator_member_email_address_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := (args.value = EMPTY) or kix.BeValidDomainPartOfEmailAddress(args.value);
end;

procedure TWebForm_change_member_email_address.TWebForm_change_member_email_address_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('change_member_email_address.p',p);
end;

end.

