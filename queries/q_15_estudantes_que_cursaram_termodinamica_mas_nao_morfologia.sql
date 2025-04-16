[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lSELECT DISTINCT a.nome
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

