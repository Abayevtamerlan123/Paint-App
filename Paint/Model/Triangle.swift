

import Foundation
import UIKit

class Triangle:Figures {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
//    private var color: UIColor
//    private var stroke_width: CGFloat = 0
//    private var isFilled:Bool
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool,p1:CGPoint, p2:CGPoint, p3:CGPoint) {
        
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath() {
        
        let triangle = UIBezierPath()
        triangle.move(to: p1)
        triangle.addLine(to: p2)
        triangle.addLine(to: p3)
        triangle.close()
        (isFilled) ? (triangle.fill()) : (triangle.stroke())
    }
}
