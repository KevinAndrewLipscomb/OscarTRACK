// Derived from template~protected~nonlanding.aspx.cs~template

using Class_msg_protected;
using kix;
using System;
using System.Configuration;

namespace register_on_vb_ems_sideband
  {

  public partial class TWebForm_register_on_vb_ems_sideband: ki_web_ui.page_class
    {

    private struct p_type
      {
      // public TClass_msg_protected.register_on_vb_ems_sideband incoming;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_register_on_vb_ems_sideband_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - register_on_vb_ems_sideband";
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
        //p.incoming = Message<TClass_msg_protected.register_on_vb_ems_sideband>
        //  (
        //  folder_name:"protected",
        //  aspx_name:"register_on_vb_ems_sideband"
        //  );
        //UserControl_register_on_vb_ems_sideband_control.Set(summary:p.incoming.summary);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
//
// ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
//
      }

    private void TWebForm_register_on_vb_ems_sideband_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_register_on_vb_ems_sideband

  }
