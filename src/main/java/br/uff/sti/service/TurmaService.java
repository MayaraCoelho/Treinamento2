/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.dao.LogDAO;
import br.uff.sti.model.Turma;
import org.springframework.beans.factory.annotation.Autowired;
import br.uff.sti.dao.TurmaDAO;
import br.uff.sti.model.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author uff
 */

@Service
public class TurmaService { 
 
    @Autowired 
    TurmaDAO turmaDAO; 
    
    @Autowired 
    LogService logService;
    
    @Transactional 
    public Turma salvaObjeto(Turma turma)
    {
        try
        {
            turmaDAO.save(turma); 
            logService.salva("Salvar turma", Log.SUCESSO);
            return turma;
        }
        catch (Exception ex)
        {
            logService.salva("Salvar turma", Log.FALHA);
            return null; 
        }
    }
    
    public Turma salva(String codigo, String professor)
    {
        Turma turma = new Turma(codigo, professor); 
        turmaDAO.save(turma); 
        return turma;
       
    }
    
    @Transactional 
    public Turma busca(String codigo)
    {
        Turma turma = (turmaDAO.findOne(codigo)); 
        return turma; 
    }
    
    
    
    

 
 
    
}
