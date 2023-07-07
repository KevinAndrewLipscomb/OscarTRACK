using kix;
using System;
using System.Web.UI.WebControls;

namespace UserControl_drop_down_time_of_day
  {

  public partial class TWebUserControl_drop_down_time_of_day: ki_web_ui.usercontrol_class
    {

    //-
    //
    // PRIVATE
    //
    //-

    private struct p_type
      {
      public bool be_clearable;
      public bool be_enabled;
      public k.subtype<int> minute_intervals;
      public string selected_value;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_drop_down_time_of_day_PreRender;
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1031:Do not catch general exception types")]
    private void SetChildSelectedValues()
      {
      if (p.selected_value.Length == 0)
        {
        Clear();
        }
      else
        {
        var value_array = p.selected_value.Split(new char[] {':'});
        if (value_array.Length < 2)
          {
          Clear();
          }
        try
          {
          value_array[1] = ((int.Parse(value_array[1])/p.minute_intervals.val)*p.minute_intervals.val).ToString("D2");
          var date_time = DateTime.Parse("1966-01-06 " + value_array[0] + ":" + value_array[1]);
          DropDownList_hour.SelectedValue = date_time.ToString("HH");
          DropDownList_minute.SelectedValue = date_time.ToString("mm");
          }
        catch
          {
          Clear();
          }
        }
      }

    private void TWebUserControl_drop_down_time_of_day_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p",p);
      }

    //-
    //
    // PROTECTED
    //
    //-

    protected void Button_clear_Click(object sender, EventArgs e)
      {
      selectedvalue = k.EMPTY;
      SetChildSelectedValues();
      }

    protected void Button_now_Click(object sender, System.EventArgs e)
      {
      selectedvalue = DateTime.Now.ToString("HH:mm");
      SetChildSelectedValues();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack && (Session[InstanceId() + ".p"] != null))
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      else
        {
        p.be_clearable = false;
        p.be_enabled = true;
        p.minute_intervals = new k.subtype<int>(1,60);
        p.selected_value = k.EMPTY;
        }
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if ((DropDownList_hour.Items.Count == 0))
        {
        //
        // Both dropdownlists should have empty item collections, so rebuild them.               
        //
        var representation = k.EMPTY;
        for (var hour = new k.subtype<int>(0,24); hour.val < hour.LAST; hour.val++)
          {
          representation = hour.val.ToString("D2");
          DropDownList_hour.Items.Add(new ListItem(representation,representation));
          }
        for (var minute = new k.subtype<int>(0,60); minute.val < minute.LAST; minute.val += p.minute_intervals.val)
          {
          representation = minute.val.ToString("D2");
          DropDownList_minute.Items.Add(new ListItem(representation,representation));
          }
        if ((p.selected_value.Length == 0) || p.be_clearable)
          {
          DropDownList_hour.Items.Insert(0, new ListItem("",""));
          DropDownList_minute.Items.Insert(0, new ListItem("",""));
          }
        if (p.selected_value.Length > 0)
          {
          SetChildSelectedValues();
          }
        }
      }

    //-
    //
    // INTERNAL
    //
    //-

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
        DropDownList_hour.Enabled = value;
        DropDownList_minute.Enabled = value;
        Button_now.Enabled = value;
        Button_clear.Enabled = value;
        p.be_enabled = value;
        }
      }

    internal int minute_intervals
      {
      get
        {
        return p.minute_intervals.val;
        }
      set
        {
        p.minute_intervals.val = value;
        }
      }

    internal string selectedvalue
      {
      get
        {
        var hour = k.Safe(DropDownList_hour.SelectedValue,k.safe_hint_type.NUM);
        var minute = k.Safe(DropDownList_minute.SelectedValue,k.safe_hint_type.NUM);
        if ((hour.Length > 0) && (minute.Length > 0))
          {
          return hour + ":" + minute;
          }
        else
          {
          return k.EMPTY;
          }
        }
      set
        {
        p.selected_value = value;
        SetChildSelectedValues();
        }          
      }

    //-
    //
    // PUBLIC
    //
    //-

    public void Clear()
      {
      DropDownList_hour.SelectedIndex = -1;
      DropDownList_minute.SelectedIndex = -1;
      p.selected_value = k.EMPTY;
      }

    public TWebUserControl_drop_down_time_of_day Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    } // end TWebUserControl_drop_down_time_of_day

  }
