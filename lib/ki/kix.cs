#pragma warning disable CA1034 // Nested types should not be visible

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using System.Web.UI;

namespace kix
  {

  public static class k
    {

    //====
    //
    // PRIVATE MEMBERS
    //
    //====

    private static bool be_smtp_mail_send_reliable = true;

    //====
    //
    // PUBLIC MEMBERS
    //
    //====

    //--
    //
    // Consts
    //
    //--

    public const string ACUTE_ACCENT = "\u00B4"; // ´
    public const string APOSTROPHE = "\'";
    public const string CENT_SIGN = "\u00A2"; // ¢
    public const string COMMA = ",";
    public const string COMMA_SPACE = ", ";
    public const string DIAERESIS = "\u00A8"; // ¨
    public const string DOUBLE_APOSTROPHE = "''";
    public const string DOUBLE_QUOTE = "\"\"";
    public const string EMPTY = "";
    public const string HYPHEN = "-";
    public const string INVERTED_EXCLAMATION_MARK = "\u00A1"; // ¡
    public const string LEFT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK = "\u00AB"; //«
    public const short MAX_RFC_2822_ET_SEQ_EMAIL_LINE_LENGTH = 998;
    public const string NEW_LINE = "\n";
    public const string NO_BREAK_SPACE = "\u00A0";
    public const string OPEN_PARENTHESIS = "(";
    public const string PERIOD = ".";
    public const string QUOTE = "\"";
    public const string RIGHT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK = "\u00BB"; //»
    public const string SEMICOLON = ";";
    public const string SPACE = "\u0020";
    public const string SPACE_HYPHEN_SPACE = " - ";
    public const string SPACE_HYPHENS_SPACE = " -- ";
    public const string SQL_CSV_FIELDIFY_PREFIX = "CONCAT('" + k.QUOTE + "',REPLACE(";
    public const string SQL_CSV_FIELDIFY_SUFFIX = ",'" + k.QUOTE + "','" + k.DOUBLE_QUOTE + "'),'" + k.QUOTE + "')";
    public const string TAB = "\t";

    //--
    //
    // Enums
    //
    //--

    public enum alert_cause_type
      {
      APPDATA,
      DBMS,
      FILESYSTEM,
      LOGIC,
      MEMORY,
      NETWORK,
      OTHER,
      USER,
      }

    public enum alert_state_type
      {
      NORMAL,
      SUCCESS,
      WARNING,
      FAILURE,
      DAMAGE,
      }

    public enum client_side_function_enumeral_type
      {
      EL,
      KGS_TO_LBS,
      LBS_TO_KGS,
      REMOVE_EL
      }

    public enum safe_hint_type
      {
      NONE,
      ALPHA,
      ALPHA_WORDS,
      ALPHANUM,
      BASE64,
      CURRENCY_USA,
      DATE_TIME,
      ECMASCRIPT_WORD,
      EMAIL_ADDRESS,
      EMAIL_ADDRESS_CSV,
      FINANCIAL_TERMS,
      HEX,
      HOSTNAME,
      HTTP_TARGET,
      HUMAN_NAME,
      HUMAN_NAME_CSV,
      HYPHENATED_ALPHA,
      HYPHENATED_ALPHA_WORDS,
      HYPHENATED_ALPHANUM,
      HYPHENATED_ALPHANUM_WORDS,
      HYPHENATED_NUM,
      HYPHENATED_UNDERSCORED_ALPHANUM,
      KI_SORT_EXPRESSION,
      MAKE_MODEL,
      MEMO,
      NUM,
      NUM_CSV,
      ORG_NAME,
      ORG_NAME_ASTERICIZED,
      PHONE_NUM,
      POSTAL_CITY,
      POSTAL_CITY_CSV,
      POSTAL_STREET_ADDRESS,
      PUNCTUATED,
      REAL_NUM,
      REAL_NUM_INCLUDING_NEGATIVE,
      }

    //--
    //
    // Objects
    //
    //--

    //-
    // Exceptions
    //-

    public static readonly Exception PRIVILEGE_VIOLATION = new Exception("kix.k.PRIVILEGE_VIOLATION");


    //--
    //
    // Structs
    //
    //--

    //
    // client_side_function_rec_type
    //
    #pragma warning disable CA1051 // Do not declare visible instance fields
    public struct client_side_function_rec_type
      {
      public string profile;
      public string body;
      }
    #pragma warning restore CA1051 // Do not declare visible instance fields

    //
    // subtype
    //
    #pragma warning disable CA1066 // Type {0} should implement IEquatable<T> because it overrides Equals
    #pragma warning disable CS0659 // Type overrides Object.Equals(object o) but does not override Object.GetHashCode()
    #pragma warning disable CS0661 // Type defines operator == or operator != but does not override Object.GetHashCode()
    public struct subtype<TComparable> where TComparable : IComparable
    #pragma warning restore CS0661 // Type defines operator == or operator != but does not override Object.GetHashCode()
    #pragma warning restore CS0659 // Type overrides Object.Equals(object o) but does not override Object.GetHashCode()
    #pragma warning restore CA1066 // Type {0} should implement IEquatable<T> because it overrides Equals
      {
      //
      private readonly TComparable first;
      private TComparable current;
      private readonly TComparable last;
      //
      public static readonly Exception CONSTRAINT_ERROR = new Exception("kix.k.subtype<TComparable>.CONSTRAINT_ERROR");
      public subtype
        (
        TComparable the_first,
        TComparable the_last
        )
        {
        first = the_first;
        current = the_first;
        last = the_last;
        }
      public TComparable val
        {
        get
          {
          return current;
          }
        set
          {
          if ((value.CompareTo(first) < 0) || (value.CompareTo(last) > 0))
            {
            throw CONSTRAINT_ERROR;
            }
          unchecked
            {
            current = value;
            }
          }
        }
      public TComparable FIRST
        {
        get
          {
          return first;
          }
        }
      public TComparable LAST
        {
        get
          {
          return last;
          }
        }
      public override bool Equals(object obj)
        {
        return obj is subtype<TComparable> subtype && EqualityComparer<TComparable>.Default.Equals(val, subtype.val);
        }
      public static bool operator ==(subtype<TComparable> left, subtype<TComparable> right)
        {
        return left.Equals(right);
        }
      public static bool operator !=(subtype<TComparable> left, subtype<TComparable> right)
        {
        return !(left == right);
        }
      }

    //--
    //
    // Classes based on instatiations of generic struct 'subtype'
    //
    //--

    public class int_month
      {
      private subtype<int> current;
      public int_month()
        {
        current = new subtype<int>(1,12);
        }
      public int_month(int val)
        {
        current = new subtype<int>(1,12);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_negative
      {
      private subtype<int> current;
      public int_negative()
        {
        current = new subtype<int>(int.MinValue,-1);
        }
      public int_negative(int val)
        {
        current = new subtype<int>(int.MinValue,-1);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_nonnegative
      {
      private subtype<int> current;
      public int_nonnegative()
        {
        current = new subtype<int>(0,int.MaxValue);
        }
      public int_nonnegative(int val)
        {
        current = new subtype<int>(0,int.MaxValue);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_nonpositive
      {
      private subtype<int> current;
      public int_nonpositive()
        {
        current = new subtype<int>(int.MinValue,0);
        }
      public int_nonpositive(int val)
        {
        current = new subtype<int>(int.MinValue,0);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_positive
      {
      private subtype<int> current;
      public int_positive()
        {
        current = new subtype<int>(1,int.MaxValue);
        }
      public int_positive(int val)
        {
        current = new subtype<int>(1,int.MaxValue);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_sign_range
      {
      private subtype<int> current;
      public int_sign_range()
        {
        current = new subtype<int>(-1,1);
        }
      public int_sign_range(int val)
        {
        current = new subtype<int>(-1,1);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class int_year_mysql
      {
      private subtype<int> current;
      public int_year_mysql()
        {
        current = new subtype<int>(1901,2155);
        }
      public int_year_mysql(int val)
        {
        current = new subtype<int>(1901,2155);
        current.val = val;
        }
      public int val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class decimal_nonnegative
      {
      private subtype<decimal> current;
      public decimal_nonnegative()
        {
        current = new subtype<decimal>(0,decimal.MaxValue);
        }
      public decimal_nonnegative(decimal val)
        {
        current = new subtype<decimal>(0,decimal.MaxValue);
        current.val = val;
        }
      public decimal val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    public class decimal_positive
      {
      private subtype<decimal> current;
      public decimal_positive()
        {
        current = new subtype<decimal>(1,decimal.MaxValue);
        }
      public decimal_positive(decimal val)
        {
        current = new subtype<decimal>(1,decimal.MaxValue);
        current.val = val;
        }
      public decimal val
        {
        get
          {
          return current.val;
          }
        set
          {
          current.val = value;
          }
        }
      }

    //--
    //
    // Static methods
    //
    //--

    public static decimal AverageDeviation
      (
      ArrayList array_list,
      decimal median_value
      )
      {
      var n = array_list.Count;
      var sum = (decimal)0;
      for (var i = 0; i <= (n - 1); i++)
        {
        sum += Math.Abs((decimal)(array_list[i]) - median_value);
        }
      return sum/n;
      }

    public static bool BeValidDomainPartOfEmailAddress(string email_address)
      {
      var significant_part = email_address.Substring(email_address.LastIndexOf('@') + 1);
      var process_start_info = new ProcessStartInfo("nslookup", "-type=MX " + significant_part.Trim());
      process_start_info.RedirectStandardOutput = true;
      process_start_info.RedirectStandardError = true;
      process_start_info.UseShellExecute = false;
      var work = Process.Start(process_start_info);
      work.WaitForExit();
      work.Refresh();
      return work.StandardOutput.ReadToEnd().Contains("mail exchanger = ");
      }

    public static bool BeValidDomainPartOfWebAddress(string web_address)
      {
      const int LENGTH_OF_SHORTEST_PRACTICAL_DOMAIN_NAME = 4; // a.com
      var be_valid_domain_part_of_web_address = true;
      var index_of_slash = web_address.IndexOf('/');
      var significant_length = (index_of_slash > LENGTH_OF_SHORTEST_PRACTICAL_DOMAIN_NAME ? index_of_slash : web_address.Length);
      try
        {
        Dns.GetHostEntry(web_address.Substring(0,significant_length));
        }
      #pragma warning disable CA1031 // Do not catch general exception types
      catch
        {
        be_valid_domain_part_of_web_address = false;
        }
      #pragma warning restore CA1031 // Do not catch general exception types

      return be_valid_domain_part_of_web_address;

      }

    public static bool BeValidFormatEmailAddress(string email_address)
      {
      var be_valid_format_email_address = false;
      try
        {
        var valid_email_address = new MailAddress(email_address);
        be_valid_format_email_address = true; // Won't make it here if there was an exception.
        }
      catch (FormatException)
        {
        }
      return be_valid_format_email_address;
      }

    public static bool BeValidNanpNumber(string s)
      {
      //
      // These rules are taken from http://en.wikipedia.org/wiki/North_American_Numbering_Plan
      //
      var nanp_nxx_start = new subtype<int>(0,3);
      var be_valid_nanp_number = false;
      var digits = Safe(s,safe_hint_type.NUM);
      var digits_length = digits.Length;
      if (digits_length == 7)
        {
        be_valid_nanp_number = true;
        }
      else if (digits_length == 10)
        {
        be_valid_nanp_number = (digits.Substring(0,1).ToCharArray()[0] >= '2') && (digits.Substring(1,1).ToCharArray()[0] <= '8') && (digits.Substring(0,3) != "900");
        nanp_nxx_start.val = 3;
        }
      return be_valid_nanp_number
        && (digits.Substring(nanp_nxx_start.val,1).ToCharArray()[0] >= '2')
        && !(digits.Substring((nanp_nxx_start.val + 1),2) == "11")
        && !((digits.Substring(nanp_nxx_start.val).CompareTo("5550100") >= 0) && (digits.Substring(nanp_nxx_start.val).CompareTo("5550199") <= 0))
        && (digits.Substring(nanp_nxx_start.val) != "5551212")
        && (digits.Substring(nanp_nxx_start.val,3) != "976");
      }

    public static bool BeValidUsEin(string s)
      {
      return (Safe(s,safe_hint_type.NUM).Length == 9);
      }

    public static bool BooleanOfYesNo(string yn)
      {
      return (yn.ToUpper() == "YES");
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Security", "CA5350:Do Not Use Weak Cryptographic Algorithms", Justification = "Compliance requires transformation of database data")]
    public static string Digest(string source_string)
      {
      var byte_buf = new byte[20 + 1]; // Not sure if or why this line is necessary, but I'm afraid to remove it.
      using var sha1_managed = new SHA1Managed();
      byte_buf = sha1_managed.ComputeHash(new ASCIIEncoding().GetBytes(source_string));
      var target_string = EMPTY;
      for (var i = 1; i <= 20; i++)
        {
        target_string += byte_buf[i - 1].ToString("x2");
        }
      return target_string;
      }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Design", "CA1031:Do not catch general exception types", Justification = "Dns.GetHostEntry() does not fail gracefully.")]
    public static string DomainNameOfIpAddress(string ip_address)
      {
      var domain_name_of_ip_address = k.EMPTY;
      try
        {
        domain_name_of_ip_address = Dns.GetHostEntry(ip_address).HostName;
        }
      catch
        {
        }
      return domain_name_of_ip_address;
      }

    public static string EmptyIfInvalidEmailAddress(string e)
      {
      var empty_if_invalid = EMPTY;
      try
        {
        using var mail_message = new MailMessage();
        mail_message.To.Add(e); // throws exception if invalid format
        if (k.BeValidDomainPartOfEmailAddress(e))
          {
          empty_if_invalid = e;
          }
        }
      #pragma warning disable CA1031 // Do not catch general exception types
      catch
        {
        }
      #pragma warning restore CA1031 // Do not catch general exception types

      return empty_if_invalid;

      }

    public static string EscalatedException
      (
      Exception the_exception,
      string user_identity_name = EMPTY,
      HttpSessionState session = null,
      string engine_innodb_status = EMPTY
      )
      {
      var user_designator = (user_identity_name.Length == 0 ? "unknown" : user_identity_name);
      var the_exception_string = the_exception.ToString();
      var notification_message = "[EXCEPTION]" + NEW_LINE + the_exception_string + NEW_LINE + NEW_LINE + "[HRESULT]" + NEW_LINE + HresultAnalysis(the_exception) + NEW_LINE + NEW_LINE;
      if (user_identity_name.Length > 0)
        {
        notification_message += "[USER]" + NEW_LINE + user_designator + NEW_LINE + NEW_LINE;
        }
      if ((session != null))
        {
        notification_message += "[SESSION (has " + session.Count.ToString() + " items)]" + NEW_LINE;
        if (session.Count > 0)
          {
          var i = new subtype<int>(0,session.Count);
          for (i.val = 0; i.val <= (session.Count - 1); i.val++ )
            {
            notification_message += session.Keys[i.val].ToString() + (session[i.val] == null ? " is null" : " = " + session[i.val].ToString()) + NEW_LINE;
            }
          notification_message += NEW_LINE;
          }
        }
      if (engine_innodb_status.Length > 0)
        {
        notification_message += "[ENGINE INNODB STATUS (caution: not necessarily consistent with exception)]" + engine_innodb_status + NEW_LINE + NEW_LINE;
        }
      SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["sender_email_address"], "EXCEPTION REPORT", notification_message);
      if(
          (the_exception_string.Contains("\\inetpub\\wwwroot\\") || the_exception_string.Contains("\\kveo-it-project\\"))
        &&
          the_exception_string.Contains(":line ")
        )
        {
        SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["sysadmin_sms_address"], "CRASH", user_designator);
        }
        // else I doubt my code is responsible, so there's no need to wake me up at night.
      return notification_message;
      }

    public static string ExpandAsperand(string s)
      {
      return s.Replace("@",ConfigurationManager.AppSettings["runtime_root_fullspec"]);
      }

    public static string ExpandTildePath(string s)
      {
      return s.Replace("\\","/").Replace("~","/" + ConfigurationManager.AppSettings["virtual_directory_name"]);
      }

    public static string FormatAsNanpPhoneNum
      (
      string digits,
      bool be_for_international_audience = false
      )
      {
      var format_as_nanp_phone_num = EMPTY;
      if ((digits.Length == 10) && BeValidNanpNumber(digits))
        {
        if (be_for_international_audience)
          {
          format_as_nanp_phone_num = "+1-";
          }
        format_as_nanp_phone_num += digits.Substring(0,3) + HYPHEN + digits.Substring(3,3) + HYPHEN + digits.Substring(6);
        }
      return format_as_nanp_phone_num;
      }

    public static string FormatAsUsEin(string digits)
      {
      return (BeValidUsEin(digits) ? digits.Substring(0,2) + HYPHEN + digits.Substring(2) : EMPTY);
      }

    public static bool Has
      (
      string[] the_string_array,
      string the_string
      )
      {
      var i = new int_nonnegative();
      var len = new int_nonnegative();
      var result = false;
      if (the_string_array != null)
        {
        len.val = the_string_array.Length;
        while ((i.val < len.val) && !(new ArrayList {the_string,the_string + "/GENERALLY"}.Contains(the_string_array[i.val]))) // Test against unscoped and scoped forms.
          {
          i.val++;
          }
        result = (i.val < len.val);
        }
      return result;
      }

    public static string HresultAnalysis(Exception the_exception)
      {
      unchecked
        {
        var facility = "unknown";
        var hresult = ((uint)(Marshal.GetHRForException(the_exception)));
        var microsoft_or_not = EMPTY;
        var severity = EMPTY;
        //
        var be_ntstatus = ((hresult & 0x10000000) != 0);
        var code = ((ushort)(hresult % 0x00010000)).ToString("X");
        //
        if (!be_ntstatus) // "N": it's not an NTSTATUS
          {
          if ((hresult & 0x80000000) != 0) // "S"
            {
            severity = "FAILURE";
            }
          else
            {
            severity = "SUCCESS";
            }
          }
        else
          {
          var severity_value = hresult / 0xC0000000;
          if (severity_value == 3)
            {
            severity = "ERROR";
            }
          else if (severity_value == 2)
            {
            severity = "WARNING";
            }
          else if (severity_value == 1)
            {
            severity = "INFO";
            }
          else if (severity_value == 0)
            {
            severity = "SUCCESS";
            }
          }
        if ((hresult & 0x20000000) != 0) // "C"
          {
          microsoft_or_not = "NONMICROSOFT";
          }
        else
          {
          microsoft_or_not = "MICROSOFT";
          var facility_id = (hresult % 0x10000000) / 0x00010000;
          if (!be_ntstatus)
            {
            if (facility_id == 00)
              {
              facility = "NULL";
              }
            else if (facility_id == 01)
              {
              facility = "RPC";
              }
            else if (facility_id == 02)
              {
              facility = "DISPATCH";
              }
            else if (facility_id == 03)
              {
              facility = "STORAGE";
              }
            else if (facility_id == 04)
              {
              facility = "ITF";
              }
            else if (facility_id == 07)
              {
              facility = "WIN32";
              }
            else if (facility_id == 08)
              {
              facility = "WINDOWS";
              }
            else if (facility_id == 09)
              {
              facility = "SECURITY|SSPI";
              }
            else if (facility_id == 10)
              {
              facility = "CONTROL";
              }
            else if (facility_id == 11)
              {
              facility = "CERT";
              }
            else if (facility_id == 12)
              {facility = "INTERNET";
              }
            else if (facility_id == 13)
              {
              facility = "MEDIASERVER";
              }
            else if (facility_id == 14)
              {
              facility = "MSMQ";
              }
            else if (facility_id == 15)
              {
              facility = "SETUPAPI";
              }
            else if (facility_id == 16)
              {
              facility = "SCARD";
              }
            else if (facility_id == 17)
              {
              facility = "COMPLUS";
              }
            else if (facility_id == 18)
              {
              facility = "AAF";
              }
            else if (facility_id == 19)
              {
              facility = "URT";
              }
            else if (facility_id == 20)
              {
              facility = "ACS";
              }
            else if (facility_id == 21)
              {
              facility = "DPLAY";
              }
            else if (facility_id == 22)
              {
              facility = "UMI";
              }
            else if (facility_id == 23)
              {
              facility = "SXS";
              }
            else if (facility_id == 24)
              {
              facility = "WINDOWS_CE";
              }
            else if (facility_id == 25)
              {
              facility = "HTTP";
              }
            else if (facility_id == 26)
              {
              facility = "USERMODE_COMMONLOG";
              }
            else if (facility_id == 31)
              {
              facility = "USERMODE_FILTER_MANAGER";
              }
            else if (facility_id == 32)
              {
              facility = "BACKGROUNDCOPY";
              }
            else if (facility_id == 33)
              {
              facility = "CONFIGURATION";
              }
            else if (facility_id == 34)
              {
              facility = "STATE_MANAGEMENT";
              }
            else if (facility_id == 35)
              {
              facility = "METADIRECTORY";
              }
            else if (facility_id == 36)
              {
              facility = "WINDOWSUPDATE";
              }
            else if (facility_id == 37)
              {
              facility = "DIRECTORYSERVICE";
              }
            else if (facility_id == 38)
              {
              facility = "GRAPHICS";
              }
            else if (facility_id == 39)
              {
              facility = "SHELL";
              }
            else if (facility_id == 40)
              {
              facility = "TPM_SERVICES";
              }
            else if (facility_id == 41)
              {
              facility = "TPM_SOFTWARE";
              }
            else if (facility_id == 48)
              {
              facility = "PLA";
              }
            else if (facility_id == 49)
              {
              facility = "FVE";
              }
            else if (facility_id == 50)
              {
              facility = "FWP";
              }
            else if (facility_id == 51)
              {
              facility = "WINRM";
              }
            else if (facility_id == 52)
              {
              facility = "NDIS";
              }
            else if (facility_id == 53)
              {
              facility = "USERMODE_HYPERVISOR";
              }
            else if (facility_id == 54)
              {
              facility = "CMI";
              }
            else if (facility_id == 80)
              {
              facility = "WINDOWS_DEFENDER";
              }
            }
          else // is an NTSTATUS
            {
            if (facility_id == 01)
              {
              facility = "DEBUGGER";
              }
            else if (facility_id == 02)
              {
              facility = "RPC_RUNTIME";
              }
            else if (facility_id == 03)
              {
              facility = "RPC_STUBS";
              }
            else if (facility_id == 04)
              {
              facility = "IO";
              }
            else if (facility_id == 07)
              {
              facility = "NTWIN32";
              }
            else if (facility_id == 09)
              {
              facility = "NTSSPI";
              }
            else if (facility_id == 10)
              {
              facility = "TERMINAL_SERVER";
              }
            else if (facility_id == 11)
              {
              facility = "MUI";
              }
            else if (facility_id == 16)
              {
              facility = "USB";
              }
            else if (facility_id == 17)
              {
              facility = "HID";
              }
            else if (facility_id == 18)
              {
              facility = "FIREWIRE";
              }
            else if (facility_id == 19)
              {
              facility = "CLUSTER";
              }
            else if (facility_id == 20)
              {
              facility = "ACPI";
              }
            else if (facility_id == 21)
              {
              facility = "SXS";
              }
            else if (facility_id == 25)
              {
              facility = "TRANSACTION";
              }
            else if (facility_id == 26)
              {
              facility = "COMMONLOG";
              }
            else if (facility_id == 27)
              {
              facility = "VIDEO";
              }
            else if (facility_id == 28)
              {
              facility = "FILTER_MANAGER";
              }
            else if (facility_id == 29)
              {
              facility = "MONITOR";
              }
            else if (facility_id == 30)
              {
              facility = "GRAPHICS_KERNEL";
              }
            else if (facility_id == 32)
              {
              facility = "DRIVER_FRAMEWORK";
              }
            else if (facility_id == 33)
              {
              facility = "FVE";
              }
            else if (facility_id == 34)
              {
              facility = "FWP";
              }
            else if (facility_id == 35)
              {
              facility = "NDIS";
              }
            else if (facility_id == 53)
              {
              facility = "HYPERVISOR";
              }
            else if (facility_id == 54)
              {
              facility = "IPSEC";
              }
            else if (facility_id == 55)
              {
              facility = "MAXIMUM_VALUE";
              }
            }
          }
        return "0x" + hresult.ToString("X") + ":  %" + microsoft_or_not + '.' + facility + "--" + severity + "--0x" + code;
        }
      }

    public static k.int_sign_range IntsignrangeOfOptionalBoolean(string s)
      {
      var intsignrange_of_optional_boolean = new k.int_sign_range(-1);
      if (new ArrayList() {"0","FALSE","NO"}.Contains(s.ToUpper()))
        {
        intsignrange_of_optional_boolean.val = 0;
        }
      else if (new ArrayList() {"1","TRUE","YES"}.Contains(s.ToUpper()))
        {
        intsignrange_of_optional_boolean.val = 1;
        }
      return intsignrange_of_optional_boolean;
      }

    public static decimal Median(ArrayList sorted_array_list)
      {
      return Percentile
        (
        p:50,
        sorted_array_list:sorted_array_list
        );
      }

    public static string NoneFalseTrueOf
      (
      k.int_sign_range condition,
      string none
      )
      {
      var none_false_true_of = none;
      if (condition.val == 0)
        {
        none_false_true_of = "FALSE";
        }
      else if (condition.val == 1)
        {
        none_false_true_of = "TRUE";
        }
      return none_false_true_of;
      }

    public static string NoneNoYesOf
      (
      k.int_sign_range condition,
      string none
      )
      {
      var none_no_yes_of = none;
      if (condition.val == 0)
        {
        none_no_yes_of = "No";
        }
      else if (condition.val == 1)
        {
        none_no_yes_of = "Yes";
        }
      return none_no_yes_of;
      }

     public static string OrdinalRenditionOf(int_positive n)
       {
       var n_val_string = n.val.ToString();
       var suffix = "th";
       if (!(n_val_string.EndsWith("11") || n_val_string.EndsWith("12") || n_val_string.EndsWith("13")))
         {
         if (n_val_string.EndsWith("1"))
           {
           suffix = "st";
           }
         else if (n_val_string.EndsWith("2"))
           {
           suffix = "nd";
           }
         else if (n_val_string.EndsWith("3"))
           {
           suffix = "rd";
           }
         }
       return n_val_string + suffix;
       }

    public static decimal Percentile
      (
      uint p,
      ArrayList sorted_array_list
      )
      {
      decimal result;
      var n = sorted_array_list.Count;
      if (n == 0)
        {
        result = 0;
        }
      else
        {
        if (n == 1)
          {
          result = (decimal)(sorted_array_list[0]);
          }
        else
          {
          var virtual_index = (decimal)(p * (n - 1) / 100);
          if (virtual_index >= (n - 1))
            {
            result = (decimal)(sorted_array_list[n - 1]);
            }
          else
            {
            var practical_index = decimal.ToInt32(decimal.Floor(virtual_index));
            var interpolation_factor = virtual_index - practical_index;
            var lower_value = (decimal)(sorted_array_list[practical_index]);
            result = lower_value + interpolation_factor * ((decimal)(sorted_array_list[practical_index + 1]) - lower_value);
            }
          }
        }
      return result;
      }

    public static int PhpValueOf_safe_hint_type(string s)
      {
      return (int)Enum.Parse(enumType:typeof(safe_hint_type), value:s);
      }

    public static void RunCommandIteratedOverArguments
      (
      string command,
      ArrayList arguments,
      string working_directory,
      out string stdout,
      out string stderr
      )
      {
      //
      stderr = EMPTY;
      stdout = EMPTY;
      //
      if (arguments.Count > 0)
        {
        for (var i = new int_nonnegative(); i.val < arguments.Count; i.val++)
          {
          ProcessStartInfo process_start_info = new ProcessStartInfo(command,(arguments[i.val] as string));
          process_start_info.RedirectStandardOutput = true;
          process_start_info.RedirectStandardError = true;
          process_start_info.UseShellExecute = false;
          process_start_info.WorkingDirectory = working_directory;
          Process work = Process.Start(process_start_info);
          work.WaitForExit();
          work.Refresh();
          stderr = stderr + work.StandardError.ReadToEnd() + k.NEW_LINE;
          stdout = stdout + work.StandardOutput.ReadToEnd() + k.NEW_LINE;
          }
        }
      }

    public static string Safe
      (
      string source_string,
      safe_hint_type hint = safe_hint_type.NONE
      )
      {
      const string MODIFIED_LIBERAL_SET = "0-9a-zA-Z@#$%&()_\\-+=[\\],/.:? "
      + ACUTE_ACCENT
      + CENT_SIGN
      + DIAERESIS
      + INVERTED_EXCLAMATION_MARK
      + LEFT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK
      + RIGHT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK;
      var allow = EMPTY;
      //
      // Be extremely protective here:
      // -  Escape ("\") the following four characters: ]\^-
      // -  For scalars, do not allow punctuation.
      // -  When in doubt, don't allow it.
      // This routine is not intended to assure that data is submitted in proper format.  It is intended to protect against SQL insertion attacks.
      //
      if (hint == safe_hint_type.ALPHA)
        {
        allow = "a-zA-Z";
        }
      else if (hint == safe_hint_type.ALPHA_WORDS)
        {
        allow = "a-zA-Z ";
        }
      else if (hint == safe_hint_type.ALPHANUM)
        {
        allow = "0-9a-zA-Z";
        }
      else if (hint == safe_hint_type.BASE64)
        {
        allow = "0-9a-zA-Z=+/";
        }
      else if (hint == safe_hint_type.CURRENCY_USA)
        {
        allow = "0-9$,.";
        }
      else if (hint == safe_hint_type.DATE_TIME)
        {
        allow = "0-9:\\-/ ";
        }
      else if (hint == safe_hint_type.ECMASCRIPT_WORD)
        {
        allow = "0-9a-zA-Z_";
        }
      else if (hint == safe_hint_type.EMAIL_ADDRESS)
        {
        allow = "0-9a-zA-Z_.@\\-+";
        }
      else if (hint == safe_hint_type.EMAIL_ADDRESS_CSV)
        {
        allow = "0-9a-zA-Z_,.@\\-+";
        }
      else if (hint == safe_hint_type.FINANCIAL_TERMS)
        {
        allow = "0-9a-zA-Z@#$%()\\-+=,/. " + CENT_SIGN;
        }
      else if (hint == safe_hint_type.HEX)
        {
        allow = "0-9a-fA-F";
        }
      else if (hint == safe_hint_type.HOSTNAME)
        {
        allow = "0-9a-zA-Z_\\-.";
        }
      else if (hint == safe_hint_type.HTTP_TARGET)
        {
        allow = "0-9a-zA-Z\\-_./";
        }
      else if (hint == safe_hint_type.HUMAN_NAME)
        {
        allow = "a-zA-Z\\-. " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.HUMAN_NAME_CSV)
        {
        allow = "a-zA-Z\\-,. " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.HYPHENATED_ALPHA)
        {
        allow = "a-zA-Z\\-";
        }
      else if (hint == safe_hint_type.HYPHENATED_ALPHA_WORDS)
        {
        allow = "a-zA-Z\\- ";
        }
      else if (hint == safe_hint_type.HYPHENATED_ALPHANUM)
        {
        allow = "a-zA-Z0-9\\-";
        }
      else if (hint == safe_hint_type.HYPHENATED_ALPHANUM_WORDS)
        {
        allow = "a-zA-Z0-9\\- ";
        }
      else if (hint == safe_hint_type.HYPHENATED_NUM)
        {
        allow = "0-9\\-";
        }
      else if (hint == safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM)
        {
        allow = "a-zA-Z0-9\\-_";
        }
      else if (hint == safe_hint_type.KI_SORT_EXPRESSION)
        {
        allow = "0-9a-zA-Z_%\\*()\\-+,./ ";
        }
      else if (hint == safe_hint_type.MAKE_MODEL)
        {
        allow = "0-9a-zA-Z#*()\\-+/. ";
        }
      else if (hint == safe_hint_type.MEMO)
        {
        allow = MODIFIED_LIBERAL_SET + "\\n\\r\\t";
        }
      else if (hint == safe_hint_type.NUM)
        {
        allow = "0-9";
        }
      else if (hint == safe_hint_type.NUM_CSV)
        {
        allow = "0-9,";
        }
      else if (hint == safe_hint_type.ORG_NAME)
        {
        allow = "0-9a-zA-Z#&\\-,./ " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.ORG_NAME_ASTERICIZED)
        {
        allow = "0-9a-zA-Z#&*\\-,. " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.PHONE_NUM)
        {
        allow = "0-9-+() ";
        }
      else if (hint == safe_hint_type.POSTAL_CITY)
        {
        allow = "a-zA-Z\\-. " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.POSTAL_CITY_CSV)
        {
        allow = "a-zA-Z\\-,. " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.POSTAL_STREET_ADDRESS)
        {
        allow = "0-9a-zA-Z#\\-,(). " + ACUTE_ACCENT;
        }
      else if (hint == safe_hint_type.PUNCTUATED)
        {
        allow = MODIFIED_LIBERAL_SET;
        }
      else if (hint == safe_hint_type.REAL_NUM)
        {
        allow = "0-9.";
        }
      else if (hint == safe_hint_type.REAL_NUM_INCLUDING_NEGATIVE)
        {
        allow = "0-9.\\-";
        }
      var scratch_string = EMPTY;
      if (allow.Length > 0)
        {
        scratch_string = source_string
        .Replace(QUOTE,DIAERESIS)
        .Replace(APOSTROPHE,ACUTE_ACCENT)
        .Replace(SEMICOLON,INVERTED_EXCLAMATION_MARK)
        .Replace("<",LEFT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK)
        .Replace(">",RIGHT_POINTING_DOUBLE_ANGLE_QUOTATION_MARK)
        .Replace("!",PERIOD)
        ;
        scratch_string = Regex.Replace(scratch_string, "[^" + allow + ']', EMPTY);
       }
      return scratch_string;
      }

    public static void SendControlAsAttachmentToEmailMessage
      (
      object c,
      string scratch_pathname,
      string from_address,
      string to_target,
      string cc_target,
      string subject,
      string body
      )
      {
      //
      // For this to work, the ASP.NET Machine Account (ASPNET) [on IIS5] or the NETWORK SERVICE account [on IIS7] or the IIS APPPOOL\DefaultAppPool account must have write permission for the folder specified by p.path.
      // Configure this on the Security tab of the folder's Properties.  If the Security tab is missing, open Windows Explorer / Tools / Folder Options... / View, and in the Advanced Settings, clear the "Use simple file
      // sharing" checkbox.
      //
      var stream_writer = new System.IO.StreamWriter(scratch_pathname);
      using var html_text_writer = new HtmlTextWriter(stream_writer);
      ((c) as Control).RenderControl(html_text_writer);
      stream_writer.Close();
      //
      using var msg = new MailMessage();
      msg.From = new MailAddress(from_address);
      if (to_target.Length > 0)
        {
        msg.To.Add(to_target);
        }
      if (cc_target.Length > 0)
        {
        msg.CC.Add(cc_target);
        }
      msg.Subject = subject;
      msg.Body = body;
      msg.Attachments.Add(new Attachment(scratch_pathname));
      SmtpMailSend(msg);
      //
      System.IO.File.Delete(scratch_pathname);
      }

    public static string ShieldedValueOfHashtable
      (
      Hashtable hash_table,
      bool do_compress = false
      )
      {
      return ShieldedValueOfString
        (
        s:new JavaScriptSerializer().Serialize(hash_table),
        do_compress:do_compress
        );
      }

    public static string ShieldedValueOfString
      (
      string s,
      bool do_compress = false
      )
      {
      var ascii_encoding = new ASCIIEncoding();
      var bytearrayed_serialized_hashtable = ascii_encoding.GetBytes(s);
      //
      byte[] input_buffer;
      if (do_compress)
        {
        var memory_stream = new MemoryStream();
        var deflate_stream = new DeflateStream(memory_stream,CompressionLevel.Optimal);
        deflate_stream.Write(bytearrayed_serialized_hashtable,0,bytearrayed_serialized_hashtable.Length);
        deflate_stream.Dispose();
        input_buffer = memory_stream.ToArray();
        }
      else
        {
        input_buffer = bytearrayed_serialized_hashtable;
        }
      using var cipher = new RijndaelManaged();
      cipher.Mode = CipherMode.ECB;
      cipher.Key = ascii_encoding.GetBytes(ConfigurationManager.AppSettings["query_string_protection_password"]);
      return Convert.ToBase64String(cipher.CreateEncryptor().TransformFinalBlock(input_buffer,0,input_buffer.Length));
      }

    public static void SilentAlarm(Exception the_exception)
      {
      be_smtp_mail_send_reliable = false;
      SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:ConfigurationManager.AppSettings["sender_email_address"],
        subject:"SILENT ALARM",
        message_string:k.EMPTY
        + "[EXCEPTION]" + NEW_LINE
        + the_exception.ToString() + NEW_LINE
        + NEW_LINE
        + "[HRESULT]" + NEW_LINE
        + HresultAnalysis(the_exception) + NEW_LINE
        );
      be_smtp_mail_send_reliable = true;
      }

    public static void SmtpMailSend(MailMessage mail_message)
      {
      if (mail_message.To.ToString().Length >= MAX_RFC_2822_ET_SEQ_EMAIL_LINE_LENGTH)
        {
        for (var i = new k.subtype<int>(0,mail_message.To.Count); i.val < i.LAST; i.val++)
          {
          mail_message.Bcc.Add(mail_message.To[i.val]);
          }
        mail_message.To.Clear();
        }
      if (mail_message.To.ToString().Length + mail_message.CC.ToString().Length + mail_message.Bcc.ToString().Length > 0)
        {
        //
        // Instead of supplying a Body, which System.Net.Mail encodes as quoted-printable, supply an AlternateView and force its transfer encoding to 7bit or base64, depending.
        //
        if (mail_message.IsBodyHtml)
          {
          //
          // To pass SpamAssassin anti-spam tests, add a secondary alternative plaintext view.  Order is important.  Plainer alternate views must be added to the mail message before richer alternate views.
          //
          var secondary_alternate_view = AlternateView.CreateAlternateViewFromString
            (
            content:Unix2Dos // To be RFC-compliant, bare linefeeds may not occur anywhere in an email message.
              (
              //
              // An alternative view whose transfer encoding is set to 7bit should contain no more than 72 characters before each line break -- and MUST NOT contain more than 998 (MAX_RFC_2822_ET_SEQ_EMAIL_LINE_LENGTH) characters before each
              // line break.
              //
              //         1         2         3         4         5         6         7
              //123456789012345678901234567890123456789012345678901234567890123456789012
               "Please set, upgrade, or switch your email client to view this message in" + NEW_LINE
              +"the provided HTML format, unmodified.  Otherwise you will be missing out" + NEW_LINE
              +"on important information that the application can not adequately render" + NEW_LINE
              +"in plain text.  Contact support@frompaper2web.com if you have questions" + NEW_LINE
              +"about this message." + NEW_LINE
              ),
            contentEncoding:mail_message.BodyEncoding,
            mediaType:null
            );
          mail_message.AlternateViews.Add(secondary_alternate_view);
          secondary_alternate_view.TransferEncoding = TransferEncoding.SevenBit;
          }
        //
        var primary_alternate_view = AlternateView.CreateAlternateViewFromString(Unix2Dos(mail_message.Body),mail_message.BodyEncoding,(mail_message.IsBodyHtml ? "text/html" : null));
        mail_message.AlternateViews.Add(primary_alternate_view);
        primary_alternate_view.TransferEncoding = (mail_message.IsBodyHtml ? TransferEncoding.Base64 : TransferEncoding.SevenBit);
        //
        mail_message.Body = null;
        try
          {
          var be_enabled_obj = ConfigurationManager.AppSettings["k.SmtpMailSend.enabled"];
          if (be_enabled_obj == null ? true : bool.Parse(be_enabled_obj.ToString()))
            {
            using var smtp_client = new SmtpClient(ConfigurationManager.AppSettings["smtp_server"]);
            smtp_client.Send(mail_message);
            }
          }
        catch(Exception e)
          {
          if (be_smtp_mail_send_reliable)
            {
            SilentAlarm(e);
            }
          else
            {
            throw;
            }
          }
        mail_message.Dispose();
        }
      }

    public static void SmtpMailSend
      (
      string from,
      string to,
      string subject,
      string message_string,
      bool be_html = false,
      string cc = EMPTY,
      string bcc = EMPTY,
      string reply_to = EMPTY,
      bool suppress_bounce_to_appadmin = false
      )
      {

      //
      // To be RFC-compliant, bare linefeeds may not occur anywhere in an email message.
      //

      const string DOUBLE_COMMA = k.COMMA + k.COMMA;
      using var mail_message = new MailMessage();
      //
      to = to.Replace(k.SPACE,EMPTY).Trim(new char[] {Convert.ToChar(k.COMMA)});
      while (to.Contains(DOUBLE_COMMA))
        {
        to = to.Replace(DOUBLE_COMMA,k.COMMA);
        }
      //
      cc = cc.Replace(k.SPACE,EMPTY).Trim(new char[] {Convert.ToChar(k.COMMA)});
      while (cc.Contains(DOUBLE_COMMA))
        {
        cc = cc.Replace(DOUBLE_COMMA,k.COMMA);
        }
      //
      bcc = bcc.Replace(k.SPACE,EMPTY).Trim(new char[] {Convert.ToChar(k.COMMA)});
      while (bcc.Contains(DOUBLE_COMMA))
        {
        bcc = bcc.Replace(DOUBLE_COMMA,k.COMMA);
        }
      reply_to = reply_to.Replace(k.SPACE,EMPTY).Trim(new char[] {Convert.ToChar(k.COMMA)});
      while (reply_to.Contains(DOUBLE_COMMA))
        {
        reply_to = reply_to.Replace(DOUBLE_COMMA,k.COMMA);
        }
      //
      mail_message.From = new MailAddress(Unix2Dos(from));
      if (to.Length > 0)
        {
        mail_message.To.Add(Unix2Dos(to));
        }
      mail_message.Subject = subject;
      mail_message.Body = message_string;
      mail_message.IsBodyHtml = be_html;
      if (cc.Length > 0)
        {
        mail_message.CC.Add(Unix2Dos(cc));
        }
      if (bcc.Length > 0)
        {
        mail_message.Bcc.Add(Unix2Dos(bcc));
        }
      if (reply_to.Length > 0)
        {
        mail_message.ReplyToList.Add(Unix2Dos(reply_to));
        }
      else if (suppress_bounce_to_appadmin)
        {
        mail_message.Headers.Add("X-FromPaper2Web-Bounce-To-Appadmin","Suppress");
        }
      SmtpMailSend(mail_message);
      }

    public static string StringOfShieldedValue
      (
      string shielded_value,
      bool do_uncompress = false
      )
      {
      var ascii_encoding = new ASCIIEncoding();
      var unbase64ed_query_string = Convert.FromBase64String(shielded_value);
      using var cipher = new RijndaelManaged();
      cipher.Mode = CipherMode.ECB;
      cipher.Key = ascii_encoding.GetBytes(ConfigurationManager.AppSettings["query_string_protection_password"]);
      var transformed_final_block = cipher.CreateDecryptor().TransformFinalBlock(unbase64ed_query_string,0,unbase64ed_query_string.Length);
      //
      var decompressed_size = new k.int_nonnegative();
      var byte_q = new Queue<byte>();
      if (do_uncompress)
        {
        using var memory_stream = new MemoryStream(transformed_final_block);
        using var deflate_stream = new DeflateStream(memory_stream,CompressionMode.Decompress);
        for (var i = deflate_stream.ReadByte(); i > -1; i = deflate_stream.ReadByte())
          {
          byte_q.Enqueue(Convert.ToByte(i));
          }
        decompressed_size.val = byte_q.Count;
        }
      var byte_array = new byte[decompressed_size.val];
      byte_q.CopyTo(byte_array,0);
      //
      return ascii_encoding.GetString((do_uncompress ? byte_array : transformed_final_block));
      }

    public static string UnambiguousPseudorandomLimitedAlphanumericString(int length)
      {
      var unambiguous_pseudorandom_limited_alphanumeric_string = EMPTY;
      var unambiguous_pseudorandom_limited_alphanumeric_char_array =
        Safe
          (
          source_string:Guid.NewGuid().ToString(),
          hint:safe_hint_type.ALPHANUM
          )
        .Substring
          (
          startIndex:0,
          length:Math.Max(0,Math.Min(length,32))
          )
        .ToCharArray();
      for (var i = new subtype<int>(0,unambiguous_pseudorandom_limited_alphanumeric_char_array.Length); i.val < i.LAST; i.val++)
        {
        unambiguous_pseudorandom_limited_alphanumeric_string += (unambiguous_pseudorandom_limited_alphanumeric_char_array[i.val] == '9' ? 'a' : (char)(unambiguous_pseudorandom_limited_alphanumeric_char_array[i.val] + 1));
        }
      return unambiguous_pseudorandom_limited_alphanumeric_string;
      }

    public static string Unix2Dos(string s)
      {
      return Regex.Replace(s,@"(?<!\r)\n","\r\n");
      }

    public static string WrapText
      (
      string t,
      string insert_string,
      char[] break_char_array,
      short max_line_len
      )
      {
      var line_list = new List<string>();
      if (t.Length == 0)
        {
        return t;
        }
      else
        {
        var scratch_line = EMPTY;
        var source_line_array = t.Split(new string[] {NEW_LINE,"\r\n"},StringSplitOptions.None);
        foreach (var current_phrase in source_line_array)
          {
          var word_array = current_phrase.Split(break_char_array);
          foreach (var current_word in word_array)
            {
            if ((scratch_line.Length > max_line_len) || ((scratch_line.Length + current_word.Length) > max_line_len))
              {
              //
              // Add what has accumulated on the current_line to the line_list, and reinitialize the scratch_line.
              //
              line_list.Add(scratch_line);
              scratch_line = EMPTY;
              }
            if (scratch_line.Length > 0)
              {
              //
              // Append a space and the current_word to the non-empty scratch_line.
              //
              scratch_line += k.SPACE + current_word;
              }
            else
              {
              //
              // Start the empty scratch_line with the current_word.
              //
              scratch_line += current_word;
              }
            }
          if (scratch_line.Length > 0)
            {
            //
            // Add what has accumulated on the current_line to the line_list, and reinitialize the scratch_line.
            //
            line_list.Add(scratch_line);
            scratch_line = EMPTY;
            }
          }
        var line_list_count = line_list.Count;
        var i = new subtype<int>(1,line_list_count);
        var wrap_text = EMPTY;
        while (i.val < line_list.Count)
          {
          wrap_text += line_list[i.val - 1].Trim() + insert_string;
          i.val++;
          }
        return wrap_text + (line_list_count > 0 ? line_list[i.val - 1] : EMPTY);
        }
      }

    public static string YesNoOf(bool b)
      {
      return (b ? "Yes" : "No");
      }

    } // end k

  }
