# Setando banco
use movies_db;

# Dropando tabela se existe
drop temporary table if exists actors_temp

# Criando tabela temporária
create temporary table actors_temp
select a.first_name, a.last_name, a.rating  
from actors a 
where a.rating > 5;

# Testanto a existêncua
select * from actors_temp 

select * from actors_temp
where first_name like '%Sam%'