using System.IO;

namespace OscarDotNet.component.os
  {
  public static class Class_os_Static
    {
    public const string FOLDER_CONDEMNATION_FLAG_FILE_NAME = "_folder_condemned.kaf";
    public const string WWWROOT = "c:\\inetpub\\wwwroot\\";
    }

  public class Class_fs
    {
    internal void CondemnFolder(string spec)
      {
      if (Directory.Exists(spec))
        {
        File.Create(spec + "\\" + Class_os_Static.FOLDER_CONDEMNATION_FLAG_FILE_NAME);
        }
      }

    internal void DeleteCondemnedFolders(string path)
      {
      var flag_file_spec_array = Directory.GetFiles(path,Class_os_Static.FOLDER_CONDEMNATION_FLAG_FILE_NAME,SearchOption.AllDirectories);
      foreach (var flag_file_spec in flag_file_spec_array)
        {
        try
          {
          Directory.Delete(Path.GetDirectoryName(flag_file_spec),true);
          }
        catch (IOException)
          {
          }
        }
      }
    }
  }
