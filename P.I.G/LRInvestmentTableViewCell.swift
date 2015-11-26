//
//  LRInvestmentTableViewCell.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 05/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LRInvestmentTableViewCell: UITableViewCell {

    @IBOutlet weak var LowRiskInvestName: UILabel!
    
    @IBOutlet weak var LowRiskInvestValue: UILabel!
    
    @IBOutlet weak var lowRiskInvestImage: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundImageView.image = UIImage(named: "barImage.png")
        self.backgroundColor = UIColor(red:0.98, green:0.93, blue:0.85, alpha:1)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
