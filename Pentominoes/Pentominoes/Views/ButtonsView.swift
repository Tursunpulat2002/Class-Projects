//
//  ButtonsView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Text("Reset")
            }
            Spacer()
            Button(action: {}) {
                Text("Solve")
            }
        }.padding(.horizontal, 150)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
