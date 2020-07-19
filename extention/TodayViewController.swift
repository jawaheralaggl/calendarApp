//
//  TodayViewController.swift
//  extention
//
//  Created by Jawaher Alagel on 7/13/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var dateShow: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let name = UserDefaults.init(suiteName: "group.com.jawaher.widget")?.value(forKey: "name")
        {
            label.text = name as? String
        }
        if let name2 = UserDefaults.init(suiteName: "group.com.jawaher.widget")?.value(forKey: "name2")
        {
           label.text = name2 as? String
        }
    }
    
    
    @IBAction func dateButton(_ sender: Any) {
        if let url = URL(string: "calWidget://recent") {
        extensionContext?.open(url, completionHandler: nil)
        }
        
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
