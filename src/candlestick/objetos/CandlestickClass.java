/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candlestick.objetos;

import java.util.Calendar;

/**
 *
 * @author uff
 */
public final class CandlestickClass {
    
    private final double abertura;
    private final double fechamento;
    private final double minimo;
    private final double maximo; 
    private final double volume; 
    private final Calendar data; 

    public CandlestickClass(double abertura, double fechamento, double minimo, 
            double maximo, double volume, Calendar data) 
    {
        this.abertura = abertura; //preço da primeira negociação do dia
        this.fechamento = fechamento; // preço da última negociação do dia
        this.minimo = minimo; // preço da negociação mais barata do dia
        this.maximo = maximo; //preço da negociação mais cara do dia
        this.volume = volume; // quantidade de dinheiro que passou em todas 
                              //as negociações nesse dia
        this.data = data; // a qual dia o resumo se refere
    }

    public double getAbertura() {
        return abertura;
    }

    public double getFechamento() {
        return fechamento;
    }

    public double getMinimo() {
        return minimo;
    }

    public double getMaximo() {
        return maximo;
    }

    public double getVolume() {
        return volume;
    }

    public Calendar getData() {
        return data;
    }
    
    public boolean isALta()
    {
        return this.abertura < this.fechamento;
    }
    
    public boolean isBaixa()
    {
        return this.abertura > this.fechamento;
    }
    
    
}
