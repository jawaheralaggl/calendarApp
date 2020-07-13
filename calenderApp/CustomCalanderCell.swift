//
//  CustomCalanderCell.swift
//  calenderApp
//
//  Created by Jawaher Alagel on 7/9/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar


class CustomCalanderCell : FSCalendarCell {
    
    var selectionLayer: CAShapeLayer!
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        selectionLayer = CAShapeLayer()
        
        selectionLayer.actions = ["hidden": NSNull()]
        selectionLayer.fillColor = UIColor.white.withAlphaComponent(0).cgColor
        self.contentView.layer.insertSublayer(selectionLayer, below: self.titleLabel!.layer)
        // let contentBounds = contentView.bounds
        let myBounds = CGRect(x: 17.8, y: 2.8, width: 2, height: 2)
        self.selectionLayer.frame = myBounds
        
        self.selectionLayer.path = UIBezierPath(roundedRect: myBounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width:5, height:5)).cgPath
    }
    
    
    
    
    public func showDot (){
        selectionLayer.fillColor = UIColor.white.cgColor
    }
    
    public func hideDot () {
        selectionLayer.fillColor = UIColor.white.withAlphaComponent(0).cgColor
    }
    
}
