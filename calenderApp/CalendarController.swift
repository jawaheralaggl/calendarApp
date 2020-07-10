//
//  CalendarController.swift
//  calenderApp
//
//  Created by Jawaher Alagel on 7/8/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit
import FSCalendar



class CalendarController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    var selectedName: String = "Anonymous"
    weak var delegate: ViewController!
    
    var calendar: FSCalendar!
    
    var textContent : String = ""
    var calnderCallbackObj : CalanderCallback?
    var currentDateStr : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iphone") ? 400 : 300
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: view.frame.size.width, height: height))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.allowsMultipleSelection = false
        view.addSubview(calendar)
        self.calendar = calendar
        
        calendar.calendarHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0)
        calendar.calendarWeekdayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0)
        calendar.appearance.eventSelectionColor = UIColor.white
        calendar.appearance.eventOffset = CGPoint(x: 0, y: -7)
        calendar.today = nil // Hide the today circle
        calendar.firstWeekday = 2
        calendar.appearance.headerTitleColor = UIColor.white
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.weekdayTextColor = .lightGray
        calendar.appearance.headerMinimumDissolvedAlpha = (0)
        calendar.appearance.weekdayFont = UIFont.init(name: "Fonts.RalewayRegular", size: 16)
        calendar.appearance.headerTitleFont = UIFont.init(name: "Fonts.RalewayRegular", size: 25)
        calendar.weekdayHeight = (36)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let myDate = dateFormatter.date(from: textContent)
        calendar.select(myDate)
        
        calendar.register(CustomCalanderCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        
        return cell
    }
    
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        self.configure(cell: cell, for: date, at: position)
    }
    
    private func configureVisibleCells() {
        calendar.visibleCells().forEach { (cell) in
            let date = calendar.date(for: cell)
            let position = calendar.monthPosition(for: cell)
            self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        let diyCell = (cell as! CustomCalanderCell)
        
        if diyCell.isSelected {
            diyCell.showDot()
        } else {
            diyCell.hideDot()
        }
        
        
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        self.configureVisibleCells()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        currentDateStr = dateFormatter.string(from: date)
        
        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        self.configureVisibleCells()
    }
    
    
    @IBAction func dismiss(_ sender: UIButton) {
        
        
        if let Controller = self.navigationController {
            calnderCallbackObj?.userPickedDate(date: currentDateStr)
            Controller.popViewController(animated: true)
        }
        
        
    }
}

