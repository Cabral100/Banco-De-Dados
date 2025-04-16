[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lDROP TABLE if exists Departamentos cascade;
DROP TABLE if exists Cursos cascade;
DROP TABLE if exists Alunos cascade;
DROP TABLE if exists Cursos_alunos cascade;
DROP TABLE if exists Professores cascade;
DROP TABLE if exists Disciplinas cascade;
DROP TABLE if exists Historico_Escolar cascade;
DROP TABLE if exists Disciplinas_Professores cascade;
DROP TABLE if exists TCCs cascade;
DROP TABLE if exists tccs_alunos cascade;

-- Tabela de Departamentos
CREATE TABLE Departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    chefe INT
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    departamento_id INT,
    coordenador INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento)
);

-- Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    matricula VARCHAR(50) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE Cursos_Alunos (
    id_aluno INT,
    id_curso INT,
    PRIMARY KEY (id_curso, id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) ON DELETE CASCADE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno) ON DELETE CASCADE
);

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento)
);

ALTER TABLE departamentos
ADD CONSTRAINT foreign_key_chefe FOREIGN KEY (chefe)
REFERENCES Professores(id_professor)
ON DELETE CASCADE;

ALTER TABLE cursos
ADD CONSTRAINT foreign_key_coordenador FOREIGN KEY (coordenador)
REFERENCES Professores(id_professor)
ON DELETE CASCADE;

-- Tabela de Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) ON DELETE CASCADE
);

-- Tabela de Histórico Escolar
CREATE TABLE Historico_Escolar (
    id_historico SERIAL PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    ano INT,
    semestre INT,
    nota FLOAT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

-- Tabela de Disciplinas e Professores (Associação entre disciplinas e professores)
CREATE TABLE Disciplinas_Professores (
    id_disciplina INT,
    id_professor INT,
    ano INT,
    semestre INT,
    PRIMARY KEY (id_disciplina, id_professor, ano, semestre),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);

-- Tabela de TCCs
CREATE TABLE TCCs (
    id_tcc SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_professor_orientador INT,
    data_apresentacao DATE,
    FOREIGN KEY (id_professor_orientador) REFERENCES Professores(id_professor)
);

CREATE TABLE TCCs_Alunos (
    id_tcc INT,
    id_aluno INT,
    PRIMARY KEY (id_tcc, id_aluno),
    FOREIGN KEY (id_tcc) REFERENCES TCCs(id_tcc) ON DELETE CASCADE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno) ON DELETE CASCADE
);


