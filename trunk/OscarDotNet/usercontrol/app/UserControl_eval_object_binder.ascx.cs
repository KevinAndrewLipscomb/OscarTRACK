// Derived from KiAspdotnetFramework/UserControl/app/UserControl~eval_object~binder.cs~eval_object

using kix;
using UserControl_care_skill;
using UserControl_driver_skill;
using UserControl_patient_age_unit;
using UserControl_patient_encounter_level;
using UserControl_skill_rating;

namespace UserControl_eval_object_binder
  {

  public class UserControl_eval_object_binder_Static
    {
    public const int TSSI_SKILL_RATINGS = 0;
    public const int TSSI_CARE_SKILLS = 1;
    public const int TSSI_DRIVER_SKILLS = 2;
    public const int TSSI_PATIENT_ENCOUNTER_LEVELS = 3;
    public const int TSSI_PATIENT_AGE_UNITS = 4;
    }

  public partial class TWebUserControl_eval_object_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private struct p_type
      {
      internal bool be_loaded;
      internal string content_id;
      internal uint tab_index;
      }

    private p_type p;

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
      )
      {
      if (p.tab_index == UserControl_eval_object_binder_Static.TSSI_SKILL_RATINGS)
        {
        var c = ((TWebUserControl_skill_rating)(LoadControl("~/usercontrol/app/UserControl_skill_rating.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_0",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_eval_object_binder_Static.TSSI_CARE_SKILLS)
        {
        var c = ((TWebUserControl_care_skill)(LoadControl("~/usercontrol/app/UserControl_care_skill.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_care_skills",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_eval_object_binder_Static.TSSI_DRIVER_SKILLS)
        {
        var c = ((TWebUserControl_driver_skill)(LoadControl("~/usercontrol/app/UserControl_driver_skill.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_driver_skills",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_eval_object_binder_Static.TSSI_PATIENT_ENCOUNTER_LEVELS)
        {
        var c = ((TWebUserControl_patient_encounter_level)(LoadControl("~/usercontrol/app/UserControl_patient_encounter_level.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_patient_encounter_level",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_eval_object_binder_Static.TSSI_PATIENT_AGE_UNITS)
        {
        var c = ((TWebUserControl_patient_age_unit)(LoadControl("~/usercontrol/app/UserControl_patient_age_unit.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_patient_age_unit",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_eval_object_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_eval_object_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_eval_object_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.be_loaded = false;
        //
        p.tab_index = UserControl_eval_object_binder_Static.TSSI_SKILL_RATINGS;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_eval_object_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/skill-rating/"))
          {
          p.tab_index = UserControl_eval_object_binder_Static.TSSI_SKILL_RATINGS;
          }
        else if (target.ToLower().Contains("/care-skill/"))
          {
          p.tab_index = UserControl_eval_object_binder_Static.TSSI_CARE_SKILLS;
          }
        else if (target.ToLower().Contains("/driver-skill/"))
          {
          p.tab_index = UserControl_eval_object_binder_Static.TSSI_DRIVER_SKILLS;
          }
        else if (target.ToLower().Contains("/patient-encounter-level/"))
          {
          p.tab_index = UserControl_eval_object_binder_Static.TSSI_PATIENT_ENCOUNTER_LEVELS;
          }
        else if (target.ToLower().Contains("/patient-age_unit/"))
          {
          p.tab_index = UserControl_eval_object_binder_Static.TSSI_PATIENT_AGE_UNITS;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_eval_object_binder

  }

