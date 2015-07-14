function EndRequestHandler(sender, args)
  {
  if (args.get_error() != undefined)
    {
    var outgoing_error_message = incoming_error_message = args.get_error().message;
    if(
        (incoming_error_message == "Sys.WebForms.PageRequestManagerParserErrorException: The message received from the server could not be parsed.")
      ||
        (incoming_error_message.indexOf("Sys.WebForms.PageRequestManagerServerErrorException: ") == 0)
      )
      {
      outgoing_error_message = "The server sent something unexpected.  If the web application continues to behave abnormally, try logging out, then logging back in again.\n\nSorry for the inconvenience.";
      }
    alert(outgoing_error_message);
    args.set_errorHandled(true);
    }
  }

if (Sys.WebForms)
  {
  if (Sys.WebForms) Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
  }