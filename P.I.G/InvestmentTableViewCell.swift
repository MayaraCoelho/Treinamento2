//
//  InvestmentTableViewCell.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 13/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class InvestmentTableViewCell: UITableViewCell {

    @IBOutlet weak var enterpriseName: UILabel!
    
    @IBOutlet weak var enterpriseImage: UIImageView!
    
    @IBOutlet weak var subtitleLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
