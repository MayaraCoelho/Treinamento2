/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.model.Curso;
import br.uff.sti.dao.CursoDAO;
import br.uff.sti.model.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author uff
 */
@Service 
public class CursoService {
    
    @Autowired 
    CursoDAO cursoDAO;  
    
    @Autowired
    LogService logService; 
   
    @Transactional 
    public Curso salvaObjeto(Curso curso)
    {
        try
        {
            cursoDAO.save(curso);
            logService.salva("Salvar curso", Log.SUCESSO);
            return curso; 
        }
        catch (Exception ex)
        {
           logService.salva("Salvar curso", Log.FALHA);
           return null; 
        }
    }
    
    // este método salva com os parâmetros, o acima só o objeto.
    public Curso salva(String codigo, String nome)
    {
        Curso curso = new Curso(codigo, nome); 
        cursoDAO.save(curso);
        if (curso == null)
        {
           logService.salva("Salvar curso", Log.FALHA);
        }
        else 
        {
            logService.salva("Salvar curso", Log.SUCESSO);
        }
        return curso; 
    }
    
    @Transactional 
    public Curso busca(String codigo)
    {
        Curso curso = cursoDAO.findOne(codigo); 
        return curso; 
    }
    
    
}
