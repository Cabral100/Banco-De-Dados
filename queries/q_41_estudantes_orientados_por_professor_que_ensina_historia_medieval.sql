SELECT DISTINCT a.nome
FROM alunos a
JOIN tccs_alunos ta ON a.id_aluno = ta.id_aluno
JOIN tccs t ON ta.id_tcc = t.id_tcc
WHERE t.id_professor_orientador IN (
    SELECT dp.id_professor
    FROM disciplinas_professores dp
    JOIN disciplinas d ON dp.id_disciplina = d.id_disciplina
    WHERE d.nome = 'História Medieval'
);
