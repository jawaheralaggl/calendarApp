//
//  Properties.swift
//  calenderApp
//
//  Created by Jawaher Alagel on 7/13/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar

class Properties {
    var calendar: FSCalendar
    
    
    init(Calendar: FSCalendar) {
       self.calendar = Calendar
        return
    }
    
    func calendarAppearance() {
        calendar.appearance.headerTitleColor = .white
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.weekdayTextColor = .lightGray
        calendar.appearance.headerMinimumDissolvedAlpha = (0)
        calendar.appearance.weekdayFont = UIFont.init(name: "Fonts.RalewayRegular", size: 16)
        calendar.appearance.headerTitleFont = UIFont.init(name: "Fonts.RalewayRegular", size: 25)
        calendar.weekdayHeight = (36)
        calendar.calendarHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0)
        calendar.calendarWeekdayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0)
        calendar.appearance.eventSelectionColor = .white
        calendar.appearance.eventOffset = CGPoint(x: 0, y: -7)
        calendar.today = nil // Hide the today circle
        calendar.firstWeekday = 2
        
    }
    
    
    func dateCalendar()  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
    }
    
    func dateText() {
        CalendarController().self.configureVisibleCells()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
    }
    
}
