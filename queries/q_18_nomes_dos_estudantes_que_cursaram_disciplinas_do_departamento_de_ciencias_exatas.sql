SELECT DISTINCT a.nome
FROM alunos a
JOIN historico_escolar h ON a.id_aluno = h.id_aluno
JOIN disciplinas d ON h.id_disciplina = d.id_disciplina
JOIN cursos c ON d.id_curso = c.id_curso
JOIN departamentos dept ON c.departamento_id = dept.id_departamento
WHERE dept.nome = 'Ciências Exatas';
