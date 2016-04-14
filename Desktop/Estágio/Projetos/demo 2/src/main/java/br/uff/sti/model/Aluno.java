/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 *
 * @author uff
 */



@Entity 
public class Aluno implements Serializable {
    
   
    @Id
    private String matricula;
    
    private String nome;
    
 
    @JoinColumn (name = "codigo")
    @ManyToOne
    private Curso curso;  
    
    public Aluno( String matricula, String nome, Curso codigoCurso) {
        this.matricula = matricula;
        this.nome = nome;
        this.curso = codigoCurso; 
    }

    public Aluno() {
    
    }
    

    public String getNome()
    {
        return nome;
    }
    
    public void setNome(String nome) 
    {
        this.nome = nome;
    }
    
    public String getMatricula()
    {
        return matricula;
    }
    
    public void setMatricula(String matricula)
    {
        this.matricula = matricula;
    }
    
    public Curso getcurso()
    {
        return curso;
    }

    public void setCurso(Curso curso) 
    {
        this.curso = curso;
    }
    

    

}
