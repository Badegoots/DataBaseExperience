-- Criação do Banco de Dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar Tabela Pessoa Fisica
CREATE TABLE pessoaFisica (
	IdPessoaFisica INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT unique_cpf_pessoa_fisica UNIQUE (CPF)
);

-- Criar Tabela Pessoa Jurídica
CREATE TABLE pessoaJuridica (
	IdPessoaJuridica INT AUTO_INCREMENT PRIMARY KEY,
	RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_pessoa_juridica UNIQUE (CNPJ)
);

-- Criar Tabela Cliente
CREATE TABLE cliente (
	IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    IdClientePessoaFisica INT,
    IdClientePessoaJuridica INT,
    Nome VARCHAR(45) NOT NULL,
    Identificacao VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
    CONSTRAINT fk_cliente_pessoaFisica FOREIGN KEY (IdClientePessoaFisica) REFERENCES pessoaFisica(IdPessoaFisica) ,
    CONSTRAINT fk_cliente_pessoaJuridica FOREIGN KEY (IdClientePessoaJuridica) REFERENCES pessoaJuridica(IdPessoaJuridica)
);

-- Criar Tabela Produto
CREATE TABLE produto (
	IdProduto INT AUTO_INCREMENT PRIMARY KEY,
	Categoria ENUM('Eletronico', 'Roupas', 'Brinquedos', 'Alimentos') NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Valor INT NOT NULL
);

-- Criar Tabela Pedido
CREATE TABLE pedido (
	IdPedido INT AUTO_INCREMENT PRIMARY KEY,
    IdPedidoCliente INT,
    IdPedidoEntrega INT,
    IdPedidoPagamento INT,
	StatusPedido ENUM('Confirmado', 'Cancelado', 'Em processamento') NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Valor INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (IdPedidoCliente) REFERENCES cliente(IdCliente),
    CONSTRAINT fk_pedido_entrega FOREIGN KEY (IdPedidoEntrega) REFERENCES entrega(IdEntrega),
    CONSTRAINT fk_pedido_pagamento FOREIGN KEY (IdPedidoPagamento) REFERENCES pagamento(IdPagamento)
);

-- Criar Tabela Vendedor Terceiro
CREATE TABLE terceiro (
	IdTerceiroVendedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
    CONSTRAINT unique_cnpj_terceiro UNIQUE (CNPJ)
);

-- Criar Tabela Fornecedor
CREATE TABLE fornecedor (
	IdFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    CONSTRAINT unique_cnpj_fornecedor UNIQUE (CNPJ)
);

-- Criar Tabela Estoque
CREATE TABLE estoque (
	IdEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Endereco VARCHAR(45) NOT NULL,
    Quantidade INT NOT NULL DEFAULT 0
);

-- Criar Tabela Entrega
CREATE TABLE entrega (
	IdEntrega INT AUTO_INCREMENT PRIMARY KEY,
    EmpresaResponsavel VARCHAR(45) NOT NULL,
    StatusEntrega VARCHAR(45) NOT NULL,
    CódigoRastreio VARCHAR(45) NOT NULL
);

-- Criar Tabela Pagamento
CREATE TABLE pagamento (
	IdPagamento INT AUTO_INCREMENT PRIMARY KEY,    
    IdPagamentoCartaoCredito INT,
    IdPagamentoCartaoDebito INT,
    IdPagamentoPix INT,
    IdPagamentoBoleto INT,
    StatusPagamento VARCHAR(45) NOT NULL,
    FormaPagamento VARCHAR(45) NOT NULL,
    CONSTRAINT fk_pagamento_cartaoCredito FOREIGN KEY (IdPagamentoCartaoCredito) REFERENCES cartaoCredito(IdCartaoCredito),
    CONSTRAINT fk_pagamento_cartaoDebito FOREIGN KEY (IdPagamentoCartaoDebito) REFERENCES cartaoDebito(IdCartaoDebito),
    CONSTRAINT fk_pagamento_pix FOREIGN KEY (IdPagamentoPix) REFERENCES pix(IdPix),
    CONSTRAINT fk_pagamento_boleto FOREIGN KEY (IdPagamentoBoleto) REFERENCES boleto(IdBoleto)
);

-- Criar Tabela Cartão de Crédito
CREATE TABLE cartaoCredito (
	IdCartaoCredito INT AUTO_INCREMENT PRIMARY KEY,
    NomeCartao VARCHAR(45) NOT NULL,
    Numero VARCHAR(45) NOT NULL,
    DataValidade DATE NOT NULL
);

-- Criar Tabela Cartão de Débito
CREATE TABLE cartaoDebito (
	IdCartaoDebito INT AUTO_INCREMENT PRIMARY KEY,
    NomeCartao VARCHAR(45) NOT NULL,
    Numero VARCHAR(45) NOT NULL,
    DataValidade DATE NOT NULL
);

-- Criar Tabela PIX
CREATE TABLE pix (
	IdPix INT AUTO_INCREMENT PRIMARY KEY,
    ChavePix VARCHAR(45) NOT NULL,
    CONSTRAINT unique_chavePix_pix UNIQUE (ChavePix)
);

-- Criar Tabela Boleto
CREATE TABLE boleto (
	IdBoleto INT AUTO_INCREMENT PRIMARY KEY,
    Banco VARCHAR(45) NOT NULL,
    NumeroBoleto VARCHAR(45) NOT NULL,
    CONSTRAINT unique_numeroBoleto_boleto UNIQUE (NumeroBoleto)
);

-- Criar tabela Pagamento-CartaoCredito
CREATE TABLE pagamentoCartaoCredito (
	IdPcartaocredito INT,
    IdPpagamentocredito INT,
    NumeroCartao INT DEFAULT 1,
    PRIMARY KEY (IdPcartaocredito, IdPpagamentocredito),
    CONSTRAINT fk_pagamentoCartaoCredito_cartaoCredito FOREIGN KEY (IdPcartaocredito) REFERENCES cartaoCredito(IdCartaoCredito),
    CONSTRAINT fk_pagamentoCartaoCredito_pagamento FOREIGN KEY (IdPpagamentocredito) REFERENCES pagamento(IdPagamento)
);

-- Criar tabela Pagamento-CartaoDebito
CREATE TABLE pagamentoCartaoDebito (
	IdPcartaodebito INT,
    IdPpagamentodebito INT,
    NumeroCartao INT DEFAULT 1,
    PRIMARY KEY (IdPcartaodebito, IdPpagamentodebito),
    CONSTRAINT fk_pagamentoCartaoDebito_cartaoDebito FOREIGN KEY (IdPcartaodebito) REFERENCES cartaoDebito(IdCartaoDebito),
    CONSTRAINT fk_pagamentoCartaoDebito_pagamento FOREIGN KEY (IdPpagamentodebito) REFERENCES pagamento(IdPagamento)
);

-- Criar tabela Produto-Vendedor
CREATE TABLE produtoVendedor (
	IdPvendedor INT,
    IdPproduto INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (IdPvendedor, IdPproduto),
    CONSTRAINT fk_produtoVendedor_terceiro FOREIGN KEY (IdPvendedor) REFERENCES terceiro(IdTerceiroVendedor),
    CONSTRAINT fk_produtoVendedor_produto FOREIGN KEY (IdPproduto) REFERENCES produto(IdProduto)
);

-- Criar tabela Produto-Fornecedor
CREATE TABLE produtoFornecedor (
	IdPfornecedor INT,
    IdPOproduto INT,
    PRIMARY KEY (IdPfornecedor, IdPOproduto),
    CONSTRAINT fk_produtoFornecedor_terceiro FOREIGN KEY (IdPfornecedor) REFERENCES fornecedor(IdFornecedor),
    CONSTRAINT fk_produtoFornecedor_produto FOREIGN KEY (IdPOproduto) REFERENCES produto(IdProduto)
);

-- Criar tabela Produto-Pedido
CREATE TABLE produtoPedido (
	IdPpedido INT,
    IdPeproduto INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (IdPpedido, IdPeproduto),
    CONSTRAINT fk_produtoPedido_pedido FOREIGN KEY (IdPpedido) REFERENCES pedido(IdPedido),
    CONSTRAINT fk_produtoPedido_produto FOREIGN KEY (IdPeproduto) REFERENCES produto(IdProduto)
);

-- Criar tabela Produto-Estoque
CREATE TABLE produtoEstoque (
	IdPestoque INT,
    IdPlproduto INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (IdPestoque, IdPlproduto),
    CONSTRAINT fk_produtoEstoque_estoque FOREIGN KEY (IdPestoque) REFERENCES estoque(IdEstoque),
    CONSTRAINT fk_produtoEstoque_produto FOREIGN KEY (IdPlproduto) REFERENCES produto(IdProduto)
);

SHOW TABLES;
