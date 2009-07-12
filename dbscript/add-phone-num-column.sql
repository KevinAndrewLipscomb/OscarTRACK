START TRANSACTION;

ALTER TABLE `member`
  ADD COLUMN `phone_num` VARCHAR(10),
  ADD INDEX `phone_num`(`phone_num`);

insert notification
set name = "phone-num-change",
  activity_description = "phone number changes",
  activity_pecking_order = 135;

insert role_notification_map (notification_id,role_id,data_condition_id) values
((select id from notification where name = "phone-num-change"),(select id from role where name = "Department Human Resources Officer"),(select id from data_condition where name = "none")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Department BLS ID Coordinator"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Commander"),(select id from data_condition where name = "none")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Section Sergeant"),(select id from data_condition where name = "none")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Training Officer"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Membership Coordinator"),(select id from data_condition where name = "none")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Scheduler"),(select id from data_condition where name = "none")),
((select id from notification where name = "phone-num-change"),(select id from role where name = "Squad Manager"),(select id from data_condition where name = "none"));

insert privilege set name = "change-member-phone-num";

insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Department Human Resources Officer")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Section Sergeant")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Membership Coordinator")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Training Officer")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Scheduler")),
((select id from privilege where name = "change-member-phone-num"),(select id from role where name = "Squad Manager"));

update member set phone_num = '7574671948' where last_name = 'Stewart' and first_name = 'Denny' and agency_id = 9;
update member set phone_num = '7575829493' where last_name = 'Medero' and first_name = 'Deborah' and agency_id = 9;
update member set phone_num = '7574794002' where last_name = 'Paulsen' and first_name = 'Bob' and agency_id = 9;
update member set phone_num = '7574201778' where last_name = 'Losick' and first_name = 'Arlene' and agency_id = 9;
update member set phone_num = '7574717011' where last_name = 'Baker' and first_name = 'Ann' and agency_id = 9;
update member set phone_num = '7576718911' where last_name = 'Black' and first_name = 'Bill' and agency_id = 9;
update member set phone_num = '7576155500' where last_name = 'Sourbeer' and first_name = 'Jerry' and agency_id = 9;
update member set phone_num = '7573742543' where last_name = 'Spencer' and first_name = 'Scott' and agency_id = 9;
update member set phone_num = '7574496967' where last_name = 'Blais' and first_name = 'David' and agency_id = 9;
update member set phone_num = '7574754434' where last_name = 'Blow' and first_name = 'Rusty' and agency_id = 9;
update member set phone_num = '7574785766' where last_name = 'Heim' and first_name = 'Rebecca' and agency_id = 9;
update member set phone_num = '7576158476' where last_name = 'Kiernan' and first_name = 'Tom' and agency_id = 9;
update member set phone_num = '7576750295' where last_name = 'James' and first_name = 'Jan' and agency_id = 9;
update member set phone_num = '7575364479' where last_name = 'Dunhoff' and first_name = 'Kathleen' and agency_id = 9;
update member set phone_num = '7577482220' where last_name = 'Parks' and first_name = 'Christopher' and agency_id = 9;
update member set phone_num = '7575765032' where last_name = 'Daugherty' and first_name = 'Daniel' and agency_id = 9;
update member set phone_num = '7576180008' where last_name = 'Elliott' and first_name = 'Michael' and agency_id = 9;
update member set phone_num = '7575800649' where last_name = 'Baker' and first_name = 'Tonya' and agency_id = 9;
update member set phone_num = '7575487704' where last_name = 'Davis' and first_name = 'Kareem' and agency_id = 9;
update member set phone_num = '7578750829' where last_name = 'Mackinnnon' and first_name = 'Christine' and agency_id = 9;
update member set phone_num = '7574200314' where last_name = 'Nuckols' and first_name = 'Robert' and agency_id = 9;
update member set phone_num = '7574084597' where last_name = 'Budy' and first_name = 'Kathy' and agency_id = 9;
update member set phone_num = '7573754207' where last_name = 'Wallace' and first_name = 'Patrick' and agency_id = 9;
update member set phone_num = '7576505404' where last_name = 'Busch' and first_name = 'Anthony' and agency_id = 9;
update member set phone_num = '7576398615' where last_name = 'Baker' and first_name = 'David' and agency_id = 9;
update member set phone_num = '7574994522' where last_name = 'Fair' and first_name = 'Daniel' and agency_id = 9;
update member set phone_num = '3147995758' where last_name = 'Fedak' and first_name = 'Elizabeth' and agency_id = 9;
update member set phone_num = '7575894779' where last_name = 'Mitchell' and first_name = 'Amber' and agency_id = 9;
update member set phone_num = '7576505364' where last_name = 'Reid' and first_name = 'Marty' and agency_id = 9;
update member set phone_num = '7576412883' where last_name = 'Jacobs' and first_name = 'Diane' and agency_id = 9;
update member set phone_num = '7577487076' where last_name = 'Quinn' and first_name = 'Jonathan' and agency_id = 9;
update member set phone_num = '7572883335' where last_name = 'Davis' and first_name = 'Brian' and agency_id = 9;
update member set phone_num = '7574790561' where last_name = 'DeLugo' and first_name = 'Ben' and agency_id = 9;
update member set phone_num = '7574350407' where last_name = 'Brewer' and first_name = 'Jim' and agency_id = 9;
update member set phone_num = '6414551292' where last_name = 'Liveston' and first_name = 'Jessica' and agency_id = 9;
update member set phone_num = '7576209642' where last_name = 'Glover' and first_name = 'Gary' and agency_id = 9;
update member set phone_num = '7572275300' where last_name = 'Shook' and first_name = 'Ashley' and agency_id = 9;
update member set phone_num = '7576191166' where last_name = 'Nelson' and first_name = 'Helen' and agency_id = 9;
update member set phone_num = '7572865935' where last_name = 'Prager' and first_name = 'Erik' and agency_id = 9;
update member set phone_num = '7574710100' where last_name = 'Budy' and first_name = 'Joseph' and agency_id = 9;
update member set phone_num = '7574060459' where last_name = 'Davis' and first_name = 'Evan' and agency_id = 9;
update member set phone_num = '3362440118' where last_name = 'Henderson' and first_name = 'Courtney' and agency_id = 9;
update member set phone_num = '7574242502' where last_name = 'Lipscomb' and first_name = 'Barry' and agency_id = 9;
update member set phone_num = '7576394382' where last_name = 'Orem' and first_name = 'Arliss' and agency_id = 9;
update member set phone_num = '6109524470' where last_name = 'Kehoe' and first_name = 'Christopher' and agency_id = 9;
update member set phone_num = '7572014953' where last_name = 'Estera' and first_name = 'Sam' and agency_id = 9;
update member set phone_num = '7577145010' where last_name = 'Sandall' and first_name = 'Melissa' and agency_id = 9;
update member set phone_num = '7576516769' where last_name = 'Kwasny' and first_name = 'Brittany' and agency_id = 9;
update member set phone_num = '7572877143' where last_name = 'Baker' and first_name = 'Rick' and agency_id = 9;
update member set phone_num = '7578312918' where last_name = 'Doyle' and first_name = 'Justin' and agency_id = 9;
update member set phone_num = '7572359773' where last_name = 'Rix' and first_name = 'Charles' and agency_id = 9;
update member set phone_num = '7575670998' where last_name = 'Kalmus' and first_name = 'Paul' and agency_id = 9;
update member set phone_num = '7574393785' where last_name = 'Hicks II' and first_name = 'Floyd' and agency_id = 9;
update member set phone_num = '7578229144' where last_name = 'Pokelwaldt' and first_name = 'Tammy' and agency_id = 9;
update member set phone_num = '7573532272' where last_name = 'Miller' and first_name = 'Bryan' and agency_id = 9;
update member set phone_num = '7573737236' where last_name = 'Wise' and first_name = 'Arthur' and agency_id = 9;
update member set phone_num = '7572823944' where last_name = 'Claypool' and first_name = 'Joshua' and agency_id = 9;
update member set phone_num = '7576504954' where last_name = 'Bair' and first_name = 'Andy' and agency_id = 9;
update member set phone_num = '7575813438' where last_name = 'Gilchrist' and first_name = 'Jennetta' and agency_id = 9;
update member set phone_num = '7574064563' where last_name = 'Benadum' and first_name = 'Kristine' and agency_id = 9;
update member set phone_num = '7576502949' where last_name = 'Benadum' and first_name = 'Tom' and agency_id = 9;
update member set phone_num = '8033712587' where last_name = 'Letson' and first_name = 'Joanne' and agency_id = 9;
update member set phone_num = '7574724813' where last_name = 'Nolan' and first_name = 'Brian' and agency_id = 9;
update member set phone_num = '7572024881' where last_name = 'Conde' and first_name = 'Sara' and agency_id = 9;
update member set phone_num = '2162888625' where last_name = 'Rainer' and first_name = 'Gary' and agency_id = 9;
update member set phone_num = '7572408219' where last_name = 'Ferrari' and first_name = 'Brittany' and agency_id = 9;
update member set phone_num = '7576132004' where last_name = 'Whittaker' and first_name = 'Lori' and agency_id = 9;
update member set phone_num = '7576479549' where last_name = 'DeGroff' and first_name = 'Carolyn' and agency_id = 9;
update member set phone_num = '7574388316' where last_name = 'Wood' and first_name = 'Matthew' and agency_id = 9;
update member set phone_num = '7576413420' where last_name = 'Ehrhardt' and first_name = 'Mitchell' and agency_id = 9;
update member set phone_num = '7575132170' where last_name = 'Ward' and first_name = 'Joseph' and agency_id = 9;
update member set phone_num = '4195741655' where last_name = 'McCarty' and first_name = 'Kyle' and agency_id = 9;
update member set phone_num = '7576171421' where last_name = 'Hyssong' and first_name = 'James' and agency_id = 9;
update member set phone_num = '7573381838' where last_name = 'Chen' and first_name = 'Shirui' and agency_id = 9;
update member set phone_num = '7577183245' where last_name = 'Roach' and first_name = 'Travis' and agency_id = 9;
update member set phone_num = '7576177380' where last_name = 'Coakley' and first_name = 'Anthony' and agency_id = 9;
update member set phone_num = '7576711963' where last_name = 'Jones' and first_name = 'Kenneth' and agency_id = 9;
update member set phone_num = '7575157710' where last_name = 'Hagy' and first_name = 'Clifford' and agency_id = 9;
update member set phone_num = '7193512632' where last_name = 'Gilbert' and first_name = 'Elizabeth' and agency_id = 9;
update member set phone_num = '3137433372' where last_name = 'Quinn' and first_name = 'Tierney' and agency_id = 9;
update member set phone_num = '7576191724' where last_name = 'Mydlowski' and first_name = 'Laura' and agency_id = 9;
update member set phone_num = '7578791961' where last_name = 'Savage' and first_name = 'Katie' and agency_id = 9;
update member set phone_num = '7577170999' where last_name = 'Stein' and first_name = 'Scott' and agency_id = 9;
update member set phone_num = '7573096520' where last_name = 'Pinion' and first_name = 'John' and agency_id = 9;
update member set phone_num = '7576186403' where last_name = 'Merricks' and first_name = 'Paulette' and agency_id = 9;
update member set phone_num = '7574694779' where last_name = 'Unterbrink' and first_name = 'Sarah' and agency_id = 9;
update member set phone_num = '7576790445' where last_name = 'Jiannine' and first_name = 'Louis' and agency_id = 9;
update member set phone_num = '7573323323' where last_name = 'Keen' and first_name = 'Andrew' and agency_id = 9;
update member set phone_num = '7577726820' where last_name = 'Myers' and first_name = 'Coley (Rick)' and agency_id = 9;
update member set phone_num = '7572889686' where last_name = 'Scotty' and first_name = 'Domenic (DJ)' and agency_id = 9;
update member set phone_num = '7573195017' where last_name = 'Hishok' and first_name = 'Brittany' and agency_id = 9;
update member set phone_num = '7576095612' where last_name = 'Roland' and first_name = 'Brian' and agency_id = 9;
update member set phone_num = '7575356633' where last_name = 'McCarson' and first_name = 'Wendy' and agency_id = 9;
update member set phone_num = '7574569108' where last_name = 'Gray' and first_name = 'Jinny' and agency_id = 9;
update member set phone_num = '7577615020' where last_name = 'Baker' and first_name = 'Venita' and agency_id = 9;
update member set phone_num = '7576461002' where last_name = 'Ball' and first_name = 'Diana' and agency_id = 9;
update member set phone_num = '7576428668' where last_name = 'Lipscomb' and first_name = 'Kevin' and agency_id = 9;
update member set phone_num = '7574345536' where last_name = 'Losick' and first_name = 'Mel' and agency_id = 9;
update member set phone_num = '7576521018' where last_name = 'Barclift' and first_name = 'Norma' and agency_id = 9;
update member set phone_num = '7574710100' where last_name = 'Moore' and first_name = 'Jen' and agency_id = 9;
update member set phone_num = '7572351755' where last_name = 'Paulsen' and first_name = 'Judy' and agency_id = 9;

COMMIT