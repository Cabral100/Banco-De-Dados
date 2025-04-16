SELECT a.id_aluno, a.nome
FROM alunos a
JOIN tccs_alunos ta ON a.id_aluno = ta.id_aluno
JOIN tccs t ON ta.id_tcc = t.id_tcc
WHERE t.id_professor_orientador = '12';
