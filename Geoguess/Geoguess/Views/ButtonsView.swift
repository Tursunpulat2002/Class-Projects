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
//                .frame(width: 150, height: 70)
            
            Text(buttonTitle)
                .bold()
                .scaledToFill()
//                .frame(width: 150, height: 70)
//                .font(.system(size: 100))
//                .minimumScaleFactor(0.1)
                .foregroundColor(color)
        }
//        .frame(width: 150, height: 70)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(buttonTitle: "Home", color: Color.blue)
    }
}
