/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import org.slf4j.LoggerFactory;

/**
 *
 * @author uff
 */

@Entity 
public class Turma implements Serializable {
    
    @Id
    private String codigo;
    
    private String professor; 

    public Turma(String codigo, String professor) 
    {
        this.codigo = codigo;
        this.professor = professor;
    }
    
    public Turma()
    {

    }
    
    public String getCodigo() 
    {
        return codigo;
    }
    
    public void setCodigo(String codigo) 
    {
        this.codigo = codigo;
    }

    public String getProfessor()
    {
        return professor;
    }

    public void setProfessor(String professor) 
    {
        this.professor = professor;
    }
  
   
}
