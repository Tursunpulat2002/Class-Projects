//
//  WordsManager.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/22/23.
//

import Foundation

struct Preferences{
    var language: String = "English"
    var numOfLetters: Int = 5
    static let languageOptions: [String] = ["English", "French"]
    static let numOfLettersOptions: [Int] = [5, 6, 7]
}

class WordsManager: ObservableObject{
    @Published var game: GameSession = GameSession()
    @Published var isDeleteVisible: Bool = false
    @Published var isSubmitVisible: Bool = false
    @Published var preferences = Preferences()
    var counter: Int = 0
    
    init(){
        game.letters = {()->[String] in
            var words: String = ""
            if(preferences.language == "English"){
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
                    if(output.count == preferences.numOfLetters){
                        return output.shuffled()
                    }
                }
            }else{
                while(true){
                    words = Words.frenchWords.randomElement()!
                    var output: [String] = []
                    for word in words{
                        if(output.contains(String(word))){
                            continue
                        }
                        else{
                            output.append(String(word))
                        }
                    }
                    if(output.count == preferences.numOfLetters){
                        return output.shuffled()
                    }
                }
            }
        }()
    }
    
    func buttonClicked(index: Int){
        game.typedLetters.append(game.letters[index])
        counter+=1
        if(game.typedLetters.count > 0){
            isDeleteVisible = true
        }
        if(preferences.language == "English"){
            if(Words.words.contains(game.typedLetters.joined()) || Words.frenchWords.contains(game.typedLetters.joined())){
                isSubmitVisible = true
            }
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
        if(preferences.language == "English"){
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
                if(output.count == preferences.numOfLetters){
                    return output.shuffled()
                }
            }
        }else{
            while(true){
                words = Words.frenchWords.randomElement()!
                var output: [String] = []
                for word in words{
                    if(output.contains(String(word))){
                        continue
                    }
                    else{
                        output.append(String(word))
                    }
                }
                if(output.count == preferences.numOfLetters){
                    return output.shuffled()
                }
            }
        }
    }

    func submitWords(){
        let word = game.typedLetters.joined()
        if(!game.list.contains(word)){
            switch game.typedLetters.joined().count{
            case 1..<5:
                game.score = game.score + 1
            default:
                game.score = game.score + game.typedLetters.count
            }
            
            if(Set(game.typedLetters.joined()).count == preferences.numOfLetters){
                game.score = game.score + preferences.numOfLetters
            }
        }
        
        game.list.append(word)
        isDeleteVisible = false
        isSubmitVisible = false
        game.typedLetters.removeAll()
    }
    
}
