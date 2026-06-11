USE ProjetoDB;

-- View 1- Funcionarios com responsavel e setor
CREATE VIEW view_notebooks_detalhado AS
SELECT 
	nb.ID_NOTEBOOK,
	nb.PATRIMONIO,
	nb.MARCA,
	nb.MODELO,
	nb.STATUS,
	nb.DATA_AQUISICAO,
	f.NOME AS FUNCIONARIO,
	f.CARGO,
	s.nome_setor AS setor
FROM NOTEBOOK nb
LEFT JOIN FUNCIONARIO f ON nb.ID_FUNCIONARIO=f.ID_FUNCIONARIO
LEFT JOIN SETOR s ON f.id_setor=s.id_setor;

-- VIEW 2- Notebooks Disponiveis
CREATE VIEW view_notebooks_disponiveis AS
SELECT 
	ID_NOTEBOOK, PATRIMONIO, MARCA, MODELO,
	PROCESSADOR, MEMORIA_RAM, ARMAZENAMENTO
FROM NOTEBOOK
WHERE STATUS = 'Disponivel' OR ID_FUNCIONARIO IS NULL;
 
-- View 3- Relatório por setor (quantidade de notebooks)
CREATE VIEW vw_notebooks_por_setor AS
SELECT
	s.nome_setor,
	COUNT(nb.ID_NOTEBOOK) AS TOTAL_NOTEBOOKS,
	SUM(nb.STATUS = 'disponivel') AS DISPONIVEIS,
	SUM(nb.STATUS = 'indisponivel') AS INDISPONIVEL
FROM setor s
LEFT JOIN FUNCIONARIO f ON s.id_setor = f.ID_SETOR
LEFT JOIN NOTEBOOK nb ON f.ID_FUNCIONARIO = nb.ID_FUNCIONARIO
GROUP BY s.ID_SETOR, s.NOME_SETOR;
