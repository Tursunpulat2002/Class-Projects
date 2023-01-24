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
        var words: String = ""
        while(true){
            words = Words.words.randomElement()!
            var output: [String] = []
            for word in words{
                if(output.contains(String(word))){
                    continue
                }
                else{
                    output.append(String(word))
                }
            }
            if(output.count == 5){
                return output.shuffled()
            }
        }
    }()
    @Published var isDeleteVisible: Bool = false
    @Published var isSubmitVisible: Bool = false
    var counter: Int = 0
    
    init(){
        game = GameSession(letters: letters, score: 0, list: [""], typedLetters: [""])
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
    
    func newGame(){
        game.letters = generateLetters()
        game.list.removeAll()
        game.score = 0
        game.typedLetters.removeAll()
    }
    
    func generateLetters() -> [String]{
        var words: String = ""
        while(true){
            words = Words.words.randomElement()!
            var output: [String] = []
            for word in words{
                if(output.contains(String(word))){
                    continue
                }
                else{
                    output.append(String(word))
                }
            }
            if(output.count == 5){
                return output.shuffled()
            }
        }
    }

    func submitWords(){
        let word = game.typedLetters.joined()
        if(game.typedLetters.count > 0 && Words.words.contains(word) && !game.list.contains(word)){
            game.list.append(word)
            if(game.typedLetters.count < 5){
                game.score += 1
            }else{
                game.score += game.typedLetters.count
                if(game.typedLetters.contains{game.letters.contains($0)}){
                    game.score += 5
                }
            }
            
            isDeleteVisible = false
            isSubmitVisible = false
            game.typedLetters.removeAll()
        }
    }
    
}
