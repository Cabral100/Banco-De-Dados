SELECT d.codigo, d.nome AS disciplina, c.nome AS curso
FROM disciplinas d
JOIN cursos c ON d.id_curso = c.id_curso
WHERE c.id_curso = 2;
