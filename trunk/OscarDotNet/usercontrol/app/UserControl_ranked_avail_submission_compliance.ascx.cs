using Class_biz_schedule_assignments;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_ranked_avail_submission_compliance
  {

  public partial class TWebUserControl_ranked_avail_submission_compliance: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public uint rank;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_schedule_assignments.BindRankedAvailabilitySubmissionCompliance(DataGrid_detail);
        Label_overall.Text = p.biz_schedule_assignments.OverallAvailabilitySubmissionCompliance();
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
        //
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.rank = 0;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_detail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_detail_ItemDataBound);
      PreRender += TWebUserControl_ranked_avail_submission_compliance_PreRender;
      }

    private void TWebUserControl_ranked_avail_submission_compliance_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p",p);
      }

    public TWebUserControl_ranked_avail_submission_compliance Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_detail_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.Item,ListItemType.AlternatingItem,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        // We are dealing with a data row, not a header or footer row.
        p.rank++;
        e.Item.Cells[0].Text = p.rank.ToString();
        }
      }

    } // end TWebUserControl_ranked_avail_submission_compliance

  }
