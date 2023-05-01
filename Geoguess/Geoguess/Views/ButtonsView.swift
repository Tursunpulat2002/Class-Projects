//
//  ButtonsView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import SwiftUI

struct ButtonsView: View {
    var buttonTitle: String
    var color: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
            
            Text(buttonTitle)
                .bold()
                .scaledToFill()
                .foregroundColor(color)
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(buttonTitle: "Home", color: Color.blue)
    }
}
