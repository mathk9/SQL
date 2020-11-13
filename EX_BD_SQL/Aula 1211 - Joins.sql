--exemplo de joins

--inner join traz somente os registros da tabela da esquerda que possuem
--relação com a tab da direita e os registros da tab da direita que tem
--relação com a tabela da esquerda

--tabelas da direita e esquerda em um join
/*
select * 
from [tabela da esquerda]
???? join [tabela da direita]
*/

--listar o nome do funcionarios e o NOME do seu setor
select f.func_nome, S.setor_nome
from funcionarios f
inner join setores s on f.setor_id = s.setor_id

--listar o nome do funcionarios e o NOME do seu setor
--de todos os setores que possuem a letra 'a' em sua descricao
select f.func_nome, S.setor_nome
from funcionarios f
inner join setores s on f.setor_id = s.setor_id
where s.setor_nome like '%a%'

--mesma solução, funciona somente com inner join
select f.func_nome, S.setor_nome
from funcionarios f, setores s 
where s.setor_nome like '%a%' and --filtro de dados
f.setor_id = s.setor_id -- ligação das tabelas

--------------------------------------------------------------------------
/*
left join
traz todos os registros da tabela da esquerda independente de existir
relação com a tabela da direita
*/

select * 
from funcionarios f
left join setores s on f.setor_id = s.setor_id

--listar todos os funcionarios que não estão alocado para nenhum setor
select * 
from funcionarios f
left join setores s on f.setor_id = s.setor_id
where s.setor_id is null

--exibir todos os setores que não possuem funcionarios alocados para ele
select s.*
from setores s
left join funcionarios f on s.setor_id = f.setor_id
where f.func_id is null

--------------------------------------------------------------------------
/*
right join
traz todos os registros da tabela da direita independente de existir
relação com a tabela da esquerda
*/

--exibir todos os setores que não possuem funcionarios alocados para ele
select s.*
from funcionarios f 
right join setores s on s.setor_id = f.setor_id
where f.func_id is null