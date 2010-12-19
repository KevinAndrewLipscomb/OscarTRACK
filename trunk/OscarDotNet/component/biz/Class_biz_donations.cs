using Class_biz_user;
using Class_db_donations;
using kix;
using System;

namespace Class_biz_donations
  {
  public class TClass_biz_donations
    {

    private TClass_biz_user biz_user = null;
    private TClass_db_donations db_donations = null;
      
    public TClass_biz_donations() : base()
      {
      biz_user = new TClass_biz_user();
      db_donations = new TClass_db_donations();
      }

    internal void Log
      (
      string id,
      string amount,
      DateTime date,
      string in_mem_of,
      string note,
      string user_email_address
      )
      {
      db_donations.Log(id,amount,date,in_mem_of,note,biz_user.EmailAddress());
      }
    }

  }
