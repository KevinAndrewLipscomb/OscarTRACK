// Derived from template~protected~nonlanding.aspx.cs~template

using appcommon;
using Class_biz_availabilities;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI.WebControls;

namespace member_schedule_detail
  {
  public struct p_type
    {
    public TClass_msg_protected.member_schedule_detail incoming;
    }

  public partial class TWebForm_member_schedule_detail: ki_web_ui.page_class
    {

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_member_schedule_detail_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - member_schedule_detail";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("member_schedule_detail.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.incoming = Message<TClass_msg_protected.member_schedule_detail>("protected","member_schedule_detail");
        UserControl_member_schedule_detail_control.SetFilter(p.incoming.member_agency_id,p.incoming.relative_month,p.incoming.member_id);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["member_schedule_detail.p"]);
        }
      }

    private void TWebForm_member_schedule_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("member_schedule_detail.p", p);
      }

    } // end TWebForm_member_schedule_detail

  }
