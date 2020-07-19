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
    
    let dateFormatter = DateFormatter()
    
    var dateFormat = "dd/MM/yyyy"
    
    var headerTitleColor = UIColor.white
    var titleDefaultColor = UIColor.white
    var weekdayTextColor = UIColor.lightGray
    var headerMinimumDissolvedAlpha = CGFloat(0)
    var weekdayFont = UIFont.init(name: "Fonts.RalewayRegular", size: 16)
    var headerTitleFont = UIFont.init(name: "Fonts.RalewayRegular", size: 25)
    var eventSelectionColor = UIColor.white
    var eventOffset = CGPoint(x: 0, y: -7)
    var firstWeekday = UInt(2)
    var weekdayHeight = CGFloat(36)
    var calanderHeaderViewBG = UIColor.lightGray.withAlphaComponent(0)
    
    
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
        calendar.weekdayHeight = weekdayHeight
        calendar.calendarHeaderView.backgroundColor = calanderHeaderViewBG
        calendar.calendarWeekdayView.backgroundColor = calanderHeaderViewBG
        calendar.today = nil // Hide the today circle
        calendar.firstWeekday = firstWeekday
        calendar.appearance.headerTitleColor = headerTitleColor
        calendar.appearance.titleDefaultColor = titleDefaultColor
        calendar.appearance.weekdayTextColor = weekdayTextColor
        calendar.appearance.headerMinimumDissolvedAlpha = headerMinimumDissolvedAlpha
        calendar.appearance.weekdayFont = weekdayFont
        calendar.appearance.headerTitleFont = headerTitleFont
        calendar.appearance.eventSelectionColor = eventSelectionColor
        calendar.appearance.eventOffset = eventOffset
        
        
        
        // k.dateCalendar()
        dateFormatter.dateFormat = dateFormat
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
    
    public func configureVisibleCells() {
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
        
        // k.dateText()
        
        self.configureVisibleCells()
        dateFormatter.dateFormat = dateFormat
        currentDateStr = dateFormatter.string(from: date)
        
        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        self.configureVisibleCells()
    }
    
    
    @IBAction func dismiss(_ sender: UIButton) {
        
        if let Controller = self.navigationController {
            calnderCallbackObj?.userPickedDate(date: currentDateStr)
            UserDefaults.init(suiteName: "group.com.jawaher.widget")?.setValue(currentDateStr, forKey: "name2")
            Controller.popViewController(animated: true)
        }
        
        
    }
}

