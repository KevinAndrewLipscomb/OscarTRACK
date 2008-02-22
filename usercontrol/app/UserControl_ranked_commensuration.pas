unit UserControl_ranked_commensuration;

interface

uses
  Class_biz_agencies,
  ki_web_ui,
  system.collections,
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
    biz_agencies: TClass_biz_agencies;
    rank: cardinal;
    END;
  TWebUserControl_ranked_commensuration = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_ranked_commensuration_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_detail_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    DataGrid_detail: System.Web.UI.WebControls.DataGrid;
    Label_overall: System.Web.UI.WebControls.Label;
    Label_no_data: System.Web.UI.WebControls.Label;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_ranked_commensuration;
  end;

implementation

uses
  appcommon,
  kix,
  system.configuration;

procedure TWebUserControl_ranked_commensuration.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Label_overall.text := p.biz_agencies.OverallCommensuration;
    if Label_overall.text <> system.string.EMPTY then begin
      Label_overall.text := Label_overall.text + ' %';
      p.biz_agencies.BindRankedCommensuration(DataGrid_detail);
      DataGrid_detail.visible := TRUE;
      Label_no_data.visible := FALSE;
    end else begin
//      Label_no_data.text := Label_no_data.text + p.biz_members.
      Label_no_data.visible := TRUE;
      DataGrid_detail.visible := FALSE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_ranked_commensuration.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_ranked_commensuration.p'] <> nil)
    and (session['UserControl_ranked_commensuration.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_ranked_commensuration.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    p.biz_agencies := TClass_biz_agencies.Create;
    p.rank := 0;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_ranked_commensuration.InitializeComponent;
begin
  Include(Self.DataGrid_detail.ItemDataBound, Self.DataGrid_detail_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_ranked_commensuration_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_ranked_commensuration.TWebUserControl_ranked_commensuration_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_ranked_commensuration.p');
  session.Add('UserControl_ranked_commensuration.p',p);
end;

function TWebUserControl_ranked_commensuration.Fresh: TWebUserControl_ranked_commensuration;
begin
  session.Remove('UserControl_ranked_commensuration.p');
  Fresh := self;
end;

procedure TWebUserControl_ranked_commensuration.DataGrid_detail_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
begin
  if e.item.itemtype in [listitemtype.item,listitemtype.alternatingitem,listitemtype.edititem,listitemtype.selecteditem] then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    p.rank := p.rank + 1;
    e.item.cells[0].text := p.rank.tostring;
  end;
end;

end.
