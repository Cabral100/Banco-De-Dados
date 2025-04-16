SELECT DISTINCT a.nome
FROM alunos a
JOIN historico_escolar h ON a.id_aluno = h.id_aluno
JOIN disciplinas d ON h.id_disciplina = d.id_disciplina
WHERE d.nome = 'Termodinâmica'
AND a.id_aluno NOT IN (
    SELECT h2.id_aluno
    FROM historico_escolar h2
    JOIN disciplinas d2 ON h2.id_disciplina = d2.id_disciplina
    WHERE d2.nome = 'Morfologia'
);
