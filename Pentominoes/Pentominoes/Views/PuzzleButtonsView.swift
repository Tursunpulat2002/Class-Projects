//
//  PuzzlesView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import SwiftUI

struct PuzzleButtonsView: View {
    @EnvironmentObject var manager: GameManager
    var body: some View {
        VStack{
            ForEach(0..<4){i in
                HStack{
                    Button(action: {manager.changePuzzle(num: i-1)}) {
                        Image("Board\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                    }
                    Spacer()
                    Button(action: {manager.changePuzzle(num: i+3)}) {
                        Image("Board\(i+4)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                    }
                }.padding()
            }
        }
    }
}

struct PuzzleButtons_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleButtonsView()
            .environmentObject(GameManager())
    }
}
