//
//  ContentView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: GameManager

    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            
            PuzzleButtonsView()
                .padding(60)
                .offset(y: -290)
    
            PuzzleView(size: manager.getSize(), outlines: manager.getOutline())
                    .fill(style: FillStyle(eoFill: true))
                    .foregroundColor(Color.green)
                    .offset(x: CGFloat(manager.getPos().x), y: CGFloat(manager.getPos().y))
            Grid(columns: 15, rows: 15)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .frame(width: 451, height: 451)
                    .offset(x:10 ,y: -270)
            
            PieceView(piece: $manager.piece)
            VStack {
                ButtonsView()
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameManager())
    }
}
