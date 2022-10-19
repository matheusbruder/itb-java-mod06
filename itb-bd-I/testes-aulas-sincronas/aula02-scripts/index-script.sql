# Criando database
create database if not exists db_index_meli;


# Setando database
use db_index_meli;

# Criando tabela
create table user (
	id integer,
	nome varchar(100)
);


# Inserindo dados
insert into user 
values (1, 'Matheus');
insert into user 
values (1, 'Lucas');
insert into user 
values (3, 'Fabiana');

# Visualizando dados
select distinct nome from user;

# Update no id para adicionar chave
update user
set id = 2
where nome = 'Lucas';

# Adicionando restrição
alter table user
add constraint primary key(id);

# Adicionando nova coluna
alter table user
add email varchar(100);

# Buscandos usuários
select * from user;

# Adicionando email
update user
set email = 'matheus@email.com'
where id = 1;

# Adicionando index no email
alter table user
add constraint unique(email)

# Adicionando email repetido, NAO PODE!
update user
set email = 'matheus@email.com'
where id = 2;


