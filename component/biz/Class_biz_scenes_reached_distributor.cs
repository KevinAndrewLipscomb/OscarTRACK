using Class_biz_notifications;
using Class_db_scenes_reached;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Class_biz_scenes_reached_distributor
{
  public class TClass_biz_scenes_reached_distributor
    {

    private readonly TClass_biz_notifications biz_notifications = null;
    private readonly TClass_db_scenes_reached db_scenes_reached = null;

    internal TClass_biz_scenes_reached_distributor() : base()
      {
      biz_notifications = new TClass_biz_notifications();
      db_scenes_reached = new TClass_db_scenes_reached();
      }

    internal void ProcessCloudmailinRequest
      (
      string envelope_to,
      string headers_to,
      string attachment
      )
      {
      var scenes_reached_distributor_address = ConfigurationManager.AppSettings["scenes_reached_distributor_address"];
      if (envelope_to == scenes_reached_distributor_address)
        {
        //
        // Skip the first line, which contains column headers.
        //
        var attachment_lines = attachment.Split
          (
          separator:new string[] {"\r\n"},
          options:StringSplitOptions.RemoveEmptyEntries
          );
        foreach (var group in db_scenes_reached.ByAgencyFromDescriptors(attachment_lines.Skip(1).Select(SceneReachedDescriptorOf)))
          {
          biz_notifications.IssueLoveLetterReport
            (
            love_letter_targets:group.Value.ToList(),
            agency_id:group.Key
            );
          }
        }
      else
        {
        throw new Exception(message:$"The envelope_to field '{envelope_to}' does not match the unpublished gateway address.");
        }
      }

    private SceneReachedDescriptor SceneReachedDescriptorOf(string scene_reached_csv)
      {
      //
      // By the time the scenes_reached_csv gets here, k.Safe() is required to have converted its quotation marks to diaeresis
      // characters, or deriving a descriptor will fail.
      //
      const string INITIAL_PATTERN = $"{k.DIAERESIS}(.+?){k.DIAERESIS},{k.DIAERESIS}([0-9]+?){k.DIAERESIS},{k.DIAERESIS}(.*){k.DIAERESIS}";
      return new SceneReachedDescriptor()
        {
        address = Regex.Replace // Outer replace removes dangling " UNIT " endings.
          (
          input:Regex.Replace // Inner replace often leaves dangling " UNIT " endings.
            (
            input:scene_reached_csv,
            pattern:INITIAL_PATTERN,
            replacement:"$1 UNIT $3"
            ),
          pattern:" UNIT $",
          replacement:k.EMPTY
          ),
        bumper_number = Regex.Replace
          (
          input:scene_reached_csv,
          pattern:INITIAL_PATTERN,
          replacement:"$2"
          )
        };
      }

    } // end TClass_biz_scenes_reached_distributor
  }
