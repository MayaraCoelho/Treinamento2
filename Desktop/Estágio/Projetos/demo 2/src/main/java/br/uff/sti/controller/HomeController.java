/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.dao.AlunoTurmaDAO;
import br.uff.sti.model.Aluno;
import br.uff.sti.model.AlunoTurma;
import br.uff.sti.model.Curso;
import br.uff.sti.dao.AlunoDAO;
import br.uff.sti.dao.CursoDAO;
import br.uff.sti.dao.TurmaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author uff
 */

 // post e put 

@RestController
public class HomeController {

    @Autowired
    AlunoTurmaDAO alunoTurmaDAO;
    
    @Autowired
    TurmaDAO turmaDAO;
    
    @Autowired
    AlunoDAO alunoDAO;
    
    @Autowired
    CursoDAO CursoDAO;

    String home() {
        return "Hello World!";
    }

//    @RequestMapping(name = "/teste", method = RequestMethod.GET)
//    public String test() {
//        return " teste";
//    }

//    @RequestMapping(value = "/aluno", method = RequestMethod.GET)
//    public Aluno aluno(@RequestParam(name = "nome") String nome, @RequestParam String matricula, @RequestParam(required = false) Curso curso) {
//        Aluno aluno = new Aluno(nome, matricula, new Curso("12", "si"));
//        return aluno;
//    }

//    @RequestMapping(value = "/")
//    public AlunoTurma alunoTurma() {
//        AlunoTurma alunoTurma = alunoTurmaDAO.findByCodigoDaTurmaComAluno("2");
//        return alunoTurma;
//    }
// 
    
    
    
    
}
