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

namespace paypal_assistant
  {

  public partial class TWebForm_paypal_assistant: ki_web_ui.page_class
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
      PreRender += TWebForm_paypal_assistant_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - paypal_assistant";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisitUnlimited(InstanceId() + ".p");
      if (nature_of_visit == nature_of_visit_type.VISIT_COLD_CALL)
        {
        //
        // Initialize p.~ objects here.
        //
        var hash_table = HashtableOfShieldedRequest();
        UserControl_paypal_assistant_control.Set
          (
          agency:hash_table["agency"].ToString(),
          amount_donated:hash_table["amount_donated"].ToString(),
          donor_email_address:hash_table["donor_email_address"].ToString(),
          donor_name:hash_table["donor_name"].ToString(),
          donation_date:DateTime.Parse(hash_table["donation_date"].ToString()),
          memo:(hash_table.Contains("memo") ? hash_table["memo"].ToString() : k.EMPTY),
          donor_house_num:(hash_table.Contains("donor_house_num") ? hash_table["donor_house_num"].ToString() : k.EMPTY),
          donor_street_name:(hash_table.Contains("donor_street_name") ? hash_table["donor_street_name"].ToString() : k.EMPTY)
          );
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        }
      //
      // ToolkitScriptManager.GetCurrent(Page).EnablePartialRendering = false;
      //
      }

    private void TWebForm_paypal_assistant_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_paypal_assistant

  }
