//
//  ReadJSON.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import Foundation

class ReadJSON: Codable{
    var pentominos: String = "PentominoOutlines"
    var solutions: String = "Solutions"
    var puzzles: String = "PuzzleOutlines"
    
    var puzzleData: [PuzzleOutline] = []
    var pentoData: [PentominoOutline] = []
    
    init() {
        let bundle = Bundle.main
        let puzzleUrl = bundle.url(forResource: puzzles, withExtension: ".json")
        let pentoUrl = bundle.url(forResource: pentominos, withExtension: ".json")
        
        
        do{
            let decoder = JSONDecoder()
            let dataPuzzle = try Data(contentsOf: puzzleUrl!)
            let dataPento = try Data(contentsOf: pentoUrl!)
            pentoData = try decoder.decode([PentominoOutline].self, from: dataPento)
            puzzleData = try decoder.decode([PuzzleOutline].self, from: dataPuzzle)
        }catch{
            puzzleData = []
            pentoData = []
            print(error)
        }
    }
}
