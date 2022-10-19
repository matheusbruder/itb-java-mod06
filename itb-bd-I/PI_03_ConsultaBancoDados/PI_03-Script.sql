/*
 
 PRÁTICA INTEGRADORA 03
 
 SCRIPT EXERCÍCIO
   
 */


# Settings
use movies_db;

# ➔ Mostrar todos os registros da tabela de filmes.
select * 
from movies;

# ➔ Mostrar o nome, sobrenome e classificação de todos os atores.
select a.first_name, a.last_name, a.rating 
from actors a;

# ➔ Mostrar o título de todas as séries e use alias para que tanto o nome da tabela quanto o campo estejam em Português.
select s.title as titulo 
from series s;

# ➔ Mostrar o nome e sobrenome dos atores cuja classificação é superior a 7,5.
select a.first_name, a.last_name
from actors a
where rating > 7.5;

# ➔ Mostrar o título dos filmes, a classificação e os prêmios dos filmes com classificação superior a 7,5 e com mais de dois prêmios.
select m.title, m.rating, m.awards
from movies m 
where rating > 7.5 and awards > 2;

# ➔ Mostrar o título dos filmes e a classificação ordenados por classificação em ordem crescente.
select m.title, m.rating
from movies m 
order by m.rating asc;

# ➔ Mostrar os títulos dos três primeiros filmes no banco de dados.
select m.title
from movies m
limit 3;

# ➔ Mostrar os 5 melhores filmes com a classificação mais alta.
select m.id, m.title, m.rating, m.awards
from movies m 
order by m.rating desc
limit 5;

# ➔ Listar os 10 primeiros atores.
select a.id, a.first_name, a.last_name, a.rating
from actors a 
limit 10;

# ➔ Mostrar o título e a classificação de todos os filmes cujo título é Toy Story.
select m.title, m.rating
from movies m 
where m.title like '%Toy Story%';

# ➔ Mostrar todos os atores cujos nomes começam com Sam.
select *
from actors a 
where a.first_name like 'sam%' or a.last_name like 'sam%';

# ➔ Mostrar o título dos filmes que saíram entre 2004 e 2008.
select m.title, m.release_date 
from movies m 
where m.release_date between '2004-01-01' and '2008-12-31';

# Mostrar o título dos filmes com classificação superior a 3, com mais de 1 prêmio e com data de lançamento entre 1988 e 2009. Ordenar os resultados por classificação.
select m.id, m.title, m.rating, m.awards, m.release_date
from movies m
where m.rating > 3 and m.awards > 1 and m.release_date between '1988-01-01' and '2009-12-31'
order by m.rating asc;