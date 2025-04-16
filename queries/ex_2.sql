[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lSELECT t.titulo, p.nome AS professor_orientador, a.nome AS aluno

FROM tccs t
JOIN tccs_alunos ta ON t.id_tcc = ta.id_tcc
JOIN alunos a ON ta.id_aluno = a.id_aluno
JOIN professores p ON t.id_professor_orientador = p.id_professor;

