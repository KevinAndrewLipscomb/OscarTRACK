using Class_biz_schedule_assignment_logs;
using Class_biz_role_member_map;
using kix;
using System.Web.UI.WebControls;

namespace UserControl_ranked_scheduled_duty_compliance
  {

  public partial class TWebUserControl_ranked_scheduled_duty_compliance: ki_web_ui.usercontrol_class
    {

    public struct p_type
      {
      public bool be_loaded;
      public TClass_biz_schedule_assignment_logs biz_schedule_assignment_logs;
      public TClass_biz_role_member_map biz_role_member_map;
      public uint rank;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Label_overall.Text = p.biz_schedule_assignment_logs.OverallScheduledDutyCompliance();
        if (Label_overall.Text != k.EMPTY)
          {
          Label_overall.Text = Label_overall.Text + " %";
          p.biz_schedule_assignment_logs.BindRankedScheduledDutyCompliance(DataGrid_detail);
          DataGrid_detail.Visible = true;
          Label_no_data.Visible = false;
          }
        else
          {
          Label_overall.Text = "?";
          Label_no_data.Visible = true;
          DataGrid_detail.Visible = false;
          }
        p.be_loaded = true;
        }
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
        p.biz_schedule_assignment_logs = new TClass_biz_schedule_assignment_logs();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.rank = 0;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_detail.ItemDataBound += new DataGridItemEventHandler(this.DataGrid_detail_ItemDataBound);
      PreRender += this.TWebUserControl_ranked_scheduled_duty_compliance_PreRender;
      }

    private void TWebUserControl_ranked_scheduled_duty_compliance_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_ranked_scheduled_duty_compliance Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_detail_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().Contains("Item"))
        {
        // We are dealing with a data row, not a header or footer row.
        p.rank = p.rank + 1;
        e.Item.Cells[0].Text = p.rank.ToString();
        }
      }

    } // end TWebUserControl_ranked_scheduled_duty_compliance

}
