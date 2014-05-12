using Class_ac_cad_activity_notification_agent;
using System;
using System.Threading;

namespace cad_activity_notification_agent
  {

  public partial class TWebForm_cad_activity_notification_agent: System.Web.UI.Page
    {

    protected void Page_Load(object sender, System.EventArgs e)
      {
      var today_0326 = DateTime.Today.AddHours(3).AddMinutes(26);
      var datetime_to_quit = (DateTime.Now < today_0326 ? today_0326 : today_0326.AddDays(1));
      //
      while (DateTime.Now < datetime_to_quit)
        {
        //
        // Start the agent.  It will block until it terminates.
        //
        // NOTE: The app containing the agent apparently must run in an up-privileged application pool.
        //
        new TClass_ac_cad_activity_notification_agent(datetime_to_quit);
        //
        // If the agent terminates, wait one minute prior to launching a new one, to make sure the remote site has had time to properly reset itself (since we haven't built a login re-try
        // mechanism), then loop back to start a new agent (if it's not quitting time).
        //
        Thread.Sleep(millisecondsTimeout:60000);
        }
      }

    }

  }
