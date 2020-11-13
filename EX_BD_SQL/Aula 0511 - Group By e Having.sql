--exemplos de group by

--qual o maior salario?
select max(func_salario) from funcionarios

--qual o maior salario dos funcionarios do gerente 1
select max(func_salario) from funcionarios
where gerente_id = 1

--qual o maior salario dos funcionarios do gerente 2
select max(func_salario) from funcionarios
where gerente_id = 2

--------------------------------------------------------------

/*
se voce agrupar os funcionarios por "gerente_id", pode obter as seguintes informações:
max(func_salario) - maior salario dos funcionarios de cada gerente
min(func_salario) - menor salario dos funcionarios de cada gerente
avg(func_salario) - média salarial dos funcionarios de cada gerente
count(*) - quantidade de funcionarios que cada gerente possui
sum(func_salario) - somatória de todos os salarios dos funcionarios daquele gerente
*/

--qual o maior salario dos funcionarios de cada gerente?
select max(f.func_salario) maior, gerente_id
from funcionarios f
group by gerente_id 

--quantos funcionarios cada gerente possui?
select count(*) qtd, gerente_id
from funcionarios f
where gerente_id is not null
group by gerente_id 

--quantos funcionarios cada setor possui?
select count(*) qtd, setor_id
from funcionarios f
group by setor_id

--agrupando por mais de um campo
--qual o total de salarios separados por gerente_id e por setores deste gerente?
select sum(f.func_salario) total, gerente_id, setor_id
from funcionarios f
group by gerente_id, setor_id
-----------------------------------------------------------------------------

--uso do having
--listar a soma dos salarios de cada setor, somente dos setores que pagam 
--mais que 2500 reais no total
select sum(func_salario) total, setor_id
from funcionarios 
group by setor_id
having sum(func_salario) > 2500 --faz um filtro DEPOIS do agrupamento

--listar somente os setores que possuem mais que 4 funcionarios
select count(*) qtd, setor_id
from funcionarios
group by setor_id
having count(*) > 4

select * from funcionarios
