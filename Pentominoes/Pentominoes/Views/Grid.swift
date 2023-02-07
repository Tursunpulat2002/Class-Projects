//
//  Grid.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import Foundation
import SwiftUI

struct Grid: Shape {
    let columns : Int
    let rows : Int
    
    func path(in rect: CGRect) -> Path {
        var xDelta : Int {Int(rect.size.width) / columns}
        var yDelta : Int {Int(rect.size.height) / rows}
        
        var path = Path()
        
        for i in stride(from: 0, to: xDelta*(columns), by: xDelta) {
            path.move(to: CGPoint(x: CGFloat(i), y: 0))
            path.addLine(to: CGPoint(x: CGFloat(i), y: rect.size.height-CGFloat(xDelta)))
        }
        for i in stride(from: 0, to: yDelta*(rows), by: yDelta) {
            path.move(to: CGPoint(x: 0, y: CGFloat(i)))
            path.addLine(to: CGPoint(x: rect.size.width-CGFloat(yDelta), y: CGFloat(i)))
        }
        return path
    }
}

