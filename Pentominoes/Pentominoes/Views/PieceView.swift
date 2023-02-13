//
//  PieceView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/6/23.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var manager: GameManager
    @Binding var piece: [Piece]
    @State var offset: CGSize = CGSize.zero
    var body: some View {
        ZStack{
            ForEach(0..<12){i in
                let move = DragGesture()
                            .onChanged { value in
                                offset = value.translation
                            }
                            .onEnded { value in
                                piece[i].position.x = piece[i].position.x + Int(value.translation.width)
                                piece[i].position.y = piece[i].position.y + Int(value.translation.height)
    //                                offset = value.translation
                            }
                PentominosView(size: piece[i].outline.size, outline: piece[i].outline.outline)
                    .frame(width: 50 ,height: 50)
                    .foregroundColor(manager.getColor(name: piece[i].outline.name))
//                    .position(x: CGFloat(piece[i].position.x), y: CGFloat(piece[i].position.y))
                    .offset(offset)
                    .gesture(move)
                    .onAppear{
                        for i in 0..<12{
                            switch piece[i].outline.name{
                            case "X":
                                piece[i].position = Position(x: 180,y: 650)
                                offset = CGSize(width: CGFloat(180), height: CGFloat(650))
                            case "P":
                                piece[i].position = Position(x: 330,y: 650)
                                offset = CGSize(width: CGFloat(330), height: CGFloat(650))
                            case "F":
                                piece[i].position = Position(x: 480,y: 650)
                                offset = CGSize(width: CGFloat(480), height: CGFloat(650))
                            case "W":
                                piece[i].position = Position(x: 630,y: 650)
                                offset = CGSize(width: CGFloat(630), height: CGFloat(650))
                            case "Z":
                                piece[i].position = Position(x: 180,y: 800)
                                offset = CGSize(width: CGFloat(180), height: CGFloat(800))
                            case "U":
                                piece[i].position = Position(x: 330,y: 800)
                                offset = CGSize(width: CGFloat(330), height: CGFloat(800))
                            case "V":
                                piece[i].position = Position(x: 480,y: 800)
                                offset = CGSize(width: CGFloat(480), height: CGFloat(800))
                            case "T":
                                piece[i].position = Position(x: 630,y: 800)
                                offset = CGSize(width: CGFloat(630), height: CGFloat(800))
                            case "L":
                                piece[i].position = Position(x: 180,y: 950)
                                offset = CGSize(width: CGFloat(180), height: CGFloat(950))
                            case "Y":
                                piece[i].position = Position(x: 330,y: 950)
                                offset = CGSize(width: CGFloat(330), height: CGFloat(950))
                            case "N":
                                piece[i].position = Position(x: 480,y: 950)
                                offset = CGSize(width: CGFloat(480), height: CGFloat(950))
                            case "I":
                                piece[i].position = Position(x: 630,y: 950)
                                offset = CGSize(width: CGFloat(630), height: CGFloat(950))
                            default:
                                piece[i].position = Position(x: 0,y: 0)
                                offset = CGSize(width: CGFloat(0), height: CGFloat(0))
                            }
                        }
                    }
                
            }
        }
    }
}

//struct PieceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PieceView(piece: GameManager.piece)
//            .environmentObject(GameManager())
//    }
//}
