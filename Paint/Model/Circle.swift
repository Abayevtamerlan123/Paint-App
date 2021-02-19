//
//  Circle.swift
//  Paint
//
//  Created by Тамирлан Абаев   on 16.02.2021.
//

import Foundation
import UIKit

class Circle:Figures {
    
    private var radius: CGFloat = 0.0
    private var center: CGPoint

    
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool,radius:CGFloat, center:CGPoint) {
        
        self.radius = radius
        self.center = center
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)

    }
    
    override func drawPath () {
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise: true)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
        
    }
}
extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
}
