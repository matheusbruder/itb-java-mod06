/**
  Prática integradora I

  PRIMEIRA PARTE

    1. Como é chamado um JOIN em um banco de dados e para que é usado?
        Um JOIN existe para fazer a junção de duas ou mais tabelas.

    2. Explique os tipos de JOIN.
        INNER JOIN - Junção por igualdade
        LEFT JOIN - Junção de por igualdade além de tudo da esquerda
        RIGHT JOIN - Junção de por igualdade além de tudo da direita
        CROSS JOIN - Junção de tudo

    3. Para que serve o GROUP BY?
        Agrupar um conjunto de linhas de acordo com alguma função de agregação. Por exemplo: somar preços por categorias.

    4. Para que serve o HAVING?
        O Having é identico ao WHERE, entretanto ele é o filtro sobre as agragações já feitas pelo GROUP BY

    5. Escreva uma consulta genérica para cada um dos seguintes diagramas:
        select * from LeftTable lt inner join RightTable rt on lt.id = rt.id;
        select * from LeftTable lt left join RightTable rt on lt.id = rt.id;

 */


/**
  SEGUNDA PARTE
 */

-- set database
use movies_db;

select *
from actors;

select *
from series;

select *
from movies;

select *
from genres;

select *
from episodes;

# 1. Mostrar o título e o nome do gênero de todas as séries.
select s.title as título, g.name as gênero
from series s
         inner join genres g on s.genre_id = g.id;

# 2. Mostrar o título dos episódios, o nome e sobrenome dos atores que trabalham em cada um deles.
select e.title, concat(a.first_name, ' ', a.last_name) as full_name
from actors a
         inner join actor_episode ae on a.id = ae.actor_id
         inner join episodes e on ae.episode_id = e.id;

# 3. Mostrar o título de todas as séries e o número total de temporadas que cada uma delas possui.
select series.title, count(seasons.id) as temporadas
from series
         inner join seasons on series.id = seasons.serie_id
group by series.title;

# 4. Mostrar o nome de todos os gêneros e o número total de filmes de cada um, desde que seja maior ou igual a 3.
select g.name, count(m.id) as total_filmes
from movies m
         left join genres g on m.genre_id = g.id
group by g.name
having total_filmes >= 3
order by total_filmes desc;

# 5. Mostrar apenas o nome e sobrenome dos atores que atuam em todos os filmes de Harry Potter e que estes não se repitam.
select distinct a.first_name, a.last_name
from actors a
         inner join actor_movie am on a.id = am.actor_id
         inner join movies m on am.movie_id = m.id
where m.title like '%Harry Potter%';