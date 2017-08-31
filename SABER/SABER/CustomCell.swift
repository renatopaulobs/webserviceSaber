//
//  CustomCell.swift
//  SABER
//
//  Created by Paulo  on 8/26/17.
//  Copyright © 2017 Paulo . All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    //Variaveis
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
