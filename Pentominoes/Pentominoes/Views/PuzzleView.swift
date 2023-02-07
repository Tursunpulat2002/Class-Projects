//
//  PuzzleView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/6/23.
//

import SwiftUI
import Foundation

struct PuzzleView: Shape {
    let size: Size
    let outlines: [Outline]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let xDelta : Int = 30
        let yDelta : Int = 30
        
        for outline in outlines{
            var path2 = Path()
            path2.move(to: CGPoint(x: outline[0].x, y: outline[0].y))
            for i in outline {
                path2.addLine(to: CGPoint(x: i.x*xDelta, y: i.y*yDelta))
            }
            path.addPath(path2)
        }
        
        
        
        return path
    }
}

