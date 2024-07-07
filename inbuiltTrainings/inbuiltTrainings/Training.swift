//
//  Training.swift
//  inbuiltTrainings
//
//  Created by Наиль on 07.07.2024.
//

import Foundation
import UIKit

class Training{
    var name: String
    var description: String
    var trainingImageName: String
    
    init(name: String, description: String, trainingImageName: String) {
        self.name = name
        self.description = description
        self.trainingImageName = trainingImageName
    }
}
