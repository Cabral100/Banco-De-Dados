SELECT DISTINCT a.nome
FROM alunos a
JOIN cursos_alunos ca ON a.id_aluno = ca.id_aluno
JOIN cursos c ON ca.id_curso = c.id_curso
JOIN departamentos d ON c.departamento_id = d.id_departamento
WHERE d.nome = 'Engenharia';
