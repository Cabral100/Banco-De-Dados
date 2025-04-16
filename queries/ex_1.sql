[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lSELECT h1.id_aluno, h1.id_disciplina, h1.ano, h1.semestre, h1.nota AS nota_reprovacao,
       h2.ano AS ano_aprovacao, h2.semestre AS semestre_aprovacao, h2.nota AS nota_aprovacao

FROM historico_escolar h1
JOIN historico_escolar h2 
  ON h1.id_aluno = h2.id_aluno 
  AND h1.id_disciplina = h2.id_disciplina
  AND (h2.ano > h1.ano OR (h2.ano = h1.ano AND h2.semestre > h1.semestre))

WHERE h1.nota < 6.0 AND h2.nota >= 6.0;

