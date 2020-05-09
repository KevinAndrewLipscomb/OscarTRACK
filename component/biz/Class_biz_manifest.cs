using Class_biz_user;
using Class_db_manifest;

namespace Class_biz_manifest
  {
  public class TClass_biz_manifest
      {

      private readonly TClass_biz_user biz_user = null;
      private readonly TClass_db_manifest db_manifest = null;
      
      public TClass_biz_manifest() : base()
        {
        biz_user = new TClass_biz_user();
        db_manifest = new TClass_db_manifest();
        }

      internal string NewBoardingPass(string agency_keyclick_enumerator)
        {
        return db_manifest.NewBoardingPass
          (
          agency_keyclick_enumerator:agency_keyclick_enumerator,
          email_address:biz_user.EmailAddress()
          );
        }

      }

  }
