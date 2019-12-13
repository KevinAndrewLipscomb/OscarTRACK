using System;
using System.Configuration;

namespace UserControl_autocalendaring_subscriptions
  {

  public partial class TWebUserControl_autocalendaring_subscriptions: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      public string icalendar_path_common_part;
      }

    private p_type p;

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        Literal_application_name_2.Text = Literal_application_name.Text;
        Literal_application_name_3.Text = Literal_application_name.Text;
        Literal_application_name_4.Text = Literal_application_name.Text;
        Literal_application_name_5.Text = Literal_application_name.Text;
        Literal_application_name_6.Text = Literal_application_name.Text;
        Literal_application_name_7.Text = Literal_application_name.Text;
        Literal_application_name_8.Text = Literal_application_name.Text;
        Literal_application_name_9.Text = Literal_application_name.Text;
        //
        HyperLink_subscribe_via_google_calendar_render.NavigateUrl =
          "https://www.google.com/calendar/render?cid=" + Server.UrlEncode(ConfigurationManager.AppSettings["runtime_root_fullspec"] + p.icalendar_path_common_part);
        HyperLink_subscribe_via_webcal.NavigateUrl = ConfigurationManager.AppSettings["runtime_root_fullspec"].Replace("http","webcal") + p.icalendar_path_common_part;
        //
        p.be_loaded = true;
        }
      }

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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_S_member_schedule_detail_autocalendaring_subscriptions_control")
          {
          p.be_loaded &= false;
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_autocalendaring_subscriptions")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_autocalendaring_subscriptions");
//        }
        }
      else
        {
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_autocalendaring_subscriptions_PreRender;
      }

    private void TWebUserControl_autocalendaring_subscriptions_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_autocalendaring_subscriptions Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetP(string icalendar_path_common_part)
      {
      p.icalendar_path_common_part = icalendar_path_common_part;
      }
    }

  }
