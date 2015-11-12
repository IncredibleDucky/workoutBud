//
//  CalendarViewController.swift
//  WorkoutBuddy
//
//  Created by Mattthew Bailey on 10/29/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//

import Foundation
import UIKit

class CalendarViewController: UIViewController, CalendarViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
   
    //Todays Date
    let todaysDate:NSDate = NSDate()
    @IBOutlet weak var startWorkoutButton: UIButton!
    let calendar: CalendarView = CalendarView.instance(NSDate(), selectedDate: NSDate())

    func didSelectDate(date: NSDate) {
        print("\(date.month)-\(date.day)-\(date.year)")
        tableView.reloadData()
        
        if(calendar.dateSelected.day == todaysDate.day && calendar.dateSelected.month == todaysDate.month && calendar.dateSelected.year == todaysDate.year) {
            startWorkoutButton.tintColor = UIColor.blueColor()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        calendar.delegate = self
        
        //Constraints for calendar, subview fills storyboard superview.
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendarView.addSubview(calendar)
        
        // Constraints for calendar view - Fill the parent view.
        calendarView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[calendar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["calendar": calendar]))
        calendarView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[calendar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["calendar": calendar]))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"calendarCell")
        
        startWorkoutButton.tintColor = UIColor.blueColor()

    }
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //MARK - TableView Datasource and Delegates
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "calendarCell")
        cell.textLabel!.text = "Workout \(indexPath.row)"
        cell.detailTextLabel!.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return "Workout for \(dateFormatter.stringFromDate(calendar.dateSelected.nsdate))"
    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        <#code#>
//    }
}