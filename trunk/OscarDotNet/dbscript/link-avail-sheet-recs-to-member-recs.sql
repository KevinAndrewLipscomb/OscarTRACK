--
-- NOTE:  Run repeatedly until 0 rows are affected.
--
START TRANSACTION
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = avail_sheet.first_name)
, timestamp = timestamp
where odnmid is null
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ABDELAZIZ")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "AZIZ"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "AMANDA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MANDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ANDREW")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ANDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ANTHONY")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "TONY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ALEXANDRA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ALEX"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ALEXANDRE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ALEX"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ARTHUR")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ART"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CATHARINE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CAT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CHARLES")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CHUCK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CHRIS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CHRISTOPHER"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CHRISTOPHER")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CHRIS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CLIFFORD")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CLIFF"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CYNTHIA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CINDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DANIEL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DAN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DANIELLE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DANI"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DAVID")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DAVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DEBORAH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DEB"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DEBORAH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DEBBIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DENNIS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DENNY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DIANE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DEE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DONALD")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DOUGLAS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DOUGIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ELIZABETH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "LIBBA"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "FREDERICK")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "FREDDIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "FREDERICK")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "FREDDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "GANDOLFO")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "GAN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "GREGORY")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "GREG"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "JAY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "JIM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "JIMMY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JOSHUA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "JOSH"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHERINE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KATE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHERINE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KATIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHLEEN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KATHY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHRYN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KATHY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KENNETH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KEN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KENNETH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KENNY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KRISTEN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KRISSY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KYLAN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KYL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MATTHEW")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MAT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MATTHEW")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MATT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MELVIN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MEL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MICHAEL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "M"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MICHAEL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MICHEAL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MICHAEL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MIKE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "NICHOLAS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "NICK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "PAMELA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "PAM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "PATRICIA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "TRISHA"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "RICHARD")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "RICH"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ROBERT")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "BOBBY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "RONALD")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "RON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEPHEN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "STEVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEVE")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "STEVEN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEVEN")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "STEVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "THERESA")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "TERRY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "TERYL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "TERRY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "THOMAS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "TOM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "WILLIAM")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "BILL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ZACHARY")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ZACH"
;
--
-- Specific links
--
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "MICHAEL" and member.last_name = "BEVERLY JR.")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MICHAEL" and avail_sheet.last_name = "BEVERLY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CLIFFORD" and member.last_name = "COLLINGS III")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CLIFF" and avail_sheet.last_name = "COLLINGS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "PAUL" and member.last_name = "FLACK")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "RICK" and avail_sheet.last_name = "FLACK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "STEVEN" and member.last_name = "FRAZIER")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "BARRON" and avail_sheet.last_name = "FRAZIER"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "KATHERINE" and member.last_name = "HASTINGS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "KATHARINE" and avail_sheet.last_name = "HASTINGS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CALVIN GERALD" and member.last_name = "JONES JR.")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "CALVIN" and avail_sheet.last_name = "JONES"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "DAVID" and member.last_name = "MARTINEZ")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ALEX" and avail_sheet.last_name = "MARTINEZ"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "GEORGE" and member.last_name = "MEADORS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "GEORGE" and avail_sheet.last_name = "MEADORS JR"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "BRIAN" and member.last_name = "MILLER" and agency_id = 16)
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "E. BRIAN" and avail_sheet.last_name = "MILLER"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "AMBER-LEIGH" and member.last_name = "MITCHELL")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "AMBER" and avail_sheet.last_name = "MITCHELL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "GARY" and member.last_name = "PETTINGER")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "MIKE" and avail_sheet.last_name = "PETTINGER"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "ELMER" and member.last_name = "PUGH")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "RANDY" and avail_sheet.last_name = "PUGH"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "ROBERT" and member.last_name = "RADAM III")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ROBERT" and avail_sheet.last_name = "RADAM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "BEVERLY" and member.last_name = "RING")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "ANNETTE" and avail_sheet.last_name = "RING"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "JERRY" and member.last_name = "SAMS")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "JERRY LEE" and avail_sheet.last_name = "SAMS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name like "SA%TOYA" and member.last_name = "STANTON")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name like "SA%TOYA" and avail_sheet.last_name = "JOHNSON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CHARLES" and member.last_name = "WHITLEY")
, timestamp = timestamp
where odnmid is null
  and avail_sheet.first_name = "DAVID" and avail_sheet.last_name = "WHITLEY"
;
update schedule_assignment
set be_selected = FALSE
  and be_notification_pending = FALSE
where MONTH(nominal_day) < 4
;
COMMIT