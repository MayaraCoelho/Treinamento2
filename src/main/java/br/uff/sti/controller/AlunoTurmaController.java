/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.model.AlunoTurma;
import br.uff.sti.service.AlunoTurmaService;
import java.util.List;
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
public class AlunoTurmaController {
    
    @Autowired 
    AlunoTurmaService alunoTurmaService; 
    
    @RequestMapping(value = "salvaAlunoTurma", method = RequestMethod.GET)
    public AlunoTurma salvaAlunoTurma(@RequestParam(value = "codigoAluno") 
            String codigoAluno, @RequestParam(value = "codigoTurma") 
            String codigoTurma)
    {
        return alunoTurmaService.salva(codigoAluno, codigoTurma);
    }
    
    @RequestMapping(value = "buscaAlunoTurma", method = RequestMethod.GET)
    List<AlunoTurma> buscaAlunoTurma(@RequestParam(value = "codigoAluno") 
            String codigoAluno, @RequestParam(value = "codigoTurma") 
                    String codigoTurma)
    {
        return alunoTurmaService.buscaByAluno(codigoTurma);
    }
    // tratar quando se informa só a turma ou só o aluno
}
