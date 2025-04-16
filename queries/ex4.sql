SELECT 
    d.codigo AS codigo_disciplina,
    d.nome AS nome_disciplina,
    p.nome AS nome_professor
FROM 
    historico_escolar he
JOIN 
    disciplinas d ON he.id_disciplina = d.id_disciplina
JOIN 
    disciplinas_professores dp ON d.id_disciplina = dp.id_disciplina
JOIN 
    professores p ON dp.id_professor = p.id_professor
WHERE 
    he.id_aluno = '2';
