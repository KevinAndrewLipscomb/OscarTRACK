using System;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;
using System.Configuration;

namespace Class_ss_vbemsbridge
  {

  public class TClass_ss_vbemsbridge : ApplicationContext
    {

    //--
    //
    // PRIVATE
    //
    //--

    private WebBrowser browser;
    private Thread browser_thread;
    private Form form;
    private int navigation_counter;

    private void ajax_container_PropertyChange
      (
      object sender,
      EventArgs e
      )
      {
      var juice = browser.Document.GetElementById("ajax_container").InnerHtml;
      //
      // Call biz layer to process, store, and analyze the juice, and to trigger notifications as appropriate.
      //
      Thread.Sleep(millisecondsTimeout:int.Parse(ConfigurationManager.AppSettings["vbemsbridge_refresh_rate_in_seconds"])*1000);
      //
      // Click the Refresh button.
      //
      browser.Document.GetElementsByTagName("input")[4].InvokeMember("click");
      }

    private void browser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
      {
      var doc = browser.Document;
      //
      if (navigation_counter == 1)
        {
        //
        // Log in.
        //
        doc.GetElementById("UserId").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_username"]);
        doc.GetElementById("Password").SetAttribute("value", ConfigurationManager.AppSettings["vbemsbridge_password"]);
        doc.GetElementById("submit").InvokeMember("click");
        }
      else if (navigation_counter == 2)
        {
        //
        // Acknowledge the Data Privacy Statement.
        //
        doc.GetElementById("acc_yes").InvokeMember("click");
        }
      else if (navigation_counter == 4)
        {
        //
        // Click the "Dispatch" link.
        //
        doc.Links[1].InvokeMember("click");
        }
      else if (navigation_counter == 6)
        {
        //
        // Navigate to the source of the target iframe.
        //
        browser.Navigate("https://vbems.emsbridge.com/resource/apps/caddispatch/cad_dispatch_pages.cfm?item=Dispatch&noLayout");
        }
      else if (navigation_counter == 7)
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
      navigation_counter++;
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
      navigation_counter = 0;
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
          Thread.Sleep(millisecondsTimeout:1000);
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