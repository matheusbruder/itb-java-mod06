/**
  Prática Integradora IV

 */

use movies_db;

# 1. Adicione um filme à tabela de filmes.
insert into movies
values (22, curdate(), curdate(), 'Filme do Matheus', 10.0, 7, '1999-03-24', 100, 9);

# 2. Adicione um gênero à tabela de gêneros.
insert into genres
values (13, curdate(), curdate(), 'Matheusagem', 13, 1);

# 3. Associe o filme do ponto 1. com o gênero criado no ponto 2.
update movies
set genre_id = 13
where movies.title = 'Filme do Matheus';

# 4. Modifique a tabela de atores para que pelo menos um ator tenha o filme adicionado no ponto 1 como favorito.
update actors
set favorite_movie_id = 22
where id = 1;

# 5. Crie uma tabela temporária da tabela filmes.
create temporary table if not exists temp_movies
select title, rating, awards
from movies;

select *
from temp_movies;

# 6. Elimine dessa tabela temporária todos os filmes que ganharam menos de 5 prêmios.
delete
from temp_movies
where awards < 5;

select *
from temp_movies;

# 7. Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
select g.name, count(m.id) as nro_filmes
from genres g
         left join movies m on g.id = m.genre_id
group by g.id
having nro_filmes >= 1;

# 8. Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
select a.first_name, a.last_name, m.title, m.awards
from actors a
         inner join movies m on a.favorite_movie_id = m.id
where m.awards > 3;

# 9. Crie um índice no nome na tabela de filmes.
alter table movies
    add index unique_title (title);

# 10. Verifique se o índice foi criado corretamente.
show index from movies;

# 11. No banco de dados movies, haveria uma melhoria notável na criação de índices? Analise e justifique a resposta.
# ??????????

# 12. Em que outra tabela você criaria um índice e por quê? Justifique a resposta
# ??????????