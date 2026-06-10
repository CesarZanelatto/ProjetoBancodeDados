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