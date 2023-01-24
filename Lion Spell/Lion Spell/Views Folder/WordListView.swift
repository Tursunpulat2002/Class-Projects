//
//  WordListView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct WordListView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        ScrollView(Axis.Set.horizontal){
            HStack(alignment: .center){
                ForEach(0..<manager.game.list.count, id: \.self){ i in
                    Text("\(manager.game.list[i]) ")
                        .foregroundColor(Color.black)
                }
            }
        }
            .padding()
            
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
            .environmentObject(WordsManager())
    }
}
