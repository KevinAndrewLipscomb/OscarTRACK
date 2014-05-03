using Class_ac_cad_activity_notification_agent;
using System.Threading;

namespace cad_activity_notification_agent
  {

  public partial class TWebForm_cad_activity_notification_agent: System.Web.UI.Page
    {

    protected void Page_Load(object sender, System.EventArgs e)
      {
      new TClass_ac_cad_activity_notification_agent();
      //
      //  Wake and sleep every 15 minutes to prevent Page_Load from ever completing, and therefore to avoid being considered idle by the server application pool.
      while (true)
        {
        Thread.Sleep(millisecondsTimeout:900000);
        }
      }

    }

  }
