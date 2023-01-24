//
//  TitleView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack{
            Text("Lion Spell")
                .font(.system(size: 50))
        }.padding()
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
