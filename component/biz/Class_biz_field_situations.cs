// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_field_situations;
using kix;
using OscarDotNet.component.os;
using System.Collections.Generic;
using System.IO;
using System.Net;
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
    private Class_fs fs = null;

    //--
    //
    // INTERNAL/PUBLIC
    //
    //--

    public TClass_biz_field_situations() : base()
      {
      db_field_situations = new TClass_db_field_situations();
      fs = new Class_fs();
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

    internal string DynomapUrlOf(string address)
      {
      return "http://google.com/maps?q=" + MapRenditionOf(address);
      }

    internal string MultiMarkerMapImageUrl
      (
      Queue<string> marker_address_q,
      int height,
      int width,
      string server_mappath_tilde,
      string tilde_path_prefix
      )
      {
      var static_part = "http://google.com/maps/api/staticmap?size=" + width.ToString() + "x" + height.ToString() + "&zoom=11&center=" + HttpUtility.UrlEncode("PRESIDENTIAL BL & OLD FORGE RD,23456");
      var dynamic_part = k.EMPTY;
      var label = 'A';
      while (marker_address_q.Count > 0)
        {
        dynamic_part += "&markers=label:" + label + "|" + MapRenditionOf(marker_address_q.Dequeue());
        label = (label == 'Z' ? 'A' : (char)(((int)label) + 1));
        }
      var file_name = k.Digest(dynamic_part) + ".png";
      var disk_folder_spec = tilde_path_prefix.Replace("~",server_mappath_tilde);
      var disk_file_spec = disk_folder_spec + "/" + file_name;
      if (!File.Exists(disk_file_spec))
        {
        try
          {
          new WebClient().DownloadFile
            (
            address:static_part + dynamic_part,
            fileName:disk_file_spec
            );
          }
        catch (WebException)
          {
          }
        //
        // Delete stale files.
        //
        var time_until_stale = new System.TimeSpan
          (
          hours:0,
          minutes:2,
          seconds:0
          );
        fs.DeleteStaleFilesInFolder
          (
          path:disk_folder_spec,
          time_until_stale:time_until_stale
          );
        }
      return k.ExpandAsperand(tilde_path_prefix.Replace("~","@")) + "/" + file_name;
      }

    internal string MapRenditionOf(string address)
      {
      //**
      //
      // When revising this routine, also consider making corresponding revisions to Class_biz_residents.FilteredFromSceneVisits() and/or Class_db_residents.FilteredFromSceneVisits() and/or keyclick user-defined function
      // `NORMALIZED_STREET_SUFFIX_RENDITION`.
      //
      //**
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
        //----
        //
        // The address is in Virginia Beach.  This is the usual case.
        //
        //----
        //--
        //
        // Perform Regex operations.
        //
        //--
        //
        // Perform suffix replacements.  Account for when suffix...
        // - is at end of string;
        // - immediately precedes the intersection indicator ("/");
        // - precedes a space followed by a directional (N/S/E/W) indicator.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )AR$|(?<prefix> )AR(?<suffix>/)|(?<prefix> )AR(?<suffix> )",
          replacement:"${prefix}ARCH${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )AV$|(?<prefix> )AV(?<suffix>/)|(?<prefix> )AV(?<suffix> )",
          replacement:"${prefix}AVE${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )BD$|(?<prefix> )BD(?<suffix>/)|(?<prefix> )BD(?<suffix> )",
          replacement:"${prefix}BND${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )BL$|(?<prefix> )BL(?<suffix>/)|(?<prefix> )BL(?<suffix> )",
          replacement:"${prefix}BLVD${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CH$|(?<prefix> )CH(?<suffix>/)|(?<prefix> )CH(?<suffix> )",
          replacement:"${prefix}CHASE${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CI$|(?<prefix> )CI(?<suffix>/)|(?<prefix> )CI(?<suffix> )",
          replacement:"${prefix}CIR${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CG$|(?<prefix> )CG(?<suffix>/)|(?<prefix> )CG(?<suffix> )",
          replacement:"${prefix}XING${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CL$|(?<prefix> )CL(?<suffix>/)|(?<prefix> )CL(?<suffix> )",
          replacement:"${prefix}CLUSTER${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CS$|(?<prefix> )CS(?<suffix>/)|(?<prefix> )CS(?<suffix> )",
          replacement:"${prefix}CLOSE${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )CW$|(?<prefix> )CW(?<suffix>/)|(?<prefix> )CW(?<suffix> )",
          replacement:"${prefix}CAUSEWAY${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )GA$|(?<prefix> )GA(?<suffix>/)|(?<prefix> )GA(?<suffix> )",
          replacement:"${prefix}GATE${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )GR$|(?<prefix> )GR(?<suffix>/)|(?<prefix> )GR(?<suffix> )",
          replacement:"${prefix}GRN${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )LD$|(?<prefix> )LD(?<suffix>/)|(?<prefix> )LD(?<suffix> )",
          replacement:"${prefix}LNDG${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )LO$|(?<prefix> )LO(?<suffix>/)|(?<prefix> )LO(?<suffix> )",
          replacement:"${prefix}LOOP${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )LS$|(?<prefix> )LS(?<suffix>/)|(?<prefix> )LS(?<suffix> )",
          replacement:"${prefix}LAST${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )MW$|(?<prefix> )MW(?<suffix>/)|(?<prefix> )MW(?<suffix> )",
          replacement:"${prefix}MEWS${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )PA$|(?<prefix> )PA(?<suffix>/)|(?<prefix> )PA(?<suffix> )",
          replacement:"${prefix}PATH${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )PK$|(?<prefix> )PK(?<suffix>/)|(?<prefix> )PK(?<suffix> )",
          replacement:"${prefix}PARK${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )PW$|(?<prefix> )PW(?<suffix>/)|(?<prefix> )PW(?<suffix> )",
          replacement:"${prefix}PKWY${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )QU$|(?<prefix> )QU(?<suffix>/)|(?<prefix> )QU(?<suffix> )",
          replacement:"${prefix}QUAY${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )RE$|(?<prefix> )RE(?<suffix>/)|(?<prefix> )RE(?<suffix> )",
          replacement:"${prefix}REACH${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )RI$|(?<prefix> )RI(?<suffix>/)|(?<prefix> )RI(?<suffix> )",
          replacement:"${prefix}RDG${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )RN$|(?<prefix> )RN(?<suffix>/)|(?<prefix> )RN(?<suffix> )",
          replacement:"${prefix}RUN${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )SC$|(?<prefix> )SC(?<suffix>/)|(?<prefix> )SC(?<suffix> )",
          replacement:"${prefix}SHOPPING CENTER${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )TE$|(?<prefix> )TE(?<suffix>/)|(?<prefix> )TE(?<suffix> )",
          replacement:"${prefix}TERR${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )TL$|(?<prefix> )TL(?<suffix>/)|(?<prefix> )TL(?<suffix> )",
          replacement:"${prefix}TRL${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )TP$|(?<prefix> )TP(?<suffix>/)|(?<prefix> )TP(?<suffix> )",
          replacement:"${prefix}TPKE${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )TU$|(?<prefix> )TU(?<suffix>/)|(?<prefix> )TU(?<suffix> )",
          replacement:"${prefix}TURN${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )WA$|(?<prefix> )WA(?<suffix>/)|(?<prefix> )WA(?<suffix> )",
          replacement:"${prefix}WALK${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )WD$|(?<prefix> )WD(?<suffix>/)|(?<prefix> )WD(?<suffix> )",
          replacement:"${prefix}WYND${suffix}"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )WF$|(?<prefix> )WF(?<suffix>/)|(?<prefix> )WF(?<suffix> )",
          replacement:"${prefix}WHARF${suffix}"
          );
        //
        // Account for the special "BW" (boardwalk) case.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )BW$|(?<prefix> )BW(?<suffix>/)|(?<prefix> )BW(?<suffix> )|^BW(?<suffix> )",
          replacement:"${prefix}BOARDWALK${suffix}"
          );
        //
        // Account for beach-borough "half streets".
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix> )HALF ST$|(?<prefix> )HALF ST(?<suffix>/)",
          replacement:"${prefix}1/2 ST${suffix}"
          );
        //
        // Account for certain truncations that appear in data source.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:" B$",
          replacement:" BLVD"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:" P$",
          replacement:" PKWY"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:" R$",
          replacement:" RD"
          );
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"/VIRGINIA BEACH$",
          replacement:"/VIRGINIA BEACH BLVD"
          );
        //
        // For a WaterWay, strip the WW suffix *and* strip out the house_num, if any.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<house_num>[0-9]+ )(?<name>[A-Z ]+ )WW$",
          replacement:"${name}"
          );
        //
        // Perform simple replacements.
        //
        map_rendition_of = map_rendition_of
        .Replace("BOARDWALK BOARDWALK","ATLANTIC AVE")
        .Replace("BOARDWALK/","ATLANTIC AVE/")
        .Replace("/BOARDWALK","/ATLANTIC AVE")
        .Replace("OCEANFRONT/","ATLANTIC AVE/")
        .Replace("/OCEANFRONT","/ATLANTIC AVE")
        .Replace("100 64 ","I-64 & ")
        .Replace("100 64E ","I-64 & ")
        .Replace("100 64W ","I-64 & ")
        .Replace("100 264 ","I-264 & ")
        .Replace("100 264E ","I-264 & ")
        .Replace("100 264W ","I-264 & ")
        .Replace("100 DN ","DAM NECK NAVAL BASE ")
        .Replace("4400 NORTHAMPTON BLVD","CHESAPEAKE BAY BRIDGE TUNNEL");
        //
        // Convert true intersection indicators (and not 1/2-street indicators) to Google format.
        //
        map_rendition_of = Regex.Replace
          (
          input:map_rendition_of,
          pattern:"(?<prefix>[^1])/(?<suffix>[^2])",
          replacement:"${prefix} & ${suffix}"
          );
        //
        // Add context.
        //
        map_rendition_of += ",Virginia Beach,VA";
        }
      return HttpUtility.UrlEncode(map_rendition_of);
      }

    internal void Remove(string id)
      {
      db_field_situations.Remove(id);
      }

    } // end TClass_biz_field_situations

  }
