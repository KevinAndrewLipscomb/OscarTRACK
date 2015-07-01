// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using UserControl_incident_nature;
using UserControl_ephemeral_dispatch;
using UserControl_incident_nature_translation;

namespace UserControl_cad_object_binder
  {

  public partial class TWebUserControl_cad_object_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TSSI_INCIDENT_NATURES = 0;
      public const int TSSI_EPHEMERAL_DISPATCHES = 1;
      public const int TSSI_INCIDENT_NATURE_TRANSLATIONS = 2;
      }

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
      if (p.tab_index == Static.TSSI_INCIDENT_NATURES)
        {
        var c = ((TWebUserControl_incident_nature)(LoadControl("~/usercontrol/app/UserControl_incident_nature.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_incident_nature",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_EPHEMERAL_DISPATCHES)
        {
        var c = ((TWebUserControl_ephemeral_dispatch)(LoadControl("~/usercontrol/app/UserControl_ephemeral_dispatch.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_ephemeral_dispatch",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_INCIDENT_NATURE_TRANSLATIONS)
        {
        var c = ((TWebUserControl_incident_nature_translation)(LoadControl("~/usercontrol/app/UserControl_incident_nature_translation.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_incident_nature_translation",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
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
      PreRender += TWebUserControl_cad_object_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_cad_object_binder_PreRender(object sender, System.EventArgs e)
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
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config_business_objects_binder_cad_object_binder")
          {
          p.be_loaded &= ((Session["M_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_cad_object_binder");
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
        p.tab_index = Static.TSSI_INCIDENT_NATURES;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_cad_object_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/incident-natures/"))
          {
          p.tab_index = Static.TSSI_INCIDENT_NATURES;
          }
        else if (target.ToLower().Contains("/ephemeral-dispatches/"))
          {
          p.tab_index = Static.TSSI_EPHEMERAL_DISPATCHES;
          }
        else if (target.ToLower().Contains("/incident-nature-translations/"))
          {
          p.tab_index = Static.TSSI_INCIDENT_NATURE_TRANSLATIONS;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_cad_object_binder

  }

