//
//  EnterpriseProperties.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation


class EnterpriseProperties{

    var enterprises:[Enterprise]
    

    init(){
        self.enterprises = [Enterprise]()
        
        let ent1desc = "Fundada em 1931, na Arábia Saudita, é a maior empresa de petróleo do mundo responsável pela venda de cerca de 400 barris de petróleo para os Estados Unidos"
        let ent1 = Enterprise(pId: 1, pName: "Everest Oil", pValue: 180000000000, pDescription: ent1desc, pImageName: "everestOil.png")
        self.enterprises.append(ent1)
        
        let ent2desc = "Fundada em 1980 pelo estudante, Frank Roy, atua criando sistemas poderosos que mudaram o cotidiano da sociedade."
        let ent2 = Enterprise(pId: 2, pName: "Bug Software Inc", pValue: 70000000000, pDescription: ent2desc, pImageName: "bugSoftwareInc.png")
        self.enterprises.append(ent2)
        
        let ent3desc = "Coorporação brasileira fundada pela junção das duas maiores empresas do ramo alimentício."
        let ent3 = Enterprise(pId: 3, pName: "Bacompany House", pValue: 32000000000, pDescription: ent3desc, pImageName: "bacompany.png")
        self.enterprises.append(ent3)
        
        let ent4desc = " A estilista francesa, Amélie DeLage, criou sua pequena loja de roupas que expandiu e hoje se tornou um ícone fashion mundial."
        let ent4 = Enterprise(pId: 4, pName: "Mr Always Young", pValue: 270000000, pDescription: ent4desc, pImageName: "mrAlwaysYoung.jpg")
        self.enterprises.append(ent4)

        
    
    }



}