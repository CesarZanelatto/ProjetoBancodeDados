-- Atribuir notebook a um funcionário

DELIMITER //

CREATE PROCEDURE atribuirNotebook(
    IN id_notebook_p INT,
    IN id_funcionario_p INT
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE notebook
    SET
        id_funcionario = id_funcionario_p,
        status = 'indisponivel'
    WHERE id_notebook = id_notebook_p;

    COMMIT;

END//

DELIMITER ;

-- Testar
CALL atribuirNotebook(1, 2);


-- Devolver um Notebook

DELIMITER //

CREATE PROCEDURE devolverNotebook(
    IN id_notebook_p INT
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE notebook
    SET
        id_funcionario = NULL,
        status = 'disponivel'
    WHERE id_notebook = id_notebook_p;

    COMMIT;

END//

DELIMITER ;

-- Teste
CALL devolverNotebook(1);