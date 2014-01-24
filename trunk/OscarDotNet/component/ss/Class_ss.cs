using HtmlAgilityPack;
using kix;
using System;
using System.IO;
using System.Net;
using System.Text;

namespace Class_ss
  {

  public abstract class TClass_ss
    {

    internal TClass_ss() : base()
      {
      }

    //--
    //
    // PROTECTED STATIC
    //
    //--

    protected static string EventValidationOf(HtmlDocument html_document)
      {
      return html_document.GetElementbyId("__EVENTVALIDATION").Attributes["value"].Value;
      }

    protected static HtmlDocument HtmlDocumentOf(string stream)
      {
      var html_document = new HtmlDocument(); 
      html_document.LoadHtml(stream);
      return html_document;
      }

    protected static string ConsumedStreamOf(HttpWebResponse response)
      {
      var consumed_stream_of = k.EMPTY;
      if (response != null)
        {
        var stream_reader = new StreamReader(response.GetResponseStream());
        consumed_stream_of = stream_reader.ReadToEnd();
        stream_reader.Close();
        stream_reader.Dispose();
        response.Close();  // Prevents timeout errors in later calls to HttpWebRequest.GetResponse() via Fiddler-based scraping code.
        }
      return consumed_stream_of;
      }

    protected static string TitleOf(HtmlDocument html_document)
      {
      return html_document.DocumentNode.SelectSingleNode("/html/head/title").InnerText.Trim();
      }

    protected static string ViewstateOf(HtmlDocument html_document)
      {
      return html_document.GetElementbyId("__VIEWSTATE").Attributes["value"].Value;
      }

    }

  }

