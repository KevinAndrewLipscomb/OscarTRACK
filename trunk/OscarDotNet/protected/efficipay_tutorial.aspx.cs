// Derived from template~protected~nonlanding.aspx.cs~template

using System;
using System.Configuration;

namespace efficipay_tutorial
  {

  public partial class TWebForm_efficipay_tutorial: ki_web_ui.page_class
    {

    private struct p_type
      {
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_efficipay_tutorial_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - efficipay_tutorial";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisitUnlimited(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        //
        // Initialize p.~ objects here.
        //
        //p.incoming = Message<TClass_msg_protected.efficipay_tutorial>
        //  (
        //  folder_name:"protected",
        //  aspx_name:"efficipay_tutorial"
        //  );
        //UserControl_efficipay_tutorial_control.Set(summary:p.incoming.summary);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
//
// ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
//
      }

    private void TWebForm_efficipay_tutorial_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_efficipay_tutorial

  }
