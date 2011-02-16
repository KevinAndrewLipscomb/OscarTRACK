// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_schedule_assignment_assistant_alert_binder;
using UserControl_schedule_assignment_assistant_holdouts;
using UserControl_schedule_assignment_assistant_special_requests;
using UserControl_schedule_proposal;

namespace UserControl_schedule_assignment_assistant_binder
  {
  public class UserControl_schedule_assignment_assistant_binder_Static
    {
    public const int TSSI_HOLDOUTS = 0;
    public const int TSSI_ALERT = 1;
    public const int TSSI_SPECIAL_REQUESTS = 2;
    public const int TSSI_PROPOSAL = 3;
    }

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public string content_id;
    public k.subtype<int> relative_month;
    public string release_filter;
    public uint tab_index;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    protected TWebUserControl_schedule_assignment_assistant_alert_binder UserControl_schedule_assignment_assistant_alert_binder = null;
    protected TWebUserControl_schedule_assignment_assistant_holdouts UserControl_schedule_assignment_assistant_holdouts = null;
    protected TWebUserControl_schedule_assignment_assistant_special_requests UserControl_schedule_assignment_assistant_special_requests = null;
    protected TWebUserControl_schedule_proposal UserControl_schedule_proposal = null;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter);
        DropDownList_agency_filter.SelectedValue = p.agency_filter;
        DropDownList_release_filter.SelectedValue = p.release_filter;
        RadioButtonList_which_month.SelectedValue = p.relative_month.val.ToString();
        RadioButtonList_which_month.Enabled = p.biz_schedule_assignments.BeOkToWorkOnNextMonth();
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      UserControl_schedule_assignment_assistant_holdouts = ((TWebUserControl_schedule_assignment_assistant_holdouts)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_holdouts.ascx")));
      UserControl_schedule_assignment_assistant_alert_binder = ((TWebUserControl_schedule_assignment_assistant_alert_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_binder.ascx")));
      UserControl_schedule_assignment_assistant_special_requests = ((TWebUserControl_schedule_assignment_assistant_special_requests)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_special_requests.ascx")));
      UserControl_schedule_proposal = ((TWebUserControl_schedule_proposal)(LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx")));
      //
      if (Session["UserControl_schedule_assignment_assistant_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_holdouts, "UserControl_schedule_assignment_assistant_holdouts", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_binder, "UserControl_schedule_assignment_assistant_alert_binder", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_special_requests, "UserControl_schedule_assignment_assistant_special_requests", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PROPOSAL)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_proposal, "UserControl_schedule_proposal", PlaceHolder_content);
          }
        }
      else
        {
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        if (p.be_user_privileged_to_see_all_squads)
          {
          p.agency_filter = k.EMPTY;
          }
        else
          {
          p.agency_filter = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
          }
        p.be_loaded = false;
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS;
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_holdouts.Fresh(), "UserControl_schedule_assignment_assistant_holdouts", PlaceHolder_content);
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        }
      }

    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_schedule_assignment_assistant_binder_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_schedule_assignment_assistant_binder.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_binder Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_binder.p");
      return this;
      }

    protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void DropDownList_release_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.release_filter = k.Safe(DropDownList_release_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void RadioButtonList_which_month_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.relative_month.val = int.Parse(k.Safe(RadioButtonList_which_month.SelectedValue,k.safe_hint_type.NUM));
      Bind();
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_holdouts.Fresh(), "UserControl_schedule_assignment_assistant_holdouts", PlaceHolder_content);
        UserControl_schedule_assignment_assistant_holdouts.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_binder.Fresh(), "UserControl_schedule_assignment_assistant_alert_binder", PlaceHolder_content);
        UserControl_schedule_assignment_assistant_alert_binder.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_special_requests.Fresh(), "UserControl_schedule_assignment_assistant_special_requests", PlaceHolder_content);
        UserControl_schedule_assignment_assistant_special_requests.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PROPOSAL)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_proposal.Fresh(), "UserControl_schedule_proposal", PlaceHolder_content);
        UserControl_schedule_proposal.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }

    private void Bind()
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
        {
        UserControl_schedule_assignment_assistant_holdouts.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
        {
        UserControl_schedule_assignment_assistant_alert_binder.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
        {
        UserControl_schedule_assignment_assistant_special_requests.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PROPOSAL)
        {
        UserControl_schedule_proposal.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }

    }

  }

