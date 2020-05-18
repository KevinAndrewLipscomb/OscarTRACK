using kix;
using UserControl_business_objects_binder;
using UserControl_roles_and_matrices_binder;
using UserControl_users_and_mapping_binder;

namespace UserControl_config_binder
  {

  public partial class TWebUserControl_config_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TSSI_ROLES_AND_MATRICES = 0;
      public const int TSSI_USERS_AND_MAPPING = 1;
      public const int TSSI_BUSINESS_OBJECTS = 2;
      }

    private struct p_type
      {
      public bool be_loaded;
      public string content_id;
      public uint tab_index;
      }

    private p_type p;

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target = k.EMPTY
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == Static.TSSI_ROLES_AND_MATRICES)
        {
        var c = ((TWebUserControl_roles_and_matrices_binder)(LoadControl("~/usercontrol/app/UserControl_roles_and_matrices_binder.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_roles_and_matrices_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_USERS_AND_MAPPING)
        {
        var c = ((TWebUserControl_users_and_mapping_binder)(LoadControl("~/usercontrol/app/UserControl_users_and_mapping_binder.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_users_and_mapping_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_BUSINESS_OBJECTS)
        {
        var c = ((TWebUserControl_business_objects_binder)(LoadControl("~/usercontrol/app/UserControl_business_objects_binder.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_business_objects_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_config_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (k.Has((string[])(Session["privilege_array"]), "config-users"))
          {
          TabPanel_users_and_mappings.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-business-objects"))
          {
          TabPanel_business_objects.Enabled = true;
          }
        p.be_loaded = true;
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void TWebUserControl_config_binder_PreRender(object sender, System.EventArgs e)
      {
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_config");
          }
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = Static.TSSI_ROLES_AND_MATRICES;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_config_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/roles-and-mappings/"))
          {
          p.tab_index = Static.TSSI_ROLES_AND_MATRICES;
          }
        else if (target.ToLower().Contains("/users-and-mappings/"))
          {
          p.tab_index = Static.TSSI_USERS_AND_MAPPING;
          }
        else if (target.ToLower().Contains("/business-objects/"))
          {
          p.tab_index = Static.TSSI_BUSINESS_OBJECTS;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_config_binder

  }
