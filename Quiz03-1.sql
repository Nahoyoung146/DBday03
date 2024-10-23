CREATE TABLE member
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR(50)     NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

CREATE SEQUENCE AI START WITH 1 INCREMENT BY 1;

ALTER TABLE goods ADD CONSTRAINT FK_goods_g_id_member_m_id FOREIGN KEY (g_id) REFERENCES member (m_id) ;

insert into member values('aaa','aaa','홍길동','산골짜기');
insert into member values('bbb','bbb','김개똥','개똥별');
insert into member values('ccc','ccc','고길동','마포구');
insert into member values('ddd','ddd','김말이','분식집');

insert into goods values(AI.nextval,'aaa','운동화',75000,2,150000,sysdate);
insert into goods values(AI.nextval,'aaa','티셔츠',15000,5,75000,sysdate);
insert into goods values(AI.nextval,'bbb','가방',450000,1,450000,sysdate);
insert into goods values(AI.nextval,'bbb','책',35000,2,70000,sysdate);

select * from member;
select * from goods;
select * from member M inner join goods G on M.m_id = G.g_id;
select M.m_id,M.m_name,G.g_name,G.g_price_sum  from member M inner join goods G on M.m_id = G.g_id;
select M.m_id,M.m_name,M.m_addr,sum(G.g_price_sum) from member M inner join goods G on M.m_id = G.g_id group by M.m_id,M.m_name,M.m_addr;
