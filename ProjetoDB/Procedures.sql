--INSERT FUNCIONARIO
 
DELIMITER //
 
CREATE PROCEDURE inserirFuncionario(
    IN nome_p VARCHAR(150),
    IN cpf_p VARCHAR(14),
    IN cargo_p VARCHAR(100),
    IN email_p VARCHAR(150),
    IN telefone_p VARCHAR(20),
    IN id_setor_p INT
)
BEGIN
 
    INSERT INTO funcionario(
        nome,
        cpf,
        cargo,
        email,
        telefone,
        id_setor
    )
    VALUES(
        nome_p,
        cpf_p,
        cargo_p,
        email_p,
        telefone_p,
        id_setor_p
    );
 
END//
 
DELIMITER ;

--INSERT NOTEBOOK
 
DELIMITER //
 
CREATE PROCEDURE inserirNotebook(
    IN patrimonio_p VARCHAR(50),
    IN marca_p VARCHAR(50),
    IN modelo_p VARCHAR(100),
    IN numero_serie_p VARCHAR(100),
    IN processador_p VARCHAR(100),
    IN memoria_p VARCHAR(20),
    IN armazenamento_p VARCHAR(20),
    IN data_p DATE,
    IN status_p VARCHAR(20),
    IN id_funcionario_p INT
)
BEGIN
 
    INSERT INTO notebook(
        patrimonio,
        marca,
        modelo,
        numero_serie,
        processador,
        memoria_ram,
        armazenamento,
        data_aquisicao,
        status,
        id_funcionario
    )
    VALUES(
        patrimonio_p,
        marca_p,
        modelo_p,
        numero_serie_p,
        processador_p,
        memoria_p,
        armazenamento_p,
        data_p,
        status_p,
        id_funcionario_p
    );
 
END//
 
DELIMITER ;

--Consultar notebook por patrimonio
 
DELIMITER //
 
CREATE PROCEDURE buscarNotebook(
    IN patrimonio_p VARCHAR(50)
)
BEGIN
 
    SELECT *
    FROM notebook
    WHERE patrimonio = patrimonio_p;
 
END//
 
DELIMITER ;

--Contar notebooks
DELIMITER //
 
CREATE PROCEDURE quantidadeNotebooks(
    OUT quantidade INT
)
BEGIN
 
    SELECT COUNT(*)
    INTO quantidade
    FROM notebook;
 
END//
 
DELIMITER ;

--Quantidade de funcionario
DELIMITER //
 
CREATE PROCEDURE quantidadeFuncionarios(

    OUT quantidade INT

)

BEGIN
 
    SELECT COUNT(*)

    INTO quantidade

    FROM funcionario;
 
END//
 
DELIMITER ;
 
--Buscar Funcionario 
DELIMITER //
 
CREATE PROCEDURE buscarFuncionario(

    IN id_funcionario_p INT

)

BEGIN
 
    SELECT *

    FROM funcionario

    WHERE id_funcionario = id_funcionario_p;
 
END//
 
DELIMITER ;
 
 --Categoria do notebook
 
DELIMITER //
 
CREATE PROCEDURE categoriaNotebook(
    IN id_notebook_p INT,
    OUT categoria VARCHAR(30)
)
BEGIN
 
    DECLARE valor_status VARCHAR(20);
 
    SELECT status
    INTO valor_status
    FROM notebook
    WHERE id_notebook = id_notebook_p;
 
    CASE valor_status
 
        CASE valor_status
    WHEN 'disponivel' THEN
        SET categoria = 'Pronto para uso';

    WHEN 'indisponivel' THEN
        SET categoria = 'Equipamento indisponivel';

END CASE;
 
    END CASE;
 
END//
 
DELIMITER ;
