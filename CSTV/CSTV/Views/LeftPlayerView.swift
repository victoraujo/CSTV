//
//  LeftPlayerView.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import SwiftUI

struct LeftPlayerView: View {
    @StateObject var imageManager = ImageManager()
    let player: Player

    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(12, corners: [.topRight, .bottomRight])
                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.22))
            HStack(spacing: 0) {
                VStack(alignment: .trailing, spacing: 0){
                    Text(player.name ?? "")
                        .font(.nicknameFont)
                        .foregroundColor(.white)
                    Text(player.firstName ?? "" + (player.lastName ?? ""))
                        .font(.vsFont)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 16)
                Image(uiImage: imageManager.image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48.5, height: 48.5)
                    .cornerRadius(8)
                    .padding(.trailing, 12)
                    .offset(y: -5.25)
            } .frame(maxWidth: .infinity, alignment: .trailing)
        }.frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54)
            . onAppear {
                imageManager.loadImage(fromURL: player.imageUrl ?? "")
            }
    }
}
