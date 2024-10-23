create view m_g_join as select * from member M inner join goods G on M.m_id = G.g_id;
select * from m_g_join;
select * from m_g_join where g_count >= 2;
select m_id,m_name,g_name, g_price*g_count 총_가격 from m_g_join;
select m_id,m_name,m_addr,sum(g_price_sum) total_price from m_g_join group by m_id,m_name,m_addr;