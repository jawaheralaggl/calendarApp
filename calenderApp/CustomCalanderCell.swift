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
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let whiteDot = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let widthAndHeight = 2
        let cornerRadius = widthAndHeight / 2
        
        whiteDot.backgroundColor = .white
        whiteDot.frame.size = CGSize(width: widthAndHeight, height: widthAndHeight)
        whiteDot.layer.cornerRadius = CGFloat(cornerRadius)
        whiteDot.center = CGPoint(x: contentView.bounds.width * (0.6),
                                  y: contentView.bounds.height * (1/6))
        
        contentView.addSubview(whiteDot)
        
    }
    
    
    
    public func showDot (){
        whiteDot.backgroundColor = .white
    }
    
    public func hideDot () {
        whiteDot.backgroundColor = UIColor.white.withAlphaComponent(0)
    }
    
    
}
