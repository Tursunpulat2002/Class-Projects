//
//  WordsManager.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/22/23.
//

import Foundation

class WordsManager: ObservableObject{
    @Published var game: GameSession
    var letters: [String] = {()->[String] in
        var letter: [String] = []
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        for i in 1...5{
            letter.append(alphabet.randomElement() ?? "a")
        }
        return letter
    }()
    @Published var isDeleteVisible: Bool = false
    @Published var isSubmitVisible: Bool = false
    var counter: Int = 0
    
    init(){
        game = GameSession()
        game.letters = letters
    }
    
    func buttonClicked(index: Int){
        game.typedLetters.append(game.letters[index])
        counter+=1
        if(game.typedLetters.count > 0){
            isDeleteVisible = true
        }
        
        if(Words.words.contains(game.typedLetters.joined())){
            isSubmitVisible = true
        }
    }
    
    func deleteLetter(){
        
        if(game.typedLetters.count > 0){
            game.typedLetters.removeLast()
            counter-=1
        }
        if(counter == 0){
            isDeleteVisible = false
            isSubmitVisible = false
        }
    }

    func submitWords(){
        let word = game.typedLetters.joined()
        let score = Int(game.score) ?? 0
        if(game.typedLetters.count > 0 && Words.words.contains(word) && !game.list.contains(word)){
            game.list.append(word)
            switch game.typedLetters.count{
            case 4:
                game.score = String(score+1)
            case 5:
                game.score = String(score+5)
            case 6:
                game.score = String(score+6)
            case 7:
                game.score = String(score+7)
            case 8:
                game.score = String(score+8)
            case 9:
                game.score = String(score+9)
            case 10:
                game.score = String(score+10)
            case 11:
                game.score = String(score+11)
            case 12:
                game.score = String(score+12)
            case 13:
                game.score = String(score+13)
            case 14:
                game.score = String(score+14)
            case 15:
                game.score = String(score+15)
            default:
                game.score = String(0)
            }
            
            game.typedLetters.removeAll()
        }
    }
    
}
