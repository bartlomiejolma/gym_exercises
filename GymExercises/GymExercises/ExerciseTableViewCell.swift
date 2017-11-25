//
//  ExerciseTableViewCell.swift
//  GymTracker
//
//  Created by Bartlomiej Olma on 25/09/2017.
//  Copyright © 2017 Bartlomiej Olma. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    //MARK Properties
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var photoImage: UIImageView!
//    @IBOutlet weak var lastTrainedValueLabel: UILabel!
//    @IBOutlet weak var weightValueLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var lastTrainedValueLabel: UILabel!
    
    @IBOutlet weak var weightValueLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
