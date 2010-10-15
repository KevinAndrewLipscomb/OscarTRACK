// Derived from UserControl~template~std.ascx.cs~template

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
  public struct p_type
    {
    public bool be_loaded;
    public TClass_biz_residents biz_residents;
    }

  public partial class TWebUserControl_scene_visits_to_love_letter_targets: ki_web_ui.usercontrol_class
    {

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_scene_visits_to_love_letter_targets.p"] != null)
        {
        p = (p_type)(Session["UserControl_scene_visits_to_love_letter_targets.p"]);
        p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_scene_visits_to_love_letter_targets");
        }
      else
        {
        p.biz_residents = new TClass_biz_residents();
        p.be_loaded = false;
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
      SessionSet("UserControl_scene_visits_to_love_letter_targets.p", p);
      }

    public TWebUserControl_scene_visits_to_love_letter_targets Fresh()
      {
      Session.Remove("UserControl_scene_visits_to_love_letter_targets.p");
      return this;
      }

    protected void Button_process_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        TextBox_love_letter_targets.Text = p.biz_residents.FilteredFromSceneVisits
          (
          k.Safe(TextBox_scene_visits.Text,k.safe_hint_type.MEMO),
          k.Safe(TextBox_batch_designator.Text,k.safe_hint_type.HYPHENATED_ALPHANUM)
          );
        }
      }

    } // end TWebUserControl_scene_visits_to_love_letter_targets

  }
