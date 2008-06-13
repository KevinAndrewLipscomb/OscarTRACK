unit UserControl_ranked_utilization;

interface

uses
  Class_biz_members,
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
    biz_members: TClass_biz_members;
    rank: cardinal;
    total_cooked: decimal;
    total_raw: decimal;
    END;
  TWebUserControl_ranked_utilization = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_ranked_utilization_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_detail_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_total: System.Web.UI.WebControls.Label;
    DataGrid_detail: System.Web.UI.WebControls.DataGrid;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_ranked_utilization;
  end;

implementation

uses
  appcommon,
  kix,
  System.Collections,
  system.configuration;

procedure TWebUserControl_ranked_utilization.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_members.BindRankedUtilization(DataGrid_detail,(session['mode:report/monthly-core-ops-dashboard'] <> nil));
    Label_total.text := (p.total_cooked/p.total_raw).tostring('P0');
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_ranked_utilization.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_ranked_utilization.p'] <> nil)
    and (session['UserControl_ranked_utilization.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_ranked_utilization.p']);
  end else begin
    //
    p.be_loaded :=FALSE;
    p.biz_members := TClass_biz_members.Create;
    p.rank := 0;
    p.total_cooked := 0;
    p.total_raw := 0;
    //
  end;
  //
end;

procedure TWebUserControl_ranked_utilization.DataGrid_detail_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
var
  num_cooked_shifts: decimal;
  num_raw_shifts: decimal;
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    p.rank := p.rank + 1;
    e.item.cells[0].text := p.rank.tostring;
    num_cooked_shifts := decimal.Parse(e.item.cells[2].text);
    num_raw_shifts := decimal.Parse(e.item.cells[3].text);
    p.total_cooked := p.total_cooked + num_cooked_shifts;
    p.total_raw := p.total_raw + num_raw_shifts;
    if num_raw_shifts <> 0 then begin
      e.item.cells[3].text := (num_cooked_shifts/num_raw_shifts).tostring('P0');
    end else begin
      e.item.cells[3].text := 'NAN';
    end;
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_ranked_utilization.InitializeComponent;
begin
  Include(Self.DataGrid_detail.ItemDataBound, Self.DataGrid_detail_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_ranked_utilization_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_ranked_utilization.TWebUserControl_ranked_utilization_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_ranked_utilization.p',p);
end;

function TWebUserControl_ranked_utilization.Fresh: TWebUserControl_ranked_utilization;
begin
  session.Remove('UserControl_ranked_utilization.p');
  Fresh := self;
end;

end.
