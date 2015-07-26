using Class_biz_agencies;
using Class_biz_members;
using Class_biz_user;
using Class_db_manifest;
using kix;
using System;
using System.Collections;

namespace Class_biz_manifest
  {
    public class TClass_biz_manifest
      {

      private TClass_biz_agencies biz_agencies = null;
      private TClass_biz_members biz_members = null;
      private TClass_biz_user biz_user = null;
      private TClass_db_manifest db_manifest = null;
      
      public TClass_biz_manifest() : base()
        {
        biz_agencies = new TClass_biz_agencies();
        biz_members = new TClass_biz_members();
        biz_user = new TClass_biz_user();
        db_manifest = new TClass_db_manifest();
        }

      internal string NewBoardingPass()
        {
        return db_manifest.NewBoardingPass(biz_agencies.KeyclickEnumeratorOf(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum()))),biz_user.EmailAddress());
        }

      }

  }