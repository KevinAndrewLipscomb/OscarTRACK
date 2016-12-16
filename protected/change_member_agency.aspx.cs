using Class_biz_agencies;
using Class_biz_members;
using kix;
using System;
using System.Configuration;

namespace change_member_agency
  {

  public partial class TWebForm_change_member_agency: ki_web_ui.page_class
   {

    private struct p_type
      {
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public string saved_agency_id;
      }

    private p_type p;

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_change_member_agency_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session[InstanceId() + ".p"] != null))
                {
                    p = (p_type)(Session[InstanceId() + ".p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_member_agency";
                    p.biz_members = new TClass_biz_members();
                    p.biz_agencies = new TClass_biz_agencies();
                    Label_member_name_1.Text = p.biz_members.FirstNameOf(Session["member_summary"]) + k.SPACE + p.biz_members.LastNameOf(Session["member_summary"]);
                    Label_member_name_2.Text = Label_member_name_1.Text;
                    p.saved_agency_id = p.biz_agencies.IdOfShortDesignator(p.biz_members.AgencyOf(Session["member_summary"]));
                    p.biz_agencies.BindListControlShort(DropDownList_agency, p.saved_agency_id, false);
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      var new_agency_id = k.Safe(DropDownList_agency.SelectedValue, k.safe_hint_type.NUM);
      if (new_agency_id == p.saved_agency_id)
        {
        AlertAndBackTrack
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.WARNING,
          key:"nochange",
          value:"The member's agency was NOT changed.  The member already belongs to the specified 'new' agency."
          );
        }
      else
        {
        p.biz_members.SetAgency
          (
          old_agency_id:p.saved_agency_id,
          new_agency_id:new_agency_id,
          summary:Session["member_summary"]
          );
        BackTrack();
        }
      }

        private void TWebForm_change_member_agency_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_change_member_agency

  }
