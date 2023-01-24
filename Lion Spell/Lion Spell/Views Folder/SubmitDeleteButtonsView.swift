//
//  SubmitDeleteButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/16/23.
//

import SwiftUI

struct SubmitDeleteButtonsView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        HStack{
            Button(action: manager.deleteLetter){
                Text("Delete")
            }.buttonStyle(.borderedProminent)
                .disabled(!manager.isDeleteVisible)
            Spacer()
            Button(action: manager.submitWords){
                Text("Submit")
            }.buttonStyle(.borderedProminent)
                .disabled(!manager.isSubmitVisible)
        }.padding()
    }
}

struct SubmitDeleteButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitDeleteButtonsView()
            .environmentObject(WordsManager())
    }
}
