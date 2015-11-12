//
//  Timer.swift
//  WorkoutBuddy
//
//  Created by Mattthew Bailey on 11/3/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

import Foundation
import UIKit

let SecondTickNotification = "SecondTickNotification"
let TimerCompleteNotification = "TimerCompleteNotification"

class Timer: NSObject {
    
    static let sharedInstance = Timer()
    
    var minutes:Int = 1
    var seconds:Int = 0
    var isOn:Bool = Bool(false)
    
    
    func startTimer() {
        isOn = true;
        
        let timerLength:NSTimeInterval = Double(minutes) * 60 + Double(seconds)
        let expirationDate:NSDate = NSDate(timeIntervalSinceNow: timerLength)
        
        let timerExpiredNotification:UILocalNotification = UILocalNotification()
        timerExpiredNotification.fireDate = expirationDate
        timerExpiredNotification.timeZone = NSTimeZone .defaultTimeZone()
        timerExpiredNotification.soundName = UILocalNotificationDefaultSoundName
        timerExpiredNotification.alertBody = "Start Next Lift Plz"
        
        UIApplication.sharedApplication().scheduleLocalNotification(timerExpiredNotification)
        
        checkActive()
    }
    
    func checkActive() {
        
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        
        if isOn {
            decreaseSecond()
            self.performSelector("checkActive", withObject: nil, afterDelay: NSTimeInterval(1.0))
        }
    }
    
    func decreaseSecond() {
        
        if seconds > 0 {
            --seconds
            NSNotificationCenter.defaultCenter().postNotificationName(SecondTickNotification, object: nil)
        } else if seconds == 0 && minutes > 0 {
            --minutes
            seconds = 59
            NSNotificationCenter.defaultCenter().postNotificationName(SecondTickNotification, object: nil)
        } else {
            endTimer()
        }
        
    }
    
    func endTimer() {
        isOn = false
        NSNotificationCenter.defaultCenter().postNotificationName(TimerCompleteNotification, object: nil)

    }
    
    func cancelTimer() {
        isOn = false
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    func pauseTimer() {
        isOn = false
    }
    
}
