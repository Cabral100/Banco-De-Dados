[?25l
    Select a project:                                                                             
                                                                                                  
  >  1. nlweecqavpfxgrodjtbn [name: Projeto1, org: dbcobxdraadehuwebukk, region: us-west-1]       
    2. sqjsbawfrwedqattwyxq [name: Banco_de_Dados_1, org: dbcobxdraadehuwebukk, region: us-east-1]
                                                                                                  
                                                                                                  
    ↑/k up • ↓/j down • / filter • q quit • ? more                                                
                                                                                                  [0D[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[2K[1A[0D[2K [0D[2K[?25h[?1002l[?1003l[?1006lSELECT DISTINCT a.nome
FROM alunos a
JOIN historico_escolar h ON a.id_aluno = h.id_aluno
JOIN disciplinas d ON h.id_disciplina = d.id_disciplina
JOIN cursos c ON d.id_curso = c.id_curso
JOIN departamentos dept ON c.departamento_id = dept.id_departamento
WHERE dept.nome = 'Ciências Exatas';

