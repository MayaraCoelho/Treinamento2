/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.dao.AlunoTurmaDAO;
import br.uff.sti.model.AlunoTurma;
import br.uff.sti.model.Log;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author uff
 */
@Service 
public class AlunoTurmaService {

 @Autowired 
 AlunoTurmaDAO alunoTurmaDAO; 
 
 @Autowired
 AlunoService alunoService; 
 
 @Autowired 
 TurmaService turmaService; 
 
 @Autowired 
 LogService logService; 
 
 
 @Transactional 
 public AlunoTurma salva(String matriculaALuno, String codigoTurma)
 {
    
     try 
     {
         AlunoTurma alunoTurma = new AlunoTurma(alunoService.busca(matriculaALuno),turmaService.busca(codigoTurma));
         alunoTurmaDAO.save(alunoTurma);  
         logService.salva("Salvar aluno turma", Log.SUCESSO);
         return alunoTurma; 
     }
     catch(Exception ex)
     {
         logService.salva("Salvar aluno turma", Log.FALHA);
     }
     return null; 
 }

 public List<AlunoTurma> buscaByAluno(String matricula)
 {
     List<AlunoTurma> alunoTurmaLista = alunoTurmaDAO.findByMatriculaAluno(matricula);
     return alunoTurmaLista; 
    
 }
 
 public List<AlunoTurma> buscaByTurma(String codigo)
 {
     List<AlunoTurma> alunoTurmaLista = alunoTurmaDAO.findByCodigoDaTurmaComAluno(codigo);
     return alunoTurmaLista; 
 }
 
 public List<AlunoTurma> confereLista (List<AlunoTurma> lista)
 {
     return lista; 
 }


    
}
