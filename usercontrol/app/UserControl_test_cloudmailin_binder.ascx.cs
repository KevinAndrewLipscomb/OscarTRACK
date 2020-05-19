// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using UserControl_test_cloudmailin_fleetman;
using UserControl_test_cloudmailin_group;
using System;

namespace UserControl_test_cloudmailin_binder
  {

  public partial class TWebUserControl_test_cloudmailin_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TSSI_FLEETMAN = 0;
      public const int TSSI_GROUP = 1;
      }

    private struct p_type
      {
      internal bool be_loaded;
      internal string content_id;
      internal uint tab_index;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == Static.TSSI_FLEETMAN)
        {
        var c = ((TWebUserControl_test_cloudmailin_fleetman)(LoadControl("~/usercontrol/app/UserControl_test_cloudmailin_fleetman.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_test_cloudmailin_fleetman",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      else if (p.tab_index == Static.TSSI_GROUP)
        {
        var c = ((TWebUserControl_test_cloudmailin_group)(LoadControl("~/usercontrol/app/UserControl_test_cloudmailin_group.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_test_cloudmailin_group",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
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
      PreRender += TWebUserControl_test_cloudmailin_binder_PreRender;
      }

    private void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_test_cloudmailin_binder_PreRender(object sender, EventArgs e)
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

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_test_binder_test_cloudmailin_binder")
          {
          p.be_loaded &= ((Session["M_UserControl_test_binder_PlaceHolder_content"] as string) == "UserControl_test_cloudmailin_binder");
          }
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.be_loaded = false;
        //
        p.tab_index = Static.TSSI_FLEETMAN;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_test_cloudmailin_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/fleetman/"))
          {
          p.tab_index = Static.TSSI_FLEETMAN;
          }
        else if (target.ToLower().Contains("/group/"))
          {
          p.tab_index = Static.TSSI_GROUP;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_test_cloudmailin_binder

  }
