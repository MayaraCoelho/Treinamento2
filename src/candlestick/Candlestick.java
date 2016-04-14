/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candlestick;

import java.util.Calendar;

/**
 *
 * @author uff
 */
public class Candlestick {

    /**
     * @param args the command line arguments
     */
        
        
    public static void main(String[] args) {
        
        Calendar c = Calendar.getInstance();
        System.out.println("Dia do mês: " + c.get(Calendar.DAY_OF_MONTH));
        System.out.println("Dia da semana: " + c.get(Calendar.DAY_OF_WEEK));
        
    }
    
}
