//
//  WordListView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct WordListView: View {
    let list: [String]
    var body: some View {
        let size: Int = list.count
        ScrollView(Axis.Set.horizontal){
            HStack(alignment: .center){
                ForEach(0..<size, id: \.self){ i in
                    Text("\(list[i]) ")
                        .foregroundColor(Color.white)
                }
            }
                .background(Color.gray)
        }
            .padding()
            .fixedSize(horizontal: true, vertical: false)
            .offset(y: -50)
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView(list: ["thing 1", "thing 2", "thing 3"])
    }
}
