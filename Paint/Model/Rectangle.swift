//
//  Rectangle.swift
//  Paint
//
//  Created by Тамирлан Абаев   on 16.02.2021.
//

import Foundation
import UIKit

class Rectangle:Figures {
    
    private var p1: CGPoint
    private var p2: CGPoint
    
    
    
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool, p1:CGPoint, p2: CGPoint) {
        
        self.p1 = p1
        self.p2 = p2
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
        
    }
    
    override func drawPath()  {
        
        let rect = CGRect(origin: p1, size: CGSize(width: abs(p2.x-p1.x), height: abs(p2.y-p1.y)))
        let path = UIBezierPath(rect:rect)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
    
    
}
