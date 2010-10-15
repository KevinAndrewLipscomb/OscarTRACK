using Class_dbkeyclick;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_residents
  {

  public class TClass_db_residents: TClass_dbkeyclick
    {
    
    public TClass_db_residents() : base()
      {
      }

    public bool BeExtantId(string id)
      {
      Open();
      var result = (null != new MySqlCommand("select TRUE from resident where id = '" + id + "'", connection).ExecuteScalar());
      Close();
      return result;
      }

    internal string FilteredFromSceneVisits
      (
      string scene_visits,
      string love_letter_batch_designator
      )
      {
      var output = k.EMPTY;
      var script = k.EMPTY
      + "START TRANSACTION"
      + ";"
      + " delete from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "'"
      + ";";
      var scene_visit_array = scene_visits.Split(new string[] {Environment.NewLine},StringSplitOptions.RemoveEmptyEntries);
      foreach (var scene_visit in scene_visit_array)
        {
        script += " insert into scene_visited set love_letter_batch_designator = '" + love_letter_batch_designator + "', address = '" + scene_visit + "';";
        }
      script += k.EMPTY
      + " drop table if exists resident_immune_from_love_letter"
      + ";"
      + " create table resident_immune_from_love_letter SELECT distinct address1 FROM resident join donation using (id) where date > DATE_SUB(CURDATE(),INTERVAL 1 YEAR)"
      + ";"
      + " drop table if exists immune_scene_visited"
      + ";"
      + " create table immune_scene_visited SELECT address FROM scene_visited join resident_immune_from_love_letter on (resident_immune_from_love_letter.address1=scene_visited.address) where love_letter_batch_designator = '" + love_letter_batch_designator + "'"
      + ";"
      + " drop table if exists love_letter_target"
      + ";"
      + " CREATE TABLE love_letter_target SELECT distinct address from scene_visited"
      + ";"
      + " DELETE from love_letter_target"
      + " WHERE address like '100 264%'"
        + " or address like '%/%'"
      + ";"
      + " DELETE FROM love_letter_target WHERE address in (select address from immune_scene_visited)"
      + ";"
      + " insert love_letter_batch"
      + " set designator = '" + love_letter_batch_designator + "',"
        + " immune_scene_visits_factor = (select count(*) from immune_scene_visited)/(select count(*) from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "')"
      + " on duplicate key update"
        + " immune_scene_visits_factor = (select count(*) from immune_scene_visited)/(select count(*) from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "')"
      + ";"
      + " drop table if exists resident_immune_from_love_letter"
      + ";"
      + " drop table if exists immune_scene_visited"
      + ";"
      + " select * from love_letter_target"
      + ";"
      + " COMMIT";
      Open();
      var dr = new MySqlCommand(script,connection).ExecuteReader();
      while (dr.Read())
        {
        output += dr["address"].ToString() + k.NEW_LINE;
        }
      dr.Close();
      Close();
      return output;
      }

    } // end TClass_db_residents

  }
