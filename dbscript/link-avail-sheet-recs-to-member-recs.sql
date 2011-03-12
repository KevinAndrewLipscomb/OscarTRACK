--
-- NOTE:  Run repeatedly until 0 rows are affected.
--
START TRANSACTION
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = avail_sheet.first_name)
where odnmid is null
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ABDELAZIZ")
where odnmid is null
  and avail_sheet.first_name = "AZIZ"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "AMANDA")
where odnmid is null
  and avail_sheet.first_name = "MANDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ANDREW")
where odnmid is null
  and avail_sheet.first_name = "ANDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ANTHONY")
where odnmid is null
  and avail_sheet.first_name = "TONY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ALEXANDRA")
where odnmid is null
  and avail_sheet.first_name = "ALEX"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ALEXANDRE")
where odnmid is null
  and avail_sheet.first_name = "ALEX"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ARTHUR")
where odnmid is null
  and avail_sheet.first_name = "ART"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CATHARINE")
where odnmid is null
  and avail_sheet.first_name = "CAT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CHARLES")
where odnmid is null
  and avail_sheet.first_name = "CHUCK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CHRISTOPHER")
where odnmid is null
  and avail_sheet.first_name = "CHRIS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CLIFFORD")
where odnmid is null
  and avail_sheet.first_name = "CLIFF"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "CYNTHIA")
where odnmid is null
  and avail_sheet.first_name = "CINDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DANIEL")
where odnmid is null
  and avail_sheet.first_name = "DAN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DANIELLE")
where odnmid is null
  and avail_sheet.first_name = "DANI"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DAVID")
where odnmid is null
  and avail_sheet.first_name = "DAVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DEBORAH")
where odnmid is null
  and avail_sheet.first_name = "DEB"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DEBORAH")
where odnmid is null
  and avail_sheet.first_name = "DEBBIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DENNIS")
where odnmid is null
  and avail_sheet.first_name = "DENNY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DIANE")
where odnmid is null
  and avail_sheet.first_name = "DEE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DONALD")
where odnmid is null
  and avail_sheet.first_name = "DON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "DOUGLAS")
where odnmid is null
  and avail_sheet.first_name = "DOUGIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ELIZABETH")
where odnmid is null
  and avail_sheet.first_name = "LIBBA"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "FREDERICK")
where odnmid is null
  and avail_sheet.first_name = "FREDDY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "GANDOLFO")
where odnmid is null
  and avail_sheet.first_name = "GAN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "GREGORY")
where odnmid is null
  and avail_sheet.first_name = "GREG"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
where odnmid is null
  and avail_sheet.first_name = "JAY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
where odnmid is null
  and avail_sheet.first_name = "JIM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JAMES")
where odnmid is null
  and avail_sheet.first_name = "JIMMY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "JOSHUA")
where odnmid is null
  and avail_sheet.first_name = "JOSH"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHERINE")
where odnmid is null
  and avail_sheet.first_name = "KATE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHERINE")
where odnmid is null
  and avail_sheet.first_name = "KATIE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHLEEN")
where odnmid is null
  and avail_sheet.first_name = "KATHY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KATHRYN")
where odnmid is null
  and avail_sheet.first_name = "KATHY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KENNETH")
where odnmid is null
  and avail_sheet.first_name = "KEN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KENNETH")
where odnmid is null
  and avail_sheet.first_name = "KENNY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KRISTEN")
where odnmid is null
  and avail_sheet.first_name = "KRISSY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "KYLAN")
where odnmid is null
  and avail_sheet.first_name = "KYL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MATTHEW")
where odnmid is null
  and avail_sheet.first_name = "MAT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MATTHEW")
where odnmid is null
  and avail_sheet.first_name = "MATT"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MELVIN")
where odnmid is null
  and avail_sheet.first_name = "MEL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MICHAEL")
where odnmid is null
  and avail_sheet.first_name = "MIKE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "MICHAEL")
where odnmid is null
  and avail_sheet.first_name = "M"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "NICHOLAS")
where odnmid is null
  and avail_sheet.first_name = "NICK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "PAMELA")
where odnmid is null
  and avail_sheet.first_name = "PAM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "PATRICIA")
where odnmid is null
  and avail_sheet.first_name = "TRISHA"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "RICHARD")
where odnmid is null
  and avail_sheet.first_name = "RICH"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ROBERT")
where odnmid is null
  and avail_sheet.first_name = "BOBBY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "RONALD")
where odnmid is null
  and avail_sheet.first_name = "RON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEPHEN")
where odnmid is null
  and avail_sheet.first_name = "STEVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEVE")
where odnmid is null
  and avail_sheet.first_name = "STEVEN"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "STEVEN")
where odnmid is null
  and avail_sheet.first_name = "STEVE"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "THERESA")
where odnmid is null
  and avail_sheet.first_name = "TERRY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "TERYL")
where odnmid is null
  and avail_sheet.first_name = "TERRY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "THOMAS")
where odnmid is null
  and avail_sheet.first_name = "TOM"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "WILLIAM")
where odnmid is null
  and avail_sheet.first_name = "BILL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = "ZACHARY")
where odnmid is null
  and avail_sheet.first_name = "ZACH"
;
--
-- Specific links
--
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "MICHAEL" and member.last_name = "BEVERLY JR.")
where odnmid is null
  and avail_sheet.first_name = "MICHAEL" and avail_sheet.last_name = "BEVERLY"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CLIFFORD" and member.last_name = "COLLINGS III")
where odnmid is null
  and avail_sheet.first_name = "CLIFF" and avail_sheet.last_name = "COLLINGS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "PAUL" and member.last_name = "FLACK")
where odnmid is null
  and avail_sheet.first_name = "RICK" and avail_sheet.last_name = "FLACK"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "STEVEN" and member.last_name = "FRAZIER")
where odnmid is null
  and avail_sheet.first_name = "BARRON" and avail_sheet.last_name = "FRAZIER"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "KATHERINE" and member.last_name = "HASTINGS")
where odnmid is null
  and avail_sheet.first_name = "KATHARINE" and avail_sheet.last_name = "HASTINGS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CALVIN GERALD" and member.last_name = "JONES JR.")
where odnmid is null
  and avail_sheet.first_name = "CALVIN" and avail_sheet.last_name = "JONES"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "DAVID" and member.last_name = "MARTINEZ")
where odnmid is null
  and avail_sheet.first_name = "ALEX" and avail_sheet.last_name = "MARTINEZ"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "GEORGE" and member.last_name = "MEADORS")
where odnmid is null
  and avail_sheet.first_name = "GEORGE" and avail_sheet.last_name = "MEADORS JR"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "AMBER-LEIGH" and member.last_name = "MITCHELL")
where odnmid is null
  and avail_sheet.first_name = "AMBER" and avail_sheet.last_name = "MITCHELL"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "BEVERLY" and member.last_name = "RING")
where odnmid is null
  and avail_sheet.first_name = "ANNETTE" and avail_sheet.last_name = "RING"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "JERRY" and member.last_name = "SAMS")
where odnmid is null
  and avail_sheet.first_name = "JERRY LEE" and avail_sheet.last_name = "SAMS"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name like "SA%TOYA" and member.last_name = "STANTON")
where odnmid is null
  and avail_sheet.first_name like "SA%TOYA" and avail_sheet.last_name = "JOHNSON"
;
update ignore avail_sheet
set odnmid = (select id from member where member.first_name = "CHARLES" and member.last_name = "WHITLEY")
where odnmid is null
  and avail_sheet.first_name = "DAVID" and avail_sheet.last_name = "WHITLEY"
;
update schedule_assignment
set be_selected = FALSE
  and be_notification_pending = FALSE
where MONTH(nominal_day) < 4
;
COMMIT