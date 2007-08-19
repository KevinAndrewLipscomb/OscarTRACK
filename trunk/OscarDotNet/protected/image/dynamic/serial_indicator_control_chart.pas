unit serial_indicator_control_chart;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls;

type
  TWebForm1 = class(System.Web.UI.Page)
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
  Class_biz_agencies,
  com.quinncurtis.chart2dnet,
  com.quinncurtis.spcchartnet,
  ki,
  system.drawing.imaging,
  system.drawing.text;

CONST
  AVERAGE_NUM_MINUTES_PER_MONTH = 43829; // takes into account all scheduled leap days

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm1.InitializeComponent;
begin    
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm1.Page_Load(sender: System.Object; e: System.EventArgs);
var
  chart: spctimevariablecontrolchart;
  datum: serial_indicator_rec_type;
  history: queue;
  i: cardinal;
  image: bufferedimage;
begin
  chart := spctimevariablecontrolchart.Create
    (
    spccontrolchartdata.INDIVIDUAL_RANGE_CHART,
    1,                             // One data point per month
    15,                            // months wide
    AVERAGE_NUM_MINUTES_PER_MONTH  // time distance between data points
    );
  chart.autoscroll := TRUE;
  chart.bounds := rectangle.Create(0,0,781,417);
  chart.headerstringslevel := spccontrolchartdata.HEADER_STRINGS_LEVEL0;
  chart.enablecalculatedvalues := FALSE;
  chart.enablenotes := FALSE;
  chart.enabletimevalues := FALSE;
  chart.enabletotalsamplesvalues := FALSE;
  history := TClass_biz_agencies.Create.SerialIndicatorData
    (
    Safe(request['indicator'],ECMASCRIPT_WORD),
    Safe(request['agency'],NUM),
    Safe(request['be_agency_applicable'],NUM)
    );
  for i := 0 to (history.Count - 1) do begin
    datum := serial_indicator_rec_type(history.Dequeue);
    chart.chartdata.AddNewSampleRecord
      (
      chartcalendar.Create(datum.year,datum.month,1),
      doublearray.Create([datum.value])
      );
  end;
  chart.AutoCalculatePrimaryControlLimits;
  chart.AutoScalePrimaryChartYRange;
  chart.secondarychart.displaychart := FALSE;
  chart.textrenderinghint := textrenderinghint.CLEARTYPEGRIDFIT;
  chart.RebuildChartUsingCurrentData;
  //
  image := bufferedimage.Create(chart,imageformat.JPEG);
  image.jpegimagequality := 100;
  image.SaveImage(response.outputstream);
  //
end;

procedure TWebForm1.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
  //
end;

end.

