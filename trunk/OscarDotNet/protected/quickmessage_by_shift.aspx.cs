// Derived from template~protected~nonlanding.aspx.cs~template

using Class_msg_protected;
using System;
using System.Configuration;

namespace quickmessage_by_shift
  {

  public partial class TWebForm_quickmessage_by_shift: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_msg_protected.quickmessage_by_shift incoming;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_quickmessage_by_shift_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - quickmessage_by_shift";
      if (!IsPostBack)
        {
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
        //
        // Initialize p.~ objects here.
        //
        p.incoming = Message<TClass_msg_protected.quickmessage_by_shift>
          (
          folder_name:"protected",
          aspx_name:"quickmessage_by_shift"
          );
        UserControl_quickmessage_by_shift_control.Set
          (
          agency_filter:p.incoming.agency_filter,
          release_filter:p.incoming.release_filter,
          depth_filter:p.incoming.depth_filter,
          relative_month:p.incoming.relative_month,
          nominal_day_filter:p.incoming.nominal_day_filter,
          shift_name:p.incoming.shift_name
          );
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      //
      // ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      //
      }

    private void TWebForm_quickmessage_by_shift_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_quickmessage_by_shift

  }
