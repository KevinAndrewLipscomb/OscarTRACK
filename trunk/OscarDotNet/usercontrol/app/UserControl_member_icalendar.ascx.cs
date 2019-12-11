using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace UserControl_member_icalendar
  {

  public partial class TWebUserControl_member_icalendar: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_SCHEDULE_ASSIGNMENT_ID = 0;
      public const int TCI_SHIFT_NAME = 1;
      public const int TCI_LOGON_TIME = 2;
      public const int TCI_LOGOFF_TIME = 3;
      public const int TCI_POST_SHORT_DESIGNATOR = 4;
      public const int TCI_POST_CARDINALITY = 5;
      public const int TCI_POST_MEDIUM_DESIGNATOR = 6;
      public const int TCI_POST_LONG_DESIGNATOR = 7;
      public const int TCI_POST_ADDRESS = 8;
      public const int TCI_DOOR_CODE = 9;
      public const int TCI_COMMENT = 10;
      public const int TCI_PARTNER_LIST = 11;
      public const int TCI_REVISER = 12;
      public const int TCI_LAST_REVISED = 13;
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public string key;
      public string member_cad_num;
      public string member_first_name;
      public string member_id;
      public string vevent_list;
      }

    private p_type p;

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
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
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_member_icalendar")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_member_icalendar");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_member_icalendar")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_member_icalendar");
////        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.key = k.EMPTY;
        p.member_cad_num = k.EMPTY;
        p.member_id = k.EMPTY;
        p.vevent_list = k.EMPTY;
        //
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_member_icalendar_PreRender;
      }

    private void TWebUserControl_member_icalendar_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_member_icalendar Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        p.vevent_list += k.EMPTY
        + "BEGIN:VEVENT" + k.NEW_LINE
        + "DTSTAMP:" + DateTime.Now.ToString("yyyyMMddTHHmm00") + k.NEW_LINE
        + "UID:schedule_assignment.id-" + e.Item.Cells[Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text + "-" + ConfigurationManager.AppSettings["application_name"] + "@frompaper2web.com" + k.NEW_LINE
        + "DTSTART:" + e.Item.Cells[Static.TCI_LOGON_TIME].Text + k.NEW_LINE
        + "DTEND:" + e.Item.Cells[Static.TCI_LOGOFF_TIME].Text + k.NEW_LINE
        + "SUMMARY:" + e.Item.Cells[Static.TCI_POST_SHORT_DESIGNATOR].Text + k.NEW_LINE
        + "DESCRIPTION:VBEMS duty at " + e.Item.Cells[Static.TCI_POST_MEDIUM_DESIGNATOR].Text + k.SPACE_HYPHEN_SPACE + e.Item.Cells[Static.TCI_POST_LONG_DESIGNATOR].Text + k.NEW_LINE
        + (e.Item.Cells[Static.TCI_POST_ADDRESS].Text == "&nbsp;" ? k.EMPTY : "LOCATION:" + e.Item.Cells[Static.TCI_POST_ADDRESS].Text + k.NEW_LINE)
        + "COMMENT:" + k.EMPTY
        +   e.Item.Cells[Static.TCI_SHIFT_NAME].Text + " shift, crew '" + e.Item.Cells[Static.TCI_POST_CARDINALITY].Text + "'\n"
        +   "Door code: " + (e.Item.Cells[Static.TCI_DOOR_CODE].Text == "&nbsp;" ? "(none)" : e.Item.Cells[Static.TCI_DOOR_CODE].Text) + "\n"
        +   (e.Item.Cells[Static.TCI_COMMENT].Text == "&nbsp;" ? k.EMPTY : "Comment: " + e.Item.Cells[Static.TCI_COMMENT].Text + "\n")
        +   "Partner(s):" + (e.Item.Cells[Static.TCI_PARTNER_LIST].Text == "&nbsp;" ? " (none)" : "\n   " + e.Item.Cells[Static.TCI_PARTNER_LIST].Text.Replace(k.COMMA_SPACE,"\n" + (new String(Convert.ToChar(k.SPACE), 3)))) + "\n"
        +   (e.Item.Cells[Static.TCI_LAST_REVISED].Text.Length > 0 ? "Last revised at " + e.Item.Cells[Static.TCI_LAST_REVISED].Text + " by " + e.Item.Cells[Static.TCI_REVISER].Text : k.EMPTY) + k.NEW_LINE
        + "CONTACT:" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + k.NEW_LINE
        + "END:VEVENT" + k.NEW_LINE;
        }
      }

    private void Bind()
      {
      p.biz_schedule_assignments.BindMemberScheduleDetailBaseDataListForIcalendar
        (
        member_id:p.member_id,
        target:DataGrid_control
        );
      }

    internal void Publish(string member_id)
      {
      p.member_id = member_id;
      Bind();
      //
      // Build and (over)write member's iCalendar into perplexibase, named using digest of p.member_id, member CAD num, member first name, perplexibase_salt.
      //
      var summary = p.biz_members.Summary(p.member_id);
      p.member_first_name = p.biz_members.FirstNameOf(summary);
      p.member_cad_num = p.biz_members.CadNumOf(summary);
      p.key = k.Digest(p.biz_members.IdOf(summary) + p.member_first_name + p.member_cad_num + ConfigurationManager.AppSettings["perplexibase_salt"]);
      var path_common_part = "perplexibase/ical/" + p.key + ".ics";
      var icalendar = new StreamWriter(path:HttpContext.Current.Server.MapPath("~/" + path_common_part));
      icalendar.Write
        (
        k.Unix2Dos
          (
          "BEGIN:VCALENDAR" + k.NEW_LINE
          + "PRODID:" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + k.NEW_LINE
          + "VERSION:2.0" + k.NEW_LINE
          + "NAME:" + ConfigurationManager.AppSettings["application_name"] + " assignments - " + p.member_first_name + k.SPACE + p.biz_members.LastNameOf(summary) + " (" + p.member_cad_num + ")" + k.NEW_LINE
          + "URL:" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + k.NEW_LINE
          + p.vevent_list
          + "END:VCALENDAR" + k.NEW_LINE
          )
        );
      icalendar.Close();
      HyperLink_subscribe_via_google_calendar_render.NavigateUrl = "https://www.google.com/calendar/render?cid=" + Server.UrlEncode(ConfigurationManager.AppSettings["runtime_root_fullspec"] + path_common_part);
      HyperLink_subscribe_via_webcal.NavigateUrl = ConfigurationManager.AppSettings["runtime_root_fullspec"].Replace("http","webcal") + path_common_part;
      }

    }

  }
