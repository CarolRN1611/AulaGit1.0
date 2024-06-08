CREATE DATABASE PASTELARIA2;
USE PASTELARIA2;

CREATE TABLE clientes (	
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);


CREATE TABLE cargos (
	id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(20) NOT NULL,
	salario FLOAT
    );

CREATE TABLE funcionarios (	
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cargo VARCHAR(20) NOT NULL
);


CREATE TABLE produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(20) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
	categoria VARCHAR(10) NOT NULL,
    tamanho CHAR(2) NOT NULL
);

CREATE TABLE recheios (
	id_recheio INT PRIMARY KEY AUTO_INCREMENT,
    nome_recheio VARCHAR(10) NOT NULL,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE produtos_recheios (
	id_produto INT NOT NULL,
	id_recheio INT NOT NULL,
	quantidade INT NOT NULL,
    
    FOREIGN KEY (id_produto) references produtos(id_produto),
    FOREIGN KEY (id_recheio) references recheios(id_recheio)
);

CREATE TABLE pagamentos (
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    forma VARCHAR(10) NOT NULL, 
    descricao VARCHAR(20) NOT NULL
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
	datapedido DATETIME,
    forma_pagamento INT NOT NULL,
    valor_total FLOAT NOT NULL,
    sts ENUM('PROCESSANDO','FINALIZADO'),
    obs VARCHAR(50) ,
    FOREIGN KEY (forma_pagamento) references pagamentos(id_pagamento)
	
);

CREATE TABLE itens_pedidos (
	id_pedido INT NOT NULL,
    id_produto INT NOT NULL, 
    quantidade INT NOT NULL,
    valor_unitario FLOAT NOT NULL, 

	FOREIGN KEY (id_pedido) references pedidos(id_pedido),
	FOREIGN KEY (id_produto) references produtos(id_produto)
);


INSERT INTO clientes (nome_cliente, cpf, data_nascimento, telefone, email, endereco) 
VALUES 
('João Silva', '12345678901', '1994-05-15', '11987654321', 'joao.silva@example.com', 'Rua da Penha, 123'),
('Maria Oliveira', '98765432109', '2006-10-20', '11901234567', 'maria.oliveira@example.com', 'Av. Champs Elyées, 456'),
('Pedro Santos', '45678901234', '1989-07-05', '11976543210', 'pedro.santos@example.com', 'Rua Las Ramblas, 789');


INSERT INTO cargos (nome_cargo, salario)
VALUES 
('Atendente', 1500.00),
('Cozinheiro', 2000.00),
('Gerente', 3000.00);


INSERT INTO funcionarios (nome_funcionario, cpf, data_nascimento, telefone, email, endereco, cargo) 
VALUES 
('Carlos Pereira', '23456789012', '1996-03-25', '11987654322', 'carlos.pereira@example.com', 'Rua X, 789', 'Atendente'),
('Ana Souza', '34567890123', '1984-11-12', '11901234568', 'ana.souza@example.com', 'Av. Y, 456', 'Cozinheiro'),
('Luiza Lima','56789012345', '1992-08-30', '11976543211', 'luiza.lima@example.com', 'Rua Z, 123', 'Gerente');


INSERT INTO produtos (nome_produto, descricao, preco, categoria, tamanho) 
VALUES 
('Pastel de Carne', 'Pastel recheado com carne moída', 3.50, 'Salgado', 'P'),
('Pastel de Carne', 'Pastel recheado com carne moída', 4.50, 'Salgado', 'M'),
('Pastel de Carne', 'Pastel recheado com carne moída', 5.50, 'Salgado', 'G'),
('Pastel de Queijo', 'Pastel recheado com queijo', 3.00, 'Salgado', 'P'),
('Pastel de Queijo', 'Pastel recheado com queijo', 4.00, 'Salgado', 'M'),
('Pastel de Queijo', 'Pastel recheado com queijo', 5.00, 'Salgado', 'G'),
('Pastel de Bacon', 'Pastel recheado com Bacon', 3.00, 'Salgado', 'P'),
('Pastel de Bacon', 'Pastel recheado com Bacon', 4.00, 'Salgado', 'M'),
('Pastel de Bacon', 'Pastel recheado com Bacon', 5.00, 'Salgado', 'G'),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 3.50, 'Salgado', 'P'),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 4.50, 'Salgado', 'M'),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 5.50, 'Salgado', 'G'),
('Pastel de Palmito', 'Pastel recheado com palmito', 4.50, 'Vegano', 'P'),
('Pastel de Palmito', 'Pastel recheado com palmito', 5.50, 'Vegano', 'M'),
('Pastel de Palmito', 'Pastel recheado com palmito', 6.50, 'Vegano', 'G'),
('Pastel de cogumelos','Pastel recheado com cogumelos',5.00,'Vegano','P'), 
('Pastel de cogumelos','Pastel recheado com cogumelos',6.00,'Vegano','M'), 
('Pastel de cogumelos','Pastel recheado com cogumelos',7.00,'Vegano','G'), 
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 4.00, 'Doce', 'P'),
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 5.00, 'Doce', 'M'),
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 6.00, 'Doce', 'G'),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 4.00, 'Doce', 'P'),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 5.00, 'Doce', 'M'),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 6.00, 'Doce', 'G'),
('Coca-Cola', 'Refrigerante', 2.00, 'Bebida', 'P'),
('Coca-Cola', 'Refrigerante', 3.00, 'Bebida', 'M'),
('Coca-Cola', 'Refrigerante', 4.00, 'Bebida', 'G'),
('Pepsi', 'Refrigerante', 2.00, 'Bebida', 'P'),
('Pepsi', 'Refrigerante', 2.50, 'Bebida', 'M'),
('Pepsi', 'Refrigerante', 3.00, 'Bebida', 'G'),
('Suco de Laranja', 'Suco natural de laranja', 2.00, 'Bebida', 'P'),
('Suco de Laranja', 'Suco natural de laranja', 3.00, 'Bebida', 'M'),
('Suco de Laranja', 'Suco natural de laranja', 4.00, 'Bebida', 'G'),
('Suco de Caju', 'Suco natural de Caju', 2.00, 'Bebida', 'P'),
('Suco de Caju', 'Suco natural de Caju', 3.00, 'Bebida', 'M'),
('Suco de Caju', 'Suco natural de Caju', 4.00, 'Bebida', 'G'),
('Suco de Goiaba', 'Suco natural de Goiaba', 2.00, 'Bebida', 'P'),
('Suco de Goiaba', 'Suco natural de Goiaba', 3.00, 'Bebida', 'M'),
('Suco de Goiaba', 'Suco natural de Goiaba', 4.00, 'Bebida', 'G'),
('Café', 'Café expresso', 1.50, 'Bebida', 'P'),
('Água Mineral', 'Água sem gás', 1.50, 'Bebida', 'G'),
('Batata Frita', 'Porção de batatas fritas crocantes', 5.00, 'Acompanhamento', 'P'),
('Batata Frita', 'Porção de batatas fritas crocantes', 7.00, 'Acompanhamento', 'M'),
('Batata Frita', 'Porção de batatas fritas crocantes', 9.00, 'Acompanhamento', 'G');


INSERT INTO recheios (nome_recheio, descricao)
VALUES 
('Carne', 'Carne moída temperada'),
('Bacon', 'Bacon'),
('Queijo', 'Queijo derretido'),
('Frango', 'Frango desfiado e temperado'),
('Palmito', 'Palmito refogado'),
('Nutella', 'Creme de avelã'),
('Banana com Canela', 'Banana com Canela'),
('Cogumelos', 'Congumelos refogado');


INSERT INTO pagamentos (forma, descricao)
VALUES 
('Dinheiro', 'Pagamento em dinheiro na entrega'),
('Cartão ', 'Pagamento com cartão de crédito ou débito'),
('Pix ', 'Pagamento via Pix na entrega');

INSERT INTO pedidos (id_cliente, datapedido, forma_pagamento, valor_total, sts)
VALUES 
(1, '2023-09-09 10:00:00', 1, 10.50, 'FINALIZADO'),
(2, '2024-03-12 12:30:00', 2, 7.50, 'PROCESSANDO'),
(3, '2024-05-29 15:45:00', 3, 14.00, 'FINALIZADO'),
(1, '2024-03-01 10:00:00', 1, 11.00, 'FINALIZADO'),
(2, '2024-04-14 12:30:00', 2, 8.00, 'PROCESSANDO'),
(3, '2024-03-27 15:45:00', 3, 15.00, 'FINALIZADO'),
(2, '2024-02-13 10:00:00', 1, 9.50, 'PROCESSANDO'),
(3, '2024-01-09 12:30:00', 2, 12.50, 'FINALIZADO'),
(1, '2024-05-06 15:45:00', 3, 10.00, 'PROCESSANDO');




INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, valor_unitario)
VALUES 
(1, 1, 2, 3.50),
(1, 2, 1, 3.00),
(2, 4, 3, 3.50),
(3, 5, 4, 4.00),
(4, 1, 1, 3.50),
(4, 3, 2, 3.50),
(5, 2, 3, 3.00),
(5, 4, 1, 3.50),
(6, 5, 2, 4.00),
(6, 1, 3, 3.50);


#DROP DATABASE PASTELARIA2;

#CREATE VIEW cliente_maiores_veganos AS
#SELECT
#	nome,
#	FLOOR(DATEDIFF(NOW(), data_nascimento)/365.25) idade
#FROM clientes
#HAVING idade >= 18;


