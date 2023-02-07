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
            Grid(columns: 15, rows: 15)
                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .frame(width: 450, height: 450)
                .offset(x:10 ,y: -270)
            PuzzleView(size: manager.getSize(), outlines: manager.getOutline())
                .stroke(.white, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .offset(x:10 ,y: -270)
            
            VStack {
                ButtonsView()
                    .foregroundColor(Color.black)
                PieceView()
            }
            .offset(y: 150)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameManager())
    }
}
