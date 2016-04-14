/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.uff.sti.controller;

import br.uff.sti.model.Log;
import br.uff.sti.service.LogService;
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
public class LogController {
    
    @Autowired
    LogService logService; 
    
    @RequestMapping(value = "/buscaLog", method = RequestMethod.GET)
    List<Log> buscaLog( @RequestParam(value = "operacao") 
            String operacao, @RequestParam(value = "valor") String valor)
    {
        return logService.buscaOperacao(operacao); 
    }
  
}
