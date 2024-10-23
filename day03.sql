CREATE TABLE membership
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR(50)     NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(20)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

CREATE SEQUENCE board_SEQ START WITH 1 INCREMENT BY 1;

ALTER TABLE board ADD CONSTRAINT fk_test FOREIGN KEY (b_id) REFERENCES membership (m_id) ;

insert into membership(m_id,m_pwd,m_name,m_addr) values ('aaa','aaa','홍길동','산골짜기');
insert into board(b_num,b_id,b_title,b_content,b_date) values (board_SEQ.nextval,'aaa','제목1','내용1',sysdate);
insert into board(b_num,b_id,b_title,b_content,b_date) values ((select max(b_num) from board)+1,'aaa','제목2','내용2',sysdate);
select * from membership;
select * from board;
delete from membership where m_id ='aaa';
delete from board where b_id ='aaa';
select * from user_sequences;
select * from all_sequences;
select * from all_sequences where sequence_owner = 'C##GHDUD024';
drop sequence board_seq;
select * from all_constraints;
select * from all_constraints where owner='C##GHDUD024';
select * from user_constraints;
alter table board drop constraint fk_test;
insert into membership values('aaa','aaa','홍길동','산골짜기');
insert into board values (1,'ccc','제목','내용',sysdate);
insert into board values (2,'aaa','제목','내용',sysdate);
insert into board values (3,'aaa','제목','내용',sysdate);
delete from membership where m_id = 'aaa';
delete from board;

ALTER TABLE board ADD CONSTRAINT fk_test FOREIGN KEY (b_id) REFERENCES membership (m_id) on delete cascade;
-- on delete cascade : 부모가 삭제되면 모든 자식들도 같이 삭제

select * from membership M inner join board B on M.m_id = B.b_id;
delete from membership where m_id='aaa';

drop table membership; -- 자식과 연결되어 있어서 에러
drop table membership cascade constraints; -- 강제로 

create view view_test as select * from member where m_id='aaa';
select * from view_test;
create view view_test2 as select * from member M inner join goods G on M.m_id = G.g_id;
select * from view_test2;
create view view_test3 as select M.m_id,M.m_name,M.m_addr,sum(G.g_price_sum) 총금액 from member M inner join goods G on M.m_id = G.g_id group by M.m_id,M.m_name,M.m_addr;
select * from view_test3;
create or replace view view_test as select * from member where m_id='bbb';
drop view view_test;