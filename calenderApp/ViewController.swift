//
//  ViewController.swift
//  calenderApp
//
//  Created by Jawaher Alagel on 7/8/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        button.isEnabled = false
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        let string = dateFormatter.string(from: date)
        
        dateText.text = string
    }
    
    
    
    
    
    
    @IBAction func dateButton(_ sender: UIButton) {
        //dateLable.text = dateText.text
    }
    
    @IBAction func dateAction(_ sender: UITextField) {
        
        print(sender.text!)
        
        if validate(text: sender.text!) {
            button.isEnabled = true
        }else{
            button.isEnabled = false
            dateLable.text = "Invalid Date"
            
        }
        
    }
    
    
    func validate(text: String) -> Bool {
        
        return text == "00/00/0000"
    }
}

