using Class_biz_user;
using kix;
using UserControl_my_roles_and_mappings;
using UserControl_notification;
using UserControl_privilege;
using UserControl_role;
using UserControl_role_member_mapping;
using UserControl_role_notification_mapping;
using UserControl_role_privilege_mapping;

namespace UserControl_roles_and_matrices_binder
  {

  public partial class TWebUserControl_roles_and_matrices_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TSSI_MINE = 0;
      public const int TSSI_ROLES = 1;
      public const int TSSI_ROLE_MEMBER_MAPPING = 2;
      public const int TSSI_PRIVILEGES = 3;
      public const int TSSI_ROLE_PRIVILEGE_MAPPING = 4;
      public const int TSSI_NOTIFICATIONS = 5;
      public const int TSSI_ROLE_NOTIFICATION_MAPPING = 6;
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_user biz_user;
      public string content_id;
      public uint tab_index;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target = k.EMPTY
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == Static.TSSI_MINE)
        {
        var c = ((TWebUserControl_my_roles_and_mappings)(LoadControl("~/usercontrol/app/UserControl_my_roles_and_mappings.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_my_roles_and_mappings",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLES)
        {
        var c = ((TWebUserControl_role)(LoadControl("~/usercontrol/app/UserControl_role.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_MEMBER_MAPPING)
        {
        var c = ((TWebUserControl_role_member_mapping)(LoadControl("~/usercontrol/app/UserControl_role_member_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_member_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_PRIVILEGES)
        {
        var c = ((TWebUserControl_privilege)(LoadControl("~/usercontrol/app/UserControl_privilege.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_privilege",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_PRIVILEGE_MAPPING)
        {
        var c = ((TWebUserControl_role_privilege_mapping)(LoadControl("~/usercontrol/app/UserControl_role_privilege_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_privilege_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_NOTIFICATIONS)
        {
        var c = ((TWebUserControl_notification)(LoadControl("~/usercontrol/app/UserControl_notification.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_notification",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_ROLE_NOTIFICATION_MAPPING)
        {
        var c = ((TWebUserControl_role_notification_mapping)(LoadControl("~/usercontrol/app/UserControl_role_notification_mapping.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_role_notification_mapping",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
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
      PreRender += TWebUserControl_roles_and_matrices_binder_PreRender;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (p.biz_user.Privileges().Length > 0)
          {
          TabPanel_privileges.Enabled = true;
          }
        if (p.biz_user.Notifications().Length > 0)
          {
          TabPanel_notifications.Enabled = true;
          }
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

    private void TWebUserControl_roles_and_matrices_binder_PreRender(object sender, System.EventArgs e)
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config_roles_and_matrices_binder")
          {
          p.be_loaded &= ((Session["M_UserControl_config_PlaceHolder_content"] as string) == "UserControl_roles_and_matrices_binder");
          }
        //
        // Dynamic controls must be re-added on each postback.
        //
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_user = new TClass_biz_user();
        //
        p.be_loaded = false;
        p.tab_index = Static.TSSI_ROLE_MEMBER_MAPPING;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_roles_and_matrices_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/mine/"))
          {
          p.tab_index = Static.TSSI_MINE;
          }
        else if (target.ToLower().Contains("/roles/"))
          {
          p.tab_index = Static.TSSI_ROLES;
          }
        else if (target.ToLower().Contains("/role-member-mappings/"))
          {
          p.tab_index = Static.TSSI_ROLE_MEMBER_MAPPING;
          }
        else if (target.ToLower().Contains("/privileges/"))
          {
          p.tab_index = Static.TSSI_PRIVILEGES;
          }
        else if (target.ToLower().Contains("/role-privilege-mappings/"))
          {
          p.tab_index = Static.TSSI_ROLE_PRIVILEGE_MAPPING;
          }
        else if (target.ToLower().Contains("/notifications/"))
          {
          p.tab_index = Static.TSSI_NOTIFICATIONS;
          }
        else if (target.ToLower().Contains("/role-notification-mappings/"))
          {
          p.tab_index = Static.TSSI_ROLE_NOTIFICATION_MAPPING;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_roles_and_matrices_binder

  }
