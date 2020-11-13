--manipulando dados nas tabelas

-- Inclusão de dados
insert into cidade (codCidade, descricao) values (1, 'Santo André')
--tem que colocar dados em todos os campos
insert into cidade values (2, 'Mauá') 
--colocar varios registros de uma só vez
insert into cidade values (3, 'São Bernardo do Campo'),
				          (4, 'São Paulo'),
						  (5, 'São Caetano do Sul')
insert into cidade (codCidade, descricao) values (6, 'Diadema')

--não colocando informaçoes
insert into cidade (codCidade) values (7)
insert into cidade (codCidade, descricao) values (8, null)

--Atualizando dados
update cidade set descricao='Diadema Cidade Maravilhosa'
	where codCidade = 6

update cidade set descricao='sem valor'
	where descricao is null

--Apagando registros
delete from cidade where codCidade = 7

-----------------------------------------------------------------------------
--inserir registro na tabela de cliente com cidade inexistente
insert into cliente values 
(2, 'Rivotriu de Anador', 'remdio@farmais.com', '10/12/1973',0, 4, 130000)

insert into cliente values 
(3, 'Benedito de Souza Cruz', 'cruz@vermelha.com', '10/01/1984',1, 3, 2130000)

--para alterar o formato da data
set dateformat ymd --ano mes dia

set dateformat dmy --dia mes ano

select * from cliente