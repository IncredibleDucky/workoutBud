//
//  Workout.swift
//  WorkoutBuddy
//
//  Created by Mattthew Bailey on 11/11/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

import Foundation
import UIKit

class Workout : NSObject {
    
    var exercises : [Exercise]?
    
    init(exercises : [Exercise]) {
        self.exercises = exercises
    }
}

class Exercise : NSObject {
    
    var title:String?
    var intervalPerRep:Int?
    var intervalPerRest:Int?
    var intervalToGetReady:Int?
    
    init(title: String, intervalPerRep:Int, intervalPerRest:Int, intervalToGetReady:Int) {
        
        self.title = title
        self.intervalPerRep = intervalPerRep
        self.intervalPerRest = intervalPerRest
        self.intervalToGetReady = intervalToGetReady
    }
    
}