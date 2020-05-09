using Class_biz_agencies;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace UserControl_serial_indicator_num_core_ops_members
{
    public partial class TWebUserControl_serial_indicator_num_core_ops_members: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int AVERAGE_NUM_MINUTES_PER_MONTH = 43829; // takes into account all scheduled leap days
      public const string DEFAULT_WIDTH_IN_MONTHS = "27"; // should allow easy reading of top margin values
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_agencies biz_agencies;
      public string width_in_months;
      public string width_in_months_max;
      }

        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!p.be_loaded)
            {
                RangeValidator_width_in_months.MaximumValue = p.width_in_months_max;
                RangeValidator_width_in_months.ErrorMessage = RangeValidator_width_in_months.ErrorMessage.Replace("#",p.width_in_months_max);
                TextBox_width_in_months.Text = p.width_in_months;
                Bind();
                p.be_loaded = true;
            }

        }

        private void Bind()
          {
          p.biz_agencies.BindForControlCharts("core_ops_size", DataGrid_control_charts);
          }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack && (Session[InstanceId() + ".p"] != null))
            {
                p = (p_type)(Session[InstanceId() + ".p"]);
            }
            else
            {
                p.be_loaded = false;
                p.biz_agencies = new TClass_biz_agencies();
                p.width_in_months = Static.DEFAULT_WIDTH_IN_MONTHS;
                p.width_in_months_max =
                  Math.Max
                    (
                    val1:double.Parse(Static.DEFAULT_WIDTH_IN_MONTHS),
                    val2:Math.Truncate(DateTime.Today.Subtract(DateTime.Parse(ConfigurationManager.AppSettings["year_month_spec_of_first_serial_dashboard_data_point"] + "-01")).TotalMinutes/Static.AVERAGE_NUM_MINUTES_PER_MONTH)
                    )
                    .ToString("f0");
            }

        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebUserControl_serial_indicator_num_core_ops_members_PreRender;
        }

        private void TWebUserControl_serial_indicator_num_core_ops_members_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        public TWebUserControl_serial_indicator_num_core_ops_members Fresh()
        {
            TWebUserControl_serial_indicator_num_core_ops_members result;
            Session.Remove(InstanceId() + ".p");
            result = this;
            return result;
        }

    protected void Button_go_Click(object sender, EventArgs e)
      {
      p.width_in_months = k.Safe(TextBox_width_in_months.Text,k.safe_hint_type.NUM);
      Bind();
      }

    protected void Button_max_Click(object sender, EventArgs e)
      {
      p.width_in_months = p.width_in_months_max;
      TextBox_width_in_months.Text = p.width_in_months_max;
      Bind();
      }

    protected void Button_default_Click(object sender, EventArgs e)
      {
      p.width_in_months = Static.DEFAULT_WIDTH_IN_MONTHS;
      TextBox_width_in_months.Text = Static.DEFAULT_WIDTH_IN_MONTHS;
      Bind();
      }

    protected void DataGrid_control_charts_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList() {ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.Item,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var image_control = (e.Item.Cells[0].FindControl("Image_control") as Image);
        image_control.ImageUrl = k.ExpandTildePath(image_control.ImageUrl + "&width_in_months=" + p.width_in_months);
        }
      }

    } // end TWebUserControl_serial_indicator_num_core_ops_members

}
