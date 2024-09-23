CREATE DATABASE Oficina;
use Oficina;
CREATE TABLE Cliente (
    CódigoCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Endereço VARCHAR(255),
    CPF_CNPJ VARCHAR(14),
    DataCadastro DATE
);
CREATE TABLE Veículo (
    CódigoVeículo INT AUTO_INCREMENT PRIMARY KEY,
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10),
    Cliente_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(CódigoCliente)
);
CREATE TABLE OrdemDeServico (
    NúmeroOS INT AUTO_INCREMENT PRIMARY KEY,
    DataEmissão DATE,
    DataPrevistaConclusão DATE,
    ValorTotal DECIMAL(10,2),
    Status ENUM('Em Andamento', 'Concluída', 'Cancelada', 'Autorizada'),
    Veículo_ID INT,
    Equipe_ID INT,
    FOREIGN KEY (Veículo_ID) REFERENCES Veiculo(CódigoVeículo),
    FOREIGN KEY (Equipe_ID) REFERENCES Equipe(CódigoEquipe)
);

ALTER TABLE OrdemDeServico
ADD Cliente_ID INT;

ALTER TABLE OrdemDeServico
ADD CONSTRAINT FK_OrdemDeServico_Cliente
FOREIGN KEY (Cliente_ID) REFERENCES Cliente(CódigoCliente);

select * from OrdemDeServico
UPDATE OrdemDeServico
SET Cliente_ID = 1
WHERE NúmeroOS = 5;

ALTER TABLE OrdemDeServico
RENAME COLUMN Status TO StatusServico;

CREATE TABLE Equipe (
    CódigoEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Servico (
    CódigoServiço INT AUTO_INCREMENT PRIMARY KEY,
    Descrição VARCHAR(255),
    Valor DECIMAL(10,2),
    MãoDeObra DECIMAL(10,2)
);

CREATE TABLE Mecanico (
    CódigoMecânico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereço VARCHAR(255),
    Especialidade VARCHAR(100)
);

CREATE TABLE Peca (
    CódigoPeça INT AUTO_INCREMENT PRIMARY KEY,
    Descrição VARCHAR(255),
    ValorUnitario DECIMAL(10,2),
    Fornecedor VARCHAR(100)
);

CREATE TABLE OrdemDeServico_Servico (
    NúmeroOS INT,
    CódigoServiço INT,
    Quantidade INT,
    PRIMARY KEY (NúmeroOS, CódigoServiço),
    FOREIGN KEY (NúmeroOS) REFERENCES OrdemDeServico(NúmeroOS),
    FOREIGN KEY (CódigoServiço) REFERENCES Servico(CódigoServiço)
);
select * from OrdemDeServico_Peca
CREATE TABLE OrdemDeServico_Peca (
    NúmeroOS INT,
    CódigoPeça INT,
    Quantidade INT,
    PRIMARY KEY (NúmeroOS, CódigoPeça),
    FOREIGN KEY (NúmeroOS) REFERENCES OrdemDeServico(NúmeroOS),
    FOREIGN KEY (CódigoPeça) REFERENCES Peca(CódigoPeça)
);

