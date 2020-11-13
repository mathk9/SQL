--criando tabela, PKs e FKs

--criar o banco de dados
create database exemplo

--habilita para ser utilizado
use exemplo

--criando tabela de cliente
create table Cliente (
	codCliente int primary key, --permite criar somente pk simples
	nome       varchar(100),
	email	   varchar(200),
	dtNasc	   smalldatetime,
	casado	   bit,
	patrimonio decimal(10,2)
)

--outra maneira
create table Cliente (
	codCliente int not null, --será o campo PK
	nome       varchar(100),
	email	   varchar(200) default 'sem e-mail',
	dtNasc	   smalldatetime,
	casado	   bit,
	patrimonio decimal(10,2),
	primary key (codCliente) --permite criar PKs compostas, basta separar os campos por 
						     --virgula
)

--apagar a tabela
drop table Cliente

--comandos para alterar a tabela
--adicionar um campo
alter table cliente
	add codCidade int,
	    sexo varchar(1)

--remover um campo da tabela
alter table cliente
	drop column casado

--criando uma tabela sem PK
create table Cidade (
	codCidade int  not null,
	descricao varchar(50)
)

--alterar uma tabela
--adicionar um PK - constraint
alter table Cidade
	add constraint PK_Cidade primary key (codCidade)

--adicionar um FK - constraint
alter table Cliente
	add constraint FK_Cidade_Cliente foreign key (codCidade)
									 references Cidade (codCidade)


--criando uma tabela já com chave PK e FK
create table Cliente (
	codCliente int not null, --será o campo PK
	nome       varchar(100),
	email	   varchar(200) default 'sem e-mail',
	dtNasc	   smalldatetime,
	casado	   bit,
	codCidade  int foreign key references Cidade (codCidade),
	patrimonio decimal(10,2),
	primary key (codCliente) --permite criar PKs compostas, basta separar os campos por 
						     --virgula
)