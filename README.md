# Projeto 1 - Banco de Dados para uma Universidade

## Integrantes do grupo
- **Guilherme Moraes Escudeiro** - RA: 24.123.005-1
- **Gustavo Mendes Franco Lapin Atui** – RA: 24.123.072-1
- **Lucas Tonoli Cabral Duarte** - RA: 24.123.032-5


## Descrição do Projeto

Este projeto tem como objetivo o desenvolvimento de um sistema de banco de dados para uma universidade. O banco de dados deve permitir o armazenamento e gerenciamento eficiente de informações como:

- Alunos
- Professores
- Departamentos
- Cursos
- Disciplinas
- Históricos escolares de alunos
- Histórico de disciplinas lecionadas por professores
- Trabalhos de Conclusão de Curso (TCCs)

A proposta inclui também a execução de diversas queries em SQL para validar o funcionamento e a integridade dos dados.

## Introdução

A proposta deste trabalho é simular um ambiente real de banco de dados acadêmico, aplicando conceitos de modelagem conceitual, lógica e física, com foco na normalização e na realização de consultas complexas utilizando SQL.

## Metodologia

O desenvolvimento do projeto foi dividido nas seguintes etapas:

1. **Modelagem Conceitual** – construção do Modelo Entidade-Relacionamento (MER);
2. **Modelagem Lógica** – conversão para o Modelo Relacional em 3FN;
3. **Implementação** – criação das tabelas utilizando DDL em SQL;
4. **Geração de Dados** – criação de um script em Python para gerar dados fictícios utilizando a biblioteca Faker
5. **Validação de Dados** – execução de código para verificação da integridade e consistência dos dados;
6. **Consultas (queries)** – elaboração de consultas SQL com base nos requisitos e exercícios de álgebra relacional.

## Experimentos (Queries SQL)

### Queries obrigatórias (5):

1. **Histórico escolar de aluno com reprovação e aprovação posterior**  
   Mostra todas as tentativas de um aluno em uma disciplina, incluindo reprovação e posterior aprovação.

2. **TCCs orientados por um professor**  
   Exibe todos os projetos de TCC orientados por um professor, com os nomes dos alunos envolvidos.

3. **Matriz curricular de dois cursos com disciplinas em comum**  
   Duas queries foram feitas, uma para cada curso (ex: Ciência da Computação e Ciência de Dados), listando todas as disciplinas e permitindo comparar as que são compartilhadas.

4. **Disciplinas cursadas por aluno com nomes dos professores**  
   Exibe os nomes e códigos das disciplinas cursadas por um aluno junto com os professores responsáveis.

5. **Chefes de departamento e coordenadores de curso (com tratamento de dados vazios)**  
   Lista o nome dos professores, nome do departamento que chefiam e curso que coordenam. Quando não existe departamento ou curso, o campo é preenchido com "nenhum".

### Outras 10 queries implementadas:

- Q01: Encontre os nomes de todos os estudantes.
- Q02: Liste os IDs e nomes de todos os professores.
- Q07: Encontre os nomes de todos os estudantes que cursaram "Etica".
- Q08: Liste os IDs dos professores que ensinam mais de um curso.
- Q10: Recupere os nomes e IDs dos estudantes que são orientados por um professor específico (ID = '12').
- Q14: Encontre os estudantes que cursaram "Ciência da Computação" ou "Engenharia Elétrica".
- Q15: Encontre os estudantes que cursaram "Termodinâmica" mas não "Morfologia".
- Q18: Recupere os nomes dos estudantes que cursaram disciplinas do departamento de "Ciências Exatas"
- Q22: Encontre os estudantes que estão matriculados em cursos oferecidos pelo departamento de "Engenharia".
- Q41: Recupere os nomes dos estudantes que são orientados por um professor que ensina "História Medieval".

## Como Executar o Projeto

1. Banco de Dados Supabase:
O banco de dados foi criado com todas as tabelas necessárias, conforme o script ddl.sql.

2. Conexão com o Banco de Dados:
O projeto usa Python para se conectar ao banco de dados do Supabase. As credenciais de conexão (usuário, senha, host, porta e nome do banco de dados).

3. Geração de Dados Fictícios:
O script Python, utilizando a biblioteca Faker, gera dados fictícios para popular o banco de dados com informações como alunos, professores, cursos, disciplinas e outros dados relacionados à universidade.

4. Execução das Queries:
As consultas SQL estão organizadas em diferentes arquivos de SQL Editor. Elas podem ser executadas diretamente no banco de dados do Supabase para testar os requisitos do sistema. As queries resolvem problemas como histórico escolar, TCCs, matrizes curriculares e muito mais.

5. Validação de Dados:
Após a execução das queries, você pode validar os dados para garantir que o banco de dados está funcionando corretamente e as consultas retornam os resultados esperados.

## Modelos

### Modelo Entidade-Relacionamento (MER)

### Modelo Relacional na 3FN
