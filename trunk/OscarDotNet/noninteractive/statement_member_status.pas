unit statement_member_status;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls;

type
  TWebForm_statement_member_status = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

uses
  Class_biz_scheduled_tasks;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm_statement_member_status.InitializeComponent;
begin    
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm_statement_member_status.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  TClass_biz_scheduled_tasks.Create.DoMemberStatusStatements;
end;

procedure TWebForm_statement_member_status.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

end.

