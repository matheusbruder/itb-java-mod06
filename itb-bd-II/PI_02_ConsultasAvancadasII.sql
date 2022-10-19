/**
  Prática Integradora II

 */

# Creating database
create database if not exists db_praticas_integradoras;
use db_praticas_integradoras;

# Create tables
create table departamento
(
    depto_nro   varchar(10),
    nome_depto  varchar(50),
    localizacao varchar(50)
);
alter table departamento
    add constraint primary key (depto_nro);

create table funcionario
(
    cod_fuc   varchar(10),
    nome      varchar(50),
    sobrenome varchar(50),
    cargo     varchar(50),
    data_alta date,
    salario   decimal(10, 2),
    comissao  decimal(10, 2),
    depto_nro varchar(10)
);
alter table funcionario
    add constraint primary key (cod_fuc),
    add constraint foreign key (depto_nro) references departamento (depto_nro);

# Inserindo dados
insert into departamento
values ('D-000-1', 'Software', 'Los Tigres');
insert into departamento
values ('D-000-2', 'Sistemas', 'Guadalupe');
insert into departamento
values ('D-000-3', 'Contabilidade', 'La Roca');
insert into departamento
values ('D-000-4', 'Vendas', 'Plata');

insert into funcionario
values ('E-0001', 'Cesar', 'Pinero', 'Vendedor', '2018-12-05', 80000, 15000, 'D-000-4');
insert into funcionario
values ('E-0002', 'Yosep', 'Rowelsk', 'Analista', '2015-07-14', 140000, 0, 'D-000-2');
insert into funcionario
values ('E-0003', 'Mariela', 'Barrios', 'Diretor', '2014-05-06', 185000, 0, 'D-000-3');
insert into funcionario
values ('E-0004', 'Jhonathan', 'Aguilera', 'Vendedor', '2015-03-06', 85000, 10000, 'D-000-4');
insert into funcionario
values ('E-0005', 'Daniel', 'Brezieki', 'Vendedor', '2018-03-03', 83000, 10000, 'D-000-4');
insert into funcionario
values ('E-0006', 'Mito', 'Barchuk', 'Presidente', '2014-05-06', 190000, 0, 'D-000-3');
insert into funcionario
values ('E-0007', 'Emilio', 'Garlaza', 'Desenvolvedor', '2014-08-02', 60000, 0, 'D-000-1');
insert into funcionario
values ('E-0008', 'Jesus', 'Maria', 'Presidente', '2011-05-09', 200000, 10000, 'D-000-1');

# Visualizando dados
select *
from departamento;
select *
from funcionario;

# 1. Selecione o nome, cargo e localização dos departamentos onde os vendedores trabalham.
select f.nome, f.sobrenome, f.cargo, d.nome_depto, d.localizacao
from funcionario f
         inner join departamento d on f.depto_nro = d.depto_nro
where f.cargo = 'Vendedor';

# 2. Visualize departamentos com dois ou mais funcionários.
select d.nome_depto, count(f.cod_fuc) as nro_func
from departamento d
         inner join funcionario f on d.depto_nro = f.depto_nro
group by f.depto_nro
having nro_func >= 2;

# 3. Exiba o nome, salário e nome do departamento dos funcionários que têm o mesmo cargo que 'Mito Barchuki'.
select f.nome, f.sobrenome, f.salario, d.nome_depto
from funcionario f
         inner join departamento d on f.depto_nro = d.depto_nro
where f.cargo = (select fu.cargo from funcionario fu where fu.sobrenome = 'Barchuki');

# 4. Mostre os dados dos funcionários que trabalham no departamento de contabilidade, ordenados por nome.
select f.*
from funcionario f
         inner join departamento d on f.depto_nro = d.depto_nro
where d.nome_depto = 'contabilidade'
order by f.nome;

# 5. Mostre o nome do funcionário que tem o menor salário.
select *
from funcionario
order by salario
limit 1;

# 6. Mostre os dados do funcionário que tem o maior salário no departamento 'Vendas'.
select *
from funcionario f
    inner join departamento d on f.depto_nro = d.depto_nro
where d.nome_depto = 'Vendas'
order by f.salario desc
limit 1;