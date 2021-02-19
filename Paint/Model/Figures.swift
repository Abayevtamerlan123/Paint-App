

import Foundation
import UIKit

class Figures {
     var color: UIColor
     var stroke_width: CGFloat = 0.0
    var isFilled : Bool
    
    
    init(color:UIColor, stroke_width:CGFloat, isFilled:Bool) {
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    
    func drawPath() {
        
    }
}
