// Derived from UserControl~template~std.ascx.cs~template

using kix;
using System;
using UserControl_drop_down_date;

namespace UserControl_drop_down_datetime
  {
  public static class UserControl_drop_down_datetime_Static
    {
    public const int MIN_CONSISTENTLY_REPRESENTABLE_YEAR = UserControl_drop_down_date_Static.MIN_CONSISTENTLY_REPRESENTABLE_YEAR;
    public const int MAX_CONSISTENTLY_REPRESENTABLE_YEAR = UserControl_drop_down_date_Static.MAX_CONSISTENTLY_REPRESENTABLE_YEAR;
    public readonly static DateTime NONE = DateTime.MinValue;
    }

  public partial class TWebUserControl_drop_down_datetime: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_enabled;
      public bool be_loaded;
      public DateTime selected_value;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    public bool enabled
      {
      get
        {
        return p.be_enabled;
        }
      set
        {
        UserControl_drop_down_date_control.enabled = value;
        UserControl_drop_down_time_of_day_control.enabled = value;
        p.be_enabled = value;
        }
      }
    public bool isvalid
      {
      get
        {
        return UserControl_drop_down_date_control.isvalid;
        }
      }
    public string maxyear
      {
      get
        {
        return UserControl_drop_down_date_control.maxyear;
        }
      set
        {
        UserControl_drop_down_date_control.maxyear = value;
        }
      }
    public int minute_intervals
      {
      get
        {
        return UserControl_drop_down_time_of_day_control.minute_intervals;
        }
      set
        {
        UserControl_drop_down_time_of_day_control.minute_intervals = value;
        }
      }
    public string minyear
      {
      get
        {
        return UserControl_drop_down_date_control.minyear;
        }
      set
        {
        UserControl_drop_down_date_control.minyear = value;
        }
      }
    public DateTime selectedvalue
      {
      get
        {
        p.selected_value = DateTime.Parse(UserControl_drop_down_date_control.selectedvalue.ToString("yyyy-MM-dd ") + UserControl_drop_down_time_of_day_control.selectedvalue);
        return p.selected_value;
        }
      set
        {
        UserControl_drop_down_date_control.selectedvalue = value;
        if (value == UserControl_drop_down_datetime_Static.NONE)
          {
          UserControl_drop_down_time_of_day_control.selectedvalue = k.EMPTY;
          }
        else
          {
          UserControl_drop_down_time_of_day_control.selectedvalue = value.ToString("HH:mm");
          }
        p.selected_value = value;
        }
      }

    public void Clear()
      {
      p.selected_value = UserControl_drop_down_datetime_Static.NONE;
      UserControl_drop_down_date_control.Clear();
      UserControl_drop_down_time_of_day_control.Clear();
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_drop_down_datetime");
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
      PreRender += TWebUserControl_drop_down_datetime_PreRender;
      }

    private void TWebUserControl_drop_down_datetime_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_drop_down_datetime Fresh()
      {
      UserControl_drop_down_date_control.Fresh();
      UserControl_drop_down_time_of_day_control.Fresh();
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    } // end TWebUserControl_drop_down_datetime

  }
