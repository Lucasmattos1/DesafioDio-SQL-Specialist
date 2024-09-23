INSERT INTO Cliente (CódigoCliente, Nome, Telefone, Endereço, CPF_CNPJ)
VALUES
  (1, 'João da Silva', '(11) 98765-4321', 'Rua dos Bobos, nº 0', '123.456.789-00'),
  (2, 'Maria Pereira', '(21) 91234-5678', 'Avenida das Flores, nº 123', '987.654.321-23'),
  (3, 'Pedro Santos', '(31) 89012-3456', 'Rua das Palmeiras, nº 456', '111.222.333-44'),
  (4, 'Ana Souza', '(19) 78901-2345', 'Avenida dos Pássaros, nº 789', '222.333.444-55'),
  (5, 'Carlos Oliveira', '(41) 67890-1234', 'Rua dos Lagos, nº 1011', '333.444.555-66');
  
  INSERT INTO Veiculo (Placa, Modelo, Ano, Cliente_ID)
VALUES
    ('AAA-1234', 'Gol', 2015, 1),
    ('BBB-5678', 'Corolla', 2020, 2),
    ('CCC-9012', 'Onix', 2018, 1),
    ('DDD-3456', 'Civic', 2022, 3),
    ('EEE-7890', 'HB20', 2019, 2);
    
    INSERT INTO Servico (Descrição, Valor, MãoDeObra)
VALUES
    ('Troca de óleo', 150.00, 50.00),
    ('Alinhamento e balanceamento', 200.00, 80.00),
    ('Troca de pastilhas de freio', 180.00, 70.00),
    ('Revisão completa', 500.00, 200.00),
    ('Troca de bateria', 120.00, 40.00);
    
    INSERT INTO Equipe (Nome)
VALUES
    ('Equipe de Mecânica'),
    ('Equipe Administrativa'),
    ('Gerência'),
    ('Equipe de Suporte'),
    ('Equipe de Vendas');
    
    INSERT INTO OrdemDeServico (DataEmissão, DataPrevistaConclusão, ValorTotal, StatusServico, Veículo_ID, Equipe_ID)
VALUES
    ('2023-11-20', '2023-11-22', 300.00, 'Concluída', 1, 1),
    ('2023-12-05', '2023-12-10', 250.00, 'Em Andamento', 2, 2),
    ('2023-12-10', '2023-12-15', 400.00, 'Concluída', 3, 1),
    ('2024-01-02', '2024-01-15', 550.00, 'Autorizada', 4, 3),
    ('2024-01-10', '2024-01-12', 180.00, 'Cancelada', 5, 2);
    
    
    INSERT INTO Peca (Descrição, ValorUnitario, Fornecedor)
VALUES
    ('Filtro de óleo', 25.00, 'ABC Auto Peças'),
    ('Óleo sintético 5W30', 80.00, 'XYZ Lubrificantes'),
    ('Pastilhas de freio', 120.00, 'ABC Auto Peças'),
    ('Bateria 12V', 200.00, 'XYZ Lubrificantes'),
    ('Pneu 195/65 R15', 250.00, 'PneuMax');
    
    INSERT INTO OrdemDeServico_Peca (NúmeroOS, CódigoPeça, Quantidade)
VALUES
    (1, 1, 2),
    (1, 5, 1),
    (2, 4, 3),
    (3, 2, 1),
    (4, 5, 2),
    (4, 1, 1),
    (5, 3, 2);
    
    INSERT INTO OrdemDeServico_Servico (NúmeroOS, CódigoServiço, Quantidade)
VALUES
    (1, 2, 1),  -- Ordem de serviço 1, serviço 101, 1 unidade
    (1, 3, 2),  -- Ordem de serviço 1, serviço 102, 2 unidades
    (2, 1, 1),  -- Ordem de serviço 2, serviço 103, 1 unidade
    (3, 5, 1),  -- Ordem de serviço 3, serviço 101, 1 unidade
    (4, 4, 2);  -- Ordem de serviço 4, serviço 104, 2 unidades
    
    
    
    