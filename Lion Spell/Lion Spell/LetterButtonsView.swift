//
//  LetterButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct LetterButtonsView: View {
    let choices: [String] = ["a", "b", "c", "d", "e"]
    var body: some View {
        HStack{
            ForEach(0..<5){i in
                Button(action: {}){
                    Text("\(choices[i])")
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
    }
}
