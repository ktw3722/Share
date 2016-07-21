--테이블 생성
create table guest(
guestno number not null,
mname varchar(100) not null,
content varchar(500) not null,
wdate varchar(50) not null,
primary key(guestno)
)
-----
delete from GUEST
----
drop table guest
-----
select * from guest
------
alter table guest RENAME COLUMN gname to id
------------데이터 삽입
insert into GUEST (
guestno,mname,content,wdate)
values(
(select nvl(max(guestno),0)+1 from GUEST),
'김성빈','야호','2016-06-22 11:12:12')
------리스트

SELECT * from guest 
order by geustno