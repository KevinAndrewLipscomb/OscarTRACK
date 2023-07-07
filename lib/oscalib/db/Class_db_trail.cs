using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;

namespace Class_db_trail
  {
  public class TClass_db_trail: TClass_db
    {

    public TClass_db_trail() : base()
      {
      }

    public void MimicTraditionalInsertOnDuplicateKeyUpdate
      (
      string target_table_name,
      string key_field_name,
      string key_field_value,
      string childless_field_assignments_clause,
      string additional_match_condition
      )
      //
      // USAGE
      //    var childless_field_assignments_clause = " name = NULLIF('" + name + "','')"
      //    + " , county_code = NULLIF('" + county_code + "','')"
      //    + " , business_phone_num = NULLIF('" + business_phone_num + "','')"
      //    + " , business_fax_num = NULLIF('" + business_fax_num + "','')"
      //    + " , website_address = NULLIF('" + website_address + "','')"
      //    ;
      //    db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
      //      (
      //      target_table_name:"service",
      //      key_field_name:"affiliate_num",
      //      key_field_value:affiliate_num,
      //      childless_field_assignments_clause:childless_field_assignments_clause
      //      );
      //
      // DESCRIPTION
      //   This routine mimics the use of the INSERT . . . ON DUPLICATE KEY UPDATE construct as if the MySQL server's innodb_autoinc_lock_mode were set to Traditional (0).  In other words, it does its best to prevent gaps from
      //   forming in the assigned auto-increment values.
      //
      //   This routine opens and closes the connection itself, and saves its work in the journal.
      //
      //   The generated code can only be executed by a database user if that user has been granted the CREATE ROUTINE privilege on the database in whose context the execution occurs.
      //
      {
      const string DELIMITER = "~";
      var procedure_name = "MTIODKU_" + ConfigurationManager.AppSettings["application_name"] + "_" + DateTime.Now.Ticks.ToString("D19");
      var code = "/* DELIMITER '" + DELIMITER + "' */"
      + " drop procedure if exists " + procedure_name
      + DELIMITER
      + " create procedure " + procedure_name + "() modifies sql data"
      +   " BEGIN"
      +   " start transaction;"
      +   " if (select 1 from " + target_table_name + " where " + key_field_name + " = '" + key_field_value + "'" + (additional_match_condition.Length > 0 ? additional_match_condition : k.EMPTY) + " limit 1 LOCK IN SHARE MODE) is null"
      +   " then"
      +     " insert " + target_table_name + " set " + key_field_name + " = NULLIF('" + key_field_value + "',''), " + childless_field_assignments_clause + ";"
      +   " else"
      +     " update " + target_table_name + " set " + childless_field_assignments_clause + " where " + key_field_name + " = '" + key_field_value + "'" + (additional_match_condition.Length > 0 ? additional_match_condition : k.EMPTY) + ";"
      +   " end if;"
      +   " commit;"
      +   " END"
      + DELIMITER
      + " call " + procedure_name + "()"
      + DELIMITER
      + " drop procedure if exists " + procedure_name;
      var my_sql_script = new MySqlScript();
      my_sql_script.Connection = connection;
      my_sql_script.Delimiter = DELIMITER;
      my_sql_script.Query = Saved(code);
      Open();
      ExecuteOneOffProcedureScriptWithTolerance(procedure_name,my_sql_script);
      Close();
      }
    public void MimicTraditionalInsertOnDuplicateKeyUpdate(string target_table_name,string key_field_name,string key_field_value,string childless_field_assignments_clause)
      {
      MimicTraditionalInsertOnDuplicateKeyUpdate(target_table_name,key_field_name,key_field_value,childless_field_assignments_clause,additional_match_condition:k.EMPTY);
      }

    public string Saved(string action)
      {
      // Make a local journal entry for convenient review.
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "insert into journal"
        + " set timestamp = CURRENT_TIMESTAMP"
        + " , actor = \"" + HttpContext.Current.User.Identity.Name + "\""
        + " , ip_address = \"" + HttpContext.Current.Request.UserHostAddress + "\""
        + " , action = \"" + Regex.Replace(action, Convert.ToString(k.QUOTE), k.DOUBLE_QUOTE) + "\"",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      // Send a representation of the action offsite as a contingency.
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:ConfigurationManager.AppSettings["failsafe_recipient_email_address"],
        subject:"DB action by " + HttpContext.Current.User.Identity.Name,
        message_string:k.WrapText
          (
          t:"/*" + DateTime.Now.ToString("yyyyMMddHHmmssfffffff") + k.SPACE + HttpContext.Current.Session["username"] + "*/ " + action,
          insert_string:k.NEW_LINE,
          break_char_array:Array.Empty<char>(),
          max_line_len:k.MAX_RFC_2822_ET_SEQ_EMAIL_LINE_LENGTH
          )
        );
      return action;
      }

    } // end TClass_db_trail

  }