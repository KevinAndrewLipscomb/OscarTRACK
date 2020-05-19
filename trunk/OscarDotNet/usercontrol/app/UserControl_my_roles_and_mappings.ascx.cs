// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using Class_biz_notifications;
using Class_biz_user;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

namespace UserControl_my_roles_and_mappings
  {

  public partial class TWebUserControl_my_roles_and_mappings: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_interactive;
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public TClass_biz_notifications biz_notifications;
      public TClass_biz_user biz_user;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_user.BindRolesToBaseDataList(DataGrid_role);
        TableRow_no_roles.Visible = (DataGrid_role.Items.Count == 0);
        TableRow_role_data.Visible = !TableRow_no_roles.Visible;
        //
        p.biz_user.BindPrivilegesToBaseDataList(DataGrid_privilege);
        TableRow_no_privileges.Visible = (DataGrid_privilege.Items.Count == 0);
        TableRow_privilege_data.Visible = !TableRow_no_privileges.Visible;
        //
        p.biz_user.BindNotificationsToBaseDataList(DataGrid_notification);
        TableRow_no_notifications.Visible = (DataGrid_notification.Items.Count == 0);
        TableRow_notification_data.Visible = !TableRow_no_notifications.Visible;
        //
        p.be_loaded = true;
        }
      }

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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_config_binder_roles_and_matrices_binder_my_roles_and_mappings")
          {
          p.be_loaded &= ((Session["UserControl_member_binder_UserControl_config_binder_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_my_roles_and_mappings");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_my_roles_and_mappings")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_my_roles_and_mappings");
//        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_notifications = new TClass_biz_notifications();
        p.biz_user = new TClass_biz_user();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_my_roles_and_mappings_PreRender;
      }

    private void TWebUserControl_my_roles_and_mappings_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_my_roles_and_mappings Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    } // end TWebUserControl_my_roles_and_mappings

  }