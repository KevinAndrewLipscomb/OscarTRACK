unit change_phone_num;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  system.web.ui, ki_web_ui, System.Web.UI.WebControls, System.Web.UI.HtmlControls, kix, mysql.data.mysqlclient, system.configuration,
  system.net, system.web.security,
  Class_biz_members;

type
  p_type =
    RECORD
    biz_members: TClass_biz_members;
    END;
  TWebForm_change_phone_num = class(ki_web_ui.page_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
    procedure CustomValidator_phone_num_ServerValidate(source: System.Object; args: System.Web.UI.WebControls.ServerValidateEventArgs);
    procedure TWebForm_change_phone_num_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure Button_cancel_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Title: System.Web.UI.HtmlControls.HtmlTitle;
    Button_submit: System.Web.UI.WebControls.Button;
    Button_cancel: System.Web.UI.WebControls.Button;
    TextBox_phone_num: System.Web.UI.WebControls.TextBox;
    RequiredFieldValidator_phone_num: System.Web.UI.WebControls.RequiredFieldValidator;
    CustomValidator_phone_num: System.Web.UI.WebControls.CustomValidator;
  protected
    procedure OnInit(e: EventArgs); override;
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_change_phone_num.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.Button_cancel.Click, Self.Button_cancel_Click);
  Include(Self.PreRender, Self.TWebForm_change_phone_num_PreRender);
  Include(Self.Load, Self.Page_Load);
  Include(Self.CustomValidator_phone_num.ServerValidate, Self.CustomValidator_phone_num_ServerValidate);
end;
{$ENDREGION}

procedure TWebForm_change_phone_num.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  if IsPostback then begin
    if assigned(session['change_phone_num.p']) then begin
      p := p_type(session['change_phone_num.p']);
    end else begin
      server.Transfer('~/timeout.aspx');
    end;
  end else begin
    if request.servervariables['URL'] = request.currentexecutionfilepath then begin
      session.Clear;
      server.Transfer('~/login.aspx');
    end;
    Title.text := configurationmanager.AppSettings['application_name'] + ' - change_phone_num';
    p.biz_members := TClass_biz_members.Create;
    //
    TextBox_phone_num.text := FormatAsNanpPhoneNum(session['member_phone_num'].tostring);
    //
    Focus(TextBox_phone_num,TRUE);
    end;
end;

procedure TWebForm_change_phone_num.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm_change_phone_num.CustomValidator_phone_num_ServerValidate(source: System.Object;
  args: System.Web.UI.WebControls.ServerValidateEventArgs);
begin
  args.isvalid := BeValidNanpNumber(Safe(TextBox_phone_num.text,NUM));
end;

procedure TWebForm_change_phone_num.Button_cancel_Click(sender: System.Object;
  e: System.EventArgs);
begin
  BackTrack;
end;

procedure TWebForm_change_phone_num.TWebForm_change_phone_num_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('change_phone_num.p',p);
end;

procedure TWebForm_change_phone_num.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
begin
  if page.isvalid then begin
    p.biz_members.SetPhoneNum(Safe(TextBox_phone_num.text,NUM),session['e_item']);
    BackTrack;
  end else begin
    ValidationAlert(TRUE);
  end;
end;

end.

