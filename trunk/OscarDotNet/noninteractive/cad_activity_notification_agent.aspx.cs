using Class_ac_cad_activity_notification_agent;
using System.Threading;

namespace cad_activity_notification_agent
  {

  public partial class TWebForm_cad_activity_notification_agent: System.Web.UI.Page
    {

    protected void Page_Load(object sender, System.EventArgs e)
      {
      while (true)
        {
        //
        // Start the agent.
        //
        new TClass_ac_cad_activity_notification_agent();
        //
        // When the agent terminates (which will happen each midnight), wait a full minute prior to launching a new one, to make sure the remote site has had time to properly reset itself (since we haven't built a login re-try
        // mechanism).
        //
        Thread.Sleep(millisecondsTimeout:60000);
        }
      }

    }

  }
