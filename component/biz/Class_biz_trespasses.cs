// Derived from KiAspdotnetFramework/Models/Class~biz~~template~kicrudhelped~items.cs~template

using Class_db_trespasses;
using kix;

namespace Class_biz_trespasses
{
  public class TClass_biz_trespasses
    {

    private readonly TClass_db_trespasses db_trespasses = null;

    public TClass_biz_trespasses() : base()
      {
      db_trespasses = new TClass_db_trespasses();
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string keyclick_enumerator_filter = k.EMPTY
      )
      {
      db_trespasses.BindBaseDataList(sort_order,be_sort_order_ascending,target,keyclick_enumerator_filter);
      }

    internal void BindClaimDetailsBaseDataList
      (
      string house_num,
      string street_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_trespasses.BindClaimDetailsBaseDataList(house_num,street_id,sort_order,be_sort_order_ascending,target);
      }

    } // end TClass_biz_trespasses
  }
