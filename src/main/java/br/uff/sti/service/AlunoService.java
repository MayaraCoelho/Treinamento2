/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.model.Aluno;
import br.uff.sti.dao.AlunoDAO;
import br.uff.sti.model.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author uff
 */
@Service 
public class AlunoService {
    
    @Autowired 
    AlunoDAO alunoDAO; 
    
    @Autowired 
    CursoService cursoService;
    
    @Autowired 
    LogService logService; 
    
   

    @Transactional 
    public Aluno salvaObjeto(Aluno aluno)
    {
        try
        {
            alunoDAO.save(aluno); 
            logService.salva("Salvar aluno", Log.SUCESSO);
            return aluno; 
        } 
        catch (Exception ex)
        {
           logService.salva("Salvar aluno",Log.FALHA); 
        }
        
        return null; 
    }
    
    
    public Aluno salva(String matricula, String nome, String codigoCurso)
    {
        Aluno aluno = new Aluno(matricula, nome, cursoService.busca(codigoCurso));
        alunoDAO.save(aluno); 
        if(aluno == null)
        {
            logService.salva("Salvar aluno",Log.FALHA);
        }
        else
        {
            logService.salva("Salvar aluno", Log.SUCESSO);
        }
        return aluno;
    }
    
    // usar o request param
    @Transactional 
    public Aluno busca(String matricula)
    {
        Aluno aluno = alunoDAO.findOne(matricula);
        return aluno; 
    }
   
    
}
