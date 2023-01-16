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
                .offset(y: -300)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
