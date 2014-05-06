using Class_biz_cad_records;
using Class_biz_field_situations;
using kix;
using System;
using System.Configuration;
using System.Runtime.InteropServices;
using System.Threading;
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
    private Form form;
    private k.int_nonnegative master_navigation_counter = new k.int_nonnegative();
    DateTime saved_day;
    DateTime saved_meta_surge_alert_timestamp_ems;
    DateTime saved_meta_surge_alert_timestamp_als;
    DateTime saved_meta_surge_alert_timestamp_fire;

    private void ajax_container_PropertyChange
      (
      object sender,
      EventArgs e
      )
      {
      try
        {

      var doc = master_browser.Document;
      var rows = doc.GetElementById("ajax_container").GetElementsByTagName("tr");
HtmlElementCollection cells;
      for (var i = new k.subtype<int>(2,rows.Count); i.val < i.LAST; i.val++)
        {
        try
          {

        cells = rows[i.val].GetElementsByTagName("td"); //var cells = rows[i.val].GetElementsByTagName("td");
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
        catch (Exception the_exception)
          {
          k.EscalatedException(the_exception);
          }
        }
      //
      // Trim the cad_records.
      //
      biz_cad_records.Trim();
      //
      // Notify members as appropriate.
      //
      biz_field_situations.DetectAndNotify
        (
        saved_meta_surge_alert_timestamp_ems:ref saved_meta_surge_alert_timestamp_ems,
        saved_meta_surge_alert_timestamp_als:ref saved_meta_surge_alert_timestamp_als,
        saved_meta_surge_alert_timestamp_fire:ref saved_meta_surge_alert_timestamp_fire
        );
      //
      Thread.Sleep(millisecondsTimeout:int.Parse(ConfigurationManager.AppSettings["vbemsbridge_refresh_rate_in_seconds"])*1000);
      //
      if (DateTime.Today == saved_day) // if awakening on the same day...
        {
        //
        // Click the Refresh button.
        //
        doc.GetElementsByTagName("input")[4].InvokeMember("click");
        }
      else
        {
        //
        // The remote site seems to stop responding at midnight, so clicking Refresh seems not to work when awaking on the next day.  Time to die.
        //
        Dispose(disposing:true);
        }

        }
      catch (Exception the_exception)
        {
        k.EscalatedException(the_exception);
        }
      }

    private void master_browser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
      {
      try
        {

      var doc = master_browser.Document;
      //
      if (master_navigation_counter.val == 1)
        {
        //
        // Log in.
        //
        doc.GetElementById("UserId").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_username"]);
        doc.GetElementById("Password").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_password"]);
        doc.GetElementById("submit").InvokeMember("click");
        }
      else if (master_navigation_counter.val == 2)
        {
        //
        // Acknowledge the Data Privacy Statement.
        //
        doc.GetElementById("acc_yes").InvokeMember("click");
        }
      else if (master_navigation_counter.val == 4)
        {
        //
        // Click the "Dispatch" link.
        //
        doc.Links[1].InvokeMember("click");
        }
      else if (master_navigation_counter.val == 6)
        {
        //
        // Navigate to the source of the target iframe.
        //
        master_browser.Navigate("https://vbems.emsbridge.com/resource/apps/caddispatch/cad_dispatch_pages.cfm?item=Dispatch&noLayout");
        }
      else if (master_navigation_counter.val == 7)
        {
        //
        // Set the "Records per page" dropdown to 300.
        //
        var records_per_page_dropdown = master_browser.Document.GetElementById("nblock");
        records_per_page_dropdown.Children[0].SetAttribute("selected", "");
        records_per_page_dropdown.Children[4].SetAttribute("selected", "selected");
        records_per_page_dropdown.InvokeMember("onChange");
        //
        // Set the "Update every" dropdown to 15 minutes.  We'll be using the Refresh link for updates instead of the supplied timer, to prevent the site from considering us idle.
        //
        var update_every_dropdown = master_browser.Document.GetElementById("RunTime");
        update_every_dropdown.Children[1].SetAttribute("selected", "");
        update_every_dropdown.Children[4].SetAttribute("selected", "selected");
        update_every_dropdown.InvokeMember("onChange");
        //
        // The site does not trigger the Navigating or DocumentCompleted events past this point, so set up an event handler to run when the target control is updated by ServiceBridge's AJAX code.
        //
        doc.GetElementById("ajax_container").AttachEventHandler("onpropertychange",new EventHandler(ajax_container_PropertyChange));
        //
        // Make a note of the current day, for comparison when waking up during ajax_container_PropertyChange().
        //
        saved_day = DateTime.Today;
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
      master_navigation_counter.val++;
      //
      if (form != null)
        {
        form.Text = e.Url.ToString();
        }
      }

    private void MasterKickoff(bool be_browser_surface_visible_for_debugging)
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
      var be_successful = false;
      while (!be_successful)
        {
        try
          {
          master_browser.Navigate("https://vbems.emsbridge.com");
          be_successful = true;
          }
        catch (Exception the_exception)
          {
          if (the_exception.Message == "Error HRESULT E_FAIL has been returned from a call to a COM component.")
            {
            Thread.Sleep(millisecondsTimeout:1000);
            }
          else
            {
            k.EscalatedException(the_exception);
            throw the_exception;
            }
          }
        }
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected override void Dispose(bool disposing)
      {
      if (master_browser_thread == null)
        {
        Marshal.Release(master_browser.Handle);
        master_browser.Dispose();
        if (form != null)
          {
          form.Dispose();
          }
        base.Dispose(disposing);
        }
      else
        {
        master_browser_thread.Abort();
        master_browser_thread = null;
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TClass_ac_cad_activity_notification_agent()
      {
      biz_cad_records = new TClass_biz_cad_records();
      biz_field_situations = new TClass_biz_field_situations();
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

    }

  }