//
//  PieceView.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/6/23.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var manager : GameManager
    
    var body: some View {
        VStack{
            ForEach(0..<3){ i in
                HStack{
                    PentominosView(size: manager.piece[(i*4)].outline.size, outline: manager.piece[(i*4)].outline.outline)
                        .frame(width: 50 ,height: 50)
                        .foregroundColor(manager.getColor(name: manager.piece[(i*4)].outline.name))
                        .padding(30)
                    PentominosView(size: manager.piece[(i*4)+1].outline.size, outline: manager.piece[(i*4)+1].outline.outline)
                        .frame(width: 50 ,height: 50)
                        .foregroundColor(manager.getColor(name: manager.piece[(i*4)+1].outline.name))
                        .padding(30)
                    PentominosView(size: manager.piece[(i*4)+2].outline.size, outline: manager.piece[(i*4)+2].outline.outline)
                        .frame(width: 50 ,height: 50)
                        .foregroundColor(manager.getColor(name: manager.piece[(i*4)+2].outline.name))
                        .padding(30)
                    PentominosView(size: manager.piece[(i*4)+3].outline.size, outline: manager.piece[(i*4)+3].outline.outline)
                        .frame(width: 50 ,height: 50)
                        .foregroundColor(manager.getColor(name: manager.piece[(i*4)+3].outline.name))
                        .padding(30)
                }
            }
        }
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView()
            .environmentObject(GameManager())
    }
}
