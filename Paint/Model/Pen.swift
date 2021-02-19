//
//
import Foundation
import UIKit

class Pen:Figures {
    
    private var points:[CGPoint]?
    
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool, points:[CGPoint]?) {
        
        self.points = points
        super.init(color: color, stroke_width: stroke_width, isFilled: isFilled)
    }
    
    override func drawPath() {
        
        let path = UIBezierPath()
            for(i,p) in (points?.enumerated())! {
                if i == 0 {
                    path.move(to: p)
                }
                else {
                    path.addLine(to: p)
                }
            }
        
        color.set()
//        path.lineWidth = 5
        path.stroke()
    }
    
}
