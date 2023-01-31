//
//  WordsManager.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/22/23.
//

import Foundation

enum Language: String, CaseIterable, Identifiable{
    case english, french
    var id: Self {self}
}

enum ProblemSize: Int, CaseIterable, Identifiable{
    case five, six, seven
    var id: Self {self}
    func number() -> Int{
        switch self{
            case .five:
                return 5
            case .six:
                return 6
            case .seven:
                return 7
        }
    }
}

struct Preferences{
    var language: String = Language.english.rawValue
    var problemSize: Int = ProblemSize.five.number()
}

class WordsManager: ObservableObject{
    @Published var game: GameSession = GameSession()
    @Published var isDeleteVisible: Bool = false
    @Published var isSubmitVisible: Bool = false
    @Published var preferences = Preferences()
    @Published var language: Language = .english
    @Published var problemSize: ProblemSize = .five
    var counter: Int = 0
    
    init(){
        game.letters = {()->[String] in
            var words: String = ""
            if(preferences.language == language.rawValue){
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
                    if(output.count == problemSize.number()){
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
                    if(output.count == problemSize.number()){
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
        if(preferences.language == language.rawValue){
            if((Words.words.contains(game.typedLetters.joined()) || Words.frenchWords.contains(game.typedLetters.joined())) && !game.list.contains(game.typedLetters.joined())){
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
    
    private func generateLetters() -> [String]{
        var words: String = ""
        if(preferences.language == language.rawValue){
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
                if(output.count == problemSize.number()){
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
                if(output.count == problemSize.number()){
                    return output.shuffled()
                }
            }
        }
    }

    func submitWords(){
        let word = game.typedLetters.joined()
        if(!game.list.contains(word)){
            if(game.typedLetters.joined().count <= 4){
                game.score += 1
            }else{
                game.score += game.typedLetters.joined().count
                if(Set(game.typedLetters.joined()).count == problemSize.number()){
                    game.score = game.score + problemSize.number()
                }
            }
        }
        
        game.list.append(word)
        isDeleteVisible = false
        isSubmitVisible = false
        game.typedLetters.removeAll()
    }
    
    func preferencesClosed(){
        newGame()
    }
    
    func numOfWordsPossible() -> [String]{
        var possibleWords: [String] = []
        let wordBank: [String] = preferences.language == Language.english.rawValue ? Words.words : Words.frenchWords
        let letterButton:[String] = game.letters

        for word in wordBank{
            var goodWord: Bool = true
            for letter in word{
                if(!letterButton.contains(String(letter))){
                    goodWord = false
                }
            }
            if(goodWord){
                possibleWords.append(word)
            }
        }
        return possibleWords
    }
    
    func totalPossiblePoints() -> Int{
        var possiblePoints: Int = 0
        var possibleWords = numOfWordsPossible()
        possibleWords.sort(by: {$0.count < $1.count})
        for word in possibleWords{
            if(word.count <= 4){
                possiblePoints += 1
            }else{
                possiblePoints += word.count
                if(Set(word).count == problemSize.number()){
                    possiblePoints += problemSize.number()
                }
            }
        }
        
        return possiblePoints
    }
    
    func totalPanagrams() -> Int{
        var possiblePanagrams: Int = 0
        let possibleWords = numOfWordsPossible()
        for word in possibleWords{
            if(Set(word).count == problemSize.number()){
                possiblePanagrams += 1
            }
        }
        
        return possiblePanagrams
    }
    
    func wordsBeginningWithAndSize(letter: String, length: Int)->[String]{
        let possibleWords = numOfWordsPossible()
        let beginningWith = possibleWords.filter({ $0.hasPrefix(letter) && $0.count == length })
        return beginningWith
    }
    
    func numOfWordsBeginningWith(letter: String, bank: [String])->Int{
        let beginningWith = bank.filter({ $0.hasPrefix(letter) })
        return beginningWith.count
    }
}
