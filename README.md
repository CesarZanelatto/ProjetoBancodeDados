# Projeto Banco de Dados
Sistema de Controle de Notebooks Corporativos
Integrantes
César de Oliveira Zanelatto
Kleber Amaro da Silva
Rafael Sper Moralli
Descrição do Projeto

O Sistema de Controle de Notebooks Corporativos foi desenvolvido para auxiliar o setor de TI no gerenciamento de notebooks da empresa.

O sistema permite:

Cadastro de funcionários
Cadastro de setores
Cadastro de notebooks
Atribuição de notebooks aos funcionários
Devolução de notebooks
Consulta de equipamentos
Geração de relatórios através de Views
Controle de acesso e segurança dos dados
Objetivo

Centralizar o controle dos notebooks corporativos, permitindo identificar rapidamente:

Qual funcionário está utilizando um notebook
Em qual setor o funcionário trabalha
Quantos equipamentos estão disponíveis

Tecnologias Utilizadas
MySQL
XAMPP
MySQL Workbench
GitHub
Estrutura do Banco de Dados
Entidades Principais

SETOR
Responsável por armazenar os setores da empresa.
Campo	Tipo
id_setor	INT
nome_setor	ENUM
descricao	VARCHAR

FUNCIONARIO
Responsável por armazenar os colaboradores.
Campo	Tipo
id_funcionario	INT
nome	VARCHAR
cpf	VARBINARY
cargo	VARCHAR
email	VARBINARY
telefone	VARCHAR
id_setor	INT

NOTEBOOK
Responsável pelo controle dos equipamentos.
Campo	Tipo
id_notebook	INT
patrimonio	VARBINARY
marca	VARCHAR
modelo	VARCHAR
numero_serie	VARCHAR
processador	VARCHAR
memoria_ram	VARCHAR
armazenamento	VARCHAR
data_aquisicao	DATE
status	ENUM
id_funcionario	INT
HISTORICO_ATRIBUICAO

Regras de Negócio
RN01
Cada funcionário pertence a apenas um setor.

RN02
Um setor pode possuir vários funcionários.

RN03
Um notebook pode ser atribuído a apenas um funcionário por vez.

RN04
Um funcionário pode receber notebooks cadastrados no sistema.

RN05
Todo notebook deve possuir patrimônio único.

RN06
Todo notebook deve possuir número de série único.

RN07
Um notebook pode permanecer sem funcionário responsável quando estiver disponível.

Procedures

Funcionários
inserirFuncionario()
buscarFuncionario()
quantidadeFuncionarios()

Notebooks
inserirNotebook()
buscarNotebook()
quantidadeNotebooks()
categoriaNotebook()

Transações
atribuirNotebook()
devolverNotebook()
Views
view_notebooks_detalhado

Exibe:

Dados do notebook
Funcionário responsável
Cargo
Setor
view_notebooks_disponiveis

Lista equipamentos disponíveis.

vw_notebooks_por_setor

Relatório contendo:

Quantidade total de notebooks
Disponíveis
Indisponíveis
Segurança
Criptografia

Os seguintes dados são armazenados criptografados utilizando AES:

CPF
E-mail
Patrimônio

Exemplo:

AES_ENCRYPT(valor,'1234')

Descriptografia:

AES_DECRYPT(valor,'1234')
Controle de Usuários

Criação de usuário:

CREATE USER 'cesar'@'%' IDENTIFIED BY '1234';

Permissões:

GRANT ALL PRIVILEGES
ON ProjetoDB.*
TO 'cesar'@'%';
Transações

As transações garantem a integridade das operações.

Atribuição de Notebook

Fluxo:

Verifica se o notebook existe
Verifica se está disponível
Verifica se o funcionário existe
Atualiza o notebook
Executa COMMIT

Fluxo:

Remove o responsável
Atualiza status para disponível
Executa COMMIT

Backup e Recuperação

Backup
"C:\xampp\mysql\bin\mysqldump.exe" -u root ProjetoDB > backup.sql

Recuperação
"C:\xampp\mysql\bin\mysql.exe" -u root ProjetoDB < backup.sql

Normalização
Primeira Forma Normal (1FN)
Não existem grupos repetitivos.
Todos os atributos possuem valores atômicos.

Segunda Forma Normal (2FN)
Todos os atributos dependem integralmente da chave primária.

Terceira Forma Normal (3FN)
Não existem dependências transitivas.
Os dados foram separados em entidades próprias.

Diagramas

Diagrama de Caso de Uso

<img width="413" height="548" alt="image" src="https://github.com/user-attachments/assets/602b5420-e4fa-42f0-a579-f312f608d027" />



Descrição:

O Administrador de TI é responsável por:

Gerenciar funcionários
Gerenciar notebooks
Consultar relatórios
Controlar atribuições
Diagrama UML / DER


<img width="571" height="467" alt="image" src="https://github.com/user-attachments/assets/88a32d73-d5b5-42f7-8278-78af26753024" />


Descrição:

Representa:

Entidades
Relacionamentos
Cardinalidades
Chaves primárias
Chaves estrangeiras

O projeto foi desenvolvido com foco em boas práticas de modelagem de banco de dados, normalização, segurança, integridade referencial e controle de ativos corporativos, atendendo aos requisitos propostos para a disciplina de Banco de Dados.
