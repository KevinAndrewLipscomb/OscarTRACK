using kix;
using System;
using System.Text.RegularExpressions;
using System.Web;

namespace ki
  {
  public class php_app_module : IHttpModule
    {
    /// <summary>
    /// You will need to configure this module in the Web.config file of your
    /// web and register it with IIS before being able to use it. For more information
    /// see the following link: https://go.microsoft.com/?linkid=8101007
    /// </summary>
    #region IHttpModule Members

    public void Dispose()
      {
      //clean-up code here.
      }

    public void Init(HttpApplication context)
      {
      // Below is an example of how you can handle LogRequest event and provide 
      // custom logging implementation for it
      context.Error += new EventHandler(OnError);
      }

    #endregion

    public void OnError(Object source, EventArgs e)
      {
      var http_application_source = (source as HttpApplication);
      var last_error = http_application_source.Server.GetLastError();
      //
      if (Regex.IsMatch(last_error.ToString(),"A potentially dangerous Request.* value was detected from the client", RegexOptions.IgnoreCase))
        {
        http_application_source.Response.Redirect(url:"~/bad-input.phtml");
        }
      else
        {
        var request_user_host_address = http_application_source.Request.UserHostAddress;
        var request_url_string = http_application_source.Request.Url.ToString();
        k.EscalatedException
          (
          the_exception:last_error,
          user_identity_name:k.EMPTY
          + "Someone at " + request_user_host_address + " (" + k.DomainNameOfIpAddress(request_user_host_address) + ")" + k.NEW_LINE
          + "visiting " + request_url_string + k.NEW_LINE
          + k.WrapText
              (
              t:http_application_source.Request.Form.ToString(),
              insert_string:k.SPACE + k.SPACE,
              break_char_array:"&".ToCharArray(),
              max_line_len:short.MaxValue
              )
          );
        try
          {
          http_application_source.Response.Redirect(url:"~/exception.phtml");
          }
        catch
          {
          }
        }
      }
    }
  }
