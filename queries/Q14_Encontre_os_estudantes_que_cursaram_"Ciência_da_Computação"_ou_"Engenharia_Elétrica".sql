SELECT DISTINCT a.nome
FROM alunos a
JOIN cursos_alunos ca ON a.id_aluno = ca.id_aluno
JOIN cursos c ON ca.id_curso = c.id_curso
WHERE c.nome IN ('Ciência da Computação', 'Engenharia Elétrica');
