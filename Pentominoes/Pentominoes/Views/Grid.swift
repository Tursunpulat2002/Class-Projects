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
        for i in stride(from: 0, to: Int(rect.size.width), by: xDelta) {
            path.move(to: CGPoint(x: CGFloat(i), y: 0))
            path.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(rect.size.height)))
        }
        for i in stride(from: 0, to: Int(rect.size.height), by: yDelta) {
            path.move(to: CGPoint(x: 0, y: CGFloat(i)))
            path.addLine(to: CGPoint(x: rect.size.width, y: CGFloat(i)))
        }
        
        return path
    }
}

