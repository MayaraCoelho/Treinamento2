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
public class AlunoTurma implements Serializable{


    @Id
    @GeneratedValue
    private long id;
    
    @JoinColumn (name = "matricula" )
    @ManyToOne
    private Aluno aluno;
   
    @JoinColumn ( name = "codigo")
    @ManyToOne
    private Turma turma; 

    public AlunoTurma(Aluno codigoAluno, Turma turma) 
    {
        this.aluno = codigoAluno;
        this.turma = turma;
    }

    public AlunoTurma() 
    {
        
    }

    public Aluno getAluno() 
    {
        return aluno;
    }
    
    public void setAluno(Aluno aluno) 
    {
        this.aluno = aluno;
    }
        
    public Turma getTurma() 
    {
        return turma;
    }

    public void setTurma(Turma turma) 
    {
        this.turma = turma;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id) 
    {
        this.id = id;
    }
   
    
}
