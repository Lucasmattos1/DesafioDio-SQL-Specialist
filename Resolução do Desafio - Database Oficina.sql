-- Listar todos os clientes e seus veículos:
SELECT Cliente.Nome, Veiculo.Modelo FROM Cliente INNER JOIN Veiculo ON Cliente.CódigoCliente = Veiculo.Cliente_ID;

-- Filtros com WHERE

-- Listar todas as ordens de serviço de um cliente específico (por exemplo, ID 1):
SELECT * FROM OrdemDeServico WHERE Cliente_ID = 1;

-- Listar todas as peças com valor unitário acima de 100 reais:
SELECT * FROM Peca WHERE ValorUnitario > 100;

-- Expressões para Atributos Derivados
--  Calcular o valor total de uma ordem de serviço:
SELECT 
    o.NúmeroOS, 
    SUM(p.ValorUnitario * op.Quantidade) AS ValorTotal
FROM OrdemDeServico o
INNER JOIN OrdemDeServico_Peca op ON o.NúmeroOS = op.NúmeroOS
INNER JOIN Peca p ON op.CódigoPeça = p.CódigoPeça
GROUP BY o.NúmeroOS;

-- Listar os serviços mais realizados:
SELECT 
    s.Descrição, 
    COUNT(*) AS Quantidade
FROM Servico s
INNER JOIN OrdemDeServico_Servico oss ON s.CódigoServiço = oss.CódigoServiço
GROUP BY s.Descrição
ORDER BY Quantidade DESC;

-- Ordenações com ORDER BY
--  Listar os clientes em ordem alfabética pelo nome:

SELECT * FROM Cliente ORDER BY Nome ASC;

-- Listar as ordens de serviço por data de criação (descendente):
SELECT * FROM OrdemDeServico ORDER BY DataEmissão DESC;

-- Condições de Filtros aos Grupos – HAVING
-- Listar os clientes que realizaram mais ordens de serviço:
SELECT 
    c.Nome, 
    COUNT(*) AS TotalOrdens
FROM Cliente c
INNER JOIN OrdemDeServico o ON c.CódigoCliente = o.Cliente_ID
GROUP BY c.Nome
HAVING COUNT(*) > 0;

--  Junções entre Tabelas
-- Listar o nome do cliente, o modelo do veículo e as peças utilizadas em cada ordem de serviço:
SELECT 
    c.Nome, 
    v.Modelo, 
    p.Descrição
FROM OrdemDeServico o
INNER JOIN Cliente c ON o.Cliente_ID = c.CódigoCliente
INNER JOIN Veiculo v ON o.Veículo_ID = v.CódigoVeículo
INNER JOIN OrdemDeServico_Peca op ON o.NúmeroOS = op.NúmeroOS
INNER JOIN Peca p ON op.CódigoPeça = p.CódigoPeça;
