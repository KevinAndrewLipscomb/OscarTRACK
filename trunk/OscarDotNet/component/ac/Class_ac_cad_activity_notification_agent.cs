using Class_biz_cad_records;
using Class_biz_field_situations;
using kix;
using System;
using System.Configuration;
using System.Runtime.InteropServices;
using System.Threading;
using System.Timers;
using System.Windows.Forms;

namespace Class_ac_cad_activity_notification_agent
  {

  public class TClass_ac_cad_activity_notification_agent : ApplicationContext
    {

    //--
    //
    // PRIVATE
    //
    //--

    private TClass_biz_cad_records biz_cad_records = null;
    private TClass_biz_field_situations biz_field_situations = null;
    private WebBrowser master_browser;
    private Thread master_browser_thread;
    private System.Timers.Timer master_browser_timer;
    private Form form;
    private k.int_nonnegative master_navigation_counter = new k.int_nonnegative();
    private DateTime saved_datetime_to_quit;
    private DateTime saved_meta_surge_alert_timestamp_ems;
    private DateTime saved_meta_surge_alert_timestamp_als;
    private DateTime saved_meta_surge_alert_timestamp_fire;

    private void ajax_container_PropertyChange
      (
      object sender,
      EventArgs e
      )
      {
      try // Because this code only runs in the master_browser_thread, any exceptions will not bubble up to TGlobal.Application_Error(), so we must catch and raise them within master_browser_thread (I think).
        {
        master_browser_timer.Stop();
        //
        var doc = master_browser.Document;
        var rows = doc.GetElementById("ajax_container").GetElementsByTagName("tr");
        HtmlElementCollection cells; // If we declare this within the below for-loop, it's values can't be checked at exception-time in the debugger, so leave the declaration here.
        for (var i = new k.subtype<int>(2,rows.Count); i.val < i.LAST; i.val++)
          {
          cells = rows[i.val].GetElementsByTagName("td");
          if ((cells.Count == 17) && (cells[5].InnerText != null)) // I don't know why the remote site sometimes provides a cell[5] with a null InnerText, but it does.
            {
            biz_cad_records.Set
                (
                id:k.EMPTY,
                incident_date:k.Safe(cells[0].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                incident_num:k.Safe(cells[1].InnerText.Trim(),k.safe_hint_type.NUM),
                incident_address:k.Safe(cells[4].InnerText.Trim(),k.safe_hint_type.MAKE_MODEL),
                call_sign:k.Safe(cells[5].InnerText.Trim(),k.safe_hint_type.ALPHANUM),
                time_initialized:k.Safe(cells[8].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_of_alarm:k.Safe(cells[9].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_enroute:k.Safe(cells[10].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_on_scene:k.Safe(cells[11].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_transporting:k.Safe(cells[12].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_at_hospital:k.Safe(cells[13].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_available:k.Safe(cells[14].InnerText.Trim(),k.safe_hint_type.DATE_TIME),
                time_downloaded:k.Safe(cells[16].InnerText.Trim(),k.safe_hint_type.DATE_TIME)
                );
            //  )
            ////then
            //  {
            //  var row = rows[i.val];
            //  var part_array = row.OuterHtml.Split
            //    (
            //    separator:new string[] {"cadWindow('","')"},
            //    options:StringSplitOptions.None
            //    );
            //  var incident_id = k.Safe(part_array[1],k.safe_hint_type.NUM);
            //  browser.Navigate("https://vbems.emsbridge.com/resource/apps/caddispatch/cad_dispatch_history_detail.cfm?IncidentID=" + incident_id);
            //  }
            }
          }
        //
        // Validate and trim the cad_records.
        //
        biz_cad_records.ValidateAndTrim();
        //
        // Notify members as appropriate.
        //
        biz_field_situations.DetectAndNotify
          (
          saved_multambholds_alert_timestamp:ref saved_meta_surge_alert_timestamp_ems,
          saved_multalsholds_alert_timestamp:ref saved_meta_surge_alert_timestamp_als,
          saved_firesurge_alert_timestamp:ref saved_meta_surge_alert_timestamp_fire
          );
        //
        Thread.Sleep(millisecondsTimeout:int.Parse(ConfigurationManager.AppSettings["vbemsbridge_refresh_rate_in_seconds"])*1000);
        //
        if (DateTime.Now < saved_datetime_to_quit)
          {
          //
          // Update the date span (to account for crossing into the next day at midnight) and click the Refresh button.
          //
          master_browser.Document.GetElementById("DateFrom").SetAttribute("value",DateTime.Today.AddDays(-2).ToString("d"));
          master_browser.Document.GetElementById("DateTo").SetAttribute("value",DateTime.Today.ToString("d"));
          doc.GetElementsByTagName("input")[4].InvokeMember("click");
          master_browser_timer.Start();
          }
        else
          {
          Dispose();
          }
        }
      catch (Exception the_exception)
        {
        k.EscalatedException(the_exception);
        }
      }

    private void master_browser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
      {
      try // Because this code only runs in the master_browser_thread, any exceptions will not bubble up to TGlobal.Application_Error(), so we must catch and raise them within master_browser_thread (I think).
        {
        master_browser_timer.Stop();
        //
        var doc = master_browser.Document;
        //
        if (master_navigation_counter.val == 1)
          {
          //
          // Log in.
          //
          doc.GetElementById("UserId").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_username"]);
          doc.GetElementById("Password").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_password"]);
          doc.All["submit"].InvokeMember("click");
          master_browser_timer.Start();
          }
        else if (master_navigation_counter.val == 2)
          {
          //
          // Acknowledge the Data Privacy Statement.
          //
          doc.GetElementById("acc_yes").InvokeMember("click");
          master_browser_timer.Start();
          }
        else if (master_navigation_counter.val == 4)
          {
          //
          // Click the "Dispatch" link.
          //
          doc.Links[1].InvokeMember("click");
          master_browser_timer.Start();
          }
        else if (master_navigation_counter.val == 6)
          {
          //
          // Navigate to the source of the target iframe.
          //
          master_browser.Navigate("https://vbems.emsbridge.com/resource/apps/caddispatch/cad_dispatch_pages.cfm?item=Dispatch&noLayout");
          master_browser_timer.Start();
          }
        else if (master_navigation_counter.val == 7)
          {
          //
          // The site does not trigger the Navigating or DocumentCompleted events past this point, so set up an event handler to run when the target control is updated by ServiceBridge's AJAX code.
          //
          doc.GetElementById("ajax_container").AttachEventHandler("onpropertychange",new EventHandler(ajax_container_PropertyChange));
          //
          // Maybe it will lighten the load on the remote site if we contract the date span from the default, which is at least a week.
          //
          doc.GetElementById("DateFrom").SetAttribute("value",DateTime.Today.AddDays(-2).ToString("d"));
          //
          // Set the "Update every" dropdown to 15 minutes.  We'll be using the Refresh link for updates instead of the supplied timer, to prevent the site from considering us idle.
          //
          var update_every_dropdown = doc.GetElementById("RunTime");
          update_every_dropdown.Children[1].SetAttribute("selected", "");
          update_every_dropdown.Children[4].SetAttribute("selected", "selected");
          update_every_dropdown.InvokeMember("onChange");
          //
          // Set the "Records per page" dropdown to 300.
          //
          var records_per_page_dropdown = doc.GetElementById("nblock");
          records_per_page_dropdown.Children[0].SetAttribute("selected", "");
          records_per_page_dropdown.Children[4].SetAttribute("selected", "selected");
          records_per_page_dropdown.InvokeMember("onChange");
          master_browser_timer.Start();
          }
        //else if (navigation_counter.val > 7)
        //  {
        //  var cells = doc.GetElementsByTagName("TD");
        //  var incident_number = k.Safe(cells[4].InnerText,k.safe_hint_type.NUM);
        //  var nature = k.Safe(cells[16].InnerText,k.safe_hint_type.ALPHA_WORDS);
        //  //
        //  browser.GoBack();
        //  }
        }
      catch (Exception the_exception)
        {
        k.EscalatedException
          (
          the_exception:the_exception,
          user_identity_name:master_browser.Document.ActiveElement.InnerHtml
          );
        }
      }

    private void master_browser_Navigating
      (
      object sender,
      WebBrowserNavigatingEventArgs e
      )
      {
      try // Because this code only runs in the master_browser_thread, any exceptions will not bubble up to TGlobal.Application_Error(), so we must catch and raise them within master_browser_thread (I think).
        {
        master_navigation_counter.val++;
        //
        if (form != null)
          {
          form.Text = e.Url.ToString();
          }
        }
      catch (Exception the_exception)
        {
        k.EscalatedException(the_exception);
        }
      }

    private void master_browser_timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
      {
      k.EscalatedException(new Exception("TClass_ac_cad_activity_notification_agent.master_browser_timer_Elapsed"));
      Dispose();
      }

    private void MasterKickoff(bool be_browser_surface_visible_for_debugging)
      {
      try // Because this code only runs in the master_browser_thread, any exceptions will not bubble up to TGlobal.Application_Error(), so we must catch and raise them within master_browser_thread (I think).
        {
        master_browser = new WebBrowser();
        master_browser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(master_browser_DocumentCompleted);
        master_browser.Navigating += new WebBrowserNavigatingEventHandler(master_browser_Navigating);
        //
        if (be_browser_surface_visible_for_debugging)
          {
          form = new Form();
          master_browser.Dock = DockStyle.Fill;
          form.Controls.Add(master_browser);
          form.Visible = true;
          }
        //
        master_browser.Navigate("https://vbems.emsbridge.com");
        master_browser_timer.Start();
        }
      catch (Exception the_exception)
        {
        k.EscalatedException(the_exception);
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TClass_ac_cad_activity_notification_agent(DateTime datetime_to_quit)
      {
      saved_datetime_to_quit = datetime_to_quit;
      //
      biz_cad_records = new TClass_biz_cad_records();
      biz_field_situations = new TClass_biz_field_situations();
      //
      master_browser_timer = new System.Timers.Timer(interval:120000); // 2 minutes
      master_browser_timer.AutoReset = false;
      master_browser_timer.Elapsed += new ElapsedEventHandler(master_browser_timer_Elapsed);
      //
      master_browser_thread = new Thread
        (
        new ThreadStart
          (
          delegate
            {
            MasterKickoff(be_browser_surface_visible_for_debugging:false);
            Application.Run(this);
            }
          )
        );
      master_browser_thread.Name = "cad_activity_notification_agent__master_browser";
      master_browser_thread.SetApartmentState(ApartmentState.STA);
      master_browser_thread.Start();
      //
      // I suspect a second thread with a second WebBrowser object will be required to navigate to the detail pages to get the natures.
      //

      //
      // Block until the master_browser_thread terminates.
      //
      master_browser_thread.Join();
      }

    public new void Dispose()
      {
      try // Because this code only runs in the master_browser_thread, any exceptions will not bubble up to TGlobal.Application_Error(), so we must catch and raise them within master_browser_thread (I think).
        {
        master_browser.Dispose();
        master_browser_thread.Abort();
        if (form != null)
          {
          form.Dispose();
          }
        base.Dispose();
        }
      catch (Exception the_exception)
        {
        k.EscalatedException(the_exception);
        }
      }

    }

  }