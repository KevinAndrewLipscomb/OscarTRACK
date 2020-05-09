// Derived from template~protected~nonlanding.aspx.cs~template

using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace efficipay_docket_detail
  {
  public struct p_type
    {
    public TClass_msg_protected.efficipay_docket_detail incoming;
    }

  public partial class TWebForm_efficipay_docket_detail: ki_web_ui.page_class
    {
    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_efficipay_docket_detail_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - efficipay_docket_detail";
        UserControl_efficipay_docket_control.SetFilter(p.incoming.agency_id,p.incoming.summary);
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
        p.incoming = Message<TClass_msg_protected.efficipay_docket_detail>("protected","efficipay_docket_detail");
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      //
      // ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      //
      }

    private void TWebForm_efficipay_docket_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_efficipay_docket_detail

  }
