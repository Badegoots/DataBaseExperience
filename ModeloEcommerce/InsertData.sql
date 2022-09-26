-- inserção de dados
USE ecommerce;

-- idCliente, Nome, Identificação, Endereço
INSERT INTO cliente (Nome, Identificacao, Endereco)
	VALUES ('Lucas', 'Pessoa Fisica', 'Rua Pimentel Souza, 32, Centro - Floradas'),
		   ('Bob', 'Pessoa Juridica', 'Rua Abimael Queiroz, 55, Centro - Canas'),
           ('Maria', 'Pessoa Fisica', 'Rua Simas Petrorian, Centro - Ruinas'),
           ('Roberta', 'Pessoa Juridica', 'Rua Jair Reis, 502, Centro - Berts'),
           ('Juliana', 'Pessoa Fisica', 'Rua Souza Souza, 132, Centro - Floresta');
           
-- IdPessoaFisica, nome, CPF
INSERT INTO pessoaFisica (Nome, CPF)
	VALUES ('Lucas', '22589712679'),
		   ('Maria', '24589612358'),
           ('Juliana', '45236879541');
           
-- IdPessoaFisica, nome, CNPJ
INSERT INTO pessoaJuridica (RazaoSocial, CNPJ)
	VALUES ('Bob Ferragens', '22589712679'),
		   ('Roberta Flores', '24589612359');
           
-- IdProduto, Categoria, Descrição, Valor
INSERT INTO produto (Categoria, Descricao, Valor)
	VALUES ('Eletronico', 'bluetooth Raiz', '500'),
		   ('Eletronico', 'Controle Video game', '300'),
           ('Brinquedos', 'Forno Elétrico', '700'),
           ('Alimentos', 'Sofa', '400'),
           ('Roupas', 'Cama', '200');
           
           
SELECT * FROM cliente;
SELECT * FROM produto;


-- 	IdPedido, IdPedidoCliente, IdPedidoEntrega, IdPedidoPagamento, StatusPedido, Descrição, Valor
INSERT INTO pedido (IdPedidoCliente, StatusPedido, Descricao, Valor)
	VALUES ('1', DEFAULT , 'Pedido por aplicativo', '500'),
		   ('2', 'Cancelado', 'Pedido por aplicativo', '300'),
           ('3', 'Cancelado', 'Pedido por aplicativo', '700'),
           ('4', 'Confirmado', 'Pedido por aplicativo', '400'),
           ('5', 'Em Processamento', 'Pedido por aplicativo', '200');
           
-- 	IdPedido, IdPpedido, IdPeproduto, Quantidade
INSERT INTO produtoPedido (IdPpedido, IdPeproduto, Quantidade)
	VALUES ('1','1', '2'),
		   ('2', '1', '1'),
           ('3', '2', '1');
           
-- endereço, quantidade
INSERT INTO estoque (endereco, quantidade)
	VALUES ('Sao Paulo', 1000),
		   ('Sao Paulo', 2000),
           ('Sao Paulo', 1000),
		   ('Sao Paulo', 8000),
           ('Sao Paulo', 1000),
		   ('Sao Paulo', 7000);
           
-- IdPestoque, IdPlproduto, Quantidade
INSERT INTO produtoEstoque (IdPestoque, IdPlproduto, Quantidade)
	VALUES ('1', '2', '10'),
		   ('2', '3', '50');
           
-- IdFornecedor, Razao Social, CNPJ
INSERT INTO fornecedor (RazaoSocial, CNPJ)
	VALUES ('Cruz e Souza', '22589712679'),
		   ('Grande Azul', '24589612359');
           
SELECT * FROM fornecedor;

-- IdPfornecedor, IdPOproduto
INSERT INTO produtoFornecedor (IdPfornecedor, IdPOproduto)
	VALUES ('1', '1'),
		   ('1', '2'),
           ('2', '4');
           
-- IdTerceiroVendedor, RazaoSocial, CNPJ, Endereco
INSERT INTO terceiro (RazaoSocial, CNPJ, Endereco)
	VALUES ('Tech and Tech', '17458964587456', 'RJ'),
		   ('Roxy e sed', '54867896541254', 'SP'),
           ('Road e Trail', '54698723654154', 'MG');
           
SELECT * FROM terceiro;

-- IdPvendedor, IdPproduto, Quantidade
INSERT INTO produtoVendedor (IdPvendedor, IdPproduto, Quantidade)
	VALUES (1, 3, 80),
		   (2, 4, 100);
           
SELECT * FROM produtoVendedor;
           
           

