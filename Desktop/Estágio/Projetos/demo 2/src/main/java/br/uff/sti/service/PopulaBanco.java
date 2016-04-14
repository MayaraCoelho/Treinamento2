/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.model.Curso;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author uff
 */

@Service
public class PopulaBanco {
    
    @Autowired 
    CursoService cursoService; 
    
    @Autowired 
    AlunoService alunoService;
    
    @Autowired 
    TurmaService turmaService;
    
    @Autowired
    AlunoTurmaService alunoTurmaService; 
    
    
    @PostConstruct 
    public void init(){
        
        for (int i = 0; i < 10; i++) 
        {
            cursoService.salvaObjeto(new Curso("" + i,"SI " + i));
        }
        
        for (int i = 0; i < 10; i++) 
        {
            alunoService.salva("" + i, "Nome do aluno " + i ,  ""+i);   
        }
        
        for (int i = 0; i < 10; i++) 
        {
            turmaService.salva("" + i , "Professor " + i);
        }
        
        for (int i = 0; i < 10; i++) 
        {
            alunoTurmaService.salva("" + i, "" + 1);
        }
    }
    
    
    
}
