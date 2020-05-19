// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_user;
using Class_msg_protected;
using System;
using System.Configuration;

namespace member_schedule_detail
  {
  public partial class TWebForm_member_schedule_detail: ki_web_ui.page_class
    {

    private struct p_type
      {
      public TClass_biz_user biz_user;
      public TClass_msg_protected.member_schedule_detail incoming;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
      var nature_of_visit = NatureOfVisit(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.biz_user = new TClass_biz_user();
        p.incoming = Message<TClass_msg_protected.member_schedule_detail>("protected","member_schedule_detail");
        UserControl_member_schedule_detail_control.SetFilter(p.incoming.member_agency_id,p.incoming.relative_month,p.incoming.member_id);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      }

    private void TWebForm_member_schedule_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_member_schedule_detail

  }
