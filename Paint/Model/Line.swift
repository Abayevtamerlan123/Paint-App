

import Foundation
import UIKit
class Line:Figures {
    
    private var p1: CGPoint
    private var p2: CGPoint

    
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool, p1:CGPoint, p2:CGPoint) {
        
        self.p1 = p1
        self.p2 = p2
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath() {
        
        let line = UIBezierPath()
        
        line.move(to: p1)
        line.addLine(to: p2)
        
        line.lineWidth = stroke_width
        color.set()
        line.stroke()
    }
}
