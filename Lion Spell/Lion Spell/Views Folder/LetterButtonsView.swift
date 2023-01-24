//
//  LetterButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct LetterButtonsView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        HStack{
            ForEach(0..<manager.game.letters.count, id: \.self){i in
                Button(action: {manager.buttonClicked(index: i)}){
                    Text("\(manager.game.letters[i])")
                        .foregroundColor(Color.black)
                }.buttonStyle(.bordered)
                    .background(Color.red)
                    .cornerRadius(100)
            }
        }
        
    }
}

struct LetterButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonsView()
            .environmentObject(WordsManager())
    }
}
