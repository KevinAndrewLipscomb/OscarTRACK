// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situations;
using kix;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;

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

    internal string MapUrlOf(string address)
      {
      return "http://google.com/maps?q=" + MapRenditionOf(address);
      }

    internal string MapUrl
      (
      Queue<string> marker_address_q,
      int height,
      int width
      )
      {
      var map_url = "http://google.com/maps/api/staticmap?size=" + width.ToString() + "x" + height.ToString() + "&zoom=11&center=" + HttpUtility.UrlEncode("PRESIDENTIAL BL & OLD FORGE RD,23456");
      var label = 'A';
      while (marker_address_q.Count > 0)
        {
        map_url += "&markers=label:" + label + "|" + MapRenditionOf(marker_address_q.Dequeue());
        label = (label == 'Z' ? 'A' : (char)(((int)label) + 1));
        }
      return map_url;
      }

    internal string MapRenditionOf(string address)
      {
      var map_rendition_of = address;
      //
      // Test whether the address only indicates mutual aid to another city.
      //
      if (map_rendition_of == "100 NORFOLK CY")
        {
        map_rendition_of = "NORFOLK,VA";
        }
      else if (map_rendition_of == "100 CHESAPEAKE CY")
        {
        map_rendition_of = "CHESAPEAKE,VA";
        }
      else if (map_rendition_of == "100 PORTSMOUTH CY")
        {
        map_rendition_of = "PORTSMOUTH,VA";
        }
      else if (map_rendition_of == "100 SUFFOLK CY")
        {
        map_rendition_of = "SUFFOLK,VA";
        }
      else
        {
        //--
        //
        // The address is in Virginia Beach.  This is the usual case.
        //
        //--
        //
        // For a WaterWay, strip the WW suffix *and* strip out the house_num, if any.
        //
        if (map_rendition_of.Contains(" WW"))
          {
          map_rendition_of = k.Safe(map_rendition_of.Replace(" WW",k.EMPTY),k.safe_hint_type.ALPHA_WORDS).Trim();
          }
        //
        // Perform Regex operations.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:" AR$",
          replacement:" ARCH"
          );
        //
        // Perform simple replacements *and* append ',Va Beach,VA'.
        //
        map_rendition_of = map_rendition_of
        .Replace("/"," & ")
        .Replace("BOARDWALK","ATLANTIC AV")
        .Replace(" AR "," ARCH ")
        .Replace(" BW",k.EMPTY)
        .Replace(" CI"," CIR")
        .Replace(" CW"," CAUSEWAY")
        .Replace(" LD"," LNDG")
        .Replace(" PW"," PKWY")
        .Replace(" WF"," WHARF")
        .Replace("100 64 ","I-64 & ")
        .Replace("100 64E ","I-64 & ")
        .Replace("100 64W ","I-64 & ")
        .Replace("100 264 ","I-264 & ")
        .Replace("100 264E ","I-264 & ")
        .Replace("100 264W ","I-264 & ")
        .Replace("100 DN ","DAM NECK NAVAL BASE ")
        + ",Va Beach,VA";
        }
      return HttpUtility.UrlEncode(map_rendition_of);
      }

    } // end TClass_biz_field_situations

  }
