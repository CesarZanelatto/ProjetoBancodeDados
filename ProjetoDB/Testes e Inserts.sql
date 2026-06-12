-- População Inicial e Testes do Banco de Dados

-- 1. Inserção de Setores

INSERT INTO setor (nome_setor, descricao)
VALUES
('RH', 'Recursos Humanos'),
('Financeiro', 'Controle financeiro'),
('Comercial', 'Vendas e relacionamento'),
('TI', 'Tecnologia da Informacao'),
('Marketing', 'Marketing e publicidade'),
('Operacoes', 'Operacoes da empresa');




-- 2. Inserção de Funcionários

INSERT INTO funcionario
VALUES
(DEFAULT, 'Carlos Silva', AES_ENCRYPT('11111111111','1234'),
'Analista RH', AES_ENCRYPT('carlos@empresa.com','1234'),
'11999990001', 1),

(DEFAULT, 'Maria Souza', AES_ENCRYPT('22222222222','1234'),
'Gerente Financeiro', AES_ENCRYPT('maria@empresa.com','1234'),
'11999990002', 2),

(DEFAULT, 'João Pereira', AES_ENCRYPT('33333333333','1234'),
'Vendedor', AES_ENCRYPT('joao@empresa.com','1234'),
'11999990003', 3),

(DEFAULT, 'Ana Costa', AES_ENCRYPT('44444444444','1234'),
'Desenvolvedora', AES_ENCRYPT('ana@empresa.com','1234'),
'11999990004', 4),

(DEFAULT, 'Lucas Santos', AES_ENCRYPT('55555555555','1234'),
'Analista de Marketing', AES_ENCRYPT('lucas@empresa.com','1234'),
'11999990005', 5),

(DEFAULT, 'Fernanda Lima', AES_ENCRYPT('66666666666','1234'),
'Supervisor Operacional', AES_ENCRYPT('fernanda@empresa.com','1234'),
'11999990006', 6);


-- 3. Consulta de Funcionários com Dados Descriptografados


SELECT
    id_funcionario,
    nome,
    CAST(AES_DECRYPT(cpf,'1234') AS CHAR) AS cpf,
    cargo,
    CAST(AES_DECRYPT(email,'1234') AS CHAR) AS email,
    telefone
FROM funcionario;

-- 4. Inserção de Notebooks

INSERT INTO notebook
VALUES
(DEFAULT,
 AES_ENCRYPT('PAT001','1234'),
 'Dell',
 'Latitude 5440',
 'SR001',
 'Intel i5',
 '16GB',
 '512GB SSD',
 '2024-01-15',
 'disponivel',
 NULL),

(DEFAULT,
 AES_ENCRYPT('PAT002','1234'),
 'Lenovo',
 'ThinkPad E14',
 'SR002',
 'Intel i7',
 '16GB',
 '1TB SSD',
 '2024-02-20',
 'disponivel',
 NULL),

(DEFAULT,
 AES_ENCRYPT('PAT003','1234'),
 'HP',
 'ProBook 450',
 'SR003',
 'Intel i5',
 '8GB',
 '256GB SSD',
 '2023-10-10',
 'disponivel',
 NULL),

(DEFAULT,
 AES_ENCRYPT('PAT004','1234'),
 'Acer',
 'Aspire 5',
 'SR004',
 'Ryzen 5',
 '16GB',
 '512GB SSD',
 '2024-03-05',
 'disponivel',
 NULL),

(DEFAULT,
 AES_ENCRYPT('PAT005','1234'),
 'Samsung',
 'Book',
 'SR005',
 'Intel i3',
 '8GB',
 '256GB SSD',
 '2023-12-01',
 'disponivel',
 NULL);

-- Testes das Procedures

-- Teste da Procedure atribuirNotebook

CALL atribuirNotebook(1,1);
CALL atribuirNotebook(2,2);
CALL atribuirNotebook(3,4);


-- Verificação:

SELECT
    id_notebook,
    CAST(AES_DECRYPT(patrimonio,'1234') AS CHAR) AS patrimonio,
    status,
    id_funcionario
FROM notebook;


-- Teste da Procedure devolverNotebook

CALL devolverNotebook(2);

-- Verificação:

SELECT
    id_notebook,
    status,
    id_funcionario
FROM notebook
WHERE id_notebook = 2;

-- Teste da Procedure buscarFuncionario

CALL buscarFuncionario(1);


-- Teste da Procedure buscarNotebook

CALL buscarNotebook('PAT001');

-- Teste da Procedure quantidadeFuncionarios

CALL quantidadeFuncionarios(@qtd);
SELECT @qtd;

-- Teste da Procedure quantidadeNotebooks

CALL quantidadeNotebooks(@qtd);
SELECT @qtd;

-- Teste da Procedure categoriaNotebook


CALL categoriaNotebook(1,@categoria);
SELECT @categoria;

-- Testes das Views

-- View de Detalhamento dos Notebooks

SELECT * FROM view_notebooks_detalhado;




-- View de Notebooks Disponíveis

SELECT * FROM view_notebooks_disponiveis;


-- View de Relatório por Setor

SELECT * FROM vw_notebooks_por_setor;