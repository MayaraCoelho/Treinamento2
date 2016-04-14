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
public class Curso implements Serializable {
    
    
    @Id 
    private String codigo; 
    private String nome; 
    
    public Curso (String codigo, String nome)
    {
        this.codigo = codigo;
        this.nome = nome; 
    }
    
    public Curso ()
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
    
    public String getNome()
    {
        return nome; 
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }
    
    
    
    
    
}
