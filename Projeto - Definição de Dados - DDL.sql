/* Criar um banco de Dados Restaurante */
create database Restaurante;
use Restaurante;

create table Funcionarios(
	id_funcionario int auto_increment primary key,
    nome varchar(255) not null, -- nome precisa ser preenchido não pode ser nulo
    cpf varchar(14) not null, -- cpf precisar ser preenchido não pode ser nulo
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100),
    cargo varchar(100),
    salario decimal(10, 2),
    data_admissao date,
    unique (email) -- email como dado unico
);

describe Funcionarios;

create table Clientes(
	id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(14) not null,
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(255),
    email varchar(100),
    data_cadastro date,
    unique (email)
);

describe Clientes;

create table Produtos(
	id_produto int auto_increment primary key,
    nome varchar(255) not null,
    descricao text,
    preco decimal(10, 2) not null,
    categoria varchar(100)
);

describe Produtos;

create table Pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    id_funcionario int,
    id_produto int,
    quantidade int,
    preco decimal(10, 2),
    data_pedido date,
    status varchar(50),
    foreign key (id_cliente) references Clientes(id_cliente), -- sempre que for fazer referencia precisa esta com a tabela criada
    foreign key (id_funcionario) references Funcionarios(id_funcionario), -- tentei criar sem determinar o ID correto
    foreign key (id_produto) references Produtos(id_produto)
);

describe Pedidos;

create table Info_Produtos(
	id_info int auto_increment primary key,
    id_produto int,
    ingredientes text,
    fornecedor varchar(255),
    foreign key (id_produto) references Produtos(id_produto)
);

describe Info_Produtos;

