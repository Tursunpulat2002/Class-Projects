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
        
//        for i in 0..<12{
//            switch piece[i].outline.name{
//            case "X":
//                piece[i].position = Position(x: 180,y: 650)
//            case "P":
//                piece[i].position = Position(x: 330,y: 650)
//            case "F":
//                piece[i].position = Position(x: 480,y: 650)
//            case "W":
//                piece[i].position = Position(x: 630,y: 650)
//            case "Z":
//                piece[i].position = Position(x: 180,y: 800)
//            case "U":
//                piece[i].position = Position(x: 330,y: 800)
//            case "V":
//                piece[i].position = Position(x: 480,y: 800)
//            case "T":
//                piece[i].position = Position(x: 630,y: 800)
//            case "L":
//                piece[i].position = Position(x: 180,y: 950)
//            case "Y":
//                piece[i].position = Position(x: 330,y: 950)
//            case "N":
//                piece[i].position = Position(x: 480,y: 950)
//            case "I":
//                piece[i].position = Position(x: 630,y: 950)
//            default:
//                piece[i].position = Position(x: 0,y: 0)
//            }
//        }
    }
    
//    func setPiecePos(){
//        for i in 0..<12{
//            switch piece[i].outline.name{
//            case "X":
//                piece[i].position = Position(x: 180,y: 650)
//            case "P":
//                piece[i].position = Position(x: 330,y: 650)
//            case "F":
//                piece[i].position = Position(x: 480,y: 650)
//            case "W":
//                piece[i].position = Position(x: 630,y: 650)
//            case "Z":
//                piece[i].position = Position(x: 180,y: 800)
//            case "U":
//                piece[i].position = Position(x: 330,y: 800)
//            case "V":
//                piece[i].position = Position(x: 480,y: 800)
//            case "T":
//                piece[i].position = Position(x: 630,y: 800)
//            case "L":
//                piece[i].position = Position(x: 180,y: 950)
//            case "Y":
//                piece[i].position = Position(x: 330,y: 950)
//            case "N":
//                piece[i].position = Position(x: 480,y: 950)
//            case "I":
//                piece[i].position = Position(x: 630,y: 950)
//            default:
//                piece[i].position = Position(x: 0,y: 0)
//            }
//        }
//    }
    
    func changePuzzle(num: Int){
        if(num < 0){
            name = "Blank"
        }else{
            name = puzzle[num].name
        }
    }
    
    func getPos()->Position{
        var pos = Position()
        
        switch name{
        case "6x10":
            pos = Position(x: 262, y: 200)
        case "5x12":
            pos = Position(x: 232, y: 200)
        case "OneHole":
            pos = Position(x: 292, y: 170)
        case "FourNotches":
            pos = Position(x: 292, y: 170)
        case "FourHoles":
            pos = Position(x: 292, y: 170)
        case "13Holes":
            pos = Position(x: 262, y: 170)
        case "Flower":
            pos = Position(x: 262, y: 140)
        default:
            pos = Position(x: 0,y: 0)
        }
        
        return pos
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
    
}
