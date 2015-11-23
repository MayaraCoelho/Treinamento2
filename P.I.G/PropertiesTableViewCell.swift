//
//  PropertiesTableViewCell.swift
//  P.I.G
//
//  Created by Maria Carolina Santos on 05/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class PropertiesTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var propertyAmount: UILabel!
    
    
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
