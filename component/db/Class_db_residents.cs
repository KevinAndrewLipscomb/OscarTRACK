using Class_db_agencies;
using Class_dbkeyclick;
using Class_dbkeyclick_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;

namespace Class_db_residents
  {

  public class TClass_db_residents: TClass_dbkeyclick
    {

    private TClass_db_agencies db_agencies = null;
    private TClass_dbkeyclick_trail dbkeyclick_trail = null;
    
    public TClass_db_residents() : base()
      {
      db_agencies = new TClass_db_agencies();
      dbkeyclick_trail = new TClass_dbkeyclick_trail();
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
      + " create table resident_immune_from_love_letter"
      + " SELECT distinct concat(house_num,' ',street.name) as address1"
      + " FROM resident_base"
        + " join street on (street.id=resident_base.street_id)"
        + " join donation on (donation.id=resident_base.id)"
      + " where date > DATE_SUB(CURDATE(),INTERVAL 1 YEAR)"
      + ";"
      + " drop table if exists immune_scene_visited"
      + ";"
      + " create table immune_scene_visited"
      + " SELECT address"
      + " FROM scene_visited"
        + " join resident_immune_from_love_letter on (resident_immune_from_love_letter.address1=scene_visited.address)"
      + " where love_letter_batch_designator = '" + love_letter_batch_designator + "'"
      + ";"
      + " drop table if exists love_letter_target"
      + ";"
      + " CREATE TABLE love_letter_target SELECT distinct address from scene_visited where love_letter_batch_designator = '" + love_letter_batch_designator + "'"
      + ";"
      + " DELETE from love_letter_target"
      + " WHERE address like '100 264%'"
        + " or address like '100 64%%'"
        + " or address like '%/%'"
        + " or address in"
          + " ("
          + " '3769 E STATFORD RD'"
          + " , '4672 HAYGOOD RD'"
          + " , '600 CENTRAL DR'"
          + " , '2444 PLEASURE HOUSE RD'"
          + " , '2461 PRINCESS ANNE RD'"
          + " , '595 PRINCESS ANNE RD'"
          + " , '407 THALIA RD'"
          + " , '1201 BAYNE DR'"
          + " , '1243 BAYNE DR'"
          + " , '5145 RURITAN CT'"
          + " , '5656 PROVIDENCE RD'"
          + " , '800 VIRGINIA BEACH BLVD'"
          + " , '949 S BIRDNECK RD'"
          + " , '6009 BLACKWATER RD'"
          + " , '740 VIRGINIA BEACH BLVD'"
          + " , '3608 S PLAZA TRL'"
          + " , '3610 S PLAZA TRL'"
          + " , '305 SANDBRIDGE RD'"
          + " , '1601 S LYNNHAVEN PKWY'"
          + " , '4196 PLEASANT VALLEY RD'"
          + " , '885 LITTLE NECK RD'"
          + " , '1468 NIMMO PKWY'"
          + " , '2837 SHORE DR'"
          + " )"
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

    internal k.int_nonnegative NumForAgency(string agency_id)
      {
      var num_for_agency = new k.int_nonnegative();
      Open();
      num_for_agency.val = int.Parse(new MySqlCommand("select count(*) from resident_base  where agency='" + db_agencies.KeyclickEnumeratorOf(agency_id) + "'",connection).ExecuteScalar().ToString());
      Close();
      return num_for_agency;
      }

    internal void ScrubToApplicationStandards()
      {
      Open();
      new MySqlCommand
        (
        "START TRANSACTION"
        + ";"
        + " delete from resident_base"
        + " where house_num not like '1%'"
          + " and house_num not like '2%'"
          + " and house_num not like '3%'"
          + " and house_num not like '4%'"
          + " and house_num not like '5%'"
          + " and house_num not like '6%'"
          + " and house_num not like '7%'"
          + " and house_num not like '8%'"
          + " and house_num not like '9%'"
          + " and street_id not in (select id from street where name = 'PO BOX')"
          + " and name is null"
          + " and id not in (select id from donation)"
        + ";"
        + " update resident_base set name = REPLACE(name,'  ',' ')"
        + ";"
        + " update resident_base set house_num = REPLACE(house_num,' -','-')"
        + ";"
        + " update resident_base set house_num = REPLACE(house_num,'- ','-')"
        + ";"
        + " COMMIT",
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    }

  }
