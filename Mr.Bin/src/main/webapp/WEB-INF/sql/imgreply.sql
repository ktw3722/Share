 create table imgreply(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
imgno number(7) not null,
primary key(rnum),
foreign key(imgno)  references img(imgno)
 
)

--create(댓글등록)
select * from MEMBER;
select * from img;
 
select nvl(max(rnum),0)+1 from imgreply;
 
insert into imgreply(rnum, content, regdate, id, imgno)
values((select nvl(max(rnum),0)+1 from imgreply),
'의견입니다.',sysdate,'user1',1
)
 
 
--read(댓글 내용)
select * from imgreply
 
--update(댓글 수정)
update imgreply
set content = '새로운 의견을 올립니다.'
where rnum = 1
 
--delete(댓글 삭제)
delete from imgreply
where rnum = 1
 
 
--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, imgno, r
FROM(
select rnum, content, regdate, id, imgno, rownum r
FROM(
select rnum, content, regdate, id, imgno
from imgreply
order by rnum DESC
    )
)WHERE r >= 1 and r <= 5
 
 
--total(목록)
select count(*) from imgreply