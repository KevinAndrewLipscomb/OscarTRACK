using Class_biz_cad_records;
using kix;
using System;
using System.Configuration;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;

namespace Class_ss_vbemsbridge
  {

  public class TClass_ss_vbemsbridge : ApplicationContext
    {

    //--
    //
    // PRIVATE
    //
    //--

    private TClass_biz_cad_records biz_cad_records = null;
    private WebBrowser browser;
    private Thread browser_thread;
    private Form form;
    private k.int_nonnegative navigation_counter = new k.int_nonnegative();

    private void ajax_container_PropertyChange
      (
      object sender,
      EventArgs e
      )
      {
      //try
      //  {
      var rows = browser.Document.GetElementById("ajax_container").GetElementsByTagName("tr");
      for (var i = new k.subtype<int>(2,rows.Count); i.val < i.LAST; i.val++)
        {
        var cells = rows[i.val].GetElementsByTagName("td");
        if (cells.Count == 17)
          {
          biz_cad_records.Set
            (
            id:k.EMPTY,
            incident_date:cells[0].InnerText.Trim(),
            incident_num:cells[1].InnerText.Trim(),
            incident_address:cells[4].InnerText.Trim(),
            call_sign:cells[5].InnerText.Trim(),
            time_initialized:cells[8].InnerText.Trim(),
            time_of_alarm:cells[9].InnerText.Trim(),
            time_enroute:cells[10].InnerText.Trim(),
            time_on_scene:cells[11].InnerText.Trim(),
            time_transporting:cells[12].InnerText.Trim(),
            time_at_hospital:cells[13].InnerText.Trim(),
            time_available:cells[14].InnerText.Trim(),
            time_downloaded:cells[16].InnerText.Trim()
            );
          }
        }
      //
      Thread.Sleep(millisecondsTimeout:int.Parse(ConfigurationManager.AppSettings["vbemsbridge_refresh_rate_in_seconds"])*1000);
      //
      // Click the Refresh button.
      //
      browser.Document.GetElementsByTagName("input")[4].InvokeMember("click");
      //  }
      //catch (Exception ex)
      //  {
      //  }
      }

    private void browser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
      {
      var doc = browser.Document;
      //
      if (navigation_counter.val == 1)
        {
        //
        // Log in.
        //
        doc.GetElementById("UserId").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_username"]);
        doc.GetElementById("Password").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_password"]);
        doc.GetElementById("submit").InvokeMember("click");
        }
      else if (navigation_counter.val == 2)
        {
        //
        // Acknowledge the Data Privacy Statement.
        //
        doc.GetElementById("acc_yes").InvokeMember("click");
        }
      else if (navigation_counter.val == 4)
        {
        //
        // Click the "Dispatch" link.
        //
        doc.Links[1].InvokeMember("click");
        }
      else if (navigation_counter.val == 6)
        {
        //
        // Navigate to the source of the target iframe.
        //
        browser.Navigate("https://vbems.emsbridge.com/resource/apps/caddispatch/cad_dispatch_pages.cfm?item=Dispatch&noLayout");
        }
      else if (navigation_counter.val == 7)
        {
        //
        // Set the "Records per page" dropdown to 300.
        //
        var records_per_page_dropdown = browser.Document.GetElementById("nblock");
        records_per_page_dropdown.Children[0].SetAttribute("selected", "");
        records_per_page_dropdown.Children[4].SetAttribute("selected", "selected");
        records_per_page_dropdown.InvokeMember("onChange");
        //
        // Set the "Update every" dropdown to 15 minutes.  We'll be using the Refresh link for updates instead of the supplied timer, to prevent the site from considering us idle.
        //
        var update_every_dropdown = browser.Document.GetElementById("RunTime");
        update_every_dropdown.Children[1].SetAttribute("selected", "");
        update_every_dropdown.Children[4].SetAttribute("selected", "selected");
        update_every_dropdown.InvokeMember("onChange");
        //
        // The site does not trigger the Navigating or DocumentCompleted events past this point, so set up an event handler to run when the target control is updated by ServiceBridge's AJAX code.
        //
        doc.GetElementById("ajax_container").AttachEventHandler("onpropertychange",new EventHandler(ajax_container_PropertyChange));
        }
      }

    private void browser_Navigating
      (
      object sender,
      WebBrowserNavigatingEventArgs e
      )
      {
      navigation_counter.val++;
      //
      if (form != null)
        {
        form.Text = e.Url.ToString();
        }
      }

    private void Kickoff(bool be_browser_surface_visible_for_debugging)
      {
      browser = new WebBrowser();
      browser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(browser_DocumentCompleted);
      browser.Navigating += new WebBrowserNavigatingEventHandler(browser_Navigating);
      //
      if (be_browser_surface_visible_for_debugging)
        {
        form = new Form();
        browser.Dock = DockStyle.Fill;
        form.Controls.Add(browser);
        form.Visible = true;
        }
      //
      var be_successful = false;
      while (!be_successful)
        {
        try
          {
          browser.Navigate("https://vbems.emsbridge.com");
          be_successful = true;
          }
        catch (Exception e)
          {
          if (e.Message == "Error HRESULT E_FAIL has been returned from a call to a COM component.")
            {
            Thread.Sleep(millisecondsTimeout:1000);
            }
          else
            {
            throw e;
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
      if (browser_thread == null)
        {
        Marshal.Release(browser.Handle);
        browser.Dispose();
        if (form != null)
          {
          form.Dispose();
          }
        base.Dispose(disposing);
        }
      else
        {
        browser_thread.Abort();
        browser_thread = null;
        }
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TClass_ss_vbemsbridge()
      {
      biz_cad_records = new TClass_biz_cad_records();
      //
      browser_thread = new Thread
        (
        new ThreadStart
          (
          delegate
            {
            Kickoff(be_browser_surface_visible_for_debugging:false);
            Application.Run(this);
            }
          )
        );
      browser_thread.SetApartmentState(ApartmentState.STA);
      browser_thread.Start();
      }

    }

  }