unit UserControl_commensuration;

interface

uses
  Class_biz_agencies,
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
    biz_agencies: TClass_biz_agencies;
    END;
  TWebUserControl_commensuration = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_commensuration_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_commensuration_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure Button_submit_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Label_application_name: System.Web.UI.WebControls.Label;
    Button_submit: System.Web.UI.WebControls.Button;
    DataGrid_commensuration: System.Web.UI.WebControls.DataGrid;
    Label_month: System.Web.UI.WebControls.Label;
    UpdatePanel_control: System.Web.UI.UpdatePanel;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_commensuration;
  end;

implementation

uses
  Class_db_agencies,
  kix,
  System.Collections,
  system.configuration;

const
  TCCI_AGENCY_ID = 0;
  TCCI_DESIGNATOR = 1;
  TCCI_FORECAST = 2;
  TCCI_ACTUAL = 3;

procedure TWebUserControl_commensuration.Page_Load(sender: System.Object; e: System.EventArgs);
begin
  //
  if not p.be_loaded then begin
    //
    Label_month.text := datetime.today.AddMonths(1).tostring('MMMM');
    p.biz_agencies.BindForCommensuration(DataGrid_commensuration);
    //
    if datetime.today.day < 10 then begin
      DataGrid_commensuration.enabled := FALSE;
      Button_submit.enabled := FALSE;
    end;
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_commensuration.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_commensuration.p'] <> nil)
    and (session['UserControl_commensuration.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_commensuration.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    //
    p.biz_agencies := TClass_biz_agencies.Create;
    //
  end;
  //
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_commensuration.InitializeComponent;
begin
  Include(Self.Button_submit.Click, Self.Button_submit_Click);
  Include(Self.DataGrid_commensuration.ItemDataBound, Self.DataGrid_commensuration_ItemDataBound);
  Include(Self.PreRender, Self.TWebUserControl_commensuration_PreRender);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebUserControl_commensuration.TWebUserControl_commensuration_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  SessionSet('UserControl_commensuration.p',p);
end;

function TWebUserControl_commensuration.Fresh: TWebUserControl_commensuration;
begin
  session.Remove('UserControl_commensuration.p');
  Fresh := self;
end;

procedure TWebUserControl_commensuration.Button_submit_Click(sender: System.Object;
  e: System.EventArgs);
var
  commensuration_rec: commensuration_rec_type;
  commensuration_rec_q: queue;
  data_grid_item: datagriditem;
  data_grid_item_collection: datagriditemcollection;
  i: cardinal;
  item_type: listitemtype;
  num_actual: decimal;
  num_forecast: decimal;
  total_num_actual: decimal;
  total_num_forecast: decimal;
  table_cell_collection: tablecellcollection;
begin
  //
  commensuration_rec_q := queue.Create;
  data_grid_item_collection := DataGrid_commensuration.items;
  total_num_actual := 0;
  total_num_forecast := 0;
  //
  // Enqueue individual agency records
  //
  if data_grid_item_collection.count > 0 then begin
    for i := 0 to (data_grid_item_collection.count - 1) do begin
      data_grid_item := data_grid_item_collection[i];
      item_type := data_grid_item.itemtype;
      if item_type in [listitemtype.item,listitemtype.alternatingitem,listitemtype.edititem,listitemtype.selecteditem] then begin
        table_cell_collection := data_grid_item.cells;
        num_forecast := decimal.Parse(Safe(table_cell_collection[TCCI_FORECAST].text,REAL_NUM));
        num_actual := decimal.Parse(Safe(TextBox(table_cell_collection[TCCI_ACTUAL].FindControl('TextBox_quantity')).text,REAL_NUM));
        total_num_forecast := total_num_forecast + num_forecast;
        total_num_actual := total_num_actual + num_actual;
        with commensuration_rec do begin
          agency_id := Safe(table_cell_collection[TCCI_AGENCY_ID].text,NUM);
          commensuration_factor := num_actual/num_forecast;
          be_agency_id_applicable := TRUE;
        end;
        commensuration_rec_q.Enqueue(commensuration_rec);
      end;
    end;
  end;
  //
  // Enqueue citywide record
  //
  with commensuration_rec do begin
    agency_id := '0';
    commensuration_factor := total_num_actual/total_num_forecast;
    be_agency_id_applicable := FALSE;
  end;
  commensuration_rec_q.Enqueue(commensuration_rec);
  //
  // Log
  //
  p.biz_agencies.SetCommensuration(commensuration_rec_q);
  //
  Alert(kix.USER,SUCCESS,'subaccept','Submission accepted',TRUE);
  //
end;

procedure TWebUserControl_commensuration.DataGrid_commensuration_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    e.item.cells[TCCI_DESIGNATOR].text := e.item.cells[TCCI_DESIGNATOR].text + ':';
    e.item.cells[TCCI_FORECAST].text := decimal.Parse(e.item.cells[TCCI_FORECAST].text).tostring('F1');
    //
  end;
end;

end.
