import postgres
import psycopg2
from dotenv import load_dotenv
import os
from faker import Faker
from random import randint, choice, sample, uniform

faker = Faker()

# Listas de valores realistas
departamentos = ['Ciências Exatas', 'Ciências Humanas',  'Letras e Linguística', 'Engenharia', 'Saúde', 'Artes']
cursos = {
    "Ciências Exatas": [
        "Matemática", "Física"
    ],
    "Ciências Humanas": [
        "História", "Filosofia"
    ],
    "Letras e Linguística": [
        "Letras", "Linguística"
    ],
    "Engenharia": [
        "Engenharia Civil", "Engenharia Elétrica"
    ],
    "Saúde": [
        "Odontologia", "Nutrição"
    ],
    "Artes":[
       "Artes Visuais", "Arquitetura"
    ]
}
disciplinas = {
    "Matemática": [
        "Cálculo Diferencial e Integral I", 
        "Álgebra Linear", 
        "Geometria Analítica", 
    ],
    "Física": [
        "Cálculo Diferencial e Integral", 
        "Mecânica Clássica", 
        "Termodinâmica", 
    ],
    "História": [
        "História Antiga", 
        "História Medieval", 
        "História Moderna", 
    ],
    "Filosofia": [
        "Introdução à Filosofia", 
        "Ética", 
        "Filosofia Política", 
    ],
    "Letras": [
        "Linguística Geral", 
        "Literatura Brasileira", 
        "Literatura Portuguesa", 
    ],
    "Linguística": [
        "Fonética e Fonologia", 
        "Morfologia", 
        "Sintaxe", 
    ],
    "Engenharia Civil": [
        "Mecânica dos Sólidos", 
        "Estruturas de Concreto", 
        "Estruturas Metálicas", 
    ],
    "Engenharia Elétrica": [
        "Circuitos Elétricos", 
        "Máquinas Elétricas", 
        "Eletrônica", 
    ],
    "Odontologia": [
        "Anatomia Oral", 
        "Farmacologia", 
        "Patologia Oral", 
    ],
    "Nutrição": [
        "Anatomia e Fisiologia", 
        "Bioquímica Nutricional", 
        "Fisiologia da Nutrição", 
    ],
    "Artes Visuais": [
        "Desenho Artístico", 
        "História da Arte", 
        "Pintura", 
    ],
    "Arquitetura": [
        "Desenho Arquitetônico", 
        "Teoria da Arquitetura", 
        "Construção Civil", 
    ],
}

professores = []
array_cursos = []
alunos = []
array_disciplinas = []
tccs = []

def encontrar_chave(dicionario, valor_busca):
    for chave, lista in dicionario.items():
        if valor_busca in lista:
            return chave
    return None

def insertProfessores():
    for depto, cursos_list in cursos.items():
        cursor.execute(f"SELECT id_departamento FROM departamentos WHERE nome = '{depto}';")
        depto_id = cursor.fetchone()[0]
        for curso in cursos_list:
            for disciplina in disciplinas[curso]:
                nome = faker.unique.name()  # Gerando o nome do professor
                # Associando o professor ao departamento correto
                professores.append([nome, depto, disciplina])

                # Inserindo no banco de dados
                cursor.execute(f"INSERT INTO professores (nome, departamento_id) VALUES ('{nome}', '{depto_id}');")
                print(f"Professor {nome} inserido no departamento {depto}.")
    for depto in departamentos:
        chefe = None
        for professor, departamento, disciplina in professores:
            if departamento == depto:
                cursor.execute(f"SELECT id_professor FROM professores WHERE nome = '{professor}' LIMIT 1;")
                chefe = cursor.fetchone()[0]
        cursor.execute(f"UPDATE departamentos SET chefe = '{chefe}' WHERE nome = '{depto}';")
        print(f"Chefe do departamento {depto} atualizado para o professor {chefe}.")

def insertDepartamentos():
    for departamento in departamentos:
        cursor.execute(f"insert into departamentos (nome) values ('{departamento}');")

def insertCursos():
    # Gerando cursos e atribuindo coordenadores
    for departamento, cursos_list in cursos.items():
        for curso in cursos_list:
            # Encontrar o coordenador para o curso (professor que leciona o curso)
            array_cursos.append(curso)
            coordenador = None
            professor = choice(professores)
            # Verificar se o professor leciona a disciplina do curso e se o departamento é o mesmo
            while professor[2] not in disciplinas[curso]:
                professor = choice(professores)
            coordenador = professor

            cursor.execute(f"SELECT id_departamento FROM departamentos WHERE nome = '{departamento}';")
            depto_id = cursor.fetchone()[0]

            cursor.execute(f"SELECT id_professor FROM professores WHERE nome = '{coordenador[0]}';")
            coordenador_id = cursor.fetchone()[0]

            # Inserir no banco de dados
            if coordenador:
                cursor.execute(f"INSERT INTO cursos (nome, departamento_id, coordenador) VALUES ('{curso}', '{depto_id}', '{coordenador_id}');")
                print(f"Curso {curso} inserido no departamento {departamento} com coordenador {coordenador[0]}.")

def insertAlunos():
    # Gerando alunos
    for _ in range(randint(36, 45)):
        nome = faker.unique.name()
        matricula = faker.unique.bothify(text="##-###-###-#")
        data = faker.date()
        alunos.append([nome])
        cursor.execute(f"insert into alunos (nome, matricula, data_nascimento) values ('{nome}', '{matricula}', '{data}');")
        print(f"Aluno {nome} inserido com matrícula {matricula}.")
    # Curso de cada aluno
    for aluno in alunos:
        cursos_list = choice(list(cursos.items()))
        curso = choice(cursos_list[1])
        alunos[alunos.index(aluno)].append(curso)
        cursor.execute(f"SELECT id_curso FROM cursos WHERE nome = '{curso}';")
        id_curso = cursor.fetchone()[0]
        cursor.execute(f"SELECT id_aluno FROM alunos WHERE nome = '{aluno[0]}';")
        id_aluno = cursor.fetchone()[0]
        cursor.execute(f"INSERT into cursos_alunos (id_aluno, id_curso) values ('{id_aluno}', '{id_curso}');")
        print(f"Aluno {aluno[0]} inserido no curso {curso}.")

def insertDisciplinas():
    # Gerando disciplinas
    for curso, disciplina_list in disciplinas.items():
        for disciplina in disciplina_list:
            codigo = faker.unique.bothify(text='####')
            cursor.execute(f"SELECT id_curso FROM cursos WHERE nome = '{curso}';")
            curso_id = cursor.fetchone()[0]
            nome = disciplina
            array_disciplinas.append(disciplina)
            cursor.execute(f"insert into disciplinas (nome, codigo, id_curso) values ('{nome}', '{codigo}', '{curso_id}');")
            print(f"Disciplina {nome} inserida no curso {curso}.")

def insertHistorico():
    # Gerando histórico escolar
    for aluno in alunos:
        disciplinas_curso = disciplinas[aluno[1]]
        num_disciplinas = randint(1, len(disciplinas_curso))
        rand_disciplinas = sample(disciplinas_curso, num_disciplinas)
        for disciplina in rand_disciplinas:
            cursor.execute(f"SELECT id_aluno FROM alunos WHERE nome = '{aluno[0]}';")
            id_aluno = cursor.fetchone()[0]
            cursor.execute(f"SELECT id_disciplina FROM disciplinas WHERE nome = '{disciplina}';")
            id_disciplina = cursor.fetchone()[0]
            semestre = randint(1, 2)
            ano = randint(2015, 2025)
            nota = round(uniform(0, 10), 1)
            cursor.execute(
                f"insert into historico_escolar (id_aluno, id_disciplina, ano, semestre, nota) values ('{id_aluno}', '{id_disciplina}', '{ano}', '{semestre}', '{nota}');")
            print(f"Histórico escolar do aluno {aluno[0]} atualizado com a disciplina {disciplina}.")
            if nota < 5.0:
                if ano == 2025 and semestre == 2:
                    continue
                if semestre == 2:
                    ano += 1
                    semestre = 1
                else:
                    semestre = 2
                nota = round(uniform(5, 10), 1)
                cursor.execute(
                    f"insert into historico_escolar (id_aluno, id_disciplina, ano, semestre, nota) values ('{id_aluno}', '{id_disciplina}', '{ano}', '{semestre}', '{nota}');")
                
            print(f"Histórico escolar do aluno {aluno[0]} atualizado com a disciplina {disciplina}.")

def insertDisciplinasProfessores():        
    # Gerando ensina
    for professor in professores:
        cursor.execute(f"SELECT id_professor FROM professores WHERE nome = '{professor[0]}';")
        id_professor = cursor.fetchone()[0]
        cursor.execute(f"SELECT id_disciplina FROM disciplinas WHERE nome = '{professor[2]}';")
        id_disciplina = cursor.fetchone()[0]
        semestre = randint(1, 2)
        ano = randint(2015, 2025)
        cursor.execute(f"insert into disciplinas_professores values ('{id_disciplina}', '{id_professor}', '{ano}', '{semestre}');")
        print(f"Professor {professor[0]} leciona a disciplina {professor[2]} no ano {ano} e semestre {semestre}.")

def insertTccs():
    # Gerando TCCs
    for _ in alunos:
        rand = randint(1,4)
        if rand == 1:
            titulo = faker.text(max_nb_chars=25)
            tccs.append(titulo)
            professor = choice(professores)
            cursor.execute(f"SELECT id_professor FROM professores WHERE nome = '{professor[0]}';")
            id_professor = cursor.fetchone()[0]
            data = faker.date()
            cursor.execute(f"insert into tccs (titulo, id_professor_orientador, data_apresentacao) values ('{titulo}', '{id_professor}', '{data}');")
            print(f"TCC {titulo} inserido com o professor {professor[0]}.")

def insertTccsAlunos():
    # Gerando TCCs-Alunos
    for i in range(len(tccs)):
        id_tcc = i + 1
        for _ in range(randint(1,3)):
            aluno = choice(alunos)
            cursor.execute(f"SELECT id_aluno FROM alunos WHERE nome = '{aluno[0]}';")
            id_aluno = cursor.fetchone()[0]
            cursor.execute(f"insert into tccs_alunos values ('{id_tcc}', '{id_aluno}');")
            print(f"Aluno {aluno[0]} inserido no TCC {tccs[i]}.")

load_dotenv("environment.env")
USER = os.getenv("user")
PASSWORD = os.getenv("password")
HOST = os.getenv("host")
PORT = os.getenv("port")
DBNAME = os.getenv("dbname")

try:
    connection = psycopg2.connect(
        user=USER,
        password=PASSWORD,
        host=HOST,
        port=PORT,
        dbname=DBNAME
    )

    # Create a cursor to execute SQL queries
    cursor = connection.cursor()

    cursor.execute("TRUNCATE TABLE departamentos RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE cursos RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE alunos RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE cursos_alunos RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE professores RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE disciplinas RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE historico_escolar RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE disciplinas_professores RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE tccs RESTART IDENTITY CASCADE;")
    cursor.execute("TRUNCATE TABLE tccs_alunos RESTART IDENTITY CASCADE;")

    # Insert data into the database
    insertDepartamentos()
    insertProfessores()
    insertCursos()
    insertDisciplinas()
    insertAlunos()
    insertHistorico()
    insertDisciplinasProfessores()
    insertTccs()
    insertTccsAlunos()
    connection.commit()

    # Close the cursor and connection
    cursor.close()
    connection.close()
    print("Connection closed.")

except Exception as e:
    print(f"Failed to connect: {e}")
