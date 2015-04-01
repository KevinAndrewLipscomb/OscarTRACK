// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situations;
using kix;

namespace Class_biz_field_situations
  {

  public class TClass_biz_field_situations
    {

    //--
    //
    // PRIVATE
    //
    //--

    private TClass_db_field_situations db_field_situations = null;

    //--
    //
    // INTERNAL/PUBLIC
    //
    //--

    public TClass_biz_field_situations() : base()
      {
      db_field_situations = new TClass_db_field_situations();
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_field_situations.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    internal string DeidentifiedRenditionOf(string address)
      {
      var deidentified_rendition_of = k.EMPTY;
      var house_num = int.MaxValue;
      var part_string_array = address.Split(k.SPACE.ToCharArray());
      if (int.TryParse(part_string_array[0],out house_num))
        {
        deidentified_rendition_of = (house_num/100*100).ToString();
        for (var i = new k.subtype<int>(1,part_string_array.Length); i.val < i.LAST; i.val++)
          {
          deidentified_rendition_of += k.SPACE + part_string_array[i.val];
          }
        }
      else
        {
        deidentified_rendition_of = address;
        }
      return deidentified_rendition_of;
      }

    } // end TClass_biz_field_situations

  }
