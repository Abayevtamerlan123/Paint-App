//
//  CustomView.swift
//  Paint
//
//  Created by Тамирлан Абаев   on 16.02.2021.
//

import UIKit

class CustomView: UIView {

    var point1: CGPoint?
    var point2: CGPoint!
    var choose: Int?
    var chooseColor:UIColor? = .cyan
    var painted = Painted()
    var points = [CGPoint]()
    var chooseFill: Bool? = false

    

    
    
    override func draw(_ rect: CGRect) {
        
        if let p1 = point1 {
            
            if choose == 1 {
                
                let centx = abs(point2.x-p1.x)
                let centy = abs(point2.y-p1.y)
                let r = sqrt(pow(centx, 2)+pow(centy, 2))/2
                
                let circle:Figures = Circle(color: chooseColor!, stroke_width: 5, isFilled: chooseFill!, radius: r, center: point2)
                circle.drawPath()
                painted.addDrawing(drawing: circle)
                setNeedsDisplay()
            }
            
            
            else if choose == 2 {
                let rect:Figures = Rectangle(color: chooseColor!, stroke_width: 5, isFilled: chooseFill!, p1: p1, p2: point2)
                painted.addDrawing(drawing: rect)
                rect.drawPath()
                
            }
            
            else if choose == 3 {
                let line:Figures = Line(color: chooseColor!, stroke_width: 5, isFilled: chooseFill!, p1: p1, p2: point2)
                painted.addDrawing(drawing: line)
                line.drawPath()
                
            }
            else if choose == 4 {
                
                let triangle:Figures = Triangle(color: chooseColor!, stroke_width:5 , isFilled:chooseFill!, p1: p1, p2: point2, p3: CGPoint(x: p1.x, y: point2.y) )
                painted.addDrawing(drawing: triangle)
                triangle.drawPath()
                
            }
            else if choose == 5 {
                
                let pen:Figures = Pen(color:chooseColor!, stroke_width: 5, isFilled: chooseFill!, points: points)
                pen.drawPath()
                painted.addDrawing(drawing: pen)
                points=[CGPoint]()
                
            }

            
        }
        
        for figure in painted.getDrawings(){
            figure.drawPath()
        }
        
    
        
    }
    
    
    @IBAction func butCircle(_ sender: UIButton) {
        choose = sender.tag
    }
    
    @IBAction func butRectangle(_ sender: UIButton) {
        choose = sender.tag
    }
    @IBAction func butLine(_ sender: UIButton) {
        choose = sender.tag
    }
    
    @IBAction func butTriangle(_ sender: UIButton) {
        choose = sender.tag
    }
    
    @IBAction func butPen(_ sender: UIButton) {
        choose = sender.tag
    }
 
    @IBAction func undoButton(_ sender: Any) {
        
        point1 = nil
        point2 = nil
        painted.undo()
        setNeedsDisplay()
        switch painted.getDrawings().last {
        case is Circle:
            choose = 1
        case is Rectangle:
            choose = 2
        case is Line:
            choose = 3
        case is Triangle:
            choose = 4
        case is Pen:
            choose = 5
        default:
            break
        }
        
    }
    
    @IBAction func doFilled(_ sender: UISwitch) {
        
        
        
        if sender.isOn {
            chooseFill = true
        }
        else {
            chooseFill = false
        }
    }
    
    
    @IBAction func blueButton(_ sender: UIButton) {
        chooseColor = .blue
    }
    @IBAction func redButton(_ sender: UIButton) {
        
        chooseColor = .red
    }
    
    @IBAction func blackButton(_ sender: UIButton) {
        chooseColor = .black
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            if choose == 5 {
                points.append(touch.location(in: self))
            }
            else {
                point1 = touch.location(in: self)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if choose  == 5 {
            guard let touch = touches.first?.location(in: self) else {
                return
            }
            points.append(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            point2 = touch.location(in: self)
            if choose == 5 {
                points.append(point2)
            }
        }
        setNeedsDisplay()
    }
    
        
    
}


