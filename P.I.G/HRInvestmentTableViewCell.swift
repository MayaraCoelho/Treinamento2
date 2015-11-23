//
//  InvestmentTableViewCell.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 13/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class HRInvestmentTableViewCell: UITableViewCell {

    @IBOutlet weak var enterpriseName: UILabel!
    
    @IBOutlet weak var enterpriseImage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundImageView.image = UIImage(named: "barImage.png")
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
