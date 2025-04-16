SELECT DISTINCT a.nome
FROM alunos a
JOIN historico_escolar h ON a.id_aluno = h.id_aluno
JOIN disciplinas d ON h.id_disciplina = d.id_disciplina
WHERE d.nome = 'Ética';
