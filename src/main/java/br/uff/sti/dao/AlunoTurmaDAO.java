/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.dao;

import br.uff.sti.model.AlunoTurma;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author uff
 */
@Service
public interface AlunoTurmaDAO extends CrudRepository<AlunoTurma, String > {
    
    @Query("SELECT atu FROM AlunoTurma atu "
            + " INNER JOIN FETCH atu.aluno al "
            + " INNER JOIN FETCH atu.turma t "
            + " WHERE t.codigo = ?1")
    public List<AlunoTurma> findByCodigoDaTurmaComAluno(String codigo);
    
        @Query("SELECT atu FROM AlunoTurma atu "
            + " INNER JOIN FETCH atu.aluno al "
            + " INNER JOIN FETCH atu.turma t "
            + " WHERE al.matricula = ?1")
    public List<AlunoTurma> findByMatriculaAluno(String matricula); 


    
}
