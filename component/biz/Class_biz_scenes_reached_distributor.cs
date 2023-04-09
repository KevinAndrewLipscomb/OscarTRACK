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
      //
      // Validate the request.
      //
      var log = new StreamWriter(path:HttpContext.Current.Server.MapPath($"~/cloudmailin/{ConfigurationManager.AppSettings["scratch_folder"]}/scenes_reached_distributor.log"),append:false);
      var scenes_reached_distributor_address = ConfigurationManager.AppSettings["scenes_reached_distributor_address"];
      log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: scenes_reached_distributor_address = {scenes_reached_distributor_address}");
      log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: envelope_to = {envelope_to}");
      log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: headers_to = {headers_to}");
      log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: attachment = {attachment}");
      if(
          (headers_to == scenes_reached_distributor_address)
        &&
          (envelope_to == scenes_reached_distributor_address)
        )
        {
        //
        // Skip the first line, which contains column headers.
        //
        var lines = attachment.Split('\n');
        log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: lines.Length = {lines.Length}");
        var data = lines.Skip(1);
        log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: data.Count() = {data.Count()}");
        var scene_reached_descriptors = data.Select(SceneReachedDescriptorOf);
        log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: scene_reached_descriptors.Count() = {scene_reached_descriptors.Count()}");
        var groups = db_scenes_reached.ByAgencyFromDescriptors(scene_reached_descriptors);
        log.WriteLine($"{DateTime.Now:s}: {nameof(TClass_biz_scenes_reached_distributor)}.{nameof(ProcessCloudmailinRequest)}: groups.Count = {groups.Count}");
        foreach (var group in groups)
          {
          biz_notifications.IssueLoveLetterReport
            (
            love_letter_targets:group.Value.ToList(),
            agency_id:group.Key
            );
          }
        log.Flush();
        }
      else
        {
        throw new Exception(message:"Invalid request");
        }
      }

    private SceneReachedDescriptor SceneReachedDescriptorOf(string scene_reached_csv)
      {
      //
      // By the time the scenes_reached_csv gets here, k.Safe() has converted its quotation marks to diaeresis characters.
      //
      const string PATTERN = $"{k.DIAERESIS}(.+?){k.DIAERESIS},{k.DIAERESIS}([0-9]+?){k.DIAERESIS},{k.DIAERESIS}(.*){k.DIAERESIS}";
      return new SceneReachedDescriptor()
       {
       address = Regex.Replace
         (
         input:scene_reached_csv,
         pattern:PATTERN,
         replacement:"$1 UNIT $3"
         ),
       bumper_number = Regex.Replace
         (
         input:scene_reached_csv,
         pattern:PATTERN,
         replacement:"$2"
         )
       };
      }

    } // end TClass_biz_scenes_reached_distributor
  }
