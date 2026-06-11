ALTER TABLE funcionario MODIFY email VARBINARY(250);

ALTER TABLE funcionario MODIFY cpf VARBINARY(250);

ALTER TABLE notebook MODIFY patrimonio VARBINARY(250);
 
INSERT INTO funcionario
VALUES (DEFAULT, 'Kleber', AES_ENCRYPT('12345678901','1234'), 'Analista Financeiro', AES_ENCRYPT('kleber@email.com','1234'), '11999999999', 1);

SELECT nome, CAST(AES_DECRYPT(cpf,'1234') AS CHAR) AS cpf, CAST(AES_DECRYPT(email,'1234') AS CHAR) AS email, cargo FROM funcionario;

CREATE user 'cesar'@'%'IDENTIFIED BY '1234'; -- nome e senha
 
GRANT ALL PRIVILEGES ON ProjetoDB.* TO 'cesar'@'%'; --dar todos os privilegios pro cesar
 
SELECT user, host FROM mysql.user; -- so pra ver o usuário criado
