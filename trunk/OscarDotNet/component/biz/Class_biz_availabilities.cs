using Class_db_availabilities;
using kix;
using System;

namespace Class_biz_availabilities
  {
  public class TClass_biz_availabilities
    {

    private TClass_db_availabilities db_availabilities = null;

    public TClass_biz_availabilities() : base()
      {
      db_availabilities = new TClass_db_availabilities();
      }

    internal string SpecialRequestCommentsForMemberForMonth
      (
      string member_id,
      k.subtype<int> relative_month
      )
      {
      return db_availabilities.SpecialRequestCommentsForMemberForMonth(member_id,DateTime.Now.AddMonths(relative_month.val).ToString("MMM"));
      }

    }
  }