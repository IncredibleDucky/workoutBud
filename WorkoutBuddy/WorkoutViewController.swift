//
//  WorkoutViewController.swift
//  WorkoutBuddy
//
//  Created by Mattthew Bailey on 10/31/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

import Foundation
import UIKit


class WorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //Storyboard Outlets
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pausePlayButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerForNotifications()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.registerClass(UITableViewCell.self , forCellReuseIdentifier: "workoutCell")
        updateTimerLabel()
        
        
        let getReadyInterval = 5;
        let setInterval = 4;
        let restInterval = 3;
        
        let exercise = Exercise(title: "Squat", intervalPerRep: 3, intervalPerRest: 4, intervalToGetReady: 5)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //MARK - TableView Datasource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "workoutCell")
        cell.textLabel!.text = "Workout \(indexPath.row)"
        cell.detailTextLabel!.text = "\(indexPath.row)"
        return cell
    }
    
    func timerString(minutes:NSInteger, seconds:NSInteger) -> String {
        var timerText:String = ""
        
        if Timer.sharedInstance.minutes > 9 {
            timerText.appendContentsOf("\(minutes)")
        }
        else   {
            timerText.appendContentsOf("0\(minutes)")
        }
        
        if Timer.sharedInstance.seconds > 9 {
            timerText.appendContentsOf(":\(seconds)")
        } else  {
            timerText.appendContentsOf(":0\(seconds)")
        }
        
        return timerText
    }
  
    func updateTimerLabel () {
        timerLabel.text = timerString(Timer.sharedInstance.minutes, seconds: Timer.sharedInstance.seconds)
        
    }
    
    func registerForNotifications () {
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "updateTimerLabel", name: SecondTickNotification, object: nil)
    }
    
    @IBAction func startWorkoutPressed(sender: AnyObject) {
        Timer.sharedInstance.startTimer()
    }
}