select DATE(timestamp) as date
, sum(amount) as sum
, count(*) as count
from donation
where entered_by = "norrene@cox.net"
group by date