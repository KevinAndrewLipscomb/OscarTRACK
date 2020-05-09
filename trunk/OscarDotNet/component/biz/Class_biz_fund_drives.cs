using Class_db_role_member_map;

namespace Class_biz_fund_drives
  {

  public class TClass_biz_fund_drives
    {

    //--
    //
    // PRIVATE
    //
    //--

    private readonly TClass_db_role_member_map db_role_member_map = null;

    //--
    //
    // INTERNAL
    //
    //--

    internal string LegacyAgencyIdOfMemberId(string member_id)
      {
      return db_role_member_map.SoleSpecialAgencyOf
        (
        role_name:"Squad Fund Drive Clerk",
        member_id:member_id
        );
      }

    //--
    //
    // PUBLIC
    //
    //--

    public TClass_biz_fund_drives() : base()
      {
      db_role_member_map = new TClass_db_role_member_map();
      }

    } // end TClass_biz_fund_drives

  }
