select * from person;


# rank question by ans ratio
select total.sId, ans.num / total.num as rate
from 
(
select sId, count(sEvent) as num
from person
where sEvent = "IMP"
group by sId
) total left outer join
(select sId, count(sEvent) as num
from person
where sEvent = "ANS"
group by sId)  ans  on (total.sId = ans.sId)
order by rate desc;


# Given a person has answer question A, find the question next question to show. 
# specifically show next question with highest answer rate given question a has been answered

select pid
from person
where sEvent = "ANS" and sId = 1;


select tot.sId, ans.num / tot.num
from
(select sid, count(sEvent) as num
from person
where pId in 
(
select pId
from person
where sEvent = "ANS" and sId = 1
) and sEvent = "IMP"
group by sid
) tot left outer join 
(select sid, count(sEvent) as num
from person
where pId in 
(
select pId
from person
where sEvent = "ANS" and sId = 1
) and sEvent = "ANS"
group by sid
) ans  on (tot.sId = ans.sId);


# find all ipids that have moer than 5 timestamps in a 300-second moving window
select p.ipid, p.accesstime, p.num / q.num
from
(select t1.ipid, t1.accesstime, count(t2.accesstime) as num
from ipacesstime t1, ipacesstime t2
where t1.ipid=t2.ipid and t2.accesstime-t1.accesstime<=300 and t2.accesstime>=t1.accessTime
group by t1.ipid, t1.accesstime
order by count(t2.accesstime) desc) p inner join 
(

select t1.ipid, t1.accesstime, count(*) as num
from ipacesstime t1
group by t1.ipid, t1.accesstime) q on (p.ipid = q.ipid and p.accesstime = q.accesstime)
where p.num / q.num >= 5;
