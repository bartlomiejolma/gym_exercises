//
//  Exercise.swift
//  GymTracker
//
//  Created by Bartlomiej Olma on 25/09/2017.
//  Copyright © 2017 Bartlomiej Olma. All rights reserved.
//

import UIKit

class Exercise {
    
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var weight: Double
    var lastTrained: Date
    var step: Double
    
    
    //MARK: Initialization
    
    init(name: String, photo: UIImage?, weight: Double, lastTrained: Date, step: Double) {
        
        self.name = name
        self.photo = photo
        self.weight = weight
        self.lastTrained = lastTrained
        self.step = step
        
    }

}
