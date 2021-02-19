//
//  Painted.swift
//  Paint
//
//  Created by Тамирлан Абаев   on 18.02.2021.
//

import Foundation

struct Painted {
    
    var drawings = [Figures]()
    
    mutating func addDrawing(drawing:Figures) {
        
        drawings.append(drawing)
    }
    
    func getDrawings()->[Figures] {
        return drawings
    }
    
    mutating func undo() {
        drawings.removeLast()
    }
}
