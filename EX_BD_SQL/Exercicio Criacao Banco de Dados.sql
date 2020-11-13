

--1)Crie um banco de dados chamado Exercicio;
create database Exercicio

--2)Faça uso deste banco;
use Exercicio

--3)Crie uma tabela processo com os campos
--codProcesso, descricao (nao crie PK)
create table processo (
	codProcesso int not null,
	descricao varchar(50)
)

--4)altere a tabela processo e coloque PK como codProcesso
alter table processo
	add constraint PK_Processo primary key (codProcesso)

--5)crie uma tabela chamada Advogado com 
--codAdvogado(PK), nome, data_nasc que nao aceita nulo
create table advogado (
	codAdvogado int primary key,
	nome	    varchar(100),
	data_Nasc	smalldatetime not null
)

--6) adicione um campo na tabela processo
--que faça relacionamento com a tabela Advogado
alter table processo
	add codAdvogado int
		foreign key references Advogado(codAdvogado)
--ou
alter table processo
	add codAdvogado int

alter table processo
	add constraint FK_Processo_Advogado 
		foreign key (codAdvogado) references Advogado(codAdvogado)

--6-1) criar uma tabela cidade com os campos codCidade(PK) e descricao
create table cidade (
	codCidade int primary key,
	descricao varchar(40)
)

--7) Crie uma tabela chamada Forum com 
--codForum(PK), nome, endereço, codCidade(FK). 
--Neste mesmo comando, crie a tabela já com suas
--FKs
create table forum (
	codForum	int primary key,
	nome		varchar(100),
	endereco	varchar(70),
	codCidade	int foreign key references Cidade (codCidade)
)

--8) Adicione um campo na tabela Advogado chamado
--numOAB.
alter table Advogado
	add numOAB int