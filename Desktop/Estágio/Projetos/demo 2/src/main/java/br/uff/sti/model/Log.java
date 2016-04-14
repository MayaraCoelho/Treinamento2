/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 *
 * @author uff
 */
@Entity 
public class Log implements Serializable  {

    @Transient
    public static final String SUCESSO= "Sucesso"; 
    @Transient 
    public static final String FALHA = "Falha";
    @Transient 
    public static final String INFO = "Info";
    
    @Id 
    @GeneratedValue 
    private long id;
    
    // pegar a data 
    // @temporal pra passar do java banco de dados
    @Temporal(TemporalType.DATE)
    private java.util.Date data; 
    
    private String operacao; 
    private String valor;

    
    public Log() 
    {
        
    }

    public Log(Date data, String oprecacao, String valor) 
    {
        this.id = id;
        this.data = data;
        this.operacao = operacao;
        this.valor = valor;
    }
    
    
    public String getOprecacao() 
    {
        return operacao;
    }

    public void setOprecacao(String oprecacao) 
    {
        this.operacao = operacao;
    }
    
    public String getValor() 
    {
        return valor;
    }

    public void setValor(String valor) 
    {
        this.valor = valor;
    }
    
    public Date getData() 
    {
        return data;
    }

    public void setData(Date data)
    {
        this.data = data;
    }

    public long getId()
    {
        return id;
    }
    
    public void setId(long id) 
    {
        this.id = id;
    }
    
    
    
    // tentar implementar com ENUM 
        
//    public enum MessagerLog {
//        SUCESSO,FALHA, INFO; 
//    }
    
    
}
