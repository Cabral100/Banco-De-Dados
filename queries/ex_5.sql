SELECT 
    p.nome AS nome_professor,
    COALESCE(d.nome, 'nenhum') AS departamento_que_coordena,
    COALESCE(c.nome, 'nenhum') AS curso_que_coordena
FROM 
    professores p
LEFT JOIN 
    departamentos d ON p.id_professor = d.chefe
LEFT JOIN 
    cursos c ON p.id_professor = c.coordenador;
