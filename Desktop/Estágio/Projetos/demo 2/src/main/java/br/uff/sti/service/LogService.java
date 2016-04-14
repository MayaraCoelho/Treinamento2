/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.service;

import br.uff.sti.dao.LogDAO;
import br.uff.sti.model.Log;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author uff
 */
@Service 
public class LogService {
    
    @Autowired 
    LogDAO logDAO; 
    
    @Transactional 
    public Log salvaObjeto(Log log)
    {
        log = logDAO.save(log); 
        return log;
    }
    
    @Transactional 
    public Log salva(String operacao, String valor)
    {
        Date data = new Date(System.currentTimeMillis()); 
        Log log = new Log(data, operacao, valor); 
        log = logDAO.save(log); 
        return log;
    }
    
    @Transactional 
    public Log busca(Long id)
    {
        Log log = logDAO.findOne(id);
        return log; 
    }
    
    @Transactional 
    public List<Log> buscaOperacao(String operacao)
    {
       List<Log> logs = logDAO.findByOperacao(operacao);
       return logs; 
    }
    
}
