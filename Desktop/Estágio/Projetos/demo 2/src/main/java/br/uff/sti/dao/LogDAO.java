/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.dao;

import br.uff.sti.model.Log;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author uff
 */
public interface LogDAO extends CrudRepository < Log, Long>{
    
    @Query("SELECT lg From Log lg WHERE lg.operacao= ?1")
    public List<Log> findByOperacao(String operacao);  
    
//      @Query("SELECT lg From Log lg WHERE lg.operacao=?1")
}
