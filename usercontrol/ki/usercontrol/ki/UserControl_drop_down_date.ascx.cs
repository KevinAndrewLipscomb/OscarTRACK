using kix;
using System;
using System.Web.UI.WebControls;

namespace UserControl_drop_down_date
  {

  public static class UserControl_drop_down_date_Static
      {
      public const int MIN_CONSISTENTLY_REPRESENTABLE_YEAR = 1000; // Driven by MySQL DATETIME type and .Net DateTime type
      public const int MAX_CONSISTENTLY_REPRESENTABLE_YEAR = 9999; // Driven by MySQL DATETIME type
      public readonly static DateTime NONE = DateTime.MinValue; // Driven by MySQL DATETIME type and .Net DateTime type
      }

  public partial class TWebUserControl_drop_down_date: ki_web_ui.usercontrol_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    private struct p_type
      {
      public bool be_clearable;
      public bool be_enabled;
      public uint min_year;
      public uint max_year;
      public DateTime selected_value;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_drop_down_date_PreRender;
      }

    private void SetChildSelectedValues()
      {
      if (p.selected_value == UserControl_drop_down_date_Static.NONE)
        {
        DropDownList_month.SelectedIndex = -1;
        DropDownList_day.SelectedIndex = -1;
        DropDownList_year.SelectedIndex = -1;
        }
      else
        {
        DropDownList_month.SelectedValue = p.selected_value.Month.ToString();
        DropDownList_day.SelectedValue = p.selected_value.Day.ToString();
        DropDownList_year.SelectedValue = p.selected_value.Year.ToString();
        }
      }

    private void TWebUserControl_drop_down_date_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p",p);
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected void Button_clear_Click(object sender, EventArgs e)
      {
      p.selected_value = UserControl_drop_down_date_Static.NONE;
      SetChildSelectedValues();
      }

    protected void Button_today_Click(object sender, EventArgs e)
      {
      p.selected_value = DateTime.Today;
      SetChildSelectedValues();
      }

    protected void CustomValidator_date_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (selectedvalue == UserControl_drop_down_date_Static.NONE) || isvalid;
      }

    public TWebUserControl_drop_down_date Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (IsPostBack && (Session[instance_id + ".p"] != null))
        {
        p = (p_type)(Session[instance_id + ".p"]);
        }
      else
        {
        p.be_clearable = false;
        p.be_enabled = true;
        p.min_year = (uint)(DateTime.Today.Year - 1);
        p.max_year = (uint)(DateTime.Today.Year + 1);
        p.selected_value = UserControl_drop_down_date_Static.NONE;
        }
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      uint i;
      if ((DropDownList_month.Items.Count == 0))
        {
        //
        // All three dropdownlists should have empty item collections, so rebuild them.
        //
        DropDownList_month.Items.Add(new ListItem("Jan","1"));
        DropDownList_month.Items.Add(new ListItem("Feb","2"));
        DropDownList_month.Items.Add(new ListItem("Mar","3"));
        DropDownList_month.Items.Add(new ListItem("Apr","4"));
        DropDownList_month.Items.Add(new ListItem("May","5"));
        DropDownList_month.Items.Add(new ListItem("Jun","6"));
        DropDownList_month.Items.Add(new ListItem("Jul","7"));
        DropDownList_month.Items.Add(new ListItem("Aug","8"));
        DropDownList_month.Items.Add(new ListItem("Sep","9"));
        DropDownList_month.Items.Add(new ListItem("Oct","10"));
        DropDownList_month.Items.Add(new ListItem("Nov","11"));
        DropDownList_month.Items.Add(new ListItem("Dec","12"));
        for (i = 1; i <= 31; i++)
          {
          DropDownList_day.Items.Add(new ListItem(i.ToString(), i.ToString()));
          }
        for (i = p.min_year; i <= p.max_year; i++)
          {
          DropDownList_year.Items.Add(new ListItem(i.ToString(), i.ToString()));
          }
        if ((p.selected_value == UserControl_drop_down_date_Static.NONE) || p.be_clearable)
          {
          DropDownList_month.Items.Insert(0, new ListItem("",""));
          DropDownList_day.Items.Insert(0, new ListItem("",""));
          DropDownList_year.Items.Insert(0, new ListItem("",""));
          }
        if (p.selected_value != UserControl_drop_down_date_Static.NONE)
          {
          SetChildSelectedValues();
          }
        //
        // Only make the Today button visible if it falls within the range of valid choices.
        //
        var today_spec = DateTime.Today.ToString("yyyy-MM-dd");
        Button_today.Visible = ((p.min_year + "-01-01").CompareTo(today_spec) < 1) && (today_spec.CompareTo(p.max_year + "-12-31") < 1);
        }
      }

    //--
    //
    // INTERNAL
    //
    //--

    //
    // Note that these properties are deliberately 'internal'.
    //

    internal bool be_clearable
      {
      get
        {
        return p.be_clearable;
        }
      set
        {
        Button_clear.Visible = value;
        p.be_clearable = value;
        }
      }

    internal bool enabled
      {
      get
        {
        return p.be_enabled;
        }
      set
        {
        DropDownList_month.Enabled = value;
        DropDownList_day.Enabled = value;
        DropDownList_year.Enabled = value;
        Button_today.Enabled = value;
        Button_clear.Enabled = value;
        p.be_enabled = value;
        }
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1031:Do not catch general exception types")]
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Usage", "CA1806:Do not ignore method results")]
    internal bool isvalid
      {
      get
        {
        bool result;
        try
          {
          new DateTime
            (
            year:int.Parse(k.Safe(DropDownList_year.SelectedValue, k.safe_hint_type.NUM)),
            month:int.Parse(k.Safe(DropDownList_month.SelectedValue, k.safe_hint_type.NUM)),
            day:int.Parse(k.Safe(DropDownList_day.SelectedValue, k.safe_hint_type.NUM))
            );
          result = true;
          }
        catch
          {
          result = false;
          }
        return result;
        }
      }

    internal string maxyear
      {
      get
        {
        return ((uint)(p.max_year)).ToString();
        }
      set
        {
        p.max_year = Math.Min(uint.Parse(value), (uint)(UserControl_drop_down_date_Static.MAX_CONSISTENTLY_REPRESENTABLE_YEAR));
        }
      }

    internal string minyear
      {
      get
        {
        return ((uint)(p.min_year)).ToString();
        }
      set
        {
        p.min_year = Math.Max(uint.Parse(value), UserControl_drop_down_date_Static.MIN_CONSISTENTLY_REPRESENTABLE_YEAR);
        }
      }

    internal DateTime selectedvalue
      {
      get
        {
        DateTime result;
        if (isvalid)
          {
          p.selected_value = new DateTime
            (
            year:int.Parse(k.Safe(DropDownList_year.SelectedValue, k.safe_hint_type.NUM)),
            month:int.Parse(k.Safe(DropDownList_month.SelectedValue, k.safe_hint_type.NUM)),
            day:int.Parse(k.Safe(DropDownList_day.SelectedValue, k.safe_hint_type.NUM))
            );
          result = p.selected_value;
          }
        else
          {
          result = UserControl_drop_down_date_Static.NONE;
          }
        return result;
        }
      set
        {
        DateTime min_datetime;
        DateTime max_datetime;
        if (value == UserControl_drop_down_date_Static.NONE)
          {
          p.selected_value = UserControl_drop_down_date_Static.NONE;
          }
        else
          {
          min_datetime = new DateTime((int)p.min_year, 1, 1);
          max_datetime = new DateTime((int)p.max_year, 12, 31);
          if (value < min_datetime)
            {
            p.selected_value = min_datetime;
            }
          else if (value > max_datetime)
            {
            p.selected_value = max_datetime;
            }
          else
            {
            p.selected_value = value;
            }
          }
        SetChildSelectedValues();
        }
      }

    //--
    //
    // PUBLIC
    //
    //-

    public void Clear()
      {
      p.selected_value = UserControl_drop_down_date_Static.NONE;
      DropDownList_month.SelectedIndex = 0;
      DropDownList_day.SelectedIndex = 0;
      DropDownList_year.SelectedIndex = 0;
      }

    } // end TWebUserControl_drop_down_date

  }
