//
//  CustomTableViewCell.swift
//  practice3
//
//  Created by Cristian Salomon Olmedo on 29/03/18.
//  Copyright © 2018 Cristian Salomon Olmedo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parent1: UILabel!
    @IBOutlet weak var parent2: UILabel!
    @IBOutlet weak var childOneCross1: UILabel!
    @IBOutlet weak var childOneCross2: UILabel!
    @IBOutlet weak var twoPointCross1: UILabel!
    @IBOutlet weak var familyNumber: UILabel!
    @IBOutlet weak var twoPointCross2: UILabel!
    @IBOutlet weak var cellView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
