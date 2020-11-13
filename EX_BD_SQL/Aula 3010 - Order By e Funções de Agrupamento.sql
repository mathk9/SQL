--Exemplo de ordenação

--listar por ordem de salario
select * from funcionarios 
order by func_salario asc

--listar por ordem decrescente de salario
select * from funcionarios 
order by func_salario desc

--listar os funcionarios ordenados por gerente crescente e depois salario decrescente
select * from funcionarios 
order by gerente_id, func_salario desc

-------------------------------------------------------------------
--Funções de Agrupamento

--contagem
--exibir quantos funcionarios existem na empresa
select count(*) from funcionarios

--exibir quantos funcionarios existem no setor 1
select count(*) 
from funcionarios
where setor_id = 1

--contar quantos funcionarios possuem gerente (gerente != null)
select count(gerente_id)
from funcionarios

--equivale a 
select count(*)
from funcionarios
where gerente_id is not null

--contar quantos gerentes diferentes existem na tabela
select count(distinct gerente_id) total
from funcionarios

--mostrar o total pago para todos os funcionarios
select sum(func_salario) from funcionarios

select sum(func_salario), func_id from funcionarios

--Valores minimos, máximos e média

--qual o maior salario dos funcionarios
--não mostra de quem é
select max(func_salario) as maximo from funcionarios

--se quiser saber de quem é
select top 1 f.func_nome, f.func_salario
from funcionarios f
order by f.func_salario desc

--qual o menor salario dos funcionarios
--não mostra de quem é
select min(func_salario) as menor from funcionarios

--se quiser saber de quem é
select top 1 f.func_nome, f.func_salario
from funcionarios f
order by f.func_salario asc

--qual a média salarial dos funcionarios
select avg(func_salario) media
from funcionarios

--é possivel combinar funções de agrupamento
select max(f.func_dataNasc) maisNovo, min(func_salario) menorSalario, 
	   sum(func_salario) somatoria
from funcionarios f

