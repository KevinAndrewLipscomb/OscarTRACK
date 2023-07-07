using kix;
using System.Text.RegularExpressions;

namespace Class_biz_publicity
  {

  // **
  //
  // When revising this class, consider making corresponding changes to KvrsWebsite.Class_biz_publicity.
  //
  // **

  public class TClass_biz_publicity
    {

    public TClass_biz_publicity() : base()
      {
      }

    public string RenditionOfOscalertLogContent(string content)
      {
      var rendition_of_oscalert_log_content = content;
      //
      rendition_of_oscalert_log_content = rendition_of_oscalert_log_content
        .Replace("OSCALERT: ",k.EMPTY)
        .Replace(" http://goo.gl/lvMvXs",k.EMPTY)
        .Replace(" http://fp2w.net",k.EMPTY)
        .Replace("Assgnmt=","Assgnmt: ")
        .Replace(" Volunteers to your stations.",k.EMPTY)
        .Replace(" Volunteers to your stations!",k.EMPTY)
        .Replace("MCI!","MCI")
        .Replace(" SAFETY *UNKNOWN*.",k.EMPTY)
        ;
      //
      // Remove house numbers.
      //
      rendition_of_oscalert_log_content = Regex.Replace
        (
        input:rendition_of_oscalert_log_content,
        pattern:" \\d+ ",
        replacement:k.SPACE
        );
      //
      // Make "Assgnmt" clauses (which are the only places we'll encounter a comma not followed by a space) wrapable.
      //
      rendition_of_oscalert_log_content = Regex.Replace
        (
        input:rendition_of_oscalert_log_content,
        pattern:",([^ ])",
        replacement:" $1"
        );
      //
      return rendition_of_oscalert_log_content;
      }

    } // end TClass_biz_publicity

  }