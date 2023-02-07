//
//  GameManager.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject{
    let data: ReadJSON = ReadJSON()
    var piece: [Piece]
    var pentos: [PentominoOutline]
    var puzzle: [PuzzleOutline]
    @Published var name: String = ""
    
    init() {
        let _pentos: [PentominoOutline] = data.pentoData
        let _puzzle: [PuzzleOutline] = data.puzzleData
        var _piece : [Piece] = []
        pentos = _pentos
        puzzle = _puzzle
        for i in data.pentoData{
            _piece.append(Piece(outline: i))
        }
        piece = _piece
    }
    
    func changePuzzle(num: Int){
        name = puzzle[num].name
    }
    
    func getSize()->Size{
        for puz in puzzle{
            if(puz.name == name){
                return puz.size
            }
        }
        return Size(width: 3, height: 3)
    }
    
    func getOutline()->[Outline]{
        for puz in puzzle{
            if(puz.name == name){
                return puz.outlines
            }
        }
        return []
    }
    
    func getColor(name: String)->Color{
        let color: Color
        
        switch name{
        case "X":
            color = Color.red
        case "P":
            color = Color.teal
        case "F":
            color = Color.pink
        case "W":
            color = Color.green
        case "Z":
            color = Color.purple
        case "U":
            color = Color.brown
        case "V":
            color = Color.cyan
        case "T":
            color = Color.gray
        case "L":
            color = Color.indigo
        case "Y":
            color = Color.orange
        case "N":
            color = Color.mint
        case "I":
            color = Color.yellow
        default:
            color = Color.white
        }
        return color
    }
    
    //    func getPosition(name: String)->CGPoint{
    //        var pos: CGPoint
    //
    //        switch name{
    //        case "X":
    //            pos = CGPoint(x: 50, y: 100)
    //        case "P":
    //            pos = CGPoint(x: 100, y: 100)
    //        case "F":
    //            pos = CGPoint(x: 150, y: 100)
    //        case "W":
    //            pos = CGPoint(x: 200, y: 100)
    //        case "Z":
    //            pos = CGPoint(x: -200, y: 200)
    //        case "U":
    //            pos = CGPoint(x: -150, y: 200)
    //        case "V":
    //            pos = CGPoint(x: -100, y: 200)
    //        case "T":
    //            pos = CGPoint(x: -50, y: 200)
    //        case "L":
    //            pos = CGPoint(x: -50, y: 300)
    //        case "Y":
    //            pos = CGPoint(x: -100, y: 300)
    //        case "N":
    //            pos = CGPoint(x: -150, y: 300)
    //        case "I":
    //            pos = CGPoint(x: -200, y: 300)
    //        default:
    //            pos = CGPoint(x: 0, y: 0)
    //        }
    //
    //        return pos
    //    }
    
}
