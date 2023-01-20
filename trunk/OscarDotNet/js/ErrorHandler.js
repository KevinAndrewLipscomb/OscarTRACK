"use strict";
window.EndRequestHandler = function EndRequestHandler(_sender, args) {
    "use strict";
    if (args.get_error() !== null) {
        const APP_HANDLED_ERROR_MESSAGE_LINE = "Sys.WebForms.PageRequestManagerServerErrorException: -=:App-Handled-Message:=-\n";
        const custom_response_header_value = args.get_response().getResponseHeader("KiAspdotnetFramework-Pragma");
        const incoming_error_message = String(args.get_error().message);
        let outgoing_error_message = incoming_error_message;
        if (custom_response_header_value === "Session-Interrupted") {
            outgoing_error_message = "Your session has been interrupted.  Please log out, then log back in again.";
        }
        else if (custom_response_header_value === "App-Handled-Message") {
            outgoing_error_message = incoming_error_message.replace("Sys.WebForms.PageRequestManagerServerErrorException: ", "");
        }
        else if (incoming_error_message.startsWith(APP_HANDLED_ERROR_MESSAGE_LINE)) {
            outgoing_error_message = incoming_error_message.replace(APP_HANDLED_ERROR_MESSAGE_LINE, "");
        }
        else if (incoming_error_message.startsWith("Sys.WebForms.PageRequestManagerParserErrorException: The message received from the server could not be parsed.")) {
            outgoing_error_message = "The server sent something unexpected.  If the web application continues to behave abnormally, try logging out, then logging back in again.\n\nSorry for the inconvenience.";
        }
        alert(outgoing_error_message);
        args.set_errorHandled(true);
    }
};
if (Sys.WebForms) {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(window.EndRequestHandler);
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiRXJyb3JIYW5kbGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiRXJyb3JIYW5kbGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7QUFZTSxNQUFPLENBQUMsaUJBQWlCLEdBQUcsU0FBUyxpQkFBaUIsQ0FFMUQsT0FBVyxFQUNYLElBQXFDO0lBR3JDLFlBQVksQ0FBQztJQUliLElBQUksSUFBSSxDQUFDLFNBQVMsRUFBRSxLQUFLLElBQUksRUFDM0I7UUFDQSxNQUFNLDhCQUE4QixHQUFHLGtGQUFrRixDQUFDO1FBQzFILE1BQU0sNEJBQTRCLEdBQUcsSUFBSSxDQUFDLFlBQVksRUFBRSxDQUFDLGlCQUFpQixDQUFDLDZCQUE2QixDQUFDLENBQUM7UUFDMUcsTUFBTSxzQkFBc0IsR0FBRyxNQUFNLENBQUMsSUFBSSxDQUFDLFNBQVMsRUFBRSxDQUFDLE9BQU8sQ0FBQyxDQUFDO1FBRWhFLElBQUksc0JBQXNCLEdBQUcsc0JBQXNCLENBQUM7UUFFcEQsSUFBSSw0QkFBNEIsS0FBSyxxQkFBcUIsRUFDeEQ7WUFDQSxzQkFBc0IsR0FBRyw2RUFBNkUsQ0FBQztTQUN0RzthQUNFLElBQUksNEJBQTRCLEtBQUsscUJBQXFCLEVBQzdEO1lBQ0Esc0JBQXNCLEdBQUcsc0JBQXNCLENBQUMsT0FBTyxDQUFDLHVEQUF1RCxFQUFDLEVBQUUsQ0FBQyxDQUFDO1NBQ25IO2FBQ0UsSUFBSSxzQkFBc0IsQ0FBQyxVQUFVLENBQUMsOEJBQThCLENBQUMsRUFDeEU7WUFDQSxzQkFBc0IsR0FBRyxzQkFBc0IsQ0FBQyxPQUFPLENBQUMsOEJBQThCLEVBQUMsRUFBRSxDQUFDLENBQUM7U0FDMUY7YUFDRSxJQUFJLHNCQUFzQixDQUFDLFVBQVUsQ0FBQyxnSEFBZ0gsQ0FBQyxFQUMxSjtZQUNBLHNCQUFzQixHQUFHLDRLQUE0SyxDQUFDO1NBQ3JNO1FBQ0gsS0FBSyxDQUFDLHNCQUFzQixDQUFDLENBQUM7UUFDOUIsSUFBSSxDQUFDLGdCQUFnQixDQUFDLElBQUksQ0FBQyxDQUFDO0tBQzNCO0FBQ0gsQ0FBQyxDQUFDO0FBRUosSUFBSSxHQUFHLENBQUMsUUFBUSxFQUNkO0lBQ0EsR0FBRyxDQUFDLFFBQVEsQ0FBQyxrQkFBa0IsQ0FBQyxXQUFXLEVBQUUsQ0FBQyxjQUFjLENBQU8sTUFBTyxDQUFDLGlCQUFpQixDQUFDLENBQUM7Q0FDN0YifQ==