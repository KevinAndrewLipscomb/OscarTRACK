unit UserControl_ranked_length_of_service;

interface

uses
  Class_biz_members,
  Class_biz_indicator_median_length_of_service,
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
    biz_members: TClass_biz_members;
    biz_indicator_median_length_of_service: TClass_biz_indicator_median_length_of_service;
    citywide_years_of_service_array_list: arraylist;
    ems_years_of_service_array_list: arraylist;
    r01_years_of_service_array_list: arraylist;
    r02_years_of_service_array_list: arraylist;
    r04_years_of_service_array_list: arraylist;
    r05_years_of_service_array_list: arraylist;
    r06_years_of_service_array_list: arraylist;
    r09_years_of_service_array_list: arraylist;
    r13_years_of_service_array_list: arraylist;
    r14_years_of_service_array_list: arraylist;
    r16_years_of_service_array_list: arraylist;
    r17_years_of_service_array_list: arraylist;
    rank: cardinal;
    END;
  TWebUserControl_ranked_length_of_service = class(ki_web_ui.usercontrol_class)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure TWebUserControl_ranked_length_of_service_PreRender(sender: System.Object;
      e: System.EventArgs);
    procedure DataGrid_detail_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
    procedure DataGrid_special_ItemDataBound(sender: System.Object; e: System.Web.UI.WebControls.DataGridItemEventArgs);
  {$ENDREGION}
  strict private
    p: p_type;
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    DataGrid_detail: System.Web.UI.WebControls.DataGrid;
    Label_overall: System.Web.UI.WebControls.Label;
    DataGrid_special: System.Web.UI.WebControls.DataGrid;
  protected
    procedure OnInit(e: System.EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  published
    function Fresh: TWebUserControl_ranked_length_of_service;
  end;

implementation

uses
  appcommon,
  kix,
  system.configuration;

procedure TWebUserControl_ranked_length_of_service.Page_Load(sender: System.Object; e: System.EventArgs);
var
  be_trendable: boolean;
begin
  //
  if not p.be_loaded then begin
    //
    p.biz_members.BindSpecialForRankedLengthOfService(DataGrid_special);
    //
    p.citywide_years_of_service_array_list.Sort;
    Label_overall.text := Median(p.citywide_years_of_service_array_list).tostring('F2');
    //
    be_trendable := (session['mode:report/monthly-core-ops-dashboard'] <> nil);
    //
    p.biz_indicator_median_length_of_service.Log
      (
      be_trendable,
      p.citywide_years_of_service_array_list,
      p.ems_years_of_service_array_list,
      p.r01_years_of_service_array_list,
      p.r02_years_of_service_array_list,
      p.r04_years_of_service_array_list,
      p.r05_years_of_service_array_list,
      p.r06_years_of_service_array_list,
      p.r09_years_of_service_array_list,
      p.r13_years_of_service_array_list,
      p.r14_years_of_service_array_list,
      p.r16_years_of_service_array_list,
      p.r17_years_of_service_array_list
      );
    p.biz_indicator_median_length_of_service.BindLatestRankedYearsOfService(DataGrid_detail,be_trendable);
    //
    p.be_loaded := TRUE;
    //
  end;
  //
end;

procedure TWebUserControl_ranked_length_of_service.OnInit(e: System.EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
  if IsPostback
    and (session['UserControl_ranked_length_of_service.p'] <> nil)
    and (session['UserControl_ranked_length_of_service.p'].GetType.namespace = p.GetType.namespace)
  then begin
    p := p_type(session['UserControl_ranked_length_of_service.p']);
  end else begin
    //
    p.be_loaded := FALSE;
    p.biz_members := TClass_biz_members.Create;
    p.biz_indicator_median_length_of_service := TClass_biz_indicator_median_length_of_service.Create;
    p.citywide_years_of_service_array_list := arraylist.Create;
    p.ems_years_of_service_array_list := arraylist.Create;
    p.r01_years_of_service_array_list := arraylist.Create;
    p.r02_years_of_service_array_list := arraylist.Create;
    p.r04_years_of_service_array_list := arraylist.Create;
    p.r05_years_of_service_array_list := arraylist.Create;
    p.r06_years_of_service_array_list := arraylist.Create;
    p.r09_years_of_service_array_list := arraylist.Create;
    p.r13_years_of_service_array_list := arraylist.Create;
    p.r14_years_of_service_array_list := arraylist.Create;
    p.r16_years_of_service_array_list := arraylist.Create;
    p.r17_years_of_service_array_list := arraylist.Create;
    p.rank := 0;
    //
  end;
  //
end;

procedure TWebUserControl_ranked_length_of_service.DataGrid_special_ItemDataBound(sender: System.Object;
  e: System.Web.UI.WebControls.DataGridItemEventArgs);
var
  years_of_service: decimal;
begin
  if (e.item.itemtype = listitemtype.alternatingitem)
    or (e.item.itemtype = listitemtype.edititem)
    or (e.item.itemtype = listitemtype.item)
    or (e.item.itemtype = listitemtype.selecteditem)
  then begin
    //
    // We are dealing with a data row, not a header or footer row.
    //
    if e.item.cells[1].text <> '&nbsp;' then begin
      years_of_service := decimal.Parse(e.item.cells[1].text);
      p.citywide_years_of_service_array_list.Add(years_of_service);
      case uint32.Parse(e.item.cells[0].text) of
      00: p.ems_years_of_service_array_list.Add(years_of_service);
      01: p.r01_years_of_service_array_list.Add(years_of_service);
      02: p.r02_years_of_service_array_list.Add(years_of_service);
      04: p.r04_years_of_service_array_list.Add(years_of_service);
      05: p.r05_years_of_service_array_list.Add(years_of_service);
      06: p.r06_years_of_service_array_list.Add(years_of_service);
      09: p.r09_years_of_service_array_list.Add(years_of_service);
      13: p.r13_years_of_service_array_list.Add(years_of_service);
      14: p.r14_years_of_service_array_list.Add(years_of_service);
      16: p.r16_years_of_service_array_list.Add(years_of_service);
      17: p.r17_years_of_service_array_list.Add(years_of_service);
      end;
    end;
  end;
end;

procedure TWebUserControl_ranked_length_of_service.DataGrid_detail_ItemDataBound(sender: System.Object;
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
    p.rank := p.rank + 1;
    e.item.cells[0].text := p.rank.tostring;
  end;
end;

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebUserControl_ranked_length_of_service.InitializeComponent;
begin
  Include(Self.DataGrid_detail.ItemDataBound, Self.DataGrid_detail_ItemDataBound);
  Include(Self.DataGrid_special.ItemDataBound, Self.DataGrid_special_ItemDataBound);
  Include(Self.Load, Self.Page_Load);
  Include(Self.PreRender, Self.TWebUserControl_ranked_length_of_service_PreRender);
end;
{$ENDREGION}

procedure TWebUserControl_ranked_length_of_service.TWebUserControl_ranked_length_of_service_PreRender(sender: System.Object;
  e: System.EventArgs);
begin
  session.Remove('UserControl_ranked_length_of_service.p');
  session.Add('UserControl_ranked_length_of_service.p',p);
end;

function TWebUserControl_ranked_length_of_service.Fresh: TWebUserControl_ranked_length_of_service;
begin
  session.Remove('UserControl_ranked_length_of_service.p');
  Fresh := self;
end;

end.
