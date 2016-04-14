/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.model.Turma;
import br.uff.sti.service.TurmaService;
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
public class TurmaController {
    
    @Autowired 
    TurmaService turmaService; 
    
    @RequestMapping(value = "/salvaTurma", method = RequestMethod.GET)
    public Turma salvaTurma(@RequestParam(value = "codigo") String codigo, 
            @RequestParam(value = "professor") String professor)
    {
        return turmaService.salva(codigo, professor);
    }
    
    @RequestMapping(value = "/buscaTurma", method = RequestMethod.GET)
    public Turma buscaTurma(@RequestParam(value = "codigo") String codigo,
            @RequestParam(required = false, value = "professor" ) String professor)
    {
        return turmaService.busca(codigo);
    }
    
    
}
