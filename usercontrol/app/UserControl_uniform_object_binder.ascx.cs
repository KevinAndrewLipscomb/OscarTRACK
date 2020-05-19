// Derived from KiAspdotnetFramework/UserControl/app/UserControl~uniform_object~binder.cs~uniform_object

using kix;
using UserControl_uniform_priority;
using UserControl_uniform_class;
using UserControl_uniform_piece;
using UserControl_rank_group;
using UserControl_uniform_option_category;
using UserControl_uniform_piece_vendor;
using UserControl_uniform_piece_make;
using UserControl_uniform_piece_model;
using UserControl_uniform_piece_color;
using UserControl_uniform_catalog;
using UserControl_rank;
using System;

namespace UserControl_uniform_object_binder
  {

  public partial class TWebUserControl_uniform_object_binder: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private static class Static
      {
      public const int TSSI_PRIORITY = 0;
      public const int TSSI_CLASS = 1;
      public const int TSSI_PIECE = 2;
      public const int TSSI_RANK_GROUP = 3;
      public const int TSSI_OPTION_CATEGORY = 4;
      public const int TSSI_VENDOR = 5;
      public const int TSSI_MAKE = 6;
      public const int TSSI_MODEL = 7;
      public const int TSSI_COLOR = 8;
      public const int TSSI_CATALOG = 9;
      public const int TSSI_RANK = 10;
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
      if (p.tab_index == Static.TSSI_PRIORITY)
        {
        var c = ((TWebUserControl_uniform_priority)(LoadControl("~/usercontrol/app/UserControl_uniform_priority.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_priority",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_CLASS)
        {
        var c = ((TWebUserControl_uniform_class)(LoadControl("~/usercontrol/app/UserControl_uniform_class.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_class",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_PIECE)
        {
        var c = ((TWebUserControl_uniform_piece)(LoadControl("~/usercontrol/app/UserControl_uniform_piece.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_piece",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_RANK_GROUP)
        {
        var c = ((TWebUserControl_rank_group)(LoadControl("~/usercontrol/app/UserControl_rank_group.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_rank_group",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_OPTION_CATEGORY)
        {
        var c = ((TWebUserControl_uniform_option_category)(LoadControl("~/usercontrol/app/UserControl_uniform_option_category.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_option_category",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_VENDOR)
        {
        var c = ((TWebUserControl_uniform_piece_vendor)(LoadControl("~/usercontrol/app/UserControl_uniform_piece_vendor.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_piece_vendor",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_MAKE)
        {
        var c = ((TWebUserControl_uniform_piece_make)(LoadControl("~/usercontrol/app/UserControl_uniform_piece_make.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_piece_make",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_MODEL)
        {
        var c = ((TWebUserControl_uniform_piece_model)(LoadControl("~/usercontrol/app/UserControl_uniform_piece_model.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_piece_model",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_COLOR)
        {
        var c = ((TWebUserControl_uniform_piece_color)(LoadControl("~/usercontrol/app/UserControl_uniform_piece_color.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_piece_color",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_CATALOG)
        {
        var c = ((TWebUserControl_uniform_catalog)(LoadControl("~/usercontrol/app/UserControl_uniform_catalog.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_uniform_catalog",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        //c.SetTarget(target);
        }
      else if (p.tab_index == Static.TSSI_RANK)
        {
        var c = ((TWebUserControl_rank)(LoadControl("~/usercontrol/app/UserControl_rank.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_rank",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
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
      PreRender += TWebUserControl_uniform_object_binder_PreRender;
      }

    private void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (k.Has((string[])(Session["privilege_array"]), "config-uniforms"))
          {
          TabPanel_priority.Enabled = true;
          TabPanel_class.Enabled = true;
          TabPanel_piece.Enabled = true;
          TabPanel_rank_group.Enabled = true;
          TabPanel_option_category.Enabled = true;
          TabPanel_vendor.Enabled = true;
          TabPanel_make.Enabled = true;
          TabPanel_model.Enabled = true;
          TabPanel_color.Enabled = true;
          TabPanel_catalog.Enabled = true;
          TabPanel_rank.Enabled = true;
          }
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

    private void TWebUserControl_uniform_object_binder_PreRender(object sender, EventArgs e)
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config_business_objects_binder_uniform_object_binder")
          {
          p.be_loaded &= ((Session["M_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_uniform_object_binder");
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
        p.tab_index = Static.TSSI_PRIORITY;
        FillPlaceHolder(true);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TWebUserControl_uniform_object_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    public void SetTarget(string target)
      {
      if (target.Length > 0)
        {
        if (target.ToLower().Contains("/priority/"))
          {
          p.tab_index = Static.TSSI_PRIORITY;
          }
        else if (target.ToLower().Contains("/class/"))
          {
          p.tab_index = Static.TSSI_CLASS;
          }
        else if (target.ToLower().Contains("/piece/"))
          {
          p.tab_index = Static.TSSI_PIECE;
          }
        else if (target.ToLower().Contains("/rank-group/"))
          {
          p.tab_index = Static.TSSI_RANK_GROUP;
          }
        else if (target.ToLower().Contains("/option-category/"))
          {
          p.tab_index = Static.TSSI_OPTION_CATEGORY;
          }
        else if (target.ToLower().Contains("/vendor/"))
          {
          p.tab_index = Static.TSSI_VENDOR;
          }
        else if (target.ToLower().Contains("/make/"))
          {
          p.tab_index = Static.TSSI_MAKE;
          }
        else if (target.ToLower().Contains("/model/"))
          {
          p.tab_index = Static.TSSI_MODEL;
          }
        else if (target.ToLower().Contains("/color/"))
          {
          p.tab_index = Static.TSSI_COLOR;
          }
        else if (target.ToLower().Contains("/catalog/"))
          {
          p.tab_index = Static.TSSI_CATALOG;
          }
        else if (target.ToLower().Contains("/rank/"))
          {
          p.tab_index = Static.TSSI_RANK;
          }
        //
        TabContainer_control.ActiveTabIndex = (int)p.tab_index;
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_uniform_object_binder

  }

