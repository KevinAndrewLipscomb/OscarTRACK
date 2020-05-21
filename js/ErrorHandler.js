function EndRequestHandler(sender, args)
  {
  //
  // This function gets registered (by the last line in this file) to run at the end of *every* request, so it must test to see whether or not there has been an error.
  //
  if (args.get_error() !== null) // There has been an error.
    {
    const APP_HANDLED_ERROR_MESSAGE_INDICATOR = "Sys.WebForms.PageRequestManagerServerErrorException: -=:AppHandledMessage:=-\n";
    let outgoing_error_message = incoming_error_message = String(args.get_error().message);
    if (incoming_error_message.startsWith(APP_HANDLED_ERROR_MESSAGE_INDICATOR))
      {
      outgoing_error_message = incoming_error_message.replace(APP_HANDLED_ERROR_MESSAGE_INDICATOR,"");
      }
    else if (incoming_error_message === "Sys.WebForms.PageRequestManagerParserErrorException: The message received from the server could not be parsed.")
      {
      outgoing_error_message = "The server sent something unexpected.  If the web application continues to behave abnormally, try logging out, then logging back in again.\n\nSorry for the inconvenience.";
      }
    alert(outgoing_error_message);
    args.set_errorHandled(true);
    }
  }

if (Sys.WebForms) Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
