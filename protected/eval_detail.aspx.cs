using AjaxControlToolkit;
using Class_biz_evals;
using Class_msg_protected;
using System;
using System.Configuration;

namespace eval_detail
{
    public partial class TWebForm_eval_detail: ki_web_ui.page_class
    {
        private struct p_type
          {
          public TClass_biz_evals biz_evals;
          public TClass_msg_protected.eval_detail incoming;
          }

        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
          {
          this.PreRender += this.TWebForm_eval_detail_PreRender;
          //this.Load += this.Page_Load;
          }

        protected void Page_Load(object sender, System.EventArgs e)
          {
          if (!IsPostBack)
            {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - eval_detail";
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
            p.biz_evals = new TClass_biz_evals();
            //
            p.incoming = Message<TClass_msg_protected.eval_detail>
              (
              folder_name:"protected",
              aspx_name:"eval_detail"
              );
            UserControl_eval_control.Set
              (
              id:p.incoming.id,
              user_member_id:p.incoming.user_member_id,
              be_user_evaluatee:p.incoming.be_user_evaluatee
              );
            }
          else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
            {
            p = (p_type)(Session[InstanceId() + ".p"]);
            }
//
// Uncomment the following line to disable partial page rendering.
//
//ScriptManager.GetCurrent(Page).EnablePartialRendering = false;
          }

        private void TWebForm_eval_detail_PreRender(object sender, System.EventArgs e)
          {
          SessionSet(InstanceId() + ".p", p);
          }

    } // end TWebForm_eval_detail

}
