SELECT t.titulo, p.nome AS professor_orientador, a.nome AS aluno

FROM tccs t
JOIN tccs_alunos ta ON t.id_tcc = ta.id_tcc
JOIN alunos a ON ta.id_aluno = a.id_aluno
JOIN professores p ON t.id_professor_orientador = p.id_professor;
