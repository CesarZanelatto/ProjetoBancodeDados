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