// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Configuration;

namespace append_vehicle_down_note
  {
  public partial class TWebForm_append_vehicle_down_note: ki_web_ui.page_class
    {
  private struct p_type
    {
    public TClass_biz_vehicle_usability_history biz_vehicle_usability_history;
    public TClass_biz_vehicles biz_vehicles;
    public string down_comment;
    public string vehicle_id;
    }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_append_vehicle_down_note_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - append_vehicle_down_note";
      if (!IsPostBack)
        {
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
        TextBox_prior_note.Text = p.down_comment + k.NEW_LINE + ":" + k.NEW_LINE + ":" + k.NEW_LINE;
        Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_vehicle_usability_history = new TClass_biz_vehicle_usability_history();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.vehicle_id = p.biz_vehicles.IdOf(Session["vehicle_summary"]);
        //
        p.down_comment = p.biz_vehicle_usability_history.LatestDownComment(p.vehicle_id);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_append_vehicle_down_note_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (IsValid)
        {
        p.biz_vehicle_usability_history.AppendDownNote
          (
          p.vehicle_id,
          p.down_comment,
          k.Safe(TextBox_note_to_append.Text,k.safe_hint_type.MEMO).Trim()
          );
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    } // end TWebForm_append_vehicle_down_note

  }
