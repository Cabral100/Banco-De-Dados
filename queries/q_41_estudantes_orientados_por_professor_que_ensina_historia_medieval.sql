[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lSELECT DISTINCT a.nome
FROM alunos a
JOIN tccs_alunos ta ON a.id_aluno = ta.id_aluno
JOIN tccs t ON ta.id_tcc = t.id_tcc
WHERE t.id_professor_orientador IN (
    SELECT dp.id_professor
    FROM disciplinas_professores dp
    JOIN disciplinas d ON dp.id_disciplina = d.id_disciplina
    WHERE d.nome = 'História Medieval'
);

