-- Criação do Banco de Dados para o cenário da oficina mecânica
CREATE DATABASE oficina;
USE oficina;

-- Criar Tabela Ordem de Serviço
CREATE TABLE ordemServico (
	IdOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
	Numero INT NOT NULL,
    DataEmissao DATE NOT NULL,
    Valor VARCHAR(45) NOT NULL,
    StatusOS VARCHAR(45) NOT NULL,
    DataConclusao DATE NOT NULL       
);

-- Criar Tabela Cliente
CREATE TABLE cliente (
	IdCliente INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(45) NOT NULL,
    CPF INT NOT NULL,
    Conserto BOOLEAN NOT NULL,
    Revisao BOOLEAN NOT NULL,
    DataEmissao DATE NOT NULL,
    DataConclusao DATE NOT NULL,
    Autoriza BOOLEAN NOT NULL
);

-- Criar Tabela Equipe
CREATE TABLE equipe (
	IdEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Avaliado BOOLEAN NOT NULL,
    Executado BOOLEAN NOT NULL
);

-- Criar Tabela Mecânico
CREATE TABLE mecanico (
	IdMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Codigo INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
    Endereço VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45) NOT NULL
);

-- Criar Tabela Veiculo
CREATE TABLE veiculo (
	IdVeiculo INT AUTO_INCREMENT PRIMARY KEY,    
	Placa VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Ano INT NOT NULL,
    Cor VARCHAR(45) NOT NULL,
    Conserto BOOLEAN NOT NULL,
    Revisao BOOLEAN NOT NULL
);

-- Criar Tabela Peça
CREATE TABLE peca (
	IdPeca INT AUTO_INCREMENT PRIMARY KEY,    
	Nome VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Ano INT NOT NULL
);

-- Criar Tabela Serviço
CREATE TABLE servico (
	IdServico INT AUTO_INCREMENT PRIMARY KEY,    
	TipoServico VARCHAR(45) NOT NULL,
    ValorServico VARCHAR(45) NOT NULL
);

-- Criar Tabela Cliente da Ordem de Serviço
CREATE TABLE clienteOS (
	IdCCliente INT,    
	IdCOrdemServico INT
);

-- Criar Tabela Equipe Responsável pela Ordem de Serviço
CREATE TABLE equipeOS (
	IdEEquipe INT,    
	IdEOrdemServico INT
);

-- Criar Tabela Mecânicos da Equipe
CREATE TABLE mecanicoEquipe (
	IdMMecanico INT,    
	IdMEquipe INT
);

-- Criar Tabela Equipe Responsável pelo Serviço
CREATE TABLE equipeServico (
	IdEREequipe INT,    
	IdEServico INT
);

-- Criar Tabela Veiculos do Cliente
CREATE TABLE veiculosCliente (
	IdVVeiculo INT,    
	IdVCliente INT,
    NumeroVeiculos INT NOT NULL
);

-- Criar Tabela Veiculo do Serviço
CREATE TABLE veiculoServico (
	IdVSVeiculo INT,    
	IdVSServico INT
);

-- Criar Tabela Peças do Serviço
CREATE TABLE pecasServico (
	IdPPecas INT,    
	IdPServico INT
);

-- Criar Tabela Peças Presentes na Ordem de Serviço
CREATE TABLE pecasOS (
	IdPOSPecas INT,    
	IdPOSServico INT
);

-- Criar Tabela Serviços da Ordem de Serviço
CREATE TABLE servicosOS (
	IdSServicos INT,    
	IdSOrdemServico INT
);

SHOW TABLES;