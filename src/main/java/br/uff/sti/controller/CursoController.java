/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.model.Curso;
import br.uff.sti.service.CursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author uff
 */

@RestController  
public class CursoController {
    
    @Autowired
    CursoService cursoService; 
    
    @RequestMapping(value = "/salvaCurso", method = RequestMethod.GET)
    public Curso salvaCurso(@RequestParam(value = "codigo") String codigo, 
            @RequestParam(value = "nome") String nome)
    {
        return cursoService.salva(codigo, nome);
    }
    
    @RequestMapping(value = "/buscaCurso", method = RequestMethod.GET)
    public Curso buscaCurso(@RequestParam(value = "codigo") String codigo)
    {
        return cursoService.busca(codigo); 
    }
    
    
    
    
}
