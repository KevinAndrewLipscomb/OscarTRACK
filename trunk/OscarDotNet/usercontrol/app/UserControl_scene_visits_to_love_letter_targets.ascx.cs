// Derived from UserControl~template~std.ascx.cs~template

using Class_biz_love_letter_batches;
using Class_biz_residents;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UserControl_scene_visits_to_love_letter_targets
  {
    public static class UserControl_scene_visits_to_love_letter_targets_Static
      {
      public const int LIMIT = 10;
      }

  public partial class TWebUserControl_scene_visits_to_love_letter_targets: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public string agency;
      public bool be_loaded;
      public TClass_biz_love_letter_batches biz_love_letter_batches;
      public TClass_biz_residents biz_residents;
      public k.int_positive limit;
      }

    private p_type p;

    private void Bind()
      {
      p.biz_love_letter_batches.BindRecentToBaseDataList
        (
        agency:p.agency,
        limit:p.limit,
        target:DataGrid_control
        );
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Literal_limit.Text = p.limit.val.ToString();
        //
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_funddrive_binder_PlaceHolder_content"] as string) == "UserControl_scene_visits_to_love_letter_targets");
        }
      else
        {
        p.biz_love_letter_batches = new TClass_biz_love_letter_batches();
        p.biz_residents = new TClass_biz_residents();
        //
        p.be_loaded = false;
        //
        p.agency = k.EMPTY;
        p.limit = new k.int_positive(UserControl_scene_visits_to_love_letter_targets_Static.LIMIT);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.PreRender += this.TWebUserControl_scene_visits_to_love_letter_targets_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_scene_visits_to_love_letter_targets_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_scene_visits_to_love_letter_targets Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_process_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        TextBox_love_letter_targets.Text = p.biz_residents.FilteredFromSceneVisits
          (
          scene_visits:k.Safe(TextBox_scene_visits.Text,k.safe_hint_type.MEMO),
          love_letter_batch_designator:k.Safe(TextBox_batch_designator.Text,k.safe_hint_type.HYPHENATED_ALPHANUM),
          agency:p.agency
          );
        }
      }

    internal void SetTarget(string agency)
      {
      p.agency = agency;
      Bind();
      }

    } // end TWebUserControl_scene_visits_to_love_letter_targets

  }
