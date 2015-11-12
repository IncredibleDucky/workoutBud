//
//  ViewController.swift
//  WorkoutBuddy
//
//  Created by Mattthew Bailey on 10/19/15.
//  Copyright © 2015 Mattthew Bailey. All rights reserved.
//
import Foundation
import UIKit

class CreateProfileViewController: UIViewController, UIPickerViewDelegate {
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if dateOfBirthTexField.isFirstResponder() {
            dateOfBirthTexField.resignFirstResponder()
        }
        if heightTextField.isFirstResponder() {
            heightTextField.resignFirstResponder()
        }
        if weightTextField.isFirstResponder() {
            weightTextField.resignFirstResponder()
        }
        if goalTextField.isFirstResponder() {
            goalTextField.resignFirstResponder()
        }
        
    }
    @IBOutlet var doneToolbar: UIToolbar!
  
    
    @IBOutlet weak var dateOfBirthTexField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var goalTextField: UITextField!
    
    var dateOfBirthDataSource: DateOfBirthDataSource = DateOfBirthDataSource()
    var heightDataSource: HeightDataSource = HeightDataSource()
    var weightDataSource: WeightDataSource = WeightDataSource()
    var goalsDataSource: GoalsDataSource = GoalsDataSource()
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if dateOfBirthTexField.isFirstResponder() {
            var dobText: String = dateOfBirthDataSource.pickerData[0][pickerView.selectedRowInComponent(0)]
            dobText.appendContentsOf(" / ")
            dobText.appendContentsOf(dateOfBirthDataSource.pickerData[1][pickerView.selectedRowInComponent(1)])
            dobText.appendContentsOf(" / ")
            dobText.appendContentsOf(dateOfBirthDataSource.pickerData[2][pickerView.selectedRowInComponent(2)])
            dateOfBirthTexField.text = dobText
        }
        if heightTextField.isFirstResponder() {
            var heightText: String = heightDataSource.pickerData[0][pickerView.selectedRowInComponent(0)]
            heightText.appendContentsOf(" ")
            heightText.appendContentsOf(heightDataSource.pickerData[1][pickerView.selectedRowInComponent(1)])
            heightTextField.text = heightText
        }
        if weightTextField.isFirstResponder() {
            var weightText: String = weightDataSource.pickerData[pickerView.selectedRowInComponent(0)]
            weightText.appendContentsOf(" LBS")
            weightTextField.text = weightText
        }
        if goalTextField.isFirstResponder() {
            let goalText: String = goalsDataSource.pickerData[pickerView.selectedRowInComponent(0)]
            goalTextField.text = goalText
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var title: String = String()
        
        if dateOfBirthTexField.isFirstResponder() {
            title = dateOfBirthDataSource.pickerData[component][row]
        }
        if heightTextField.isFirstResponder() {
            title = heightDataSource.pickerData[component][row]
        }
        if weightTextField.isFirstResponder() {
            title = weightDataSource.pickerData[row]
        }
        if goalTextField.isFirstResponder() {
            title = goalsDataSource.pickerData[row]
        }
        
        return title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


       //Set up PickerViews for textField input
        let dateOfBirthPickerView:UIPickerView = UIPickerView()
        dateOfBirthPickerView.dataSource = dateOfBirthDataSource
        dateOfBirthPickerView.delegate = self
        self.dateOfBirthTexField.inputView = dateOfBirthPickerView
        self.dateOfBirthTexField.inputAccessoryView = doneToolbar
        
        
        let heightPickerView:UIPickerView = UIPickerView()
        heightPickerView.dataSource = heightDataSource
        heightPickerView.delegate = self
        self.heightTextField.inputView = heightPickerView
        self.heightTextField.inputAccessoryView = doneToolbar

        

        let weightPickerView:UIPickerView = UIPickerView()
        weightPickerView.dataSource = weightDataSource
        weightPickerView.delegate = self
        self.weightTextField.inputView = weightPickerView
        self.weightTextField.inputAccessoryView = doneToolbar

        
        let goalsPickerView:UIPickerView = UIPickerView()
        goalsPickerView.dataSource = goalsDataSource
        goalsPickerView.delegate = self
        self.goalTextField.inputView = goalsPickerView
        self.goalTextField.inputAccessoryView = doneToolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be reecreated.
    }

}

//MARK - DataSources for pickerView Input
class DateOfBirthDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerData[component].count
    }
    
    var pickerData = [
        ["MM", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        ["DD", "1", "2", "3",  "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26",  "27",  "28",  "29", "30", "31"],
        ["YYYY", "1990", "1991", "1992"]
    ]

}

class HeightDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    var pickerData = [
        ["1\'", "2\'", "3\'", "4\'", "5\'", "6\'", "7\'", "8\'"],
        ["0\"", "1\"", "2\"", "3\"",  "4\"", "5\"", "6\"", "7\"", "8\"", "9\"", "10\"", "11\""]
    ]
    
}

class WeightDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    var pickerData = ["1", "2", "3",  "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26",  "27",  "28",  "29", "30", "31"]
    
}

class GoalsDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    var pickerData = ["Lose Weight", "Gain Muscle", "Tone"]
    
}
