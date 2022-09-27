-- inserção de dados
USE oficina;

-- IdOrdemServico, Numero, DataEmissao, Valor, StatusOS, DataConclusao
INSERT INTO ordemServico (Numero, DataEmissao, Valor, StatusOS, DataConclusao)
	VALUES ('1', '2013/08/25', '5000', 'Confirmada', '2013/08/27'),
		   ('2', '2013/08/25', '5000', 'Confirmada', '2013/08/27'),
           ('3', '2013/08/25', '5000', 'Confirmada', '2013/08/27'),
           ('4', '2013/08/25', '5000', 'Confirmada', '2013/08/27'),
           ('5', '2013/08/25', '5000', 'Confirmada', '2013/08/27');
           
SELECT * FROM ordemServico;
           
-- IdCliente, Nome, CPF, Conserto, Revisao, DataEmissao, DataConclusao, Autoriza
INSERT INTO cliente (Nome, CPF, Conserto, Revisao, DataEmissao, DataConclusao, Autoriza)
	VALUES ('Lucas', '4589654', True, False, '2022/05/19', '2022/05/23', True),
		   ('Bob', '7845965', True, False, '2022/05/19', '2022/05/23', True),
           ('Jaque', '8956321', True, False, '2022/05/19', '2022/05/23', True),
           ('Lurci', '9863259', True, False, '2022/05/19', '2022/05/23', True),
           ('Cleide', '2135469', True, False, '2022/05/19', '2022/05/23', True);
           
-- IdEquipe, Avaliado, Executado
INSERT INTO equipe (Avaliado, Executado)
	VALUES (True, True),
		   (True, True),
           (True, False),
           (True, True),
           (True, False);
           
-- IdMecanico, Codigo, Nome, Endereço, Especialidade
INSERT INTO mecanico (Codigo, Nome, Endereço, Especialidade)
	VALUES ('1', 'Jose', 'Rua Cupuava, 55', 'Carborador'),
		   ('2', 'Marcos', 'Rua Guevara, 455', 'Eletrica'),
           ('3', 'Renata', 'Rua Girassol, 56', 'Injecao'),
           ('4', 'Jorge', 'Rua Marte, 111', 'Radiador'),
           ('5', 'Maria', 'Rua Cinco, 5', 'Balanceamento');
           
-- IdVeiculo, Placa, Modelo, Ano, Cor, Conserto, Revisao
INSERT INTO veiculo (Placa, Modelo, Ano, Cor, Conserto, Revisao)
	VALUES ('PLE5HG', 'civic', 2019, 'Preto', True, False), 
		   ('PER7HG', 'marea', 2000, 'Cinza', False, True), 
           ('LKF8TH', 'uno', 2015, 'Branco', False, True), 
           ('LOT8JH', 'pajero', 2010, 'Preto', True, False), 
           ('MNB5NM', 'monza', 1997, 'Verde', True, False);
           
-- IdPeca, Nome, Modelo, Ano
INSERT INTO peca (Nome, Modelo, Ano)
	VALUES ('Escapamento', 'Monza', '1998'),
		   ('Roda', 'Civic', '2010'),
           ('Cambio', 'Corolla', '2020'),
           ('Para-choque', 'Belina', '1995'),
           ('Bateria', 'Universal', '2022');
           
-- IdServico, TipoServico, ValorServico
INSERT INTO servico (TipoServico, ValorServico)
	VALUES ('revisao', 200),
		   ('revisao', 200),
           ('Conserto', 500),
           ('revisao', 200),
           ('Conserto', 600);