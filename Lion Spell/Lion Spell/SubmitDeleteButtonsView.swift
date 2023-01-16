//
//  SubmitDeleteButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/16/23.
//

import SwiftUI

struct SubmitDeleteButtonsView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Text("Delete")
            }.buttonStyle(.borderedProminent)
            Spacer()
            Button(action: {}){
                Text("Submit")
            }.buttonStyle(.borderedProminent)
        }
            .padding()
    }
}

struct SubmitDeleteButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitDeleteButtonsView()
    }
}
