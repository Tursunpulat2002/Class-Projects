//
//  PentominosView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import Foundation
import SwiftUI

struct PentominosView: Shape {
    let size : Size
    let outline : Outline
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let xDelta : Int = 30
        let yDelta : Int = 30
        
        path.move(to: CGPoint(x: outline[0].x, y: outline[0].y))
        for i in outline {
            path.addLine(to: CGPoint(x: i.x*xDelta, y: i.y*yDelta))
        }
        
        return path
    }
}
