using System.ServiceModel;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "Iauthentication" in both code and config file together.
  [ServiceContract]
  public interface Iauthentication
    {
    [OperationContract]
    bool BeAuthorized
      (
      string username,
      string encoded_password
      );
    }
  }
