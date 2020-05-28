using Class_biz_users;
using Class_db_members;

namespace OscarDotNet.service
  {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "authentication" in code, svc and config file together.
  // NOTE: In order to launch WCF Test Client for testing this service, please select authentication.svc or authentication.svc.cs at the Solution Explorer and start debugging.
  public class Authentication : IAuthentication
    {

    private readonly TClass_biz_users biz_users = new TClass_biz_users();

    public bool BeAuthorized
      (
      string username,
      string encoded_password,
      out member_summary summary,
      out string[] roles
      )
      {
      return biz_users.BeAuthorized(username,encoded_password,out summary,out roles);
      }
    }
  }
