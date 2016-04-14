/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.model.Aluno;
import br.uff.sti.model.Curso;
import br.uff.sti.service.AlunoService;
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
public class AlunoController {
    
 
 @Autowired 
 AlunoService alunoService; 
 CursoService cursoService; 
 
   
 @RequestMapping(value = "/buscaAluno", method = RequestMethod.GET)  
 public Aluno buscaAluno(@RequestParam(value = "matricula") String matricula, 
         @RequestParam(required = false, value = "nome") String nome, 
         @RequestParam(required = false, value = "curso") String curso)
 {  
    Aluno aluno = alunoService.busca(matricula);
    return aluno; 

 }
 
 @RequestMapping(value = "/salvaAluno", method = RequestMethod.GET)  
 public Aluno salvaAluno(@RequestParam(value = "matricula") String matricula, 
         @RequestParam(value = "nome") String nome, 
         @RequestParam(value = "curso")String curso)
 {
     return alunoService.salva(matricula, nome, curso);
 }
 
 @RequestMapping(value = "/criaAluno", method = RequestMethod.POST)
 public Aluno novoAluno(@RequestParam(value = "matricula") String matricula, 
         @RequestParam(value = "nome") String nome, 
         @RequestParam(value = "curso")String curso)
 {
     return alunoService.salva(matricula, nome, curso); 
 }
   
 
}
