# Projeto 1 - Banco de Dados para uma Universidade

## Integrantes do grupo
- **Guilherme Morais Escudeiro** - RA: 24.123.005-1
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
   Exibe todos os projetos de TCC orientados por um professor, com os nomes dos alunos que fizeram o projeto.

3. **Matriz curricular de dois cursos com disciplinas em comum**  
   Duas queries foram feitas, uma para cada curso (ex: Ciência da Computação e Ciência de Dados), listando todas as disciplinas e permitindo comparar as que são compartilhadas.

4. **Disciplinas cursadas por aluno com nomes dos professores**  
   Exibe os nomes e códigos das disciplinas cursadas por um aluno junto com os professores responsáveis.

5. **Chefes de departamento e coordenadores de curso**  
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

Primeiramente, utilize o arquivo ddl.sql para gerar as tabelas, após isso, utilize o código bd_codigo.py para gerar os dados de seu database, para isso, preencha o arquivo .env com suas váriaveis de acesso. Depois sinta-se a vontade para utilizar as outras queries disponíveis.

## Modelos

### [MER-2025-04-16-143449](https://github.com/user-attachments/assets/eb3649ae-0b4f-497b-b0e9-374ae3c7f783)


### Modelo Relacional na 3FN
