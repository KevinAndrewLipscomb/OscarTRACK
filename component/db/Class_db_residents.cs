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
        + " drop table if exists resident_address1_parse"
        + ";"
        //
        // Parse out all USPS Secondary Unit Designator elements
        //
        + " CREATE TABLE resident_address1_parse"
          + " ("
          + " id mediumint not null,"
          + " prefix varchar(143),"
          + " house_num varchar(143),"
          + " street_name varchar(127),"
          + " suffix varchar(143)"
          + " )"
          + " ENGINE=InnoDB"
        + ";"
        //
        // These SUDs must be followed by a range number
        //
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' APT ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' APT ',address1) + LENGTH(' APT ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* APT .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' BLDG ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' BLDG ',address1) + LENGTH(' BLDG ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* BLDG .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' DEPT ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' DEPT ',address1) + LENGTH(' DEPT ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* DEPT .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' FL ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' FL ',address1) + LENGTH(' FL ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* FL .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' HNGR ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' HNGR ',address1) + LENGTH(' HNGR ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* HNGR .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' LOT ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' LOT ',address1) + LENGTH(' LOT ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* LOT .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' PIER ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' PIER ',address1) + LENGTH(' PIER ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* PIER .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' RM ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' RM ',address1) + LENGTH(' RM ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* RM .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' SLIP ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' SLIP ',address1) + LENGTH(' SLIP ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* SLIP .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' SPC ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' SPC ',address1) + LENGTH(' SPC ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* SPC .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' STE ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' STE ',address1) + LENGTH(' STE ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* STE .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' STOP ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' STOP ',address1) + LENGTH(' STOP ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* STOP .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' SUITE ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' SUITE ',address1) + LENGTH(' SUITE ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* SUITE .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' UNIT ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' UNIT ',address1) + LENGTH(' UNIT ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* UNIT .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' # ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' # ',address1) + LENGTH(' # ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* # .*'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' TRLR ',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , SUBSTRING(address1,LOCATE(' TRLR ',address1) + LENGTH(' TRLR ')) as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* TRLR .*'"
        + ";"
        //
        // These SUDs are not typically followed by a range number (and if they are, we don't currently take that into account)
        //
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' BSMT',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'BSMT' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* BSMT$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' FRNT',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'FRNT' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* FRNT$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' LBBY',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'LBBY' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* LBBY$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' LOWR',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'LOWR' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* LOWR$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' OFC',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'OFC' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* OFC$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' REAR',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'REAR' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* REAR$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' SIDE',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'SIDE' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* SIDE$'"
        + ";"
        + " insert ignore resident_address1_parse"
        + " select id"
          + " , LEFT(address1,LOCATE(' UPPR',address1) - 1) as prefix"
          + " , LEFT(address1,LOCATE(' ',address1) - 1) as house_num"
          + " , NULL as street_name"
          + " , 'UPPR' as suffix"
        + " from resident"
        + " where address1 REGEXP '^[0-9]+.* UPPR$'"
        + ";"
        + " update resident_address1_parse set street_name = REPLACE(prefix,concat(house_num,' '),'')"
        + ";"
        + " insert ignore street (name,city_id)"
        + " select distinct street_name"
          + " , city_id"
        + " from resident_address1_parse"
          + " join resident_base on (resident_base.id=resident_address1_parse.id)"
          + " join street on (street.id=resident_base.street_id)"
        + ";"
        + " update resident_base join resident_address1_parse using (id)"
        + " set resident_base.house_num = CONCAT(resident_address1_parse.house_num,'-',suffix)"
        + "  , street_id = (select id from street where name = street_name)"
        + ";"
        + " drop table if exists resident_address1_parse"
        + ";"
        + " delete from street where id not in (select distinct street_id from resident_base)"
        + ";"
        + " delete from city where id not in (select distinct city_id from street)"
        + ";"
        + " delete from state where id not in (select distinct state_id from city)"
        + ";"
        + " COMMIT",
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    }

  }
