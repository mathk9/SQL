--Exibindo dados da Tabela
--selecionar todos os campos
select * from Cliente

--selecionar somente alguns campos
select nome, dtnasc, patrimonio
from Cliente

--apelidos
select nome, dtnasc as Nascimento, patrimonio patrimonioLiquido
from Cliente

select nome, dtnasc as Nascimento, patrimonio [Patrimonio Liquido]
from Cliente

--usando filtros de dados
select * 
from cliente
where patrimonio < 2000000

--listar todos os nomes dos clientes casados
select nome
from cliente
where casado = 1

--listar quem não é casado  ou mora na cidade 2
select *
from cliente
where casado = 0 or codCidade = 2

--atualizar o patrimonio em 10% de quem mora na cidade 2
update cliente set patrimonio = patrimonio * 1.10
where codCidade = 2

--uso do Between
--listar todos que a cidade esta entre 3 e 4 inclusive
select * 
from cliente
where codCidade between 3 and 4
--outra forma
select * 
from cliente
where codCidade >= 3  and codCliente <= 4

--lista os clientes que possuem o nome entre 'a' e 'c'
select * 
from cliente 
where nome between 'a' and 'c'

--uso do IN (lista de dados)
select * from cidade
where codCidade in (1, 3, 5, 8)

--ou
select * from cidade
where codCidade = 1 or codCidade = 3 or codCidade = 5 or codCidade = 8

select * from cidade
where descricao collate Latin1_General_CI_AI
 in ('santo andre', 'Sao caetano do sul', 'sem valor')

 select * from cidade
where descricao 
 in ('santo andre', 'Sao caetano do sul', 'sem valor')

 alter database exemplo
collate Latin1_General_CI_AI

------------------------------------------------------
--uso do LIKE
--listar todos os clientes que terminam com a letra 'o'
select * 
from cliente
where nome like '%o'

--listar quem tem a letra 'o' em qualquer parte do nome
select * from cliente
where nome like '%o%'

select * from cliente
where nome like '%an%'

--todos que começam com a letra J
select * from cliente
where nome like 'j%'

--listar todas as cidades que a segunda letra é 'a'
select * from cidade
where descricao like '_a%'

--listar as cidades que a 2 e quinta letras são 'a'
select * from cidade
where descricao like '_a__a%'

--uso do DISTINCT
select distinct casado from cliente

--uso do TOP

--listar somente os 4 primeiros
select top 4 * from cidade

--listar a pessoa mais velha
select top 1 * from cliente order by dtnasc 

select * from cidade
