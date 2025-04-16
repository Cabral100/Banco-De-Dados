SELECT dp.id_professor
FROM disciplinas_professores dp
JOIN disciplinas d ON dp.id_disciplina = d.id_disciplina
GROUP BY dp.id_professor
HAVING COUNT(DISTINCT d.id_curso) > 1;
