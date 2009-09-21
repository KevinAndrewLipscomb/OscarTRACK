Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function EndRequestHandler(sender, args)
  {
  if (args.get_error() != undefined)
    {
    alert(args.get_error().message.replace('Sys.WebForms.PageRequestManagerServerErrorException: ',""));
    args.set_errorHandled(true);
    }
  }