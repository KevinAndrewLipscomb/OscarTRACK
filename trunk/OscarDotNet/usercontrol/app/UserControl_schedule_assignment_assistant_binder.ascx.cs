// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_schedule_assignment_assistant_alert_binder;
using UserControl_schedule_assignment_assistant_holdouts;
using UserControl_schedule_assignment_assistant_intro;
using UserControl_schedule_assignment_assistant_publish;
using UserControl_schedule_assignment_assistant_special_requests;
using UserControl_schedule_proposal;

namespace UserControl_schedule_assignment_assistant_binder
  {
  public class UserControl_schedule_assignment_assistant_binder_Static
    {
    public const int TSSI_HOLDOUTS = 0;
    public const int TSSI_ALERT = 1;
    public const int TSSI_SPECIAL_REQUESTS = 2;
    public const int TSSI_WATCHBILL = 3;
    public const int TSSI_PUBLISH = 4;
    public const int TSSI_ABOUT = 5;
    }

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_ok_to_edit_schedule;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
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
    protected TWebUserControl_schedule_assignment_assistant_intro UserControl_schedule_assignment_assistant_intro = null;
    protected TWebUserControl_schedule_assignment_assistant_publish UserControl_schedule_assignment_assistant_publish = null;
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
        RadioButtonList_which_month.Enabled = ((p.be_ok_to_edit_schedule || !p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,new k.subtype<int>(1,1))) && p.biz_schedule_assignments.BeOkToWorkOnNextMonth());
        Button_refresh.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_holdouts.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_alert.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_special_requests.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_publish_print.Enabled = p.be_ok_to_edit_schedule;
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
      UserControl_schedule_assignment_assistant_intro = ((TWebUserControl_schedule_assignment_assistant_intro)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_intro.ascx")));
      UserControl_schedule_assignment_assistant_alert_binder = ((TWebUserControl_schedule_assignment_assistant_alert_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_binder.ascx")));
      UserControl_schedule_assignment_assistant_special_requests = ((TWebUserControl_schedule_assignment_assistant_special_requests)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_special_requests.ascx")));
      UserControl_schedule_proposal = ((TWebUserControl_schedule_proposal)(LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx")));
      UserControl_schedule_assignment_assistant_publish = ((TWebUserControl_schedule_assignment_assistant_publish)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_publish.ascx")));
      //
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_S_PlaceHolder_content"] as string) == "G");
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.be_ok_to_edit_schedule = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.agency_filter = (p.biz_schedule_assignments.BeOkToDefaultAgencyFilterToAll(p.be_user_privileged_to_see_all_squads,p.biz_user.Roles()) ? k.EMPTY : p.biz_members.AgencyIdOfId(Session["member_id"].ToString()));
        p.be_loaded = false;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        if (p.be_ok_to_edit_schedule)
          {
          p.tab_index = (uint)UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS;
          }
        else
          {
          p.tab_index = (uint)UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL;
          }
        FillPlaceHolder(true);
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
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_refresh_Click(object sender, System.EventArgs e)
      {
      p.biz_schedule_assignments.Update(p.relative_month.val.ToString());
      Bind();
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
      FillPlaceHolder(true);
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
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL)
        {
        UserControl_schedule_proposal.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH)
        {
        UserControl_schedule_assignment_assistant_publish.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
      )
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
        {
        var c = UserControl_schedule_assignment_assistant_holdouts;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_holdouts",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
        {
        var c = UserControl_schedule_assignment_assistant_alert_binder;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
        {
        var c = UserControl_schedule_assignment_assistant_special_requests;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_special_requests",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL)
        {
        var c = UserControl_schedule_proposal;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"C",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        //c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH)
        {
        var c = UserControl_schedule_assignment_assistant_publish;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_publish",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ABOUT)
        {
        var c = UserControl_schedule_assignment_assistant_intro;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_intro",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/compliance/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS;
          }
        else if (target.ToLower().Contains("/alert/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT;
          }
        else if (target.ToLower().Contains("/special-requests/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS;
          }
        else if (target.ToLower().Contains("/proposal/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL;
          }
        else if (target.ToLower().Contains("/publish/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH;
          }
        else if (target.ToLower().Contains("/about/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_ABOUT;
          }
        //
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    }

  }

