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