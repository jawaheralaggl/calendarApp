//
//  ViewController.swift
//  calenderApp
//
//  Created by Jawaher Alagel on 7/8/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import FSCalendar

protocol CalanderCallback {
    func userPickedDate (date: String)
}

class ViewController: UIViewController, FSCalendarDelegate, UITextFieldDelegate, CalanderCallback {
    
    
    func userPickedDate(date: String) {
        dateText.text = date
    }
    
    
    
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateText.becomeFirstResponder()
        //button.isEnabled = false
    }
    
    
    @IBAction func dateButton(_ sender: UIButton) {
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CalendarController") as! CalendarController
        vc.textContent = dateText.text!
        vc.calnderCallbackObj = self
        UserDefaults.init(suiteName: "group.com.jawaher.widget")?.setValue(dateText.text, forKey: "name")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
