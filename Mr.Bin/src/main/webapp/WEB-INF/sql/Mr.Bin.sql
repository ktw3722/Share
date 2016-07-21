select '게시판' 테이블명,title,content from bbs
WHERE title||content LIKE '%123%'
 union all
select '메모',title,content from memo 
WHERE title||content LIKE '%123%'
ORDER BY title ASC;

select mname from MEMBER
where id='ktw3722'