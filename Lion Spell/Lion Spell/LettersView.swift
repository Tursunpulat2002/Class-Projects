//
//  LettersView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct LettersView: View {
    let list: [String]
    var body: some View {
        let size = list.count
        HStack{
            ForEach(0..<size, id: \.self){i in
                Text("\(list[i]) ")
            }
        }
    }
}

struct LettersView_Previews: PreviewProvider {
    static var previews: some View {
        LettersView(list: ["a", "b", "c", "d"])
    }
}
