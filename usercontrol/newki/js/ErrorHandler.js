function EndRequestHandler(sender, args)
  {
  //
  // This function gets registered (by the last line in this file) to run at the end of *every* request, so it must test to see whether or not there has been an error.
  //
  if (args.get_error() !== null) // There has been an error.
    {
    const APP_HANDLED_ERROR_MESSAGE_LINE = "Sys.WebForms.PageRequestManagerServerErrorException: -=:App-Handled-Message:=-\n"; // must correspond to ki_web_ui.common.APP_HANDLED_ASYNC_POST_BACK_ERROR_MESSAGE_MARK
    //
    let outgoing_error_message = incoming_error_message = String(args.get_error().message);
    let custom_response_header_value = args.get_response().getResponseHeader("KiAspdotnetFramework-Pragma");
    //
    if (custom_response_header_value === "Session-Interrupted")
      {
      outgoing_error_message = "Your session has been interrupted.  Please log out, then log back in again.";
      }
    else if (custom_response_header_value === "App-Handled-Message") // we've figured out how to implement the preferred HTTP header based indication mechanism
      {
      outgoing_error_message = incoming_error_message.replace("Sys.WebForms.PageRequestManagerServerErrorException: ","");
      }
    else if (incoming_error_message.startsWith(APP_HANDLED_ERROR_MESSAGE_LINE)) // we're still using the suboptimal message-based indication mechanism
      {
      outgoing_error_message = incoming_error_message.replace(APP_HANDLED_ERROR_MESSAGE_LINE,"");
      }
    else if (incoming_error_message.startsWith("Sys.WebForms.PageRequestManagerParserErrorException: The message received from the server could not be parsed."))
      {
      outgoing_error_message = "The server sent something unexpected.  If the web application continues to behave abnormally, try logging out, then logging back in again.\n\nSorry for the inconvenience.";
      }
    alert(outgoing_error_message);
    args.set_errorHandled(true);
    }
  }

if (Sys.WebForms) Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
